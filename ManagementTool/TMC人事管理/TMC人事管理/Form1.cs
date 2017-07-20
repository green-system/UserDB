using System;
using System.Configuration;
using System.Net;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using TMC人事管理;

namespace WindowsFormsApplication1
{
    #region 構造体
    struct Data
    {
        public int[] NUMBER;
        public string[] ID;
        public string[] NAME;
    }
    #endregion

    public partial class 人事情報DB保守 : Form
    {
        #region 定数
        #region タブ
        const int PERMISSION_TAB = 0;   // 応答許可情報タブ
        const int SYSTEM_TAB = 1;       // システム情報タブ
        const int RETURN_ITEM_TAB = 2;  // 応答項目情報タブ
        #endregion

        #region column
        const int SERIAL_NUMBER = 0;        // シリアルナンバー
        const int WORKING_FLAG = 1;         // 起動中フラグ
        const int WORKING_HOST_NAME = 2;    // ホスト名
        const int WORKING_IP_ADDRESS = 3;   // IPアドレス
        const int SYSTEM_CODE = 0;          // システムコード
        const int SYSTEM_NAME = 1;          // システム名称
        const int RETURN_ITEM_CODE = 0;     // 応答項目コード
        const int RETURN_ITEM_NAME = 1;     // 応答項目名称
        #endregion

        #region メッセージ
        const String ERROR_CAPTION = "データベースエラー";                                      // エラーメッセージのキャプション
        const String WORKING_CAPTION = "多重起動通知";                                          // 多重起動通知のキャプション
        const String WORKING_MESSAGE = "既に起動されています\r\n起動端末情報\r\n";              // 多重起動通知文章
        const String DELETE_CAPTION = "削除確認";                                               // 削除警告のキャプション
        const String DELETE_MESSAGE = "削除します";                                             // 削除警告文章
        const String INPUT_CHECK_CAPTION = "入力チェック";                                      // 入力チェックのキャプション
        const String EMPTY_MESSAGE = "IDまたは名称が入力\r\nされていません。";                  // 空であることを通知する
        const String NOT_REGISTER = "IDに登録不可文字が\r\n含まれています。";                   // 登録不可文字が含まれていすことを通知する
        const String POSSIBLE_RANGE = "入力可能範囲は1～255です";                               // 入力可能範囲外である事を通知する
        const String ALREADY_REGISTERED_MESSAGE = "既に登録されています\r\nID：";               // 既に登録されていることを通知する
        const String SPACE_MESSAGE = "名称に空白が含まれています。\r\n削除して登録します。";    // 空白削除を通知する
        #endregion

        #region モード
        const String SYSTEM_MODE = "system";        // システムモード
        const String RETURN_ITEM_MODE = "response";    // 応答項目モード
        const String INSERT_MODE = "insert";        // 登録モード
        const String UPDATE_MODE = "update";        // 更新モード
        #endregion

        #region SQL
        //const String CONNECTION_STRING = "TMC人事管理.Properties.Settings.JINJIConnectionString";
        const String GET_PROGRAM_DATA = @"SELECT SERIAL_NUMBER, WORKING_FLAG, WORKING_HOST_NAME, WORKING_IP_ADDRESS, START_DATE_TIME, END_DATE_TIME FROM PROGRAM_WORKING_INFO ORDER BY SERIAL_NUMBER ASC";
        const String GET_SYSTEM_DATA = @"SELECT SYSTEM_CODE, SYSTEM_NAME FROM SYSTEM_INFORMATION WHERE DELETE_FLAG = '0' ORDER BY SYSTEM_CODE ASC";
        const String GET_RETURN_ITEM_DATA = @"SELECT RETURN_ITEM_CODE, RETURN_ITEM_NAME FROM RETURN_ITEM WHERE DELETE_FLAG = '0' ORDER BY RETURN_ITEM_CODE ASC";
        const String GET_FUKAKKOUMOKU_DATA = @"SELECT RETURN_ITEM_CODE, RETURN_ITEM_NAME FROM RETURN_ITEM WHERE NOT RETURN_ITEM_CODE IN (SELECT RETURN_ITEM_CODE FROM REPLY_PERMISSION WHERE SYSTEM_CODE = @SYSTEM_CODE) AND DELETE_FLAG = '0' ORDER BY RETURN_ITEM_CODE ASC";
        const String GET_KANOUKOUMOKU_DATA = @"SELECT RES.RETURN_ITEM_CODE, RES.RETURN_ITEM_NAME FROM RETURN_ITEM RES LEFT JOIN REPLY_PERMISSION PER ON RES.RETURN_ITEM_CODE = PER.RETURN_ITEM_CODE WHERE PER.SYSTEM_CODE = @SYSTEM_CODE AND RES.DELETE_FLAG = '0' ORDER BY RES.RETURN_ITEM_CODE ASC";
        const String INSERT_REPLY_PERMISSION = @"INSERT INTO REPLY_PERMISSION (SYSTEM_CODE, RETURN_ITEM_CODE, DELETE_FLAG) VALUES (@SYSTEM_CODE, @RETURN_ITEM_CODE, '0')";
        const String DELETE_REPLY_PERMISSION = @"DELETE FROM REPLY_PERMISSION WHERE SYSTEM_CODE = @SYSTEM_CODE AND RETURN_ITEM_CODE = @RETURN_ITEM_CODE";
        const String INSERT_PROGRAM_WORKING_INFO = @"INSERT INTO PROGRAM_WORKING_INFO (SERIAL_NUMBER, WORKING_FLAG, WORKING_HOST_NAME, WORKING_IP_ADDRESS, START_DATE_TIME) VALUES (@SERIAL_NUMBER, '0', @WORKING_HOST_NAME, @WORKING_IP_ADDRESS, FORMAT(GETDATE(),'yyyy/MM/dd hh:mm:ss'))";
        const String UPDATE_PROGRAM_WORKING_INFO = @"UPDATE PROGRAM_WORKING_INFO SET WORKING_FLAG='0', END_DATE_TIME=FORMAT(GETDATE(),'yyyy/MM/dd hh:mm:ss') WHERE SERIAL_NUMBER=@SERIAL_NUMBER";
        const String DELETE_SYSTEM_INFORMATION = @"UPDATE SYSTEM_INFORMATION SET DELETE_FLAG='1', DELETE_HOST_NAME=@DELETE_HOST_NAME, DELETE_DATE_TIME=FORMAT(GETDATE(),'yyyy/MM/dd hh:mm:ss') WHERE  SYSTEM_CODE=@SYSTEM_CODE";
        const String INSERT_SYSTEM_INFORMATION = @"INSERT INTO SYSTEM_INFORMATION (SYSTEM_CODE, SYSTEM_NAME, DELETE_FLAG) VALUES (@SYSTEM_CODE, @SYSTEM_NAME, '0')";
        const String UPDATE_SYSTEM_INFORMATION = @"UPDATE SYSTEM_INFORMATION SET SYSTEM_NAME=@SYSTEM_NAME, DELETE_FLAG='0' WHERE SYSTEM_CODE=@SYSTEM_CODE";
        const String DELETE_RETURN_ITEM = @"UPDATE RETURN_ITEM SET DELETE_FLAG='1', DELETE_HOST_NAME=@DELETE_HOST_NAME, DELETE_DATE_TIME=FORMAT(GETDATE(),'yyyy/MM/dd hh:mm:ss') WHERE  RETURN_ITEM_CODE=@RETURN_ITEM_CODE";
        const String INSERT_RETURN_ITEM = @"INSERT INTO RETURN_ITEM (RETURN_ITEM_CODE, RETURN_ITEM_NAME, DELETE_FLAG) VALUES (@RETURN_ITEM_CODE, @RETURN_ITEM_NAME, '0')";
        const String UPDATE_RETURN_ITEM = @"UPDATE RETURN_ITEM SET RETURN_ITEM_NAME=@RETURN_ITEM_NAME, DELETE_FLAG='0' WHERE RETURN_ITEM_CODE=@RETURN_ITEM_CODE";
        const String UPDATE_REPLY_PERMISSION_SYSTEM = @"UPDATE REPLY_PERMISSION SET DELETE_FLAG='1', DELETE_HOST_NAME=@DELETE_HOST_NAME, DELETE_DATE_TIME=FORMAT(GETDATE(),'yyyy/MM/dd hh:mm:ss') WHERE SYSTEM_CODE=@SYSTEM_CODE";
        const String UPDATE_REPLY_PERMISSION_RETURN_ITEM = @"UPDATE REPLY_PERMISSION SET DELETE_FLAG='1', DELETE_HOST_NAME=@DELETE_HOST_NAME, DELETE_DATE_TIME=FORMAT(GETDATE(),'yyyy/MM/dd hh:mm:ss') WHERE RETURN_ITEM_CODE=@RETURN_ITEM_CODE";
        const String GET_PROGRAM = "SELECT START_DATE_TIME, END_DATE_TIME, WORKING_HOST_NAME FROM PROGRAM_WORKING_INFO WHERE SERIAL_NUMBER = @SERIAL_NUMBER";
        const String CREATE_WK_REPLY_PERMISSION = "SELECT * INTO WK_REPLY_PERMISSION FROM REPLY_PERMISSION";
        const String SEARCH_ADD_DATA_REPLY_PERMISSION = "SELECT PER.SYSTEM_CODE, SYS.SYSTEM_NAME, PER.RETURN_ITEM_CODE, RET.RETURN_ITEM_NAME FROM REPLY_PERMISSION PER LEFT JOIN SYSTEM_INFORMATION SYS ON SYS.SYSTEM_CODE = PER.SYSTEM_CODE LEFT JOIN RETURN_ITEM RET ON RET.RETURN_ITEM_CODE = PER.RETURN_ITEM_CODE EXCEPT SELECT PER.SYSTEM_CODE, SYS.SYSTEM_NAME, PER.RETURN_ITEM_CODE, RET.RETURN_ITEM_NAME FROM WK_REPLY_PERMISSION PER LEFT JOIN SYSTEM_INFORMATION SYS ON SYS.SYSTEM_CODE = PER.SYSTEM_CODE LEFT JOIN RETURN_ITEM RET ON RET.RETURN_ITEM_CODE = PER.RETURN_ITEM_CODE ORDER BY PER.SYSTEM_CODE, PER.RETURN_ITEM_CODE ASC";
        const String SEARCH_DELETE_DATA_REPLY_PERMISSION = "SELECT PER.SYSTEM_CODE, SYS.SYSTEM_NAME, PER.RETURN_ITEM_CODE, RET.RETURN_ITEM_NAME FROM WK_REPLY_PERMISSION PER LEFT JOIN SYSTEM_INFORMATION SYS ON SYS.SYSTEM_CODE = PER.SYSTEM_CODE LEFT JOIN RETURN_ITEM RET ON RET.RETURN_ITEM_CODE = PER.RETURN_ITEM_CODE EXCEPT SELECT PER.SYSTEM_CODE, SYS.SYSTEM_NAME, PER.RETURN_ITEM_CODE, RET.RETURN_ITEM_NAME FROM REPLY_PERMISSION PER LEFT JOIN SYSTEM_INFORMATION SYS ON SYS.SYSTEM_CODE = PER.SYSTEM_CODE LEFT JOIN RETURN_ITEM RET ON RET.RETURN_ITEM_CODE = PER.RETURN_ITEM_CODE ORDER BY PER.SYSTEM_CODE, PER.RETURN_ITEM_CODE ASC";
        const String DROP_WK_REPLY_PERMISSION = "DROP TABLE WK_REPLY_PERMISSION";
        const String CREATE_WK_SYSTEM_INFORMATION = "SELECT * INTO WK_SYSTEM_INFORMATION FROM SYSTEM_INFORMATION";
        const String SEARCH_ADD_DATA_SYSTEM_INFORMATION = "SELECT SYSTEM_CODE, SYSTEM_NAME FROM SYSTEM_INFORMATION WHERE SYSTEM_CODE IN (SELECT SYSTEM_CODE FROM SYSTEM_INFORMATION EXCEPT SELECT SYSTEM_CODE FROM WK_SYSTEM_INFORMATION) ORDER BY SYSTEM_CODE ASC";
        const String SEARCH_DELETE_DATA_SYSTEM_INFORMATION = "SELECT WK.SYSTEM_CODE, WK.SYSTEM_NAME FROM WK_SYSTEM_INFORMATION WK LEFT JOIN SYSTEM_INFORMATION SYS ON SYS.SYSTEM_CODE = WK.SYSTEM_CODE WHERE WK.DELETE_FLAG != SYS.DELETE_FLAG ORDER BY WK.SYSTEM_CODE ASC";
        const String DROP_WK_SYSTEM_INFORMATION = "DROP TABLE WK_SYSTEM_INFORMATION";
        const String CREATE_WK_RETURN_ITEM = "SELECT * INTO WK_RETURN_ITEM FROM RETURN_ITEM";
        const String SEARCH_ADD_DATA_RETURN_ITEM = "SELECT RETURN_ITEM_CODE, RETURN_ITEM_NAME FROM RETURN_ITEM WHERE RETURN_ITEM_CODE IN (SELECT RETURN_ITEM_CODE FROM RETURN_ITEM EXCEPT SELECT RETURN_ITEM_CODE FROM WK_RETURN_ITEM) ORDER BY RETURN_ITEM_CODE ASC";
        const String SEARCH_DELETE_DATA_RETURN_ITEM = "SELECT WK.RETURN_ITEM_CODE, WK.RETURN_ITEM_NAME FROM WK_RETURN_ITEM WK LEFT JOIN RETURN_ITEM RET ON RET.RETURN_ITEM_CODE = WK.RETURN_ITEM_CODE WHERE WK.DELETE_FLAG != RET.DELETE_FLAG ORDER BY WK.RETURN_ITEM_CODE ASC";
        const String DROP_WK_RETURN_ITEM = "DROP TABLE WK_RETURN_ITEM";
        const String GET_WK_REPLY_PERMISSION = "SELECT CASE WHEN COUNT(id) = 0 THEN 'false' ELSE 'true' END AS TABLE_CHECK FROM dbo.sysobjects WHERE id = object_id( 'WK_REPLY_PERMISSION' ) AND OBJECTPROPERTY( id, N'IsUserTable' ) = 1";
        const String GET_WK_SYSTEM_INFORMATION = "SELECT CASE WHEN COUNT(id) = 0 THEN 'false' ELSE 'true' END AS TABLE_CHECK FROM dbo.sysobjects WHERE id = object_id( 'WK_SYSTEM_INFORMATION' ) AND OBJECTPROPERTY( id, N'IsUserTable' ) = 1";
        const String GET_WK_RETURN_ITEM = "SELECT CASE WHEN COUNT(id) = 0 THEN 'false' ELSE 'true' END AS TABLE_CHECK FROM dbo.sysobjects WHERE id = object_id( 'WK_RETURN_ITEM' ) AND OBJECTPROPERTY( id, N'IsUserTable' ) = 1";
        const String ADD_SYSTEM_CODE = "@SYSTEM_CODE";
        const String ADD_SYSTEM_NAME = "@SYSTEM_NAME";
        const String ADD_RETURN_ITEM_CODE = "@RETURN_ITEM_CODE";
        const String ADD_RETURN_ITEM_NAME = "@RETURN_ITEM_NAME";
        const String ADD_SERIAL_NUMBER = "@SERIAL_NUMBER";
        const String ADD_WORKING_HOST_NAME = "@WORKING_HOST_NAME";
        const String ADD_WORKING_IP_ADDRESS = "@WORKING_IP_ADDRESS";
        const String ADD_DELETE_HOST_NAME = "@DELETE_HOST_NAME";
        #endregion

        #region CMD
        const String CMDEXE = "ComSpec";                                                    // cmd.exeのパス
        const String COMMAND = @"/c ipconfig /all | findstr ""IPv4 アドレス*(優先)""";      // コマンド
        const String COMMAND_TASKLIST = @"/c tasklist /svc";                                // コマンド
        const String IPADDRESS_MUCH = @"[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}";       // IPアドレスの正規表現
        #endregion

        #region ログ
        const String FILE_NAME = @"\ANSWER_PERM.log";   // ファイル名
        const String SHIFT_JIS = "shift_jis";           // 文字コード
        const int START_DATE_TIME = 0;                  // 開始時間
        const int END_DATE_TIME = 1;                    // 終了時間
        #endregion

        #region 正規表現
        const String NUMBER = "^[0-9]+$";   // 半角数字
        const String SPACE = @"\s";         // 空白
        #endregion
        #endregion

        #region メンバー変数
        int SerialNumber;       // シリアルナンバー
        Data SystemData;        // システム情報
        Data ReturnItemData;    // 応答項目情報
        Data ShutokuFuka;       // 取得不可項目
        Data ShutokuKanou;      // 取得可能項目
        String ExecutionMode;   // 登録実行ボタンのモード
        String CONNECTION_STRING = ConfigurationManager.ConnectionStrings["TMC人事管理.Properties.Settings.JINJIConnectionString"].ConnectionString;
        #endregion

        #region コンストラクタ
        public 人事情報DB保守()
        {
            InitializeComponent();

            SerialNumber = -1;

            this.Text = "人事情報DB保守";
        }
        #endregion

        #region Form1ロード時
        private void Form1_Load(object sender, EventArgs e)
        {
            DataTable Result = GetProgramData();    // PG起動情報取得
            //複数タスク起動している可能性があるため、改行コードにて分割
            string[] Results = GetTaskList().Replace("\r\n", "\n").Split('\n');
            //起動数を管理
            int iCount = 0;

            // プロセス起動数を調べる
            string ProsessNm = System.Diagnostics.Process.GetCurrentProcess().ProcessName;
            for (int i = 0; i < Results.Length - 1; i++)
            {
                if (Results[i].Length > ProsessNm.Length)
                {
                    if (Results[i].Substring(0, ProsessNm.Length) == ProsessNm)
                    {
                        iCount++;
                    }
                }
            }
            
            // 複数起動されている場合、処理を終了する
            if (iCount != 1)
            {

                string hostNm = "";
                string IPAddress = "";
                // HOST名が取得できた場合
                if (Result.Rows[Result.Rows.Count - 1][WORKING_HOST_NAME].ToString() != "")
                {
                    hostNm = Result.Rows[Result.Rows.Count - 1][WORKING_HOST_NAME].ToString();
                }

                // IPAddressが取得できた場合
                if (Result.Rows[Result.Rows.Count - 1][WORKING_IP_ADDRESS].ToString() != "")
                {
                    IPAddress = Result.Rows[Result.Rows.Count - 1][WORKING_IP_ADDRESS].ToString();
                }

                //メッセージボックスを表示する
                    MessageBox.Show(WORKING_MESSAGE + IPAddress + Environment.NewLine + hostNm, WORKING_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                // フォームを閉じる
                this.Close();

                return;
            }

            if (SerialNumber == -1)
            {
                SerialNumber = Result.Rows.Count + 1;   // 新しいシリアルナンバーを設定

                // PG起動情報にレコードを追加
                Insert_Program_Working_Info();
            }

            // 比較用の応答許可情報が存在しない場合生成する
            if (!Convert.ToBoolean(Get_Work_Reply_Permission())) Create_Work_Reply_Permission();

            // 比較用のシステム情報が存在しない場合生成する
            if (!Convert.ToBoolean(Get_Work_System_Info())) Create_Work_System_Info();

            // 比較用の応答項目情報が存在しない場合生成する
            if (!Convert.ToBoolean(Get_Work_Return_Item())) Create_Work_Return_Item();

            // 応答許可情報初期化処理
            Permission_Init();
        }
        #endregion

        #region タブ切り替え時
        private void tabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // 選択されたタブを初期化する
            switch (tabControl1.SelectedIndex)
            {
                case PERMISSION_TAB:
                    // 応答許可情報初期化処理
                    Permission_Init();
                    break;
                case SYSTEM_TAB:
                    // システム情報初期化処理
                    System_Init();
                    break;
                case RETURN_ITEM_TAB:
                    // 応答項目情報初期化処理
                    Return_Item_Init();
                    break;
                default:
                    break;
            }
        }
        #endregion

        #region 応答許可情報
        #region システム名選択時
        private void System_Name_Select_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (System_Name_Select.SelectedIndex != -1)
            {
                int Index = 0;  // 該当するIDの配列番号

                // 選択されたシステム名称をもとにIDを割り出す処理
                for (int i = 0; i < SystemData.ID.Count(); i++)
                {
                    if (System_Name_Select.SelectedIndex == i)
                    {
                        Index = i;

                        break;
                    }
                }

                // IDのテキストボックスを空にする
                System_ID.DataBindings.Clear();

                // IDのテキストボックスに選択したシステム名のIDを入れる
                System_ID.DataBindings.Add("Text", SystemData.ID[Index], "");

                // 項目一覧を取得
                DataTable FukaResult = GetFukaKoumokuData();    // 取得不可項目一覧を取得
                DataTable KanouResult = GetKanouKoumokuData();  // 取得可能項目一覧を取得

                // コードと名称の配列数を再設定する
                Array.Resize(ref ShutokuFuka.NUMBER, FukaResult.Rows.Count);    // 番号の配列数を再設定する
                Array.Resize(ref ShutokuFuka.ID, FukaResult.Rows.Count);        // システムコードの配列数を再設定する
                Array.Resize(ref ShutokuFuka.NAME, FukaResult.Rows.Count);      // システム名称の配列数を再設定する
                Array.Resize(ref ShutokuKanou.NUMBER, KanouResult.Rows.Count);  // 番号の配列数を再設定する
                Array.Resize(ref ShutokuKanou.ID, KanouResult.Rows.Count);      // 応答項目コードの配列数を再設定する
                Array.Resize(ref ShutokuKanou.NAME, KanouResult.Rows.Count);    // 応答項目名称の配列数を再設定する

                // ListBoxをクリア
                Shutoku_Fuka.Items.Clear();     // 取得不可項目一覧をクリア
                Shutoku_Kanou.Items.Clear();    // 取得可能項目一覧をクリア

                // 取得不可項目一覧に追加
                for (int i = 0; i < FukaResult.Rows.Count; i++)
                {
                    ShutokuFuka.NUMBER[i] = i;                                          // 番号を設定
                    ShutokuFuka.ID[i] = FukaResult.Rows[i][RETURN_ITEM_CODE].ToString();   // IDを設定
                    ShutokuFuka.NAME[i] = FukaResult.Rows[i][RETURN_ITEM_NAME].ToString(); // 名称を設定
                    Shutoku_Fuka.Items.Add(FukaResult.Rows[i][RETURN_ITEM_NAME]);          // 応答項目名称をListBoxに追加
                }

                // 取得可能項目一覧に追加
                for (int i = 0; i < KanouResult.Rows.Count; i++)
                {
                    ShutokuKanou.NUMBER[i] = i;                                             // 番号を設定
                    ShutokuKanou.ID[i] = KanouResult.Rows[i][RETURN_ITEM_CODE].ToString();     // IDを設定
                    ShutokuKanou.NAME[i] = KanouResult.Rows[i][RETURN_ITEM_NAME].ToString();   // 名称を設定
                    Shutoku_Kanou.Items.Add(KanouResult.Rows[i][RETURN_ITEM_NAME]);            // 応答項目名称をListBoxに追加
                }

                // 応答項目のIDをクリア
                Shutoku_Fuka_ID.Clear();    // TextBoxクリア
                Shutoku_Kanou_ID.Clear();   // TextBoxクリア

                // 各ListBoxを有効にする
                Shutoku_Fuka.Enabled = true;    // 取得不可項目を有効にする
                Shutoku_Kanou.Enabled = true;   // 取得可能項目を有効にする

                // 各Buttonを無効にする
                Add_Button.Enabled = false;     // 追加ボタンを無効にする
                Delete_Button.Enabled = false;  // 取消ボタンを無効にする
            }
        }
        #endregion

        #region 取得不可項目選択時
        private void Sentaku_Fuka_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Shutoku_Fuka.SelectedIndex != -1)
            {
                int Index = 0;  // 該当するIDの配列番号

                // 選択された応答項目名称をもとにIDを割り出す処理
                for (int i = 0; i < ShutokuFuka.ID.Count(); i++)
                {
                    if (Shutoku_Fuka.GetSelected(i))
                    {
                        Index = i;

                        break;
                    }
                }

                // IDのテキストボックスを空にする
                Shutoku_Fuka_ID.DataBindings.Clear();
                Shutoku_Kanou_ID.ResetText();

                // IDのテキストボックスに選択した応答項目のIDを入れる
                Shutoku_Fuka_ID.DataBindings.Add("Text", ShutokuFuka.ID[Index], "");

                // 各Buttonの制御
                Add_Button.Enabled = true;      // 追加ボタンを有効にする
                Delete_Button.Enabled = false;  // 取消ボタンを無効にする

                Shutoku_Kanou.SelectedIndex = -1;   // 取得可能項目を未選択状態に変更
            }
        }
        #endregion

        #region 取得可能項目選択時
        private void Sentaku_Kanou_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Shutoku_Kanou.SelectedIndex != -1)
            {
                int Index = 0;  // 該当するIDの配列番号

                // 選択された応答項目名称をもとにIDを割り出す処理
                for (int i = 0; i < ShutokuKanou.ID.Count(); i++)
                {
                    if (Shutoku_Kanou.GetSelected(i))
                    {
                        Index = i;

                        break;
                    }
                }

                // IDのテキストボックスを空にする
                Shutoku_Kanou_ID.DataBindings.Clear();
                Shutoku_Fuka_ID.ResetText();

                // IDのテキストボックスに選択した応答項目のIDを入れる
                Shutoku_Kanou_ID.DataBindings.Add("Text", ShutokuKanou.ID[Index], "");

                // 各Buttonの制御
                Add_Button.Enabled = false;     // 追加ボタンを無効にする
                Delete_Button.Enabled = true;   // 取消ボタンを有効にする

                Shutoku_Fuka.SelectedIndex = -1;    // 取得不可項目を未選択状態に変更
            }
        }
        #endregion

        #region 追加ボタン押下時
        private void Add_Click(object sender, EventArgs e)
        {
            if (Shutoku_Fuka.Text != "")
            {
                int Index = 0;  // 該当するIDの配列番号

                // 選択された応答項目名称をもとにIDを割り出す処理
                for (int i = 0; i < ShutokuFuka.ID.Count(); i++)
                {
                    if (Shutoku_Fuka.GetSelected(i))
                    {
                        Index = i;

                        break;
                    }
                }

                String Select = ShutokuFuka.ID[Index];  // 選択されたデータを退避

                // 取得不可項目一覧で選択されている項目を取得可能項目一覧に追加
                Shutoku_Kanou.Items.Add(Shutoku_Fuka.Text);

                // 取得不可項目一覧で選択されている項目を削除
                Shutoku_Fuka.Items.Remove(Shutoku_Fuka.Text);

                // 応答許可情報にレコードを追加
                Insert_Reply_Permission();

                DataTable FukaResult = GetFukaKoumokuData();    // 取得不可項目一覧を取得
                DataTable KanouResult = GetKanouKoumokuData();  // 取得可能項目一覧を取得

                // コードと名称の配列数を再設定する
                Array.Resize(ref ShutokuFuka.NUMBER, FukaResult.Rows.Count);    // 番号の配列数を再設定する
                Array.Resize(ref ShutokuFuka.ID, FukaResult.Rows.Count);        // システムコードの配列数を再設定する
                Array.Resize(ref ShutokuFuka.NAME, FukaResult.Rows.Count);      // システム名称の配列数を再設定する
                Array.Resize(ref ShutokuKanou.NUMBER, KanouResult.Rows.Count);  // 番号の配列数を再設定する
                Array.Resize(ref ShutokuKanou.ID, KanouResult.Rows.Count);      // 応答項目コードの配列数を再設定する
                Array.Resize(ref ShutokuKanou.NAME, KanouResult.Rows.Count);    // 応答項目名称の配列数を再設定する

                // 取得可能項目一覧をクリア
                Shutoku_Kanou.Items.Clear();

                // 取得不可項目一覧に追加
                for (int i = 0; i < FukaResult.Rows.Count; i++)
                {
                    ShutokuFuka.NUMBER[i] = i;                                              // 番号を設定
                    ShutokuFuka.ID[i] = FukaResult.Rows[i][RETURN_ITEM_CODE].ToString();    // IDを設定
                    ShutokuFuka.NAME[i] = FukaResult.Rows[i][RETURN_ITEM_NAME].ToString();  // 名称を設定
                }

                // 取得可能項目一覧に追加
                for (int i = 0; i < KanouResult.Rows.Count; i++)
                {
                    ShutokuKanou.NUMBER[i] = i;                                                                         // 番号を設定
                    ShutokuKanou.ID[i] = KanouResult.Rows[i][RETURN_ITEM_CODE].ToString();                              // IDを設定
                    ShutokuKanou.NAME[i] = KanouResult.Rows[i][RETURN_ITEM_NAME].ToString();                            // 名称を設定
                    Shutoku_Kanou.Items.Add(KanouResult.Rows[i][RETURN_ITEM_NAME]);                                     // 応答項目名称をListBoxに追加
                    if (KanouResult.Rows[i][RETURN_ITEM_CODE].ToString() == Select) Shutoku_Kanou.SelectedIndex = i;    // 取得可能項目の追加された行を選択
                }

                // 応答項目のIDをクリア
                Shutoku_Fuka_ID.Clear();

                Add_Button.Enabled = false;     // 応答許可情報タブの追加ボタンを無効にする

                // 応答可能項目にフォーカスを置く
                Shutoku_Kanou.Focus();
            }
        }
        #endregion

        #region 取消ボタン押下時
        private void Delete_Click(object sender, EventArgs e)
        {
            if (Shutoku_Kanou.Text != "")
            {
                int Index = 0;  // 該当するIDの配列番号

                // 選択された応答項目名称をもとにIDを割り出す処理
                for (int i = 0; i < ShutokuKanou.ID.Count(); i++)
                {
                    if (Shutoku_Kanou.GetSelected(i))
                    {
                        Index = i;

                        break;
                    }
                }

                String Select = ShutokuKanou.ID[Index];  // 選択されたデータを退避

                // 取得可能項目一覧で選択されている項目を取得不可項目一覧に追加
                Shutoku_Fuka.Items.Add(Shutoku_Kanou.Text);

                // 取得可能項目一覧で選択されている項目を削除
                Shutoku_Kanou.Items.Remove(Shutoku_Kanou.Text);

                // 応答許可情報のレコードを削除
                Delete_Reply_Permission();

                DataTable FukaResult = GetFukaKoumokuData();    // 取得不可項目一覧を取得
                DataTable KanouResult = GetKanouKoumokuData();  // 取得可能項目一覧を取得

                // コードと名称の配列数を再設定する
                Array.Resize(ref ShutokuFuka.NUMBER, FukaResult.Rows.Count);    // 番号の配列数を再設定する
                Array.Resize(ref ShutokuFuka.ID, FukaResult.Rows.Count);        // システムコードの配列数を再設定する
                Array.Resize(ref ShutokuFuka.NAME, FukaResult.Rows.Count);      // システム名称の配列数を再設定する
                Array.Resize(ref ShutokuKanou.NUMBER, KanouResult.Rows.Count);  // 番号の配列数を再設定する
                Array.Resize(ref ShutokuKanou.ID, KanouResult.Rows.Count);      // 応答項目コードの配列数を再設定する
                Array.Resize(ref ShutokuKanou.NAME, KanouResult.Rows.Count);    // 応答項目名称の配列数を再設定する

                // 取得不可項目一覧をクリア
                Shutoku_Fuka.Items.Clear();

                // 取得不可項目一覧に追加
                for (int i = 0; i < FukaResult.Rows.Count; i++)
                {
                    ShutokuFuka.NUMBER[i] = i;                                                                      // 番号を設定
                    ShutokuFuka.ID[i] = FukaResult.Rows[i][RETURN_ITEM_CODE].ToString();                            // IDを設定
                    ShutokuFuka.NAME[i] = FukaResult.Rows[i][RETURN_ITEM_NAME].ToString();                          // 名称を設定
                    Shutoku_Fuka.Items.Add(FukaResult.Rows[i][RETURN_ITEM_NAME]);                                   // 応答項目名称をListBoxに追加
                    if (FukaResult.Rows[i][RETURN_ITEM_CODE].ToString() == Select) Shutoku_Fuka.SelectedIndex = i;  // 取得不可項目の追加された行を選択
                }

                // 取得可能項目一覧に追加
                for (int i = 0; i < KanouResult.Rows.Count; i++)
                {
                    ShutokuKanou.NUMBER[i] = i;                                                 // 番号を設定
                    ShutokuKanou.ID[i] = KanouResult.Rows[i][RETURN_ITEM_CODE].ToString();      // IDを設定
                    ShutokuKanou.NAME[i] = KanouResult.Rows[i][RETURN_ITEM_NAME].ToString();    // 名称を設定
                }

                // 応答項目のIDをクリア
                Shutoku_Kanou_ID.Clear();

                Delete_Button.Enabled = false;  // 応答許可情報タブの取消ボタンを無効にする

                // 取得不可項目にフォーカスを置く
                Shutoku_Fuka.Focus();
            }
        }
        #endregion
        #endregion

        #region システム情報
        #region システム情報選択時
        private void System_Info_Data_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (System_Info_Data.SelectedIndex != -1)
            {
                int Index = 0;  // 該当するIDの配列番号

                // 選択されたシステム名称をもとにIDを割り出す処理
                for (int i = 0; i < SystemData.ID.Count(); i++)
                {
                    if (System_Info_Data.GetSelected(i))
                    {
                        Index = i;

                        break;
                    }
                }

                // バインドしているデータをクリア
                Select_System_ID.DataBindings.Clear();
                Select_System_Name.DataBindings.Clear();

                // 選択したシステム名のIDと名称をTextBoxに入れる
                Select_System_ID.DataBindings.Add("Text", SystemData.ID[Index], "");            // IDを追加
                Select_System_Name.DataBindings.Add("Text", System_Info_Data, "SelectedItem");  // 名称を追加

                // Buttonの制御
                System_Delete_Button.Enabled = true;    // システム情報タブの削除ボタンを有効にする
                System_Change_Button.Enabled = true;    // システム情報タブの変更ボタンを有効にする
            }
        }
        #endregion

        #region 削除ボタン押下時
        private void Delete_Button1_Click(object sender, EventArgs e)
        {
            // メッセージボックスを表示する
            DialogResult result = MessageBox.Show(DELETE_MESSAGE, DELETE_CAPTION, MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button2);

            // 何が選択されたか調べる
            if (result == DialogResult.Yes)
            {
                //「はい」が選択された時
                // システム情報更新
                Delete_System_Info();

                // 応答許可情報更新
                Update_Reply_Permission(SYSTEM_MODE);

                // システム情報初期化処理
                System_Init();
            }
            else if (result == DialogResult.No)
            {
                //「いいえ」が選択された時
            }
        }
        #endregion

        #region 変更ボタン押下時
        private void System_Change_Button_Click(object sender, EventArgs e)
        {
            if (System_Info_Data.SelectedIndex != -1)
            {
                System_Info_Data.Enabled = false;   // システム情報タブのシステム名称を無効にする

                // 登録内容のTextBoxの制御
                New_System_ID.ReadOnly = true;      // システム情報タブの登録項目ID入力不可にする
                New_System_Name.ReadOnly = false;   // システム情報タブの登録項目名称入力可能にする

                // 登録内容のTextBoxの背景色を変更する
                New_System_ID.BackColor = SystemColors.ControlDark; // システム情報タブの登録項目IDの背景色を変更する
                New_System_Name.BackColor = SystemColors.Control;   // システム情報タブの登録項目名称の背景色を変更する

                // 各ボタンの制御
                System_Delete_Button.Enabled = false;   // システム情報タブの削除ボタンを無効にする
                System_Change_Button.Enabled = false;   // システム情報タブの変更ボタンを無効にする
                System_New_Button.Enabled = false;      // システム情報タブの新規ボタンを無効にする
                System_Cancel_Button.Enabled = true;    // システム情報タブの取消ボタンを有効にする
                System_Execution_Button.Enabled = true; // システム情報タブの登録実行ボタンを有効にする

                // 選択したシステム名のIDをTextBoxに入れる
                New_System_ID.DataBindings.Add("Text", Select_System_ID, "Text");

                New_System_Name.TabStop = true;    // システム情報タブの登録項目名称のTabを有効にする

                // 登録内容IDにフォーカスを置く
                New_System_Name.Focus();

                ExecutionMode = UPDATE_MODE;   // 更新モードを設定
            }
        }
        #endregion

        #region 新規ボタン押下時
        private void System_New_Button_Click(object sender, EventArgs e)
        {
            System_Info_Data.Enabled = false;   // システム名称を無効にする

            // TextBoxの制御
            Select_System_ID.ReadOnly = true;   // システム情報タブの選択項目ID入力不可にする
            Select_System_Name.ReadOnly = true; // システム情報タブの選択項目名称入力不可にする
            New_System_ID.ReadOnly = false;     // システム情報タブの登録項目ID入力可能にする
            New_System_Name.ReadOnly = false;   // システム情報タブの登録項目名称入力可能にする

            // TextBoxの背景色を変更する
            Select_System_ID.BackColor = SystemColors.ControlDark;      // システム情報タブの選択項目IDの背景色を変更する
            Select_System_Name.BackColor = SystemColors.ControlDark;    // システム情報タブの選択項目名称の背景色を変更する
            New_System_ID.BackColor = SystemColors.Control;             // システム情報タブの登録項目IDの背景色を変更する
            New_System_Name.BackColor = SystemColors.Control;           // システム情報タブの登録項目名称の背景色を変更する

            // 各ボタンの制御
            System_Delete_Button.Enabled = false;   // システム情報タブの削除ボタンを無効にする
            System_Change_Button.Enabled = false;   // システム情報タブの変更ボタンを無効にする
            System_New_Button.Enabled = false;      // システム情報タブの新規ボタンを無効にする
            System_Cancel_Button.Enabled = true;    // システム情報タブの取消ボタンを有効にする
            System_Execution_Button.Enabled = true; // システム情報タブの登録実行ボタンを有効にする

            New_System_ID.TabStop = true;      // システム情報タブの登録項目IDのTabキーを有効にする
            New_System_Name.TabStop = true;    // システム情報タブの登録項目名称のTabキーを有効にする

            // 登録内容IDにフォーカスを置く
            New_System_ID.Focus();

            System_Info_Data.SelectedIndex = -1;    // システム名称を未選択状態にする

            Select_System_ID.ResetText();   // 選択項目IDをクリア
            Select_System_Name.ResetText(); // 選択項目名称をクリア

            ExecutionMode = INSERT_MODE;   // 挿入モードを設定
        }
        #endregion

        #region 取消ボタン押下時
        private void System_Cancel_Button_Click(object sender, EventArgs e)
        {
            // システム情報初期化処理
            System_Init();

            // システム名称にフォーカスを置く
            System_Info_Data.Focus();
        }
        #endregion

        #region 登録実行ボタン押下時
        private void System_Execution_Button_Click(object sender, EventArgs e)
        {
            bool ExecutionFlag = true;  // 実行フラグ

            // IDと名称が入力されているかチェック
            if (New_System_ID.Text != "" && New_System_Name.Text != "")
            {
                // IDの登録不可文字チェック
                if (Regex.IsMatch(New_System_ID.Text, NUMBER))
                {
                    // IDが入力可能範囲かチェック
                    if (int.Parse(New_System_ID.Text) >= 1 && int.Parse(New_System_ID.Text) <= 255)
                    {
                        if (ExecutionMode == INSERT_MODE)
                        {
                            for (int i = 0; i < SystemData.ID.Length; i++)
                            {
                                // 既に登録されているかチェック
                                if (SystemData.ID[i].ToString() == New_System_ID.Text)
                                {
                                    // メッセージボックスを表示する
                                    MessageBox.Show(ALREADY_REGISTERED_MESSAGE + New_System_ID.Text, INPUT_CHECK_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                                    return;
                                }
                            }
                        }

                        // 名称の空白チェック
                        if (Regex.IsMatch(New_System_Name.Text, SPACE))
                        {
                            // メッセージボックスを表示する
                            DialogResult result = MessageBox.Show(SPACE_MESSAGE, INPUT_CHECK_CAPTION, MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                            // 何が選択されたか調べる
                            if (result == DialogResult.Yes)
                            {
                                //「はい」が選択された時
                                // 空白を削除
                                New_System_Name.Text = Regex.Replace(New_System_Name.Text, SPACE, "");
                            }
                            else if (result == DialogResult.No)
                            {
                                //「いいえ」が選択された時
                                ExecutionFlag = false;  // 実行しない
                            }
                        }

                        if (ExecutionFlag)
                        {
                            if (ExecutionMode == INSERT_MODE)
                            {
                                // システム情報追加
                                Insert_System_Info();
                            }
                            else if (ExecutionMode == UPDATE_MODE)
                            {
                                // システム情報更新
                                Update_System_Info();
                            }

                            // システム情報初期化処理
                            System_Init();

                            // システム名称にフォーカスを置く
                            System_Info_Data.Focus();
                        }
                    }
                    else
                    {
                        // メッセージボックスを表示する
                        MessageBox.Show(POSSIBLE_RANGE, INPUT_CHECK_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
                    }
                }
                else
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(NOT_REGISTER, INPUT_CHECK_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
                }
            }
            else
            {
                // メッセージボックスを表示する
                MessageBox.Show(EMPTY_MESSAGE, INPUT_CHECK_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
            }
        }
        #endregion
        #endregion

        #region 応答項目情報
        #region 応答項目情報選択時
        private void Return_Item_Data_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Return_Item_Data.SelectedIndex != -1)
            {
                int Index = 0;  // 該当するIDの配列番号

                // 選択された応答項目名称をもとにIDを割り出す処理
                for (int i = 0; i < ReturnItemData.ID.Count(); i++)
                {
                    if (Return_Item_Data.GetSelected(i))
                    {
                        Index = i;

                        break;
                    }
                }

                // バインドしているデータをクリア
                Select_Return_Item_ID.DataBindings.Clear();
                Select_Return_Item_Name.DataBindings.Clear();

                // 選択した応答項目名のIDと名称をTextBoxに入れる
                Select_Return_Item_ID.DataBindings.Add("Text", ReturnItemData.ID[Index], "");       // IDを追加
                Select_Return_Item_Name.DataBindings.Add("Text", Return_Item_Data, "SelectedItem"); // 名称を追加

                // Buttonの制御
                Return_Item_Delete_Button.Enabled = true;    // 応答項目情報タブの削除ボタンを有効にする
                Return_Item_Change_Button.Enabled = true;    // 応答項目情報タブの変更ボタンを有効にする
            }
        }
        #endregion

        #region 削除ボタン押下時
        private void Return_Item_Delete_Button_Click(object sender, EventArgs e)
        {
            // メッセージボックスを表示する
            DialogResult result = MessageBox.Show(DELETE_MESSAGE, DELETE_CAPTION, MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button2);

            // 何が選択されたか調べる
            if (result == DialogResult.Yes)
            {
                //「はい」が選択された時
                // 応答項目情報更新
                Delete_Return_Item();

                // 応答許可情報更新
                Update_Reply_Permission(RETURN_ITEM_MODE);

                // 応答項目情報初期化処理
                Return_Item_Init();
            }
            else if (result == DialogResult.No)
            {
                //「いいえ」が選択された時
            }
        }
        #endregion

        #region 変更ボタン押下時
        private void Return_Item_Change_Button_Click(object sender, EventArgs e)
        {
            if (Return_Item_Data.SelectedIndex != -1)
            {
                Return_Item_Data.Enabled = false;   // 応答項目名称を無効にする

                // 登録内容のTextBoxの制御
                New_Return_Item_ID.ReadOnly = true;      // 応答項目情報タブの登録項目ID入力不可
                New_Return_Item_Name.ReadOnly = false;   // 応答項目情報タブの登録項目名称入力可能

                // 登録内容のTextBoxの背景色を変更する
                New_Return_Item_ID.BackColor = SystemColors.ControlDark; // 応答項目情報タブの登録項目IDの背景色を変更する
                New_Return_Item_Name.BackColor = SystemColors.Control;   // 応答項目情報タブの登録項目名称の背景色を変更する

                // 各ボタンの制御
                Return_Item_Delete_Button.Enabled = false;   // 応答項目情報タブの削除ボタンを無効にする
                Return_Item_Change_Button.Enabled = false;   // 応答項目情報タブの変更ボタンを無効にする
                Return_Item_New_Button.Enabled = false;      // 応答項目情報タブの新規ボタンを無効にする
                Return_Item_Cancel_Button.Enabled = true;    // 応答項目情報タブの取消ボタンを有効にする
                Return_Item_Execution_Button.Enabled = true; // 応答項目情報タブの登録実行ボタンを有効にする

                // 選択した応答項目名のIDをTextBoxに入れる
                New_Return_Item_ID.DataBindings.Add("Text", Select_Return_Item_ID, "Text");

                New_Return_Item_Name.TabStop = true;    // 応答項目情報タブの登録項目名称のTabキー有効にする

                // 登録内容IDにフォーカスを置く
                New_Return_Item_Name.Focus();

                ExecutionMode = UPDATE_MODE;   // 更新モードを設定
            }
        }
        #endregion

        #region 新規ボタン押下時
        private void Return_Item_New_Button_Click(object sender, EventArgs e)
        {
            Return_Item_Data.Enabled = false;   // 応答項目名称を無効にする

            // TextBoxの制御
            Select_Return_Item_ID.ReadOnly = true;     // 応答項目情報タブの選択項目ID入力不可にする
            Select_Return_Item_Name.ReadOnly = true;   // 応答項目情報タブの選択項目名称入力不可にする
            New_Return_Item_ID.ReadOnly = false;       // 応答項目情報タブの登録項目ID入力可能にする
            New_Return_Item_Name.ReadOnly = false;     // 応答項目情報タブの登録項目名称入力可能にする

            // TextBoxの背景色を変更する
            Select_Return_Item_ID.BackColor = SystemColors.ControlDark;      // 応答項目情報タブの選択項目IDの背景色を変更する
            Select_Return_Item_Name.BackColor = SystemColors.ControlDark;    // 応答項目情報タブの選択項目名称の背景色を変更する
            New_Return_Item_ID.BackColor = SystemColors.Control;             // 応答項目情報タブの登録項目IDの背景色を変更する
            New_Return_Item_Name.BackColor = SystemColors.Control;           // 応答項目情報タブの登録項目名称の背景色を変更する

            // 各ボタンの制御
            Return_Item_Delete_Button.Enabled = false;   // 応答項目情報タブの削除ボタンを無効にする
            Return_Item_Change_Button.Enabled = false;   // 応答項目情報タブの変更ボタンを無効にする
            Return_Item_New_Button.Enabled = false;      // 応答項目情報タブの新規ボタンを無効にする
            Return_Item_Cancel_Button.Enabled = true;    // 応答項目情報タブの取消ボタンを有効にする
            Return_Item_Execution_Button.Enabled = true; // 応答項目情報タブの登録実行ボタンを有効にする

            New_Return_Item_ID.TabStop = true;      // 応答項目情報タブの登録項目IDのTabキー有効にする
            New_Return_Item_Name.TabStop = true;    // 応答項目情報タブの登録項目名称のTabキー有効にする

            // 登録内容IDにフォーカスを置く
            New_Return_Item_ID.Focus();

            Return_Item_Data.SelectedIndex = -1;    // 応答項目名称を未選択状態にする

            Select_Return_Item_ID.ResetText();   // 選択項目IDをクリア
            Select_Return_Item_Name.ResetText(); // 選択項目名称をクリア

            ExecutionMode = INSERT_MODE;   // 挿入モードを設定
        }
        #endregion

        #region 取消ボタン押下時
        private void Return_Item_Cancel_Button_Click(object sender, EventArgs e)
        {
            // 応答項目情報初期化処理
            Return_Item_Init();

            // 応答項目名称にフォーカスを置く
            Return_Item_Data.Focus();
        }
        #endregion

        #region 登録実行ボタン押下時
        private void Return_Item_Execution_Button_Click(object sender, EventArgs e)
        {
            bool ExecutionFlag = true;  // 実行フラグ

            // IDと名称が入力されているかチェック
            if (New_Return_Item_ID.Text != "" && New_Return_Item_Name.Text != "")
            {
                // IDの登録不可文字チェック
                if (Regex.IsMatch(New_Return_Item_ID.Text, NUMBER))
                {
                    // IDが入力可能範囲かチェック
                    if (int.Parse(New_Return_Item_ID.Text) >= 1 && int.Parse(New_Return_Item_ID.Text) <= 255)
                    {
                        if (ExecutionMode == INSERT_MODE)
                        {
                            for (int i = 0; i < ReturnItemData.ID.Length; i++)
                            {
                                // 既に登録されているかチェック
                                if (ReturnItemData.ID[i].ToString() == New_Return_Item_ID.Text)
                                {
                                    // メッセージボックスを表示する
                                    MessageBox.Show(ALREADY_REGISTERED_MESSAGE + New_Return_Item_ID.Text, INPUT_CHECK_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                                    return;
                                }
                            }
                        }

                        // 名称の空白チェック
                        if (Regex.IsMatch(New_Return_Item_Name.Text, SPACE))
                        {
                            // メッセージボックスを表示する
                            DialogResult result = MessageBox.Show(SPACE_MESSAGE, INPUT_CHECK_CAPTION, MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                            // 何が選択されたか調べる
                            if (result == DialogResult.Yes)
                            {
                                //「はい」が選択された時
                                // 空白を削除
                                New_Return_Item_Name.Text = Regex.Replace(New_Return_Item_Name.Text, SPACE, "");
                            }
                            else if (result == DialogResult.No)
                            {
                                //「いいえ」が選択された時
                                ExecutionFlag = false;  // 実行しない
                            }
                        }

                        if (ExecutionFlag)
                        {
                            if (ExecutionMode == INSERT_MODE)
                            {
                                // 応答項目情報追加
                                Insert_Return_Item();
                            }
                            else if (ExecutionMode == UPDATE_MODE)
                            {
                                // 応答項目情報更新
                                Update_Return_Item();
                            }

                            // 応答項目情報初期化処理
                            Return_Item_Init();

                            // 応答項目名称にフォーカスを置く
                            Return_Item_Data.Focus();
                        }
                    }
                    else
                    {
                        // メッセージボックスを表示する
                        MessageBox.Show(POSSIBLE_RANGE, INPUT_CHECK_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
                    }
                }
                else
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(NOT_REGISTER, INPUT_CHECK_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
                }
            }
            else
            {
                // メッセージボックスを表示する
                MessageBox.Show(EMPTY_MESSAGE, INPUT_CHECK_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);
            }
        }
        #endregion
        #endregion

        #region 終了ボタン押下時
        private void END_Click(object sender, EventArgs e)
        {
            // ウィンドウを閉じる
            this.Close();
        }
        #endregion

        #region SQL
        #region PG起動情報取得
        public DataTable GetProgramData()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = GET_PROGRAM_DATA;

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table;
        }
        #endregion

        #region システム情報取得
        public DataTable GetSystemData()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = GET_SYSTEM_DATA;

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table;
        }
        #endregion

        #region 応答項目情報取得
        public DataTable GetReturnItemData()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = GET_RETURN_ITEM_DATA;

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table;
        }
        #endregion

        #region 取得不可項目取得
        public DataTable GetFukaKoumokuData()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = GET_FUKAKKOUMOKU_DATA;
                    command.Parameters.Add(new SqlParameter(ADD_SYSTEM_CODE, System_ID.Text.ToString()));

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table;
        }
        #endregion

        #region 取得可能項目取得
        public DataTable GetKanouKoumokuData()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = GET_KANOUKOUMOKU_DATA;
                    command.Parameters.Add(new SqlParameter(ADD_SYSTEM_CODE, System_ID.Text.ToString()));

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table;
        }
        #endregion

        #region 応答許可情報追加
        public void Insert_Reply_Permission()
        {
            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの準備
                    command.CommandText = INSERT_REPLY_PERMISSION;
                    command.Parameters.Add(new SqlParameter(ADD_SYSTEM_CODE, System_ID.Text.ToString()));
                    command.Parameters.Add(new SqlParameter(ADD_RETURN_ITEM_CODE, Shutoku_Fuka_ID.Text.ToString()));

                    // SQLの実行
                    command.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region 応答許可情報削除
        public void Delete_Reply_Permission()
        {
            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの準備
                    command.CommandText = DELETE_REPLY_PERMISSION;
                    command.Parameters.Add(new SqlParameter(ADD_SYSTEM_CODE, System_ID.Text.ToString()));
                    command.Parameters.Add(new SqlParameter(ADD_RETURN_ITEM_CODE, Shutoku_Kanou_ID.Text.ToString()));

                    // SQLの実行
                    command.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region PG起動情報追加
        public void Insert_Program_Working_Info()
        {
            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {

                    // データベースの接続開始
                    connection.Open();

                    // SQLの準備
                    command.CommandText = INSERT_PROGRAM_WORKING_INFO;
                    command.Parameters.Add(new SqlParameter(ADD_SERIAL_NUMBER, SerialNumber));
                    command.Parameters.Add(new SqlParameter(ADD_WORKING_HOST_NAME, getTerminalHostName()));
                    command.Parameters.Add(new SqlParameter(ADD_WORKING_IP_ADDRESS, getTerminalIPAddress()));

                    // SQLの実行
                    command.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region PG起動情報更新
        public void Update_Program_Working_Info()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = UPDATE_PROGRAM_WORKING_INFO;
                    command.Parameters.Add(new SqlParameter(ADD_SERIAL_NUMBER, SerialNumber));

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region システム情報論理削除
        public void Delete_System_Info()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = DELETE_SYSTEM_INFORMATION;
                    command.Parameters.Add(new SqlParameter(ADD_DELETE_HOST_NAME, getTerminalHostName()));
                    command.Parameters.Add(new SqlParameter(ADD_SYSTEM_CODE, Select_System_ID.Text.ToString()));

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region システム情報追加
        public void Insert_System_Info()
        {
            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの準備
                    command.CommandText = INSERT_SYSTEM_INFORMATION;
                    command.Parameters.Add(new SqlParameter(ADD_SYSTEM_CODE, New_System_ID.Text));
                    command.Parameters.Add(new SqlParameter(ADD_SYSTEM_NAME, New_System_Name.Text));

                    // SQLの実行
                    command.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region システム情報更新
        public void Update_System_Info()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = UPDATE_SYSTEM_INFORMATION;
                    command.Parameters.Add(new SqlParameter(ADD_SYSTEM_CODE, Select_System_ID.Text.ToString()));
                    command.Parameters.Add(new SqlParameter(ADD_SYSTEM_NAME, New_System_Name.Text.ToString()));

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region 応答項目情報論理削除
        public void Delete_Return_Item()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = DELETE_RETURN_ITEM;
                    command.Parameters.Add(new SqlParameter(ADD_DELETE_HOST_NAME, getTerminalHostName()));
                    command.Parameters.Add(new SqlParameter(ADD_RETURN_ITEM_CODE, Select_Return_Item_ID.Text.ToString()));

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region 応答項目情報追加
        public void Insert_Return_Item()
        {
            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの準備
                    command.CommandText = INSERT_RETURN_ITEM;
                    command.Parameters.Add(new SqlParameter(ADD_RETURN_ITEM_CODE, New_Return_Item_ID.Text));
                    command.Parameters.Add(new SqlParameter(ADD_RETURN_ITEM_NAME, New_Return_Item_Name.Text));

                    // SQLの実行
                    command.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region 応答項目情報更新
        public void Update_Return_Item()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = UPDATE_RETURN_ITEM;
                    command.Parameters.Add(new SqlParameter(ADD_RETURN_ITEM_CODE, Select_Return_Item_ID.Text.ToString()));
                    command.Parameters.Add(new SqlParameter(ADD_RETURN_ITEM_NAME, New_Return_Item_Name.Text.ToString()));

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region 応答許可情報更新
        public void Update_Reply_Permission(String mode)
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    if (mode == SYSTEM_MODE)
                    {
                        command.CommandText = UPDATE_REPLY_PERMISSION_SYSTEM;
                        command.Parameters.Add(new SqlParameter(ADD_DELETE_HOST_NAME, getTerminalHostName()));
                        command.Parameters.Add(new SqlParameter(ADD_SYSTEM_CODE, Select_System_ID.Text.ToString()));
                    }
                    else if (mode == RETURN_ITEM_MODE)
                    {
                        command.CommandText = UPDATE_REPLY_PERMISSION_RETURN_ITEM;
                        command.Parameters.Add(new SqlParameter(ADD_DELETE_HOST_NAME, getTerminalHostName()));
                        command.Parameters.Add(new SqlParameter(ADD_RETURN_ITEM_CODE, Select_Return_Item_ID.Text.ToString()));
                    }

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region 起動データ取得
        public DataTable GetProgram()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = GET_PROGRAM;
                    command.Parameters.Add(new SqlParameter(ADD_SERIAL_NUMBER, SerialNumber));

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table;
        }
        public string GetTaskList()
        {
            string Results = "";
            try
            {
                // Processオブジェクトを作成
                System.Diagnostics.Process p = new System.Diagnostics.Process();

                // ComSpec(cmd.exe)のパスを取得して、FileNameプロパティに指定
                p.StartInfo.FileName = System.Environment.GetEnvironmentVariable(CMDEXE);
                // 出力を読み取れるようにする
                p.StartInfo.UseShellExecute = false;
                p.StartInfo.RedirectStandardOutput = true;
                p.StartInfo.RedirectStandardInput = false;
                // ウィンドウを表示しないようにする
                p.StartInfo.CreateNoWindow = true;
                // コマンドラインを指定
                p.StartInfo.Arguments = COMMAND_TASKLIST;

                // 起動
                p.Start();

                // 出力を読み取る
                Results = p.StandardOutput.ReadToEnd();

            }
            catch (Exception exception)
            {
                // メッセージボックスを表示する
                MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                // フォームを閉じる
                this.Close();
            }
            finally
            {
            }
            return Results;
        }
        #endregion

        #region 比較用の応答許可情報作成
        public void Create_Work_Reply_Permission()
        {
            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの準備
                    command.CommandText = CREATE_WK_REPLY_PERMISSION;

                    // SQLの実行
                    command.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region 応答許可情報の追加されたデータを検索
        public DataTable Search_Add_Data_Reply_Permission()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = SEARCH_ADD_DATA_REPLY_PERMISSION;

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table;
        }
        #endregion

        #region 応答許可情報の取消されたデータを検索
        public DataTable Search_Delete_Data_Reply_Permission()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = SEARCH_DELETE_DATA_REPLY_PERMISSION;

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table;
        }
        #endregion

        #region 比較用の応答許可情報削除
        public void Drop_Work_Reply_Permission()
        {
            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの準備
                    command.CommandText = DROP_WK_REPLY_PERMISSION;

                    // SQLの実行
                    command.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region 比較用のシステム情報作成
        public void Create_Work_System_Info()
        {
            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの準備
                    command.CommandText = CREATE_WK_SYSTEM_INFORMATION;

                    // SQLの実行
                    command.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region システム情報の追加されたデータを検索
        public DataTable Search_Add_Data_System_Info()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = SEARCH_ADD_DATA_SYSTEM_INFORMATION;

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table;
        }
        #endregion

        #region システム情報の取消されたデータを検索
        public DataTable Search_Delete_Data_System_Info()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = SEARCH_DELETE_DATA_SYSTEM_INFORMATION;

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table;
        }
        #endregion

        #region 比較用のシステム情報削除
        public void Drop_Work_System_Info()
        {
            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの準備
                    command.CommandText = DROP_WK_SYSTEM_INFORMATION;

                    // SQLの実行
                    command.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region 比較用の応答項目情報作成
        public void Create_Work_Return_Item()
        {
            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの準備
                    command.CommandText = CREATE_WK_RETURN_ITEM;

                    // SQLの実行
                    command.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region 応答項目情報の追加されたデータを検索
        public DataTable Search_Add_Data_Return_Item()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = SEARCH_ADD_DATA_RETURN_ITEM;

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table;
        }
        #endregion

        #region 応答項目情報の取消されたデータを検索
        public DataTable Search_Delete_Data_Return_Item()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = SEARCH_DELETE_DATA_RETURN_ITEM;

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table;
        }
        #endregion

        #region 比較用の応答項目情報削除
        public void Drop_Work_Return_Item()
        {
            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの準備
                    command.CommandText = DROP_WK_RETURN_ITEM;

                    // SQLの実行
                    command.ExecuteNonQuery();
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }
        }
        #endregion

        #region 比較用の応答許可情報の存在確認
        public String Get_Work_Reply_Permission()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = GET_WK_REPLY_PERMISSION;

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table.Rows[0][0].ToString();
        }
        #endregion

        #region 比較用のシステム情報の存在確認
        public String Get_Work_System_Info()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = GET_WK_SYSTEM_INFORMATION;

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table.Rows[0][0].ToString();
        }
        #endregion

        #region 比較用の応答項目情報の存在確認
        public String Get_Work_Return_Item()
        {
            var table = new DataTable();

            // 接続文字列の取得
            var connectionString = CONNECTION_STRING;

            using (var connection = new SqlConnection(connectionString))
            using (var command = connection.CreateCommand())
            {
                try
                {
                    // データベースの接続開始
                    connection.Open();

                    // SQLの設定
                    command.CommandText = GET_WK_RETURN_ITEM;

                    // SQLの実行
                    var adapter = new SqlDataAdapter(command);
                    adapter.Fill(table);
                }
                catch (Exception exception)
                {
                    // メッセージボックスを表示する
                    MessageBox.Show(exception.Message, ERROR_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    // フォームを閉じる
                    this.Close();
                }
                finally
                {
                    // データベースの接続終了
                    connection.Close();
                }
            }

            return table.Rows[0][0].ToString();
        }
        #endregion
        #endregion

        #region 初期化処理
        #region 応答許可情報初期化処理
        private void Permission_Init()
        {
            // 結果を格納
            DataTable SystemResult = GetSystemData();           // システム情報取得
            DataTable Return_ItemResult = GetReturnItemData();  // 応答項目情報取得

            // コードと名称の配列数を再設定する
            Array.Resize(ref SystemData.ID, SystemResult.Rows.Count);               // システムコードの配列数を再設定する
            Array.Resize(ref SystemData.NAME, SystemResult.Rows.Count);             // システム名称の配列数を再設定する
            Array.Resize(ref ReturnItemData.ID, Return_ItemResult.Rows.Count);      // 応答項目コードの配列数を再設定する
            Array.Resize(ref ReturnItemData.NAME, Return_ItemResult.Rows.Count);    // 応答項目名称の配列数を再設定する

            // 応答許可情報タブのシステム名をクリア
            System_Name_Select.Items.Clear();

            // システム名称選択を初期化
            System_Name_Select.ResetText();

            // システム名を追加
            for (int i = 0; i < SystemResult.Rows.Count; i++)
            {
                System_Name_Select.Items.Add(SystemResult.Rows[i][SYSTEM_NAME]);      // システム名称をComboBoxに追加
                SystemData.ID[i] = SystemResult.Rows[i][SYSTEM_CODE].ToString();      // システムコードを構造体へ格納
                SystemData.NAME[i] = SystemResult.Rows[i][SYSTEM_NAME].ToString();    // システム名称を構造体へ格納
            }

            // 応答項目情報を構造体へ格納
            for (int i = 0; i < Return_ItemResult.Rows.Count; i++)
            {
                ReturnItemData.ID[i] = Return_ItemResult.Rows[i][RETURN_ITEM_CODE].ToString();      // 応答項目コードを構造体へ格納
                ReturnItemData.NAME[i] = Return_ItemResult.Rows[i][RETURN_ITEM_NAME].ToString();    // 応答項目名称を構造体へ格納
            }

            // 各IDのTextBoxを入力不可にする
            System_ID.ReadOnly = true;          // 応答許可情報タブのシステムIDを入力不可
            Shutoku_Fuka_ID.ReadOnly = true;    // 応答許可情報タブの不可項目IDを入力不可
            Shutoku_Kanou_ID.ReadOnly = true;   // 応答許可情報タブの可能項目IDを入力不可

            // 各TextBoxの背景色を変更する
            System_ID.BackColor = SystemColors.ControlDark;         // 応答許可情報タブのシステムIDの背景色を変更する
            Shutoku_Fuka_ID.BackColor = SystemColors.ControlDark;   // 応答許可情報タブの不可項目IDの背景色を変更する
            Shutoku_Kanou_ID.BackColor = SystemColors.ControlDark;  // 応答許可情報タブの可能項目IDの背景色を変更する

            // Tabキー無効
            System_ID.TabStop = false;          // システムIDのTabキーを無効にする
            Shutoku_Fuka_ID.TabStop = false;    // 取得不可項目IDのTabキーを無効にする
            Shutoku_Kanou_ID.TabStop = false;   // 取得可能項目IDのTabキーを無効にする

            // TextBoxをクリア
            System_ID.Clear();          // システムIDをクリア
            Shutoku_Fuka_ID.Clear();    // 取得不可項目IDクリア
            Shutoku_Kanou_ID.Clear();   // 取得可能項目IDクリア

            // ListBoxをクリア
            Shutoku_Fuka.Items.Clear();     // 取得不可項目一覧をクリア
            Shutoku_Kanou.Items.Clear();    // 取得可能項目一覧をクリア

            // 各ListBoxの制御
            Shutoku_Fuka.Enabled = false;   // 取得不可項目を無効にする
            Shutoku_Kanou.Enabled = false;  // 取得可能項目を無効にする

            // 各Buttonをの制御
            Add_Button.Enabled = false;     // 応答許可情報タブの追加ボタンを無効にする
            Delete_Button.Enabled = false;  // 応答許可情報タブの取消ボタンを無効にする
        }
        #endregion

        #region システム情報初期化処理
        private void System_Init()
        {
            DataTable SystemResult = GetSystemData();       // システム情報取得

            // コードと名称の配列数を再設定する
            Array.Resize(ref SystemData.ID, SystemResult.Rows.Count);       // システムコードの配列数を再設定する
            Array.Resize(ref SystemData.NAME, SystemResult.Rows.Count);     // システム名称の配列数を再設定する

            // バインドしているデータをクリア
            System_Info_Data.Items.Clear();             // システム情報タブの変更項目をクリア
            Select_System_ID.DataBindings.Clear();      // システム情報タブの選択項目IDをクリア
            Select_System_Name.DataBindings.Clear();    // システム情報タブの選択項目名称をクリア
            New_System_ID.DataBindings.Clear();         // システム情報タブの登録内容IDをクリア

            // 初期値に戻す
            Select_System_ID.ResetText();       // 選択項目のシステムIDを初期化
            Select_System_Name.ResetText();     // 選択項目のシステム名称を初期化
            New_System_ID.ResetText();          // 登録情報のシステムIDを初期化
            New_System_Name.ResetText();        // 登録情報のシステム名称を初期化
            
            // システム名に追加
            for (int i = 0; i < SystemResult.Rows.Count; i++)
            {
                System_Info_Data.Items.Add(SystemResult.Rows[i][SYSTEM_NAME]);        // システム名称をListBoxに追加
                SystemData.ID[i] = SystemResult.Rows[i][SYSTEM_CODE].ToString();      // システムコードを構造体へ格納
                SystemData.NAME[i] = SystemResult.Rows[i][SYSTEM_NAME].ToString();    // システム名称を構造体へ格納
            }

            // 各TextBoxを入力不可にする
            Select_System_ID.ReadOnly = true;       // システム情報タブの選択項目ID入力不可
            Select_System_Name.ReadOnly = true;     // システム情報タブの選択項目名称入力不可
            New_System_ID.ReadOnly = true;          // システム情報タブの登録項目ID入力不可
            New_System_Name.ReadOnly = true;        // システム情報タブの登録項目名称入力不可

            // 各TextBoxの背景色を変更する
            Select_System_ID.BackColor = SystemColors.ControlDark;      // システム情報タブの選択項目のシステムIDの背景色を変更する
            Select_System_Name.BackColor = SystemColors.ControlDark;    // システム情報タブの選択項目のシステム名称の背景色を変更する
            New_System_ID.BackColor = SystemColors.ControlDark;         // システム情報タブの登録情報のシステムIDの背景色を変更する
            New_System_Name.BackColor = SystemColors.ControlDark;       // システム情報タブの登録情報のシステム名称の背景色を変更する

            // 各ListBoxの制御
            System_Info_Data.Enabled = true;    // システム情報タブの選択を有効にする

            // Tabキー無効
            Select_System_ID.TabStop = false;   // システム情報タブの選択項目IDのTabキーを無効にする
            Select_System_Name.TabStop = false; // システム情報タブの選択項目名称のTabキーを無効にする
            New_System_ID.TabStop = false;      // システム情報タブの登録項目IDのTabキーを無効にする
            New_System_Name.TabStop = false;    // システム情報タブの登録項目名称のTabキーを無効にする

            // 各Buttonの制御
            System_Delete_Button.Enabled = false;       // システム情報タブの削除ボタンを無効にする
            System_Change_Button.Enabled = false;       // システム情報タブの変更ボタンを無効にする
            System_New_Button.Enabled = true;           // システム情報タブの新規ボタンを有効にする
            System_Cancel_Button.Enabled = false;       // システム情報タブの取消ボタンを無効にする
            System_Execution_Button.Enabled = false;    // システム情報タブの登録実行ボタンを無効にする

            // ListBox初期状態にする
            System_Info_Data.SelectedIndex = -1;    // システム名称を未選択状態にする
            System_Info_Data.Enabled = true;        // システム名称を有効にする

            // 新規ボタンにフォーカスを置く
            System_New_Button.Focus();
        }
        #endregion

        #region 応答項目情報初期化処理
        private void Return_Item_Init()
        {
            DataTable Return_ItemResult = GetReturnItemData();   // 応答項目情報取得

            // コードと名称の配列数を再設定する
            Array.Resize(ref ReturnItemData.ID, Return_ItemResult.Rows.Count);   // 応答項目コードの配列数を再設定する
            Array.Resize(ref ReturnItemData.NAME, Return_ItemResult.Rows.Count); // 応答項目名称の配列数を再設定する

            // バインドしているデータをクリア
            Return_Item_Data.Items.Clear();                 // 応答項目情報タブの変更項目をクリア
            Select_Return_Item_ID.DataBindings.Clear();     // 応答項目情報タブの選択項目IDをクリア
            Select_Return_Item_Name.DataBindings.Clear();   // 応答項目情報タブの選択項目名称をクリア
            New_Return_Item_ID.DataBindings.Clear();        // 応答項目情報タブの登録内容IDをクリア

            // 初期値に戻す
            Select_Return_Item_ID.ResetText();     // 選択項目の応答項目IDを初期化
            Select_Return_Item_Name.ResetText();   // 選択項目の応答項目名称を初期化
            New_Return_Item_ID.ResetText();        // 登録情報の応答項目IDを初期化
            New_Return_Item_Name.ResetText();      // 登録情報の応答項目名称を初期化

            // 応答項目情報を構造体へ格納
            for (int i = 0; i < Return_ItemResult.Rows.Count; i++)
            {
                Return_Item_Data.Items.Add(Return_ItemResult.Rows[i][RETURN_ITEM_NAME]);            // 応答項目名称をListBoxに追加
                ReturnItemData.ID[i] = Return_ItemResult.Rows[i][RETURN_ITEM_CODE].ToString();      // 応答項目コードを構造体へ格納
                ReturnItemData.NAME[i] = Return_ItemResult.Rows[i][RETURN_ITEM_NAME].ToString();    // 応答項目名称を構造体へ格納
            }

            // 各TextBoxを入力不可にする
            Select_Return_Item_ID.ReadOnly = true;     // 応答項目情報タブの選択項目ID入力不可
            Select_Return_Item_Name.ReadOnly = true;   // 応答項目情報タブの選択項目名称入力不可
            New_Return_Item_ID.ReadOnly = true;        // 応答項目情報タブの登録項目ID入力不可
            New_Return_Item_Name.ReadOnly = true;      // 応答項目情報タブの登録項目名称入力不可

            // 各IDのTextBoxの背景色を変更する
            Select_Return_Item_ID.BackColor = SystemColors.ControlDark;      // 応答項目情報タブの選択項目のシステムIDの背景色を変更する
            Select_Return_Item_Name.BackColor = SystemColors.ControlDark;    // 応答項目情報タブの選択項目のシステム名称の背景色を変更する
            New_Return_Item_ID.BackColor = SystemColors.ControlDark;         // 応答項目情報タブの登録情報のシステムIDの背景色を変更する
            New_Return_Item_Name.BackColor = SystemColors.ControlDark;       // 応答項目情報タブの登録情報のシステム名称の背景色を変更する

            // 各ListBoxの制御
            Return_Item_Data.Enabled = true;  // 応答項目情報タブの選択を有効にする

            // Tabキー無効
            Select_Return_Item_ID.TabStop = false;   // 応答項目情報タブの選択項目IDのTabキー無効にする
            Select_Return_Item_Name.TabStop = false; // 応答項目情報タブの選択項目名称のTabキー無効にする
            New_Return_Item_ID.TabStop = false;      // 応答項目情報タブの登録項目IDのTabキー無効にする
            New_Return_Item_Name.TabStop = false;    // 応答項目情報タブの登録項目名称のTabキー無効にする

            // 各Buttonの制御
            Return_Item_Delete_Button.Enabled = false;     // 応答項目情報タブの削除ボタンを無効にする
            Return_Item_Change_Button.Enabled = false;     // 応答項目情報タブの変更ボタンを無効にする
            Return_Item_New_Button.Enabled = true;         // 応答項目情報タブの新規ボタンを有効にする
            Return_Item_Cancel_Button.Enabled = false;     // 応答項目情報タブの取消ボタンを無効にする
            Return_Item_Execution_Button.Enabled = false;  // 応答項目情報タブの登録実行ボタンを無効にする

            // ListBox初期状態にする
            Return_Item_Data.SelectedIndex = -1;  // 応答項目名称を未選択状態にする
            Return_Item_Data.Enabled = true;      // 応答項目名称を有効にする

            // 新規ボタンにフォーカスを置く
            Return_Item_New_Button.Focus();
        }
        #endregion
        #endregion

        #region 閉じるとき
        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            if (SerialNumber != -1)
            {
                // PG起動情報更新
                Update_Program_Working_Info();

                // ログを追記モードで開く
                System.IO.StreamWriter Log = new System.IO.StreamWriter(Environment.CurrentDirectory + FILE_NAME, true, System.Text.Encoding.GetEncoding(SHIFT_JIS));

                // ログを書き込む
                Log.Write(CreateLog());

                // 閉じる
                Log.Close();

                // 比較用の応答許可情報削除
                if (Convert.ToBoolean(Get_Work_Reply_Permission())) Drop_Work_Reply_Permission();

                // 比較用のシステム情報削除
                if (Convert.ToBoolean(Get_Work_System_Info())) Drop_Work_System_Info();

                // 比較用の応答項目情報削除
                if (Convert.ToBoolean(Get_Work_Return_Item())) Drop_Work_Return_Item();
            }
        }
        #endregion

        #region ログ作成
        private String CreateLog()
        {
            DataTable Result = GetProgram();                                          // 起動データを取得
            DataTable AddDataPermission = Search_Add_Data_Reply_Permission();         // 応答許可情報の追加されたデータを検索
            DataTable DeleteDataPermission = Search_Delete_Data_Reply_Permission();   // 応答許可情報の取消されたデータを検索
            DataTable AddDataSystem = Search_Add_Data_System_Info();                  // システム情報の追加されたデータを検索
            DataTable DeleteDataSystem = Search_Delete_Data_System_Info();            // システム情報の取消されたデータを検索
            DataTable AddDataReturnItem = Search_Add_Data_Return_Item();              // 応答項目情報の追加されたデータを検索
            DataTable DeleteDataReturnItem = Search_Delete_Data_Return_Item();        // 応答項目情報の取消されたデータを検索
            String StartDateTime = "";                                                // 開始時間
            String EndDateTime = "";                                                  // 終了時間
            String HostName = "";                                                     // ホスト名
            String Log = "";                                                          // ログ

            // 起動データを格納
            for (int i = 0; i < Result.Rows.Count; i++)
            {
                StartDateTime = Result.Rows[i][START_DATE_TIME].ToString(); // 開始時間を格納
                EndDateTime = Result.Rows[i][END_DATE_TIME].ToString();     // 終了時間を格納
                HostName = Result.Rows[i][WORKING_HOST_NAME].ToString();    // ホスト名を格納
            }

            Log = StartDateTime + " ====== プログラム起動 ======\r\n"
                + "　起動端末：" + HostName + "\r\n"
                + "　変更内容：\r\n"
                + "　　【応答許可情報】\r\n"
                + "　　　追加\r\n";

            // 応答許可情報の追加されたデータを検索
            for (int i = 0; i < AddDataPermission.Rows.Count; i++)
            {
                Log += "       " + AddDataPermission.Rows[i][0].ToString() + ":";   // システムコード
                Log += AddDataPermission.Rows[i][1].ToString() + " ";               // システム名称
                Log += AddDataPermission.Rows[i][2].ToString() + ":";               // 応答項目コード
                Log += AddDataPermission.Rows[i][3].ToString() + "\r\n";            // 応答項目名称
            }

            Log += "　　　削除\r\n";

            // 応答許可情報の取消されたデータを検索
            for (int i = 0; i < DeleteDataPermission.Rows.Count; i++)
            {
                Log += "       " + DeleteDataPermission.Rows[i][0].ToString() + ":";    // システムコード
                Log += DeleteDataPermission.Rows[i][1].ToString() + " ";                // システム名称
                Log += DeleteDataPermission.Rows[i][2].ToString() + ":";                // 応答項目コード
                Log += DeleteDataPermission.Rows[i][3].ToString() + "\r\n";             // 応答項目名称
            }

            Log += "　　【システム情報】\r\n"
                + "　　　追加\r\n";

            // システム情報の追加されたデータを検索
            for (int i = 0; i < AddDataSystem.Rows.Count; i++)
            {
                Log += "       " + AddDataSystem.Rows[i][0].ToString() + ":";   // システムコード
                Log += AddDataSystem.Rows[i][1].ToString() + "\r\n";            // システム名称
            }

            Log += "　　　削除\r\n";

            // システム情報の取消されたデータを検索
            for (int i = 0; i < DeleteDataSystem.Rows.Count; i++)
            {
                Log += "       " + DeleteDataSystem.Rows[i][0].ToString() + ":";    // システムコード
                Log += DeleteDataSystem.Rows[i][1].ToString() + "\r\n";             // システム名称
            }

            Log += "　　【応答項目情報】\r\n"
                + "　　　追加\r\n";

            // 応答項目情報の追加されたデータを検索
            for (int i = 0; i < AddDataReturnItem.Rows.Count; i++)
            {
                Log += "       " + AddDataReturnItem.Rows[i][0].ToString() + ":";   // 応答項目コード
                Log += AddDataReturnItem.Rows[i][1].ToString() + "\r\n";            // 応答項目名称
            }

            Log += "　　　削除\r\n";

            // 応答項目情報の取消されたデータを検索
            for (int i = 0; i < DeleteDataReturnItem.Rows.Count; i++)
            {
                Log += "       " + DeleteDataReturnItem.Rows[i][0].ToString() + ":";    // 応答項目コード
                Log += DeleteDataReturnItem.Rows[i][1].ToString() + "\r\n";             // 応答項目名称
            }

            Log += EndDateTime + " ====== プログラム終了 ======\r\n";

            return Log;
        }
        #endregion

        #region キーが押されたとき
        #region システム情報の登録内容ID
        private void New_System_ID_KeyPress(object sender, KeyPressEventArgs e)
        {
            // 制御文字は入力可
            if (char.IsControl(e.KeyChar))
            {
                e.Handled = false;
                return;
            }

            // 数字(0-9)は入力可
            if (char.IsDigit(e.KeyChar))
            {
                e.Handled = false;
                return;
            }

            // 上記以外は入力不可
            e.Handled = true;
        }
        #endregion

        #region 応答項目情報の登録内容ID
        private void New_Return_Item_ID_KeyPress(object sender, KeyPressEventArgs e)
        {
            // 制御文字は入力可
            if (char.IsControl(e.KeyChar))
            {
                e.Handled = false;
                return;
            }

            // 数字(0-9)は入力可
            if (char.IsDigit(e.KeyChar))
            {
                e.Handled = false;
                return;
            }

            // 上記以外は入力不可
            e.Handled = true;
        }
        #endregion
        #endregion

        #region フォーカスが離れるとき
        #region システム情報の登録内容ID
        private void New_System_ID_Leave(object sender, EventArgs e)
        {
            // 1度int型に変換したのを入れなおす
            if (Regex.IsMatch(New_System_ID.Text, NUMBER)) New_System_ID.Text = int.Parse(New_System_ID.Text).ToString();
        }
        #endregion

        #region 応答項目情報の登録内容ID
        private void New_Return_Item_ID_Leave(object sender, EventArgs e)
        {
            // 1度int型に変換したのを入れなおす
            if (Regex.IsMatch(New_Return_Item_ID.Text, NUMBER)) New_Return_Item_ID.Text = int.Parse(New_Return_Item_ID.Text).ToString();
        }
        #endregion
        #endregion

        #region ListBoxの色
        #region システム情報の変更項目
        private void System_Info_Data_DrawItem(object sender, DrawItemEventArgs e)
        {
            // 背景を描画
            e.DrawBackground();

            if (System_Info_Data.Items.Count != 0)
            {
                // ブラシのデフォルトの色を黒色として定義する
                Brush myBrush = Brushes.Black;

                // 非活性時にgainsboroに変更する
                if (System_Info_Data.Enabled == false) myBrush = Brushes.Gainsboro;

                // 現在のフォントとカスタムブラシ設定に基づいて現在のアイテムテキストを描画する
                e.Graphics.DrawString(System_Info_Data.Items[e.Index].ToString(), e.Font, myBrush, e.Bounds, StringFormat.GenericDefault);

                // ListBoxにフォーカスがある場合は、選択した項目の周囲にフォーカスの四角形を描画する
                e.DrawFocusRectangle();
            }
        }
        #endregion

        #region 応答項目情報の変更項目
        private void Return_Item_Data_DrawItem(object sender, DrawItemEventArgs e)
        {
            // 背景を描画
            e.DrawBackground();

            if (Return_Item_Data.Items.Count != 0)
            {
                // ブラシのデフォルトの色を黒色として定義する
                Brush myBrush = Brushes.Black;

                // 非活性時にgainsboroに変更する
                if (Return_Item_Data.Enabled == false) myBrush = Brushes.Gainsboro;

                // 現在のフォントとカスタムブラシ設定に基づいて現在のアイテムテキストを描画する
                e.Graphics.DrawString(Return_Item_Data.Items[e.Index].ToString(), e.Font, myBrush, e.Bounds, StringFormat.GenericDefault);

                // ListBoxにフォーカスがある場合は、選択した項目の周囲にフォーカスの四角形を描画する
                e.DrawFocusRectangle();
            }
        }
        #endregion
        #endregion

        #region 接続ホスト名の取得
        private string getTerminalHostName()
        {
            string hostNm;
            hostNm = System.Environment.ExpandEnvironmentVariables("%CLIENTNAME%");
            if (hostNm == "" || hostNm == "%CLIENTNAME%")
            {
                return "";
            }else
            {
                return hostNm;
            }
        }
        #endregion

        #region 接続IPAddressの取得
        private string getTerminalIPAddress()
        {
            string hostNm = getTerminalHostName();
            if (hostNm == "" || hostNm == "%CLIENTNAME%")
            {
                return "";
            }

            try
            {
                IPHostEntry ipInfo = Dns.GetHostByName(hostNm);
                int iCnt = ipInfo.AddressList.Length - 1;
                return ipInfo.AddressList[iCnt].ToString();
            }
            catch
            {
                return "";
            }
            
        }
        #endregion

    }
}
