using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Srvtools;

public partial class Template_WMasterDetail1 : System.Web.UI.Page
{
    private Srvtools.WebDataSet WMaster;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitializeComponent();
            Master.DataSource = WMaster;
            Detail.DataSource = WMaster;
        }
    }



    private void InitializeComponent()
    {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Template_WMasterDetail1));
            this.WMaster = new Srvtools.WebDataSet();
            ((System.ComponentModel.ISupportInitialize)(this.WMaster)).BeginInit();
            // 
            // WMaster
            // 
            this.WMaster.Active = false;
            this.WMaster.AlwaysClose = false;
            this.WMaster.DataCompressed = false;
            this.WMaster.DeleteIncomplete = true;
            this.WMaster.Guid = null;
            this.WMaster.LastKeyValues = null;
            this.WMaster.Locale = new System.Globalization.CultureInfo("zh-TW");
            this.WMaster.PacketRecords = 100;
            this.WMaster.Position = -1;
            this.WMaster.RemoteName = "sAMSZA.AMSZA";
            this.WMaster.ServerModify = false;
            ((System.ComponentModel.ISupportInitialize)(this.WMaster)).EndInit();

    }
    protected void WebNavigator1_Command(object sender, CommandEventArgs e)
    {

        if (e.CommandName == "cmdFirst" || e.CommandName == "cmdPrevious" 
            || e.CommandName == "cmdNext" || e.CommandName == "cmdLast")
        {
            Detail.ExecuteSelect(wfvMaster); 
            DataBind(); 
        }
        else if (e.CommandName == "cmdAdd")
        {
            Detail.ExecuteAdd(wfvMaster);
            DataBind();
        }
        else if (e.CommandName == "cmdDelete")
        {
            Detail.ExecuteSelect(wfvMaster);
            DataBind();
        }
        else if (e.CommandName == "cmdApply" && wfvMaster.AllValidateSucess)
        {
            Master.SetWhere(Master.WhereStr);
            wfvMaster.DataBind();
            Detail.ExecuteSelect(wfvMaster);
            wgvDetail.DataBind();
            //Detail.
            //Detail.SetWhere(Master.WhereStr);
            //DataBind();
            //Detail.ExecuteSelect(wfvMaster);
            ////DataBind();
        }

 
    }
    protected void wfvMaster_PageIndexChanged(object sender, EventArgs e)
    {
        Detail.ExecuteSelect(wfvMaster);
        DataBind();
    }
    protected void wfvMaster_AfterInsertLocate(object sender, EventArgs e)
    {
        Detail.ExecuteSelect(wfvMaster);
        DataBind();
    }
    protected void wfvMaster_Canceled(object sender, EventArgs e)
    {
        Detail.ExecuteSelect(wfvMaster);
        DataBind();
    }
    protected void wgvDetail_DataBound(object sender, EventArgs e)
    {
        if ((wgvDetail.EditIndex != -1 && wgvDetail.Rows.Count > wgvDetail.EditIndex))
        {
            if ((wgvDetail.Rows[wgvDetail.EditIndex].FindControl("wrvZB004") as WebRefVal).BindingValue == "*****")
            {
                (wgvDetail.Rows[wgvDetail.EditIndex].FindControl("wrvZB004") as WebRefVal).Visible = false;
                (wgvDetail.Rows[wgvDetail.EditIndex].FindControl("txtEdatetime") as TextBox).Visible = false;
                (wgvDetail.Rows[wgvDetail.EditIndex].FindControl("txtSdatetime") as TextBox).Visible = false;
            }
            else
            {
                (wgvDetail.Rows[wgvDetail.EditIndex].FindControl("dtpSdate") as WebDateTimePicker).Visible = false;
                (wgvDetail.Rows[wgvDetail.EditIndex].FindControl("tpStime") as WebTimePicker).Visible = false;
                (wgvDetail.Rows[wgvDetail.EditIndex].FindControl("dtpEdate") as WebDateTimePicker).Visible = false;
                (wgvDetail.Rows[wgvDetail.EditIndex].FindControl("tpEtime") as WebTimePicker).Visible = false;
            }
        }
        //TextBox ILH002TB = (TextBox)wgvDetail.FindControl("LabDate");
    }

    public object GetDate()
    {
        if (wgvDetail.EditIndex != -1 && wgvDetail.Rows.Count > wgvDetail.EditIndex)
            return (wgvDetail.Rows[wgvDetail.EditIndex].FindControl("LabDate") as Label).Text.Replace("-","");
        else
            return "%";
    }

    protected void wgvDetail_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        //2013/11/15 Joye 自動存檔
        Master.ApplyUpdates();
        //重新取值並畫面重整
        Master.SetWhere(Master.WhereStr);
        wgvDetail.DataBind();
    }

    protected void wgvDetail_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //string sDateTime = DataBinder.Eval(e.Row.DataItem, "ZB006").GetType() == typeof(System.DBNull) ? "" : ((DateTime)DataBinder.Eval(e.Row.DataItem, "ZB006")).ToString("yyyy-MM-dd HH:mm");
            if (DataBinder.Eval(e.Row.DataItem, "ZB006").GetType() != typeof(System.DBNull))
            {
                string sSdate = ((DateTime)DataBinder.Eval(e.Row.DataItem, "ZB006")).ToString("yyyy-MM-dd");
                string sStime = ((DateTime)DataBinder.Eval(e.Row.DataItem, "ZB006")).ToString("HH:mm");
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

            if (DataBinder.Eval(e.Row.DataItem, "ZB007").GetType() != typeof(System.DBNull))
            {
                string sEdate = ((DateTime)DataBinder.Eval(e.Row.DataItem, "ZB007")).ToString("yyyy-MM-dd");
                string sEtime = ((DateTime)DataBinder.Eval(e.Row.DataItem, "ZB007")).ToString("HH:mm");
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
    protected void wgvDetail_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        WebDateTimePicker dtpSdate = (WebDateTimePicker)wgvDetail.Rows[e.RowIndex].FindControl("dtpSdate");
        WebTimePicker tpStime = (WebTimePicker)wgvDetail.Rows[e.RowIndex].FindControl("tpStime");
        WebDateTimePicker dtpEdate = (WebDateTimePicker)wgvDetail.Rows[e.RowIndex].FindControl("dtpEdate");
        WebTimePicker tpEtime = (WebTimePicker)wgvDetail.Rows[e.RowIndex].FindControl("tpEtime");
        if (dtpSdate.Visible == true)
        {
            if (dtpSdate.Text.ToString() != "")
                e.NewValues["ZB006"] = DateTime.Parse(dtpSdate.Text.ToString() + " " + tpStime.Text.ToString());
            else
                e.NewValues["ZB006"] = "";

            if (dtpEdate.Text.ToString() != "")
                e.NewValues["ZB007"] = DateTime.Parse(dtpEdate.Text.ToString() + " " + tpEtime.Text.ToString());
            else
                e.NewValues["ZB007"] = "";
        }
    }
}
