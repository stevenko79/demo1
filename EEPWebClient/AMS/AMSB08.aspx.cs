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
using System.Globalization;
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
            this.WMaster.DataCompressed = false;
            this.WMaster.DeleteIncomplete = true;
            this.WMaster.Guid = null;
            this.WMaster.LastKeyValues = null;
            this.WMaster.Locale = new System.Globalization.CultureInfo("zh-TW");
            this.WMaster.PacketRecords = 100;
            this.WMaster.Position = -1;
            this.WMaster.RemoteName = "sAMSZA.RESAJ";
            this.WMaster.ServerModify = false;
            ((System.ComponentModel.ISupportInitialize)(this.WMaster)).EndInit();

    }

    protected void WebDropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //string where = "date_id=1020101 and yyy=102";
        this.WebDataSource2.SelectCommand = " SELECT SUBSTRING(CONVERT(char,date_id,120),1,10) AS date_id,date,yyyy FROM wfdate_dim WHERE yyyy='" + WDD2.SelectedValue.Trim() + "'";
        //this.WebDataSource2.SelectCommand = where;
        //this.WebDataSource2.SetWhere("yyyy='" + WebDropDownList2.SelectedValue.Trim() + "'");
        //this.WebDataSource2.DataBind();
        //this.WebListBoxList1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        object[] l_obj_time;
        object[] l_obj_deleteYear;
        DataTable l_dtb_time;
        DataTable l_dtb_deleteYear;

        l_dtb_deleteYear = GetGVSelectYear(WDD1.SelectedValue.Trim(), WDD2.SelectedValue.Trim());
        l_obj_deleteYear = new object[] { l_dtb_deleteYear };
        object[] l_obj_ExecYear = CliUtils.CallMethod("sAMSZA", "Yeartatistic", l_obj_deleteYear);
       
        l_dtb_time = GetGVSelect(WDD1.SelectedValue.Trim(), WDD2.SelectedValue.Trim(), WDD3.SelectedValue.Trim(), WDD4.SelectedValue.Trim(), WDD5.SelectedValue.Trim(), WDD6.SelectedValue.Trim(), WDD7.SelectedValue.Trim(), WDD8.SelectedValue.Trim(), WDD9.SelectedValue.Trim(), WDD10.SelectedValue.Trim(), cb1.Checked.ToString(), cb2.Checked.ToString(), WebListBoxList1.Text.Trim());
        l_obj_time = new object[] { l_dtb_time };
        object[] l_obj_ExecTime = CliUtils.CallMethod("sAMSZA", "AMSB08", l_obj_time);
        Label20.Visible = true;
        Label20.Text="產生完成";

    }

    public DataTable GetGVSelectYear(string year,string team)
    {
        //DataTable l_dtb_Result;
        //需先結束GridView的編輯狀態,否則選擇到的該筆會無法被勾選或取消.
        string[] number = WebListBoxList1.Text.Trim().Split(',');

        DataTable table = new DataTable();

        // Declare DataColumn and DataRow variables.
        DataColumn column;
        DataRow row;

        column = new DataColumn();
        column.ColumnName = "YEAR";
        table.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "TEAM";
        table.Columns.Add(column);

        row = table.NewRow();
        row["YEAR"] = year;
        table.Rows.Add(row);
        row = table.NewRow();
        row["TEAM"] = team;
        table.Rows.Add(row);

        return table;
    }


    public DataTable GetGVSelect(string WD1, string WD2, string WD3, string WD4, string WD5, string WD6, string WD7, string WD8, string WD9, string WD10, string CB1, string CB2, string LBL1)
    {
        //DataTable l_dtb_Result;
        //需先結束GridView的編輯狀態,否則選擇到的該筆會無法被勾選或取消.
        string[] number = WebListBoxList1.Text.Trim().Split(',');

        DataTable table = new DataTable();

        // Declare DataColumn and DataRow variables.
        DataColumn column;
        DataRow row;

        // Create new DataColumn, set DataType, ColumnName
        // and add to DataTable.    
        column = new DataColumn();
        column.ColumnName = "WD1";
        table.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "WD2";
        table.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "WD3";
        table.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "WD4";
        table.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "WD5";
        table.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "WD6";
        table.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "WD7";
        table.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "WD8";
        table.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "WD9";
        table.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "WD10";
        table.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "CB1";
        table.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "CB2";
        table.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "LBL1";
        table.Columns.Add(column);


            row = table.NewRow();
            row["WD1"] = WD1;
            table.Rows.Add(row);
            row = table.NewRow();
            row["WD2"] = WD2;
            table.Rows.Add(row);
            row = table.NewRow();
            row["WD3"] = WD3;
            table.Rows.Add(row);
            row = table.NewRow();
            row["WD4"] = WD4;
            table.Rows.Add(row);
            row = table.NewRow();
            row["WD5"] = WD5;
            table.Rows.Add(row);
            row = table.NewRow();
            row["WD6"] = WD6;
            table.Rows.Add(row);
            row = table.NewRow();
            row["WD7"] = WD7;
            table.Rows.Add(row);
            row = table.NewRow();
            row["WD8"] = WD8;
            table.Rows.Add(row);
            row = table.NewRow();
            row["WD9"] = WD9;
            table.Rows.Add(row);
            row = table.NewRow();
            row["WD10"] = WD10;
            table.Rows.Add(row);
            row = table.NewRow();
            row["CB1"] = CB1;
            table.Rows.Add(row);
            row = table.NewRow();
            row["CB2"] = CB2;
            table.Rows.Add(row);
            row = table.NewRow();
            row["LBL1"] = LBL1;
            table.Rows.Add(row);

        return table;
    }


}
