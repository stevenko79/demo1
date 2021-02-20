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
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Windows.Forms;
public partial class AMSR02 : System.Web.UI.Page
{
    private Srvtools.WebDataSet WData;

    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitializeComponent();
            WebDataSource1.DataSource = WData;
        }
        CrystalReportViewer1.DisplayPage = true;
    }

    private void InitializeComponent()
    {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AMSR02));
            this.WData = new Srvtools.WebDataSet();
            ((System.ComponentModel.ISupportInitialize)(this.WData)).BeginInit();
            // 
            // WData
            // 
            this.WData.Active = true;
            this.WData.AlwaysClose = true;
            this.WData.DataCompressed = false;
            this.WData.DeleteIncomplete = true;
            this.WData.Guid = null;
            this.WData.LastKeyValues = null;
            this.WData.Locale = new System.Globalization.CultureInfo("zh-TW");
            this.WData.PacketRecords = -1;
            this.WData.Position = -1;
            this.WData.RemoteName = "sAMSMG.AMSMG";
            this.WData.ServerModify = false;
            ((System.ComponentModel.ISupportInitialize)(this.WData)).EndInit();

    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox1.Text == "")
        {
            MessageBox.Show("資料錯誤請重新輸入!");
        }
        else
        {
            string swhere = " MG001 like " + "'" + TextBox1.Text + "%'";  //   set condiction here
            WebDataSource1.SetWhere(swhere);
            CrystalReportViewer1.RefreshReport(); // reload page
        }
    }
}
