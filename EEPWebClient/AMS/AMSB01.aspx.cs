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
    private System.ComponentModel.IContainer components;
    private Srvtools.WebDataSet WGroup;
    private Srvtools.WebDataSet WMaster;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            InitializeComponent();

            Master.DataSource = WMaster;
            Groupuser.DataSource = WGroup;
        }
    }

    private void InitializeComponent()
    {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(WSingle_WSingle));
            this.WMaster = new Srvtools.WebDataSet();
            this.WGroup = new Srvtools.WebDataSet();
            ((System.ComponentModel.ISupportInitialize)(this.WMaster)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.WGroup)).BeginInit();
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
            // 
            // WGroup
            // 
            this.WGroup.Active = true;
            this.WGroup.AlwaysClose = false;
            this.WGroup.DataCompressed = false;
            this.WGroup.DeleteIncomplete = true;
            this.WGroup.Guid = "96bbaf3f-d06b-469e-a120-f60a73345fdf";
            this.WGroup.LastKeyValues = null;
            this.WGroup.Locale = new System.Globalization.CultureInfo("zh-TW");
            this.WGroup.PacketRecords = 100;
            this.WGroup.Position = -1;
            this.WGroup.RemoteName = "sAMSZA.infoCommGroup";
            this.WGroup.ServerModify = false;
            ((System.ComponentModel.ISupportInitialize)(this.WMaster)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.WGroup)).EndInit();

    }
    protected void WebDropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //2015/02/11 Joyce �ק�{���H���s�ղM�����Ө���USERGROUPS Table
        if (WebDropDownList1.SelectedValue.Trim()=="All")
            this.Groupuser.SetWhere("");   
        else
            this.Groupuser.SetWhere("GP.GROUPNAME='" + WebDropDownList1.SelectedValue.Trim() + "'");
            
        this.Groupuser.DataBind();
        this.WebListBoxList1.DataBind();
    }

    public bool IsDate(string strSource, string Format)
    {
        //format�榡�G
        //�~: yyyy;��: MM;��: dd
        //��: HH;��: mm;��: ss

        //�ϥνd�ҡG
        //IsDate("20090229", "yyyyMMdd");2��S29��
        //IsDate("1162", "HHmm");
        //IsDate("1131", "MMdd");
        //�H�W�d�ҳ��|�Ǧ^false�C

        bool bResult = false;
        DateTime l_dte_Temp;//�ѧP�_�Ȧs����

        if (!String.IsNullOrEmpty(strSource) &&
            DateTime.TryParseExact(strSource, Format, null, DateTimeStyles.None, out l_dte_Temp)
           )
        {
            bResult = true;
        }

        return bResult;
    }

    public DataTable GetGVSelect(string week)
    {
        //DataTable l_dtb_Result;
        //�ݥ�����GridView���s�説�A,�_�h��ܨ쪺�ӵ��|�L�k�Q�Ŀ�Ψ���.
        DataTable table = new DataTable();

        // Declare DataColumn and DataRow variables.
        DataColumn column;
        DataRow row;

        // Create new DataColumn, set DataType, ColumnName
        // and add to DataTable.    
        column = new DataColumn();
        column.ColumnName = "Week";
        table.Columns.Add(column);

            row = table.NewRow();
            row["Week"] = week;
            table.Rows.Add(row);

        return table;
    }

    public DataTable GetGVSelect(string ZB001,string str_date,string ZB004)
    {
        //DataTable l_dtb_Result;
        //�ݥ�����GridView���s�説�A,�_�h��ܨ쪺�ӵ��|�L�k�Q�Ŀ�Ψ���.
        string[] number = WebListBoxList1.Text.Trim().Split(',');

        DataTable table = new DataTable();

        // Declare DataColumn and DataRow variables.
        DataColumn column;
        DataRow row;

        // Create new DataColumn, set DataType, ColumnName
        // and add to DataTable.    
        column = new DataColumn();
        column.ColumnName = "ZB001";
        table.Columns.Add(column);

         column = new DataColumn();
         column.ColumnName = "DATE";
         table.Columns.Add(column);

         column = new DataColumn();
         column.ColumnName = "ZB004";
         table.Columns.Add(column);


        foreach (string i in number)
        {
            row = table.NewRow();
            row["ZB001"] =  i;
            row["DATE"] =  str_date;
            row["ZB004"] =  ZB004;
            table.Rows.Add(row);
        }

        return table;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        object[] l_obj_SentData;
        object[] l_obj_SentWeek;

        DataTable l_dtb_SelectWeek;
        DataTable l_dtb_SelectData;

        string str_ZB004=WDL1.SelectedValue.Trim()+WDL2.SelectedValue.Trim()+WDL3.SelectedValue.Trim()+WDL4.SelectedValue.Trim()+WDL5.SelectedValue.Trim()+WDL6.SelectedValue.Trim();
        if (WDL1.SelectedValue != "C0" && WDL2.SelectedValue != "C0" && WDL3.SelectedValue != "C0" && WDL4.SelectedValue != "C0")
        {

            if (WebListBoxList1.Text.Trim() != "" && TextBox1.Text.Trim()!="")
            {
                string str_NewZb004 = str_ZB004.Replace("C0", "");//�N�ťժ��߯Z�h����
                l_dtb_SelectWeek = GetGVSelect(TextBox1.Text.Trim());
                l_obj_SentWeek = new object[] { l_dtb_SelectWeek };
                object[] l_obj_ExecWeek = CliUtils.CallMethod("sAMSZA", "WeekStatistic", l_obj_SentWeek);
                int x = Convert.ToInt16(l_obj_ExecWeek[1]);//�~�몺�g��
                if (str_NewZb004.Length != x)
                {
                    Label7.Text = "���楢��,�нT�{(��)�g���O�_���T";
                }
                else
                {
                    //���o�n��s���A����T
                    l_dtb_SelectData = GetGVSelect(WebListBoxList1.Text.Trim(), TextBox1.Text.Trim(), str_ZB004.Replace("C0", ""));
                    //�P�_�O�_���Ŀ諸���

                    l_obj_SentData = new object[] { l_dtb_SelectData, };  //�ϥΪ̿�ܭn�M�������

                    //�I�sServer Method

                    object[] l_obj_ExecState = CliUtils.CallMethod("sAMSZA", "SetExecAMSAB06", l_obj_SentData);

                    //�P�_Server Method�O�_���榨�\
                    if (l_obj_ExecState[1].ToString().Equals("N"))
                    {
                        Label7.Text = "���楢��!!";
                        //MessageBox.Show(l_obj_ExecState[2].ToString(), "���~", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    else
                    {
                        Label7.Text = "���榨�\!!";
                    }
                }

            }
            else
            {
                Label7.Text = "����ܭ��u!!";
            }

        }
        else
        {
            Label7.Text = "�Ĥ@�g�ܲĥ|�g��Ƭ�����!!";
        }

    }
    }
