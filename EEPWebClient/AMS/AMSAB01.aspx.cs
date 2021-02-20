using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Srvtools;

public partial class AMS_AMSAB01 : System.Web.UI.Page
{
    private Srvtools.WebDataSet webDataSet1;

    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void ddlDepartment_SelectedIndexChanged(object sender, EventArgs e)
    {
        string l_str_SQL = @"
                            SELECT ME002,RTRIM(MV004) AS MV004,RTRIM(MV001) AS MV001,MV002 FROM CMSMV
                            LEFT JOIN CMSME ON MV004=ME001
                            WHERE ME001 IN ('3300','3400','3500','3600','3900')
                                    and ME002='{0}'";
       this.dsStaffID.SelectCommand= string.Format(l_str_SQL, this.ddlDepartment.SelectedValue.Trim());
       this.dsStaffID.DataBind();
       this.lbxStaffID.DataBind();
    }

    private void InitializeComponent()
    {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(AMS_AMSAB01));
            this.webDataSet1 = new Srvtools.WebDataSet();
            ((System.ComponentModel.ISupportInitialize)(this.webDataSet1)).BeginInit();
            // 
            // webDataSet1
            // 
            this.webDataSet1.Active = false;
            this.webDataSet1.AlwaysClose = false;
            this.webDataSet1.DataCompressed = false;
            this.webDataSet1.DeleteIncomplete = true;
            this.webDataSet1.Guid = "a36b012a-5abd-47cd-9a19-d608c8283097";
            this.webDataSet1.LastKeyValues = null;
            this.webDataSet1.Locale = new System.Globalization.CultureInfo("zh-TW");
            this.webDataSet1.PacketRecords = 100;
            this.webDataSet1.Position = -1;
            this.webDataSet1.RemoteName = null;
            this.webDataSet1.ServerModify = false;
            ((System.ComponentModel.ISupportInitialize)(this.webDataSet1)).EndInit();

    }
    protected void btnSummit_Click(object sender, EventArgs e)
    {
        DataTable l_dtb_GetSelectData;
        object[] l_obj_SentData;
        string l_str_ErrMsg=string.Empty;

        //驗証控制項
        if (Validate(out l_str_ErrMsg))
        {
            //取得需要排班人員的資訊
            l_dtb_GetSelectData = GetSelectData(dtpStartDate.DateString, dtpEndDate.DateString, tbxWorkingDay.Text, tbxDayOff.Text, lbxStaffID.Text, ddlWorkClass.SelectedValue, tbxInitDayOff.Text, tbxInitWorkingDay.Text);

            l_obj_SentData = new object[] { l_dtb_GetSelectData };
            object[] l_obj_ExecResult = CliUtils.CallMethod("sAMSZA", "SetExecAMSAB06_1", l_obj_SentData);

            //判斷呼叫Server Method的結果
            if (l_obj_ExecResult[1].ToString().Equals("Y"))
            {
                ShowMsgBox("完成");
            }
            else
            {
                ShowMsgBox("錯誤：" + l_obj_ExecResult[2].ToString());
            }
        }
        else
        {
            //顯示錯誤訊息
            ShowMsgBox(l_str_ErrMsg);
        }
    }

    /// <summary>
    /// 取得需要排班人員的資訊
    /// </summary>
    /// <param name="StartDate">開始日期</param>
    /// <param name="EndDate">結束日期</param>
    /// <param name="WorkingDay">工作天數</param>
    /// <param name="DayOff">休假天數</param>
    /// <param name="StaffID">員工編號(可接受多員工,用逗號隔開)</param>
    /// <param name="WorkClass">班別</param>
    /// <param name="InitDayOff">起始休假天數</param>
    /// <param name="InitWorkingDay">起始工作天數</param>
    /// <returns></returns>
    private DataTable GetSelectData(string StartDate, string EndDate, string WorkingDay, string DayOff, string StaffID, string WorkClass, string InitDayOff, string InitWorkingDay)
    {
        DataTable l_dtb_Result = new DataTable();
        //需先結束GridView的編輯狀態,否則選擇到的該筆會無法被勾選或取消.
        string[] l_str_StaffID = this.lbxStaffID.Text.Trim().Split(',');

        // Declare DataColumn and DataRow variables.
        DataColumn column;
        DataRow row;

        // Create new DataColumn, set DataType, ColumnName
        // and add to DataTable. 
        #region "Coloumns"
        //StartDate,EndDate,WorkingDay,DayOff,StaffID,WorkClass,InitDayOff,InitWorkingDay
        column = new DataColumn();
        column.ColumnName = "StartDate";
        l_dtb_Result.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "EndDate";
        l_dtb_Result.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "WorkingDay";
        l_dtb_Result.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "DayOff";
        l_dtb_Result.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "StaffID";
        l_dtb_Result.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "WorkClass";
        l_dtb_Result.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "InitDayOff";
        l_dtb_Result.Columns.Add(column);

        column = new DataColumn();
        column.ColumnName = "InitWorkingDay";
        l_dtb_Result.Columns.Add(column);
        #endregion

        foreach (string l_str_Temp in l_str_StaffID)
        {
            //StartDate,EndDate,WorkingDay,DayOff,StaffID,WorkClass,InitDayOff,InitWorkingDay
            row = l_dtb_Result.NewRow();
            row["StartDate"] = StartDate;
            row["EndDate"] = EndDate;
            row["WorkingDay"] = WorkingDay;
            row["DayOff"] = DayOff;
            row["StaffID"] = l_str_Temp;
            row["WorkClass"] = WorkClass;
            row["InitDayOff"] = InitDayOff;
            row["InitWorkingDay"] = InitWorkingDay;
            l_dtb_Result.Rows.Add(row);
        }

        return l_dtb_Result;
    }

    /// <summary>
    /// 驗証所有控制項
    /// </summary>
    /// <param name="ErrMsg">回傳錯誤訊息</param>
    /// <returns>True(正確) / False(不正確）</returns>
    private bool Validate(out string ErrMsg)
    {
        bool l_bool_Result = true;
        string l_str_ErrMsg = string.Empty;

        //檢查需驗証的控制項
        if (ChkDateRange(dtpStartDate.Text, dtpEndDate.Text, lblStartDate.Text, ref l_str_ErrMsg) == false) l_bool_Result = false;
        if (ChkStaffID(lbxStaffID.Text,lblStaffID.Text,ref l_str_ErrMsg) == false) l_bool_Result = false;
        if (ChkIsNum(tbxWorkingDay.Text, lblWorkingDay.Text, ref l_str_ErrMsg) == false) l_bool_Result = false;
        if (ChkIsNum(tbxDayOff.Text, lblDayOff.Text, ref l_str_ErrMsg) == false) l_bool_Result = false;
        if (ChkInitValue(tbxInitDayOff.Text, tbxInitWorkingDay.Text, "", ref l_str_ErrMsg) == false) l_bool_Result = false;
        if (ChkWorkClass(ddlWorkClass.SelectedItem.Text, lblWorkClass.Text, ref l_str_ErrMsg) == false) l_bool_Result = false;
        
        ErrMsg = l_str_ErrMsg;
        return l_bool_Result;
    }

    /// <summary>
    /// 驗証起始日期及結束日期
    /// </summary>
    /// <param name="StartDate">起始日期</param>
    /// <param name="EndDate">結束日期</param>
    /// <param name="ErrMsgTitle">錯誤訊息抬頭</param>
    /// <param name="ErrMsg">錯誤訊息</param>
    /// <returns>True(正確) / False(不正確）</returns>
    private bool ChkDateRange(string StartDate,string EndDate,string ErrMsgTitle,ref string ErrMsg)
    {
        bool l_bool_Result = false;
        string l_str_ErrMsg = string.Empty;

        //判斷起始日期不可空白
        if (string.IsNullOrEmpty(StartDate))
        {
            l_str_ErrMsg += ErrMsgTitle + "不可空白";
        }
        else
        {
            //判斷結束日期不可空白
            if (string.IsNullOrEmpty(EndDate))
            {
                l_str_ErrMsg += "結束日期：不可空白";
            }
            else
            {
                DateTime l_dte_StartDate, l_dte_EndDate;
                DateTime.TryParse(StartDate, out l_dte_StartDate);
                DateTime.TryParse(EndDate, out l_dte_EndDate);

                //判斷開始日期需小於等於結束日期
                if (l_dte_StartDate.Date.CompareTo(l_dte_EndDate) > 0)
                {
                    l_str_ErrMsg += ErrMsgTitle + "需小於或等於結束日期!!";
                }
                else
                {
                    l_bool_Result = true;
                }
            }
        }

        if (!l_bool_Result)
        {
            ErrMsg += l_str_ErrMsg + "\\n";
        }

        return l_bool_Result;
    }

    /// <summary>
    /// 檢查員工編號是否空白
    /// </summary>
    /// <param name="Value">需驗証的資料</param>
    /// <param name="ErrMsgTitle">錯誤訊息抬頭</param>
    /// <param name="ErrMsg">錯誤訊息</param>
    /// <returns>True(正確) / False(不正確）</returns>
    private bool ChkStaffID(string Value,string ErrMsgTitle,ref string ErrMsg)
    {
        bool l_bool_Result = false;
        string l_str_ErrMsg = string.Empty;

        //判斷起始日期不可空白
        if (string.IsNullOrEmpty(Value))
        {
            l_str_ErrMsg += ErrMsgTitle + "不可空白";
        }
        else
        {
            l_bool_Result = true;
        }

        if (!l_bool_Result)
        {
            ErrMsg += l_str_ErrMsg + "\\n";
        }

        return l_bool_Result;
    }

    /// <summary>
    /// 檢查是否為數值（含空白檢查）
    /// </summary>
    /// <param name="Value">需驗証的資料</param>
    /// <param name="ErrMsgTitle">錯誤訊息抬頭</param>
    /// <param name="ErrMsg">錯誤訊息</param>
    /// <returns>True(正確) / False(不正確）</returns>
    private bool ChkIsNum(string Value, string ErrMsgTitle, ref string ErrMsg)
    {
        bool l_bool_Result = false;
        string l_str_ErrMsg = string.Empty;

        //判斷不可空白
        if (string.IsNullOrEmpty(Value))
        {
            l_str_ErrMsg += ErrMsgTitle + "不可空白";
        }
        else
        {
            int l_int_ChkWorkingDay;
            if (!int.TryParse(Value, out l_int_ChkWorkingDay))
            {
                l_str_ErrMsg += ErrMsgTitle + "需為數值!!";
            }
            else
            {
                l_bool_Result = true;
            }
        }

        if (!l_bool_Result)
        {
            ErrMsg += l_str_ErrMsg + "\\n";
        }

        return l_bool_Result;
    }

    /// <summary>
    /// 驗証班別
    /// </summary>
    /// <param name="Value">需驗証的資料</param>
    /// <param name="ErrMsgTitle">錯誤訊息抬頭</param>
    /// <param name="ErrMsg">錯誤訊息</param>
    /// <returns>True(正確) / False(不正確）</returns>
    private bool ChkWorkClass(string Value, string ErrMsgTitle, ref string ErrMsg)
    {
        bool l_bool_Result = false;
        string l_str_ErrMsg = string.Empty;

        //判斷不可空白
        if (Value.Equals(""))
        {
            l_str_ErrMsg += ErrMsgTitle + "請選擇班別";
        }
        else
        {
            l_bool_Result = true;
        }

        if (!l_bool_Result)
        {
            ErrMsg += l_str_ErrMsg + "\\n";
        }
        return l_bool_Result;
    }

    /// <summary>
    /// 驗証起始工作天數及起始休假天數
    /// </summary>
    /// <param name="InitDayOff">起始休假天數</param>
    /// <param name="InitWorkingDay">始工作天數</param>
    /// <param name="ErrMsgTitle">錯誤訊息抬頭</param>
    /// <param name="ErrMsg">錯誤訊息</param>
    /// <returns>True(正確) / False(不正確）</returns>
    private bool ChkInitValue(string InitDayOff,string InitWorkingDay ,string ErrMsgTitle, ref string ErrMsg)
    {
        bool l_bool_Result = false;
        string l_str_ErrMsg = string.Empty;

        //判斷起始工作天數及起始休假天數,需為數值且不可空白
        if (ChkIsNum(InitWorkingDay, lblInitWorkingDay.Text, ref l_str_ErrMsg) &
            ChkIsNum(InitDayOff, lblInitDayOff.Text, ref l_str_ErrMsg))
        {
            //判斷起始工作天數及起始休假天數，不可同時設定．
            if (int.Parse(InitWorkingDay) > 0 && int.Parse(InitDayOff) > 0)
            {
                l_str_ErrMsg = "起始工作天數及起始休假天數，不可同時設定.\\n";
            }
            else
            {
                l_bool_Result = true;
            }
        }

        if (!l_bool_Result)
        {
            ErrMsg += l_str_ErrMsg;
        }
        return l_bool_Result;
    }


    public void ShowMsgBox(string Message)
    {
        this.Page.ClientScript.RegisterStartupScript(this.GetType(), "ShowMsgBox", "alert('" + Message + "');", true);
    }

}