using System;
using System.Windows.Forms;
using WindowsFormsApplication1;

namespace TMC人事管理
{
    static class Constants
    {
        // DB接続文字列
        public const String CONNECTION_STRING = "Data Source=DNX31150\\SID1;Initial Catalog=JINJI;Persist Security Info=True;User ID=sa;Password=chib@pc2016";
    }

    static class Program
    {
        #region 定数
        const String MUTEX_NAME = "人事情報DB保守";                                     // Mutex名
        const String PROGRAM_WORKING_MESSAGE = "既にプログラムが\r\n起動しています。";  // 起動済みなのを通知
        const String PROGRAM_WORKING_CAPTION = "起動確認";                              // メッセージのキャプション
        #endregion

        /// <summary>
        /// アプリケーションのメイン エントリ ポイントです。
        /// </summary>
        [STAThread]
        static void Main()
        {
            System.Threading.Mutex mutex = new System.Threading.Mutex(false, MUTEX_NAME);   // Mutexオブジェクトを作成する
            bool hasHandle = false;

            try
            {
                try
                {
                    // ミューテックスの所有権を要求する
                    hasHandle = mutex.WaitOne(0, false);
                }
                catch (System.Threading.AbandonedMutexException)
                {
                    // 別のアプリケーションがミューテックスを解放しないで終了した時
                    hasHandle = true;
                }

                // ミューテックスを得られたか調べる
                if (hasHandle == false)
                {
                    // 得られなかった場合は、すでに起動していると判断して終了
                    MessageBox.Show(PROGRAM_WORKING_MESSAGE, PROGRAM_WORKING_CAPTION, MessageBoxButtons.OK, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    return;
                }

                Application.EnableVisualStyles();
                Application.SetCompatibleTextRenderingDefault(false);
                Application.Run(new 人事情報DB保守());
            }
            finally
            {
                if (hasHandle)
                {
                    // ミューテックスを解放する
                    mutex.ReleaseMutex();
                }
                mutex.Close();
            }
        }
    }
}
