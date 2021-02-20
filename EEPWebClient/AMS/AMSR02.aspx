<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AMSR02.aspx.cs" Inherits="AMSR02" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>AMSR02</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="style2">
            <tr>
                <td>
                    計薪年月：</td>
                <td>
        <asp:TextBox ID="TextBox1" runat="server" Width="90px" ></asp:TextBox>
                </td>
                <td >
        <asp:ImageButton ID="ImageButton1" runat="server" 
            ImageUrl="../Image/refval/RefVal.gif" onclick="ImageButton1_Click"/>
                    <span class="style6">&nbsp;</span></td>
                <td>
                    (輸入格式:YYYYMM)</td>
            </tr>
        </table>
        <br />
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
            ToolPanelView="None" DisplayPage="False" Height="50px"
            Width="350px" ReportSourceID="CrystalReportSource1" />
        &nbsp;&nbsp;&nbsp;
        <InfoLight:WebDataSource ID="WebDataSource1" runat="server" 
            WebDataSetID="WData" DataMember="AMSMG" SelectAlias="">
        </InfoLight:WebDataSource>
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="AMSR02.rpt">
                <DataSources>
                    <CR:DataSourceRef DataSourceID="WebDataSource1" TableName="AMSMG" />
                </DataSources>
            </Report>
        </CR:CrystalReportSource>
    
    </div>
    </form>
</body>
</html>
