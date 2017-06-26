namespace WindowsFormsApplication1
{
    partial class 人事情報DB保守
    {
        /// <summary>
        /// 必要なデザイナー変数です。
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// 使用中のリソースをすべてクリーンアップします。
        /// </summary>
        /// <param name="disposing">マネージ リソースを破棄する場合は true を指定し、その他の場合は false を指定します。</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows フォーム デザイナーで生成されたコード

        /// <summary>
        /// デザイナー サポートに必要なメソッドです。このメソッドの内容を
        /// コード エディターで変更しないでください。
        /// </summary>
        private void InitializeComponent()
        {
            this.System_Name_Select = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.Shutoku_Fuka = new System.Windows.Forms.ListBox();
            this.Shutoku_Kanou = new System.Windows.Forms.ListBox();
            this.Add_Button = new System.Windows.Forms.Button();
            this.Delete_Button = new System.Windows.Forms.Button();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.Shutoku_Fuka_ID = new System.Windows.Forms.TextBox();
            this.End_Button = new System.Windows.Forms.Button();
            this.label8 = new System.Windows.Forms.Label();
            this.System_ID = new System.Windows.Forms.TextBox();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.label2 = new System.Windows.Forms.Label();
            this.Shutoku_Kanou_ID = new System.Windows.Forms.TextBox();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.label14 = new System.Windows.Forms.Label();
            this.label20 = new System.Windows.Forms.Label();
            this.System_Cancel_Button = new System.Windows.Forms.Button();
            this.System_Execution_Button = new System.Windows.Forms.Button();
            this.label12 = new System.Windows.Forms.Label();
            this.New_System_Name = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.New_System_ID = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.Select_System_Name = new System.Windows.Forms.TextBox();
            this.label10 = new System.Windows.Forms.Label();
            this.Select_System_ID = new System.Windows.Forms.TextBox();
            this.System_Delete_Button = new System.Windows.Forms.Button();
            this.System_Change_Button = new System.Windows.Forms.Button();
            this.System_New_Button = new System.Windows.Forms.Button();
            this.label9 = new System.Windows.Forms.Label();
            this.System_Info_Data = new System.Windows.Forms.ListBox();
            this.label4 = new System.Windows.Forms.Label();
            this.tabPage3 = new System.Windows.Forms.TabPage();
            this.label15 = new System.Windows.Forms.Label();
            this.label16 = new System.Windows.Forms.Label();
            this.Return_Item_Cancel_Button = new System.Windows.Forms.Button();
            this.Return_Item_Execution_Button = new System.Windows.Forms.Button();
            this.label17 = new System.Windows.Forms.Label();
            this.New_Return_Item_Name = new System.Windows.Forms.TextBox();
            this.label21 = new System.Windows.Forms.Label();
            this.New_Return_Item_ID = new System.Windows.Forms.TextBox();
            this.label22 = new System.Windows.Forms.Label();
            this.Select_Return_Item_Name = new System.Windows.Forms.TextBox();
            this.label23 = new System.Windows.Forms.Label();
            this.Select_Return_Item_ID = new System.Windows.Forms.TextBox();
            this.Return_Item_Delete_Button = new System.Windows.Forms.Button();
            this.Return_Item_Change_Button = new System.Windows.Forms.Button();
            this.Return_Item_New_Button = new System.Windows.Forms.Button();
            this.label18 = new System.Windows.Forms.Label();
            this.Return_Item_Data = new System.Windows.Forms.ListBox();
            this.label19 = new System.Windows.Forms.Label();
            this.tabControl1.SuspendLayout();
            this.tabPage2.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.tabPage3.SuspendLayout();
            this.SuspendLayout();
            // 
            // System_Name_Select
            // 
            this.System_Name_Select.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.System_Name_Select.FormattingEnabled = true;
            this.System_Name_Select.Location = new System.Drawing.Point(20, 68);
            this.System_Name_Select.Name = "System_Name_Select";
            this.System_Name_Select.Size = new System.Drawing.Size(233, 21);
            this.System_Name_Select.TabIndex = 0;
            this.System_Name_Select.SelectedIndexChanged += new System.EventHandler(this.System_Name_Select_SelectedIndexChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(18, 53);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(126, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "システム名選択 ：";
            // 
            // Shutoku_Fuka
            // 
            this.Shutoku_Fuka.FormattingEnabled = true;
            this.Shutoku_Fuka.Location = new System.Drawing.Point(22, 112);
            this.Shutoku_Fuka.Name = "Shutoku_Fuka";
            this.Shutoku_Fuka.Size = new System.Drawing.Size(233, 316);
            this.Shutoku_Fuka.TabIndex = 1;
            this.Shutoku_Fuka.SelectedIndexChanged += new System.EventHandler(this.Sentaku_Fuka_SelectedIndexChanged);
            // 
            // Shutoku_Kanou
            // 
            this.Shutoku_Kanou.FormattingEnabled = true;
            this.Shutoku_Kanou.Location = new System.Drawing.Point(367, 112);
            this.Shutoku_Kanou.Name = "Shutoku_Kanou";
            this.Shutoku_Kanou.Size = new System.Drawing.Size(233, 316);
            this.Shutoku_Kanou.TabIndex = 3;
            this.Shutoku_Kanou.SelectedIndexChanged += new System.EventHandler(this.Sentaku_Kanou_SelectedIndexChanged);
            // 
            // Add_Button
            // 
            this.Add_Button.BackColor = System.Drawing.SystemColors.Control;
            this.Add_Button.Location = new System.Drawing.Point(261, 214);
            this.Add_Button.Name = "Add_Button";
            this.Add_Button.Size = new System.Drawing.Size(100, 32);
            this.Add_Button.TabIndex = 2;
            this.Add_Button.Text = "追加　＞＞";
            this.Add_Button.UseVisualStyleBackColor = true;
            this.Add_Button.Click += new System.EventHandler(this.Add_Click);
            // 
            // Delete_Button
            // 
            this.Delete_Button.BackColor = System.Drawing.SystemColors.Control;
            this.Delete_Button.Location = new System.Drawing.Point(261, 252);
            this.Delete_Button.Name = "Delete_Button";
            this.Delete_Button.Size = new System.Drawing.Size(100, 32);
            this.Delete_Button.TabIndex = 4;
            this.Delete_Button.Text = "＜＜　取消";
            this.Delete_Button.UseVisualStyleBackColor = true;
            this.Delete_Button.Click += new System.EventHandler(this.Delete_Click);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("ＭＳ ゴシック", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label5.Location = new System.Drawing.Point(259, 71);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(29, 12);
            this.label5.TabIndex = 15;
            this.label5.Text = "ＩＤ";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(365, 97);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(133, 13);
            this.label6.TabIndex = 17;
            this.label6.Text = "取得可能項目選択：";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("ＭＳ ゴシック", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label7.Location = new System.Drawing.Point(17, 17);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(287, 13);
            this.label7.TabIndex = 18;
            this.label7.Text = "システム別に取得可能な項目を設定します。";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("ＭＳ ゴシック", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label3.Location = new System.Drawing.Point(29, 440);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(29, 12);
            this.label3.TabIndex = 22;
            this.label3.Text = "ＩＤ";
            // 
            // Shutoku_Fuka_ID
            // 
            this.Shutoku_Fuka_ID.Location = new System.Drawing.Point(64, 437);
            this.Shutoku_Fuka_ID.Name = "Shutoku_Fuka_ID";
            this.Shutoku_Fuka_ID.Size = new System.Drawing.Size(86, 20);
            this.Shutoku_Fuka_ID.TabIndex = 20;
            // 
            // End_Button
            // 
            this.End_Button.Location = new System.Drawing.Point(548, 510);
            this.End_Button.Name = "End_Button";
            this.End_Button.Size = new System.Drawing.Size(100, 32);
            this.End_Button.TabIndex = 1;
            this.End_Button.Text = "終　了";
            this.End_Button.UseVisualStyleBackColor = true;
            this.End_Button.Click += new System.EventHandler(this.END_Click);
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(20, 97);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(133, 13);
            this.label8.TabIndex = 28;
            this.label8.Text = "取得不可項目選択：";
            // 
            // System_ID
            // 
            this.System_ID.Location = new System.Drawing.Point(294, 68);
            this.System_ID.Name = "System_ID";
            this.System_ID.Size = new System.Drawing.Size(86, 20);
            this.System_ID.TabIndex = 1;
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage2);
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Controls.Add(this.tabPage3);
            this.tabControl1.Font = new System.Drawing.Font("ＭＳ ゴシック", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.tabControl1.Location = new System.Drawing.Point(12, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(640, 492);
            this.tabControl1.TabIndex = 0;
            this.tabControl1.SelectedIndexChanged += new System.EventHandler(this.tabControl1_SelectedIndexChanged);
            // 
            // tabPage2
            // 
            this.tabPage2.Controls.Add(this.label2);
            this.tabPage2.Controls.Add(this.Shutoku_Kanou_ID);
            this.tabPage2.Controls.Add(this.label7);
            this.tabPage2.Controls.Add(this.label8);
            this.tabPage2.Controls.Add(this.label3);
            this.tabPage2.Controls.Add(this.label1);
            this.tabPage2.Controls.Add(this.Shutoku_Fuka_ID);
            this.tabPage2.Controls.Add(this.System_Name_Select);
            this.tabPage2.Controls.Add(this.label6);
            this.tabPage2.Controls.Add(this.label5);
            this.tabPage2.Controls.Add(this.Shutoku_Kanou);
            this.tabPage2.Controls.Add(this.Delete_Button);
            this.tabPage2.Controls.Add(this.System_ID);
            this.tabPage2.Controls.Add(this.Add_Button);
            this.tabPage2.Controls.Add(this.Shutoku_Fuka);
            this.tabPage2.Location = new System.Drawing.Point(4, 23);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(632, 465);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "応答許可情報";
            this.tabPage2.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("ＭＳ ゴシック", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label2.Location = new System.Drawing.Point(373, 440);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(29, 12);
            this.label2.TabIndex = 30;
            this.label2.Text = "ＩＤ";
            // 
            // Shutoku_Kanou_ID
            // 
            this.Shutoku_Kanou_ID.Location = new System.Drawing.Point(408, 436);
            this.Shutoku_Kanou_ID.Name = "Shutoku_Kanou_ID";
            this.Shutoku_Kanou_ID.Size = new System.Drawing.Size(86, 20);
            this.Shutoku_Kanou_ID.TabIndex = 29;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.label14);
            this.tabPage1.Controls.Add(this.label20);
            this.tabPage1.Controls.Add(this.System_Cancel_Button);
            this.tabPage1.Controls.Add(this.System_Execution_Button);
            this.tabPage1.Controls.Add(this.label12);
            this.tabPage1.Controls.Add(this.New_System_Name);
            this.tabPage1.Controls.Add(this.label13);
            this.tabPage1.Controls.Add(this.New_System_ID);
            this.tabPage1.Controls.Add(this.label11);
            this.tabPage1.Controls.Add(this.Select_System_Name);
            this.tabPage1.Controls.Add(this.label10);
            this.tabPage1.Controls.Add(this.Select_System_ID);
            this.tabPage1.Controls.Add(this.System_Delete_Button);
            this.tabPage1.Controls.Add(this.System_Change_Button);
            this.tabPage1.Controls.Add(this.System_New_Button);
            this.tabPage1.Controls.Add(this.label9);
            this.tabPage1.Controls.Add(this.System_Info_Data);
            this.tabPage1.Controls.Add(this.label4);
            this.tabPage1.Location = new System.Drawing.Point(4, 23);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(632, 465);
            this.tabPage1.TabIndex = 2;
            this.tabPage1.Text = "システム情報";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // label14
            // 
            this.label14.AutoSize = true;
            this.label14.Font = new System.Drawing.Font("ＭＳ ゴシック", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label14.Location = new System.Drawing.Point(291, 184);
            this.label14.Name = "label14";
            this.label14.Size = new System.Drawing.Size(88, 16);
            this.label14.TabIndex = 45;
            this.label14.Text = "登録内容：";
            // 
            // label20
            // 
            this.label20.AutoSize = true;
            this.label20.Font = new System.Drawing.Font("ＭＳ ゴシック", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label20.Location = new System.Drawing.Point(291, 93);
            this.label20.Name = "label20";
            this.label20.Size = new System.Drawing.Size(88, 16);
            this.label20.TabIndex = 44;
            this.label20.Text = "選択項目：";
            // 
            // System_Cancel_Button
            // 
            this.System_Cancel_Button.BackColor = System.Drawing.SystemColors.Control;
            this.System_Cancel_Button.Location = new System.Drawing.Point(456, 269);
            this.System_Cancel_Button.Name = "System_Cancel_Button";
            this.System_Cancel_Button.Size = new System.Drawing.Size(60, 32);
            this.System_Cancel_Button.TabIndex = 8;
            this.System_Cancel_Button.Text = "取 消";
            this.System_Cancel_Button.UseVisualStyleBackColor = true;
            this.System_Cancel_Button.Click += new System.EventHandler(this.System_Cancel_Button_Click);
            // 
            // System_Execution_Button
            // 
            this.System_Execution_Button.BackColor = System.Drawing.SystemColors.Control;
            this.System_Execution_Button.Location = new System.Drawing.Point(294, 269);
            this.System_Execution_Button.Name = "System_Execution_Button";
            this.System_Execution_Button.Size = new System.Drawing.Size(109, 32);
            this.System_Execution_Button.TabIndex = 9;
            this.System_Execution_Button.Text = "＜＜ 登録実行";
            this.System_Execution_Button.UseVisualStyleBackColor = true;
            this.System_Execution_Button.Click += new System.EventHandler(this.System_Execution_Button_Click);
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Font = new System.Drawing.Font("ＭＳ ゴシック", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label12.Location = new System.Drawing.Point(292, 232);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(29, 12);
            this.label12.TabIndex = 41;
            this.label12.Text = "名称";
            // 
            // New_System_Name
            // 
            this.New_System_Name.Location = new System.Drawing.Point(327, 229);
            this.New_System_Name.Name = "New_System_Name";
            this.New_System_Name.Size = new System.Drawing.Size(189, 20);
            this.New_System_Name.TabIndex = 4;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Font = new System.Drawing.Font("ＭＳ ゴシック", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label13.Location = new System.Drawing.Point(292, 206);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(29, 12);
            this.label13.TabIndex = 39;
            this.label13.Text = "ＩＤ";
            // 
            // New_System_ID
            // 
            this.New_System_ID.ImeMode = System.Windows.Forms.ImeMode.Disable;
            this.New_System_ID.Location = new System.Drawing.Point(327, 203);
            this.New_System_ID.MaxLength = 3;
            this.New_System_ID.Name = "New_System_ID";
            this.New_System_ID.Size = new System.Drawing.Size(97, 20);
            this.New_System_ID.TabIndex = 3;
            this.New_System_ID.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.New_System_ID_KeyPress);
            this.New_System_ID.Leave += new System.EventHandler(this.New_System_ID_Leave);
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Font = new System.Drawing.Font("ＭＳ ゴシック", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label11.Location = new System.Drawing.Point(292, 142);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(29, 12);
            this.label11.TabIndex = 37;
            this.label11.Text = "名称";
            // 
            // Select_System_Name
            // 
            this.Select_System_Name.Location = new System.Drawing.Point(327, 139);
            this.Select_System_Name.Name = "Select_System_Name";
            this.Select_System_Name.Size = new System.Drawing.Size(189, 20);
            this.Select_System_Name.TabIndex = 2;
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Font = new System.Drawing.Font("ＭＳ ゴシック", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label10.Location = new System.Drawing.Point(292, 115);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(29, 12);
            this.label10.TabIndex = 35;
            this.label10.Text = "ＩＤ";
            // 
            // Select_System_ID
            // 
            this.Select_System_ID.Location = new System.Drawing.Point(327, 112);
            this.Select_System_ID.Name = "Select_System_ID";
            this.Select_System_ID.Size = new System.Drawing.Size(97, 20);
            this.Select_System_ID.TabIndex = 1;
            // 
            // System_Delete_Button
            // 
            this.System_Delete_Button.BackColor = System.Drawing.SystemColors.Control;
            this.System_Delete_Button.Location = new System.Drawing.Point(534, 118);
            this.System_Delete_Button.Name = "System_Delete_Button";
            this.System_Delete_Button.Size = new System.Drawing.Size(81, 32);
            this.System_Delete_Button.TabIndex = 5;
            this.System_Delete_Button.Text = "削除 ＞＞";
            this.System_Delete_Button.UseVisualStyleBackColor = true;
            this.System_Delete_Button.Click += new System.EventHandler(this.Delete_Button1_Click);
            // 
            // System_Change_Button
            // 
            this.System_Change_Button.BackColor = System.Drawing.SystemColors.Control;
            this.System_Change_Button.Location = new System.Drawing.Point(448, 165);
            this.System_Change_Button.Name = "System_Change_Button";
            this.System_Change_Button.Size = new System.Drawing.Size(53, 57);
            this.System_Change_Button.TabIndex = 6;
            this.System_Change_Button.Text = "変更\r\n Ｖ\r\n Ｖ";
            this.System_Change_Button.UseVisualStyleBackColor = true;
            this.System_Change_Button.Click += new System.EventHandler(this.System_Change_Button_Click);
            // 
            // System_New_Button
            // 
            this.System_New_Button.BackColor = System.Drawing.SystemColors.Control;
            this.System_New_Button.Location = new System.Drawing.Point(534, 209);
            this.System_New_Button.Name = "System_New_Button";
            this.System_New_Button.Size = new System.Drawing.Size(81, 32);
            this.System_New_Button.TabIndex = 7;
            this.System_New_Button.Text = "＜＜ 新規";
            this.System_New_Button.UseVisualStyleBackColor = true;
            this.System_New_Button.Click += new System.EventHandler(this.System_New_Button_Click);
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(18, 48);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(112, 13);
            this.label9.TabIndex = 30;
            this.label9.Text = "変更項目選択 ：";
            // 
            // System_Info_Data
            // 
            this.System_Info_Data.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.System_Info_Data.FormattingEnabled = true;
            this.System_Info_Data.Location = new System.Drawing.Point(20, 63);
            this.System_Info_Data.Name = "System_Info_Data";
            this.System_Info_Data.Size = new System.Drawing.Size(261, 381);
            this.System_Info_Data.TabIndex = 0;
            this.System_Info_Data.DrawItem += new System.Windows.Forms.DrawItemEventHandler(this.System_Info_Data_DrawItem);
            this.System_Info_Data.SelectedIndexChanged += new System.EventHandler(this.System_Info_Data_SelectedIndexChanged);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("ＭＳ ゴシック", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label4.Location = new System.Drawing.Point(17, 17);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(217, 13);
            this.label4.TabIndex = 19;
            this.label4.Text = "システム情報の変更を行います。";
            // 
            // tabPage3
            // 
            this.tabPage3.Controls.Add(this.label15);
            this.tabPage3.Controls.Add(this.label16);
            this.tabPage3.Controls.Add(this.Return_Item_Cancel_Button);
            this.tabPage3.Controls.Add(this.Return_Item_Execution_Button);
            this.tabPage3.Controls.Add(this.label17);
            this.tabPage3.Controls.Add(this.New_Return_Item_Name);
            this.tabPage3.Controls.Add(this.label21);
            this.tabPage3.Controls.Add(this.New_Return_Item_ID);
            this.tabPage3.Controls.Add(this.label22);
            this.tabPage3.Controls.Add(this.Select_Return_Item_Name);
            this.tabPage3.Controls.Add(this.label23);
            this.tabPage3.Controls.Add(this.Select_Return_Item_ID);
            this.tabPage3.Controls.Add(this.Return_Item_Delete_Button);
            this.tabPage3.Controls.Add(this.Return_Item_Change_Button);
            this.tabPage3.Controls.Add(this.Return_Item_New_Button);
            this.tabPage3.Controls.Add(this.label18);
            this.tabPage3.Controls.Add(this.Return_Item_Data);
            this.tabPage3.Controls.Add(this.label19);
            this.tabPage3.Location = new System.Drawing.Point(4, 23);
            this.tabPage3.Name = "tabPage3";
            this.tabPage3.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage3.Size = new System.Drawing.Size(632, 465);
            this.tabPage3.TabIndex = 3;
            this.tabPage3.Text = "応答項目情報";
            this.tabPage3.UseVisualStyleBackColor = true;
            // 
            // label15
            // 
            this.label15.AutoSize = true;
            this.label15.Font = new System.Drawing.Font("ＭＳ ゴシック", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label15.Location = new System.Drawing.Point(291, 184);
            this.label15.Name = "label15";
            this.label15.Size = new System.Drawing.Size(88, 16);
            this.label15.TabIndex = 61;
            this.label15.Text = "登録内容：";
            // 
            // label16
            // 
            this.label16.AutoSize = true;
            this.label16.Font = new System.Drawing.Font("ＭＳ ゴシック", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label16.Location = new System.Drawing.Point(291, 93);
            this.label16.Name = "label16";
            this.label16.Size = new System.Drawing.Size(88, 16);
            this.label16.TabIndex = 60;
            this.label16.Text = "選択項目：";
            // 
            // Return_Item_Cancel_Button
            // 
            this.Return_Item_Cancel_Button.BackColor = System.Drawing.SystemColors.Control;
            this.Return_Item_Cancel_Button.Location = new System.Drawing.Point(456, 269);
            this.Return_Item_Cancel_Button.Name = "Return_Item_Cancel_Button";
            this.Return_Item_Cancel_Button.Size = new System.Drawing.Size(60, 32);
            this.Return_Item_Cancel_Button.TabIndex = 8;
            this.Return_Item_Cancel_Button.Text = "取 消";
            this.Return_Item_Cancel_Button.UseVisualStyleBackColor = true;
            this.Return_Item_Cancel_Button.Click += new System.EventHandler(this.Return_Item_Cancel_Button_Click);
            // 
            // Return_Item_Execution_Button
            // 
            this.Return_Item_Execution_Button.BackColor = System.Drawing.SystemColors.Control;
            this.Return_Item_Execution_Button.Location = new System.Drawing.Point(294, 269);
            this.Return_Item_Execution_Button.Name = "Return_Item_Execution_Button";
            this.Return_Item_Execution_Button.Size = new System.Drawing.Size(109, 32);
            this.Return_Item_Execution_Button.TabIndex = 9;
            this.Return_Item_Execution_Button.Text = "＜＜ 登録実行";
            this.Return_Item_Execution_Button.UseVisualStyleBackColor = true;
            this.Return_Item_Execution_Button.Click += new System.EventHandler(this.Return_Item_Execution_Button_Click);
            // 
            // label17
            // 
            this.label17.AutoSize = true;
            this.label17.Font = new System.Drawing.Font("ＭＳ ゴシック", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label17.Location = new System.Drawing.Point(292, 232);
            this.label17.Name = "label17";
            this.label17.Size = new System.Drawing.Size(29, 12);
            this.label17.TabIndex = 57;
            this.label17.Text = "名称";
            // 
            // New_Return_Item_Name
            // 
            this.New_Return_Item_Name.Location = new System.Drawing.Point(327, 229);
            this.New_Return_Item_Name.Name = "New_Return_Item_Name";
            this.New_Return_Item_Name.Size = new System.Drawing.Size(189, 20);
            this.New_Return_Item_Name.TabIndex = 4;
            // 
            // label21
            // 
            this.label21.AutoSize = true;
            this.label21.Font = new System.Drawing.Font("ＭＳ ゴシック", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label21.Location = new System.Drawing.Point(292, 206);
            this.label21.Name = "label21";
            this.label21.Size = new System.Drawing.Size(29, 12);
            this.label21.TabIndex = 55;
            this.label21.Text = "ＩＤ";
            // 
            // New_Return_Item_ID
            // 
            this.New_Return_Item_ID.Location = new System.Drawing.Point(327, 203);
            this.New_Return_Item_ID.MaxLength = 3;
            this.New_Return_Item_ID.Name = "New_Return_Item_ID";
            this.New_Return_Item_ID.Size = new System.Drawing.Size(97, 20);
            this.New_Return_Item_ID.TabIndex = 3;
            this.New_Return_Item_ID.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.New_Return_Item_ID_KeyPress);
            this.New_Return_Item_ID.Leave += new System.EventHandler(this.New_Return_Item_ID_Leave);
            // 
            // label22
            // 
            this.label22.AutoSize = true;
            this.label22.Font = new System.Drawing.Font("ＭＳ ゴシック", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label22.Location = new System.Drawing.Point(292, 142);
            this.label22.Name = "label22";
            this.label22.Size = new System.Drawing.Size(29, 12);
            this.label22.TabIndex = 53;
            this.label22.Text = "名称";
            // 
            // Select_Return_Item_Name
            // 
            this.Select_Return_Item_Name.Location = new System.Drawing.Point(327, 139);
            this.Select_Return_Item_Name.Name = "Select_Return_Item_Name";
            this.Select_Return_Item_Name.Size = new System.Drawing.Size(189, 20);
            this.Select_Return_Item_Name.TabIndex = 2;
            // 
            // label23
            // 
            this.label23.AutoSize = true;
            this.label23.Font = new System.Drawing.Font("ＭＳ ゴシック", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label23.Location = new System.Drawing.Point(292, 115);
            this.label23.Name = "label23";
            this.label23.Size = new System.Drawing.Size(29, 12);
            this.label23.TabIndex = 51;
            this.label23.Text = "ＩＤ";
            // 
            // Select_Return_Item_ID
            // 
            this.Select_Return_Item_ID.Location = new System.Drawing.Point(327, 112);
            this.Select_Return_Item_ID.Name = "Select_Return_Item_ID";
            this.Select_Return_Item_ID.Size = new System.Drawing.Size(97, 20);
            this.Select_Return_Item_ID.TabIndex = 1;
            // 
            // Return_Item_Delete_Button
            // 
            this.Return_Item_Delete_Button.BackColor = System.Drawing.SystemColors.Control;
            this.Return_Item_Delete_Button.Location = new System.Drawing.Point(534, 118);
            this.Return_Item_Delete_Button.Name = "Return_Item_Delete_Button";
            this.Return_Item_Delete_Button.Size = new System.Drawing.Size(81, 32);
            this.Return_Item_Delete_Button.TabIndex = 5;
            this.Return_Item_Delete_Button.Text = "削除 ＞＞";
            this.Return_Item_Delete_Button.UseVisualStyleBackColor = true;
            this.Return_Item_Delete_Button.Click += new System.EventHandler(this.Return_Item_Delete_Button_Click);
            // 
            // Return_Item_Change_Button
            // 
            this.Return_Item_Change_Button.BackColor = System.Drawing.SystemColors.Control;
            this.Return_Item_Change_Button.Location = new System.Drawing.Point(448, 165);
            this.Return_Item_Change_Button.Name = "Return_Item_Change_Button";
            this.Return_Item_Change_Button.Size = new System.Drawing.Size(53, 57);
            this.Return_Item_Change_Button.TabIndex = 6;
            this.Return_Item_Change_Button.Text = "変更\r\n Ｖ\r\n Ｖ";
            this.Return_Item_Change_Button.UseVisualStyleBackColor = true;
            this.Return_Item_Change_Button.Click += new System.EventHandler(this.Return_Item_Change_Button_Click);
            // 
            // Return_Item_New_Button
            // 
            this.Return_Item_New_Button.BackColor = System.Drawing.SystemColors.Control;
            this.Return_Item_New_Button.Location = new System.Drawing.Point(534, 209);
            this.Return_Item_New_Button.Name = "Return_Item_New_Button";
            this.Return_Item_New_Button.Size = new System.Drawing.Size(81, 32);
            this.Return_Item_New_Button.TabIndex = 7;
            this.Return_Item_New_Button.Text = "＜＜ 新規";
            this.Return_Item_New_Button.UseVisualStyleBackColor = true;
            this.Return_Item_New_Button.Click += new System.EventHandler(this.Return_Item_New_Button_Click);
            // 
            // label18
            // 
            this.label18.AutoSize = true;
            this.label18.Location = new System.Drawing.Point(18, 48);
            this.label18.Name = "label18";
            this.label18.Size = new System.Drawing.Size(112, 13);
            this.label18.TabIndex = 46;
            this.label18.Text = "変更項目選択 ：";
            // 
            // Return_Item_Data
            // 
            this.Return_Item_Data.DrawMode = System.Windows.Forms.DrawMode.OwnerDrawFixed;
            this.Return_Item_Data.FormattingEnabled = true;
            this.Return_Item_Data.Location = new System.Drawing.Point(20, 63);
            this.Return_Item_Data.Name = "Return_Item_Data";
            this.Return_Item_Data.Size = new System.Drawing.Size(261, 381);
            this.Return_Item_Data.TabIndex = 0;
            this.Return_Item_Data.DrawItem += new System.Windows.Forms.DrawItemEventHandler(this.Return_Item_Data_DrawItem);
            this.Return_Item_Data.SelectedIndexChanged += new System.EventHandler(this.Return_Item_Data_SelectedIndexChanged);
            // 
            // label19
            // 
            this.label19.AutoSize = true;
            this.label19.Font = new System.Drawing.Font("ＭＳ ゴシック", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(128)));
            this.label19.Location = new System.Drawing.Point(17, 17);
            this.label19.Name = "label19";
            this.label19.Size = new System.Drawing.Size(217, 13);
            this.label19.TabIndex = 44;
            this.label19.Text = "応答項目情報の変更を行います。";
            // 
            // 人事情報DB保守
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 12F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(665, 553);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.End_Button);
            this.Name = "人事情報DB保守";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Form1_FormClosed);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabPage2.ResumeLayout(false);
            this.tabPage2.PerformLayout();
            this.tabPage1.ResumeLayout(false);
            this.tabPage1.PerformLayout();
            this.tabPage3.ResumeLayout(false);
            this.tabPage3.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ComboBox System_Name_Select;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ListBox Shutoku_Fuka;
        private System.Windows.Forms.ListBox Shutoku_Kanou;
        private System.Windows.Forms.Button Add_Button;
        private System.Windows.Forms.Button Delete_Button;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox Shutoku_Fuka_ID;
        private System.Windows.Forms.Button End_Button;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox System_ID;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox Shutoku_Kanou_ID;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.TabPage tabPage3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label14;
        private System.Windows.Forms.Label label20;
        private System.Windows.Forms.Button System_Cancel_Button;
        private System.Windows.Forms.Button System_Execution_Button;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox New_System_Name;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.TextBox New_System_ID;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox Select_System_Name;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.TextBox Select_System_ID;
        private System.Windows.Forms.Button System_Delete_Button;
        private System.Windows.Forms.Button System_Change_Button;
        private System.Windows.Forms.Button System_New_Button;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.ListBox System_Info_Data;
        private System.Windows.Forms.Label label15;
        private System.Windows.Forms.Label label16;
        private System.Windows.Forms.Button Return_Item_Cancel_Button;
        private System.Windows.Forms.Button Return_Item_Execution_Button;
        private System.Windows.Forms.Label label17;
        private System.Windows.Forms.TextBox New_Return_Item_Name;
        private System.Windows.Forms.Label label21;
        private System.Windows.Forms.TextBox New_Return_Item_ID;
        private System.Windows.Forms.Label label22;
        private System.Windows.Forms.TextBox Select_Return_Item_Name;
        private System.Windows.Forms.Label label23;
        private System.Windows.Forms.TextBox Select_Return_Item_ID;
        private System.Windows.Forms.Button Return_Item_Delete_Button;
        private System.Windows.Forms.Button Return_Item_Change_Button;
        private System.Windows.Forms.Button Return_Item_New_Button;
        private System.Windows.Forms.Label label18;
        private System.Windows.Forms.ListBox Return_Item_Data;
        private System.Windows.Forms.Label label19;
    }
}

