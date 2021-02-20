<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AMSB03.aspx.cs" Inherits="AMSB03_AMSB03" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #000000;
        }
        
        input.groovybutton
        {
           font-size:12px;
           font-family:Arial,sans-serif;
           font-weight:bold;
           color:#FFFFFF;
           background-color:#336699;
           border-top-style:double;
           border-top-color:#336699;
           border-top-width:4px;
           border-bottom-style:double;
           border-bottom-color:#336699;
           border-bottom-width:4px;
           border-left-style:solid;
           border-left-color:#336699;
           border-left-width:4px;
           border-right-style:solid;
           border-right-color:#336699;
           border-right-width:4px;
        }
        
        .style2
        {
            font-size: small;
        }
        
    </style>
    <script language="javascript">

        function goLite(FRM,BTN)
        {
           window.document.forms[FRM].elements[BTN].style.backgroundColor = "#6699CC";
        }

        function goDim(FRM,BTN)
        {
           window.document.forms[FRM].elements[BTN].style.backgroundColor = "#336699";
        }

</script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #bcc7d8">
    
        <br />
        <br />
    
        <asp:Label ID="lblYYYYMM" runat="server" 
            style="color: #000000; font-size: small;" Text="計薪年月:"></asp:Label>
        <asp:TextBox ID="txtYYYYMM" runat="server" Height="25px" 
            style="font-family: 微軟正黑體; font-size: medium" Font-Names="微軟正黑體" 
            Font-Size="Large" Width="139px"></asp:TextBox>
    
        &nbsp;<asp:Button ID="btnExecSSIS" runat="server" Height="31px" 
            onclick="btnExecSSIS_Click" style="font-family: 微軟正黑體; font-size: small" 
            Text="匯入刷卡明細資料" Width="157px" 
            class="groovybutton"
            onMouseOver="goLite(this.form.name,this.name)" 
            onMouseOut="goDim(this.form.name,this.name)"/>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblMsg" runat="server" Font-Bold="True" Font-Names="微軟正黑體" 
            Font-Size="Small" ForeColor="Red" style="font-size: small"></asp:Label>
        <br />
        <br />
        <span class="style1"><span class="style2">※ 執行「匯入刷卡明細資料」前，請確認已完成刷卡機的資料更新作業!!</span><br />
        <br />
        </span></div>
    </form>
</body>
</html>
