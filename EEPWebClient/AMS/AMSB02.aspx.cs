using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Srvtools;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Windows.Forms;
using YC.Library;

public partial class WSingle_WSingle : System.Web.UI.Page
{
    private Srvtools.WebDataSet WMaster;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitializeComponent();

            Master.DataSource = WMaster;
           
            
        }
        string sSQL1 = "select * from CMSMA";
        DataSet dsSheets = CliUtils.ExecuteSql("sRsa241", "ECMSMA", sSQL1, true, CliUtils.fCurrentProject);
        string l_date = dsSheets.Tables[0].Rows[0]["MA022"].ToString().Insert(4,"/") ;
       Label2.Text = l_date;
    }

    private void InitializeComponent()
    {
        System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(WSingle_WSingle));
        this.WMaster = new Srvtools.WebDataSet();
        ((System.ComponentModel.ISupportInitialize)(this.WMaster)).BeginInit();
        // 
        // WMaster
        // 
        this.WMaster.Active = true;
        this.WMaster.AlwaysClose = false;
        this.WMaster.PacketRecords = 100;
        this.WMaster.Position = -1;
        this.WMaster.RemoteName = "sRsa241.rsa241";
        this.WMaster.ServerModify = false;
        ((System.ComponentModel.ISupportInitialize)(this.WMaster)).EndInit();
    }
    
    protected void Button1_Click(object sender, EventArgs e)
    {
       
            //string sSQL = "select  *  from rsa241 where sdate Like" + "'" + Tdate.Text + "%'";
            string sSQL = "select  *  from rsa241 where sdate Like" + "'" + Label2.Text + "%'";
            DataSet dsSheets = CliUtils.ExecuteSql("sRsa241", "rsa241", sSQL, true, CliUtils.fCurrentProject);
            DataTable l_dtb_Data = new DataTable();
            object[] l_obj_SentData, l_obj_ExecState = new object[] { 0, "N" };
        
            try
            {
                l_dtb_Data = dsSheets.Tables[0].DefaultView.ToTable();

                if (l_dtb_Data.Rows.Count != 0)
                {

                    l_obj_SentData = new object[] { l_dtb_Data };
                    l_obj_ExecState = CliUtils.CallMethod("sRsa241", "SetRSA241", l_obj_SentData);
                    object[] ret = CliUtils.CallMethod("sRsa241", "execUpdateAMSMG", new object[] { });
                    if (l_obj_ExecState[1].ToString().Equals("N"))
                    {
                        MessageBox.Show("執行失敗: " + l_obj_ExecState[2].ToString().Substring(1, 350) + " ...", "錯誤", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else
                    {
                        MessageBox.Show("執行成功!!", "訊息", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                else
                {
                    MessageBox.Show("匯入可能無資料!!", "訊息", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }

            }
            catch (Exception)
            {
                MessageBox.Show("執行失敗!!\n" + "輸入錯誤", "錯誤", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
         
        }
    
    protected void Tdate_TextChanged(object sender, EventArgs e)
    {

    }
}
