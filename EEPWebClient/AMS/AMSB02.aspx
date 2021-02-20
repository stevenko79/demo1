<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AMSB02.aspx.cs" Inherits="WSingle_WSingle" Theme="ControlSkin" StylesheetTheme="ControlSkin"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #form1
        {
            height: 184px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="color: #000000; font-size: 20px; background-color: #bcc7d8; font-family: 微軟正黑體;">
        <InfoLight:WebDataSource ID="Master" runat="server" AutoApply="True" 
            WebDataSetID="WMaster" DataMember="rsa241">
        </InfoLight:WebDataSource>
        <InfoLight:WebDataSource ID="WebDataSource1" runat="server" SelectAlias="ERP" 
            SelectCommand="select * from rsa241">
        </InfoLight:WebDataSource>
        &nbsp;
        <asp:Label ID="Label1" runat="server" Text="    計薪年月  :"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp; 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="更     新" 
            Height="35px" Width="157px" Font-Size="16pt" />
        <br />
        (請至ERP系統/基本資料管理系統/共用參數設定作業/計薪年月 更改日期)<br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    
    </div>
    <Infolight:WebDefault runat="server" DefaultActive="True" DataSourceID="Master" DataMember="rsa241" CarryOnActive="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wdrsa241" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebDefault>
<Infolight:WebValidate runat="server" DataSourceID="Master" DataMember="rsa241" ValidateActive="True" DuplicateCheck="False" DuplicateCheckMode="ByLocal" ValidateStyle="ShowLable" MultiLanguage="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wvrsa241" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebValidate>
</form>
</body>
</html>
