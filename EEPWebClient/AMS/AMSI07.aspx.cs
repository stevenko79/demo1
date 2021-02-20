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
        this.WMaster.RemoteName = "sRESAJ.Resaj";
        this.WMaster.ServerModify = false;
        ((System.ComponentModel.ISupportInitialize)(this.WMaster)).EndInit();

    }


    protected void wgvMaster_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "myInsert")
        {
            wgvMaster.DataSourceID = null;
        }
    }


    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        wgvMaster.DataSourceID = "SqlDataSource1";
    }


    protected void wgvMaster_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //string sDateTime = DataBinder.Eval(e.Row.DataItem, "ZB006").GetType() == typeof(System.DBNull) ? "" : ((DateTime)DataBinder.Eval(e.Row.DataItem, "ZB006")).ToString("yyyy-MM-dd HH:mm");
            if (DataBinder.Eval(e.Row.DataItem, "resaj003").GetType() != typeof(System.DBNull))
            {
                string sSdate = ((DateTime)DataBinder.Eval(e.Row.DataItem, "resaj003")).ToString("yyyy-MM-dd");
                string sStime = ((DateTime)DataBinder.Eval(e.Row.DataItem, "resaj003")).ToString("HH:mm");
                Control controlSdate = e.Row.FindControl("dtpSdate");
                Control controlStime = e.Row.FindControl("tpStime");
                if ((controlSdate != null && controlSdate is WebDateTimePicker) && (controlStime != null && controlStime is WebTimePicker))
                {
                    WebDateTimePicker dtpSdate = (WebDateTimePicker)controlSdate;
                    WebTimePicker tpStime = (WebTimePicker)controlStime;
                    dtpSdate.Text = sSdate;
                    tpStime.Text = sStime;
                }
            }

            if (DataBinder.Eval(e.Row.DataItem, "resaj004").GetType() != typeof(System.DBNull))
            {
                string sEdate = ((DateTime)DataBinder.Eval(e.Row.DataItem, "resaj004")).ToString("yyyy-MM-dd");
                string sEtime = ((DateTime)DataBinder.Eval(e.Row.DataItem, "resaj004")).ToString("HH:mm");
                Control controlEdate = e.Row.FindControl("dtpEdate");
                Control controlEtime = e.Row.FindControl("tpEtime");
                if ((controlEdate != null && controlEdate is WebDateTimePicker) && (controlEtime != null && controlEtime is WebTimePicker))
                {
                    WebDateTimePicker dtpEdate = (WebDateTimePicker)controlEdate;
                    WebTimePicker tpEtime = (WebTimePicker)controlEtime;
                    dtpEdate.Text = sEdate;
                    tpEtime.Text = sEtime;
                }
            }

            if (DataBinder.Eval(e.Row.DataItem, "resaj006").GetType() != typeof(System.DBNull))
            {
                string sEdate = ((DateTime)DataBinder.Eval(e.Row.DataItem, "resaj006")).ToString("yyyy-MM-dd");
                string sEtime = ((DateTime)DataBinder.Eval(e.Row.DataItem, "resaj006")).ToString("HH:mm");
                Control controlEdate = e.Row.FindControl("dtpEdate");
                Control controlEtime = e.Row.FindControl("tpEtime");
                if ((controlEdate != null && controlEdate is WebDateTimePicker) && (controlEtime != null && controlEtime is WebTimePicker))
                {
                    WebDateTimePicker dtpEdate = (WebDateTimePicker)controlEdate;
                    WebTimePicker tpEtime = (WebTimePicker)controlEtime;
                    dtpEdate.Text = sEdate;
                    tpEtime.Text = sEtime;
                }
            }

            if (DataBinder.Eval(e.Row.DataItem, "resaj007").GetType() != typeof(System.DBNull))
            {
                string sEdate = ((DateTime)DataBinder.Eval(e.Row.DataItem, "resaj007")).ToString("yyyy-MM-dd");
                string sEtime = ((DateTime)DataBinder.Eval(e.Row.DataItem, "resaj007")).ToString("HH:mm");
                Control controlEdate = e.Row.FindControl("dtpEdate");
                Control controlEtime = e.Row.FindControl("tpEtime");
                if ((controlEdate != null && controlEdate is WebDateTimePicker) && (controlEtime != null && controlEtime is WebTimePicker))
                {
                    WebDateTimePicker dtpEdate = (WebDateTimePicker)controlEdate;
                    WebTimePicker tpEtime = (WebTimePicker)controlEtime;
                    dtpEdate.Text = sEdate;
                    tpEtime.Text = sEtime;
                }
            }

           

        }
    }
}
