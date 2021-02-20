using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Text;
using Srvtools;


public partial class AMSB03_AMSB03 : System.Web.UI.Page
{
    private Srvtools.InfoConnection infoConnection1;
    private Srvtools.WebDataSet webDataSet1;

    private System.ComponentModel.IContainer components;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitializeComponent();
        }
        
    }

    private void InitializeComponent()
    {
        this.components = new System.ComponentModel.Container();
        System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AMSB03_AMSB03));
        this.infoConnection1 = new Srvtools.InfoConnection(this.components);
        this.webDataSet1 = new Srvtools.WebDataSet();
        ((System.ComponentModel.ISupportInitialize)(this.infoConnection1)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this.webDataSet1)).BeginInit();
        // 
        // infoConnection1
        // 
        this.infoConnection1.EEPAlias = "ERP";
        // 
        // webDataSet1
        // 
        this.webDataSet1.Active = false;
        this.webDataSet1.AlwaysClose = false;
        this.webDataSet1.DataCompressed = false;
        this.webDataSet1.DeleteIncomplete = true;
        this.webDataSet1.Guid = "9c929e78-3887-45db-8b22-fa7f792dd4f2";
        this.webDataSet1.LastKeyValues = null;
        this.webDataSet1.Locale = new System.Globalization.CultureInfo("zh-TW");
        this.webDataSet1.PacketRecords = 100;
        this.webDataSet1.Position = -1;
        this.webDataSet1.RemoteName = "sAMSMG.cmdSSIS_ImportRSA241";
        this.webDataSet1.ServerModify = false;
        ((System.ComponentModel.ISupportInitialize)(this.infoConnection1)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this.webDataSet1)).EndInit();

    }
    protected void btnExecSSIS_Click(object sender, EventArgs e)
    {
        //string fileName = "HDTA_a.mdb";
        //string sourcePath = @"\\192.168.1.201\fac9500s";
        //string targetPath = @"\\192.168.1.200\Conductor";

        //string sourceFile = System.IO.Path.Combine(sourcePath, fileName);
        //string destFile = System.IO.Path.Combine(targetPath, fileName);

        //if (System.IO.Directory.Exists(targetPath))
        //{
        //    System.IO.File.Copy(sourceFile, destFile, true);
        //}
        //else
        //{
        //    Console.WriteLine("Source path does not exist!");
        //}

        object[] back=CliUtils.CallMethod("sAMSMG", "execSSIS_ImportRSA241",new object[] {txtYYYYMM.Text});
        if (back[0].ToString() == "0")
        {
            //CliUtils.RegisterStartupScript(this, "alert('批次更新完成~!!')");
            lblMsg.Text = "批次更新完成~!!";
        }
    }


}