<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AMSAB01.aspx.cs" Inherits="AMS_AMSAB01" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            height: 24px;
        }
        .style2
        {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <InfoLight:WebDataSource ID="dsDepartment" runat="server" SelectAlias="ERP" SelectCommand="select '' as GROUPID,'All' as GROUPNAME
union
SELECT GROUPID,GROUPNAME 
FROM GROUPS 
WHERE GROUPID IN ('3300','3400','3500','3600')">
        </InfoLight:WebDataSource>
        <InfoLight:WebDataSource ID="dsStaffID" runat="server" SelectAlias="ERP" SelectCommand="SELECT ME002,RTRIM(MV004) AS MV004,RTRIM(MV001) AS MV001,MV002 FROM CMSMV
LEFT JOIN CMSME ON MV004=ME001
WHERE ME001 IN ('3300','3400','3500','3600','3900')">
        </InfoLight:WebDataSource>
        <InfoLight:WebDataSource ID="dsWorkClass" runat="server" SelectAlias="ERP" 
            SelectCommand="SELECT DRPID,DRPVALUE FROM SYSDRP WHERE DRPNAME='AMSMB002'">
        </InfoLight:WebDataSource>
        <table style="background-color: #9999FF" border="1" cellspacing="1" cellpadding="1">
            <tr>
                <td class="style2">
                    <asp:Label ID="lblStartDate" runat="server" Text="開始日期：" Font-Names="微軟正黑體"></asp:Label>
                </td>
                <td class="style2">
                    <InfoLight:WebDateTimePicker ID="dtpStartDate" runat="server" 
                        DateTimeType="VarChar"></InfoLight:WebDateTimePicker>
                </td>
                <td class="style2">
                    <asp:Label ID="lblEndDate" runat="server" Text="結束日期：" Font-Names="微軟正黑體"></asp:Label>
                </td>
                <td class="style2">
                    <InfoLight:WebDateTimePicker ID="dtpEndDate" runat="server" 
                        DateTimeType="VarChar"></InfoLight:WebDateTimePicker>
                </td>
            </tr>
            <tr>
                <td class="style1"><asp:Label ID="lblDepartment" runat="server" Text="部　　門：" 
                        Font-Names="微軟正黑體"></asp:Label></td>
                <td class="style1">
                    <InfoLight:WebDropDownList ID="ddlDepartment" runat="server" 
                        DataMember="GROUPID" DataSourceID="dsDepartment" DataTextField="GROUPNAME" 
                        AutoPostBack="True" onselectedindexchanged="ddlDepartment_SelectedIndexChanged">
                    </InfoLight:WebDropDownList>
                </td>
                <td class="style1"><asp:Label ID="lblStaffID" runat="server" Text="人　　員：" 
                        Font-Names="微軟正黑體"></asp:Label></td>
                <td class="style1">
                    <InfoLight:WebListBoxList ID="lbxStaffID" runat="server" 
                        DataSourceID="dsStaffID" DataTextField="MV002" DataValueField="MV001"></InfoLight:WebListBoxList>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lblWorkingDay" runat="server" Text="工作天數：" Font-Names="微軟正黑體"></asp:Label></td>
                <td>
                    <asp:TextBox ID="tbxWorkingDay" runat="server" MaxLength="2" ReadOnly="True">6</asp:TextBox>
                </td>
                <td><asp:Label ID="lblDayOff" runat="server" Text="休假天數：" Font-Names="微軟正黑體"></asp:Label></td>
                <td>
                    <asp:TextBox ID="tbxDayOff" runat="server" MaxLength="2" ReadOnly="True">2</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lblWorkClass" runat="server" Text="起始班別：" Font-Names="微軟正黑體"></asp:Label></td>
                <td>
                    <InfoLight:WebDropDownList ID="ddlWorkClass" runat="server" AutoPostBack="True" 
                        DataSourceID="dsWorkClass" DataTextField="DRPVALUE" DataValueField="DRPID">
                    </InfoLight:WebDropDownList>
                </td>
                <td>&nbsp</td>
                <td>&nbsp</td>
            </tr>
            <tr>
                <td><asp:Label ID="lblInitDayOff" runat="server" Text="起始休假天數：" Font-Names="微軟正黑體"></asp:Label></td>
                <td>
                    <asp:TextBox ID="tbxInitDayOff" runat="server" MaxLength="1">0</asp:TextBox>
                </td>
                <td><asp:Label ID="lblInitWorkingDay" runat="server" Text="起始工作天數：" 
                        Font-Names="微軟正黑體"></asp:Label></td>
                <td>
                    <asp:TextBox ID="tbxInitWorkingDay" runat="server" MaxLength="1">0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:Button ID="btnSummit" runat="server" Text="確  認" Font-Names="微軟正黑體" 
                        Font-Size="Medium" onclick="btnSummit_Click" OnClientClick="return confirm('注意：若有己設定的資料，將會被刪除後重新設定班別！\n若要執行請點〔確定〕；若不執行請點〔取消〕');" />
                </td>

            </tr>
        </table>     
    </div>
    </form>
</body>
</html>
