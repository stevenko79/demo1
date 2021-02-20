<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AMSB01.aspx.cs" Inherits="WSingle_WSingle" Theme="ControlSkin" StylesheetTheme="ControlSkin"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 74px;
        }
        .style3
        {
            width: 88px;
        }
        .style4
        {
            font-family: 微軟正黑體;
        }
        .style5
        {
            font-family: 微軟正黑體;
        }
        .style6
        {
            width: 74px;
            font-family: 微軟正黑體;
        }
        .style7
        {
            width: 74px;
            height: 27px;
        }
        .style8
        {
            width: 88px;
            height: 27px;
        }
        .style9
        {
            height: 27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <InfoLight:WebDataSource ID="Master" runat="server" AutoApply="True" 
            WebDataSetID="WMaster" DataMember="AMSZA">
        </InfoLight:WebDataSource>
        <InfoLight:WebDataSource runat="server" ID="Group" SelectAlias="ERP" 
            
            
            SelectCommand="select '' as GROUPID,'All' as GROUPNAME
union
SELECT GROUPID,GROUPNAME FROM GROUPS WHERE GROUPID IN ('3300','3400','3500','3600')">
        </InfoLight:WebDataSource>
        <InfoLight:WebDataSource ID="WDSWeek" runat="server" SelectAlias="ERP" 
            SelectCommand="SELECT DRPID,DRPVALUE FROM SYSDRP WHERE DRPNAME='AMSMB002'">
        </InfoLight:WebDataSource>
        <InfoLight:WebDataSource ID="Groupuser" runat="server" SelectAlias="" 
            WebDataSetID="WGroup" DataMember="infoCommGroup" SelectCommand="">
        </InfoLight:WebDataSource>
        <table class="style1" style="background-color: #9999FF">
            <tr>
                <td class="style6">
                    排班年月</td>
                <td class="style5" colspan="2">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Label ID="Label9" runat="server" Text="ex.201301"></asp:Label>
                </td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label1" runat="server" style="font-family: 微軟正黑體" Text="單位部門"></asp:Label>
                </td>
                <td class="style3">
                    <InfoLight:WebDropDownList ID="WebDropDownList1" runat="server" 
                        AutoPostBack="True" DataMember="GROUPID" DataSourceID="Group" 
                        DataTextField="GROUPNAME" 
                        onselectedindexchanged="WebDropDownList1_SelectedIndexChanged" 
                        style="font-family: 微軟正黑體">
                    </InfoLight:WebDropDownList>
                </td>
                <td>
                    <InfoLight:WebListBoxList ID="WebListBoxList1" runat="server" 
                        DataSourceID="Groupuser" DataTextField="MV002" DataValueField="MV001" 
                        style="font-family: 微軟正黑體" Width="252px"></InfoLight:WebListBoxList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label2" runat="server" style="font-family: 微軟正黑體" Text="第一週"></asp:Label>
                </td>
                <td class="style3">
                    <InfoLight:WebDropDownList ID="WDL1" runat="server" DataMember="DRPID" 
                        DataSourceID="WDSWeek" DataTextField="DRPVALUE" CssClass="style4" 
                        DataValueField="DRPID">
                    </InfoLight:WebDropDownList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    <asp:Label ID="Label3" runat="server" style="font-family: 微軟正黑體" Text="第二週"></asp:Label>
                </td>
                <td class="style8">
                    <InfoLight:WebDropDownList ID="WDL2" runat="server" DataMember="DRPID" 
                        DataSourceID="WDSWeek" DataTextField="DRPVALUE" CssClass="style4" 
                        DataValueField="DRPID">
                    </InfoLight:WebDropDownList>
                </td>
                <td class="style9">
                    &nbsp;</td>
                <td class="style9">
                    </td>
                <td class="style9">
                    </td>
                <td class="style9">
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label4" runat="server" style="font-family: 微軟正黑體" Text="第三週"></asp:Label>
                </td>
                <td class="style3">
                    <InfoLight:WebDropDownList ID="WDL3" runat="server" DataMember="DRPID" 
                        DataSourceID="WDSWeek" DataTextField="DRPVALUE" CssClass="style4" 
                        DataValueField="DRPID">
                    </InfoLight:WebDropDownList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label5" runat="server" style="font-family: 微軟正黑體" Text="第四週"></asp:Label>
                </td>
                <td class="style3">
                    <InfoLight:WebDropDownList ID="WDL4" runat="server" DataMember="DRPID" 
                        DataSourceID="WDSWeek" DataTextField="DRPVALUE" style="font-family: 微軟正黑體" 
                        DataValueField="DRPID">
                    </InfoLight:WebDropDownList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label6" runat="server" style="font-family: 微軟正黑體" Text="第五週"></asp:Label>
                </td>
                <td class="style3">
                    <InfoLight:WebDropDownList ID="WDL5" runat="server" DataMember="DRPID" 
                        DataSourceID="WDSWeek" DataTextField="DRPVALUE" CssClass="style4" 
                        DataValueField="DRPID">
                    </InfoLight:WebDropDownList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label8" runat="server" style="font-family: 微軟正黑體" Text="第六週"></asp:Label>
                </td>
                <td class="style3">
                    <InfoLight:WebDropDownList ID="WDL6" runat="server" DataMember="DRPID" 
                        DataSourceID="WDSWeek" DataTextField="DRPVALUE" DataValueField="DRPID" 
                        style="font-family: 微軟正黑體">
                    </InfoLight:WebDropDownList>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" 
                        style="font-family: 微軟正黑體; height: 27px;" Text="確認" 
                        Width="44px" onclick="Button1_Click" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label7" runat="server" 
                        style="font-family: 微軟正黑體; color: #CC0000;"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    <Infolight:WebDefault runat="server" DefaultActive="True" DataSourceID="Master" DataMember="AMSZA" CarryOnActive="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wdAMSZA" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebDefault>
<Infolight:WebValidate runat="server" DataSourceID="Master" DataMember="AMSZA" ValidateActive="True" DuplicateCheck="False" DuplicateCheckMode="ByLocal" ValidateStyle="ShowLable" MultiLanguage="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wvAMSZA" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebValidate>
</form>
</body>
</html>
