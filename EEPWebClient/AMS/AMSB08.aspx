<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AMSB08.aspx.cs" Inherits="WSingle_WSingle" Theme="ControlSkin" StylesheetTheme="ControlSkin"%>

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
            width: 117px;
        }
        .style3
        {
            width: 228px;
        }
        .style4
        {
            width: 118px;
        }
        .style5
        {
            font-family: 微軟正黑體;
            text-align: right;
            font-size: medium;
        }
        .style6
        {
            width: 117px;
            height: 95px;
        }
        .style7
        {
            width: 228px;
            height: 95px;
        }
        .style8
        {
            width: 118px;
            height: 95px;
        }
        .style9
        {
            height: 95px;
        }
        .style10
        {
            font-size: medium;
        }
        .style11
        {
            font-family: 微軟正黑體;
            text-align: right;
            font-size: medium;
        }
        .style12
        {
            width: 117px;
            height: 30px;
        }
        .style13
        {
            width: 228px;
            height: 30px;
        }
        .style14
        {
            width: 118px;
            height: 30px;
        }
        .style15
        {
            height: 30px;
        }
        .style18
        {
            font-family: 微軟正黑體;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <InfoLight:WebDataSource ID="Master" runat="server" AutoApply="True" 
            WebDataSetID="WMaster" DataMember="RESAJ">
        </InfoLight:WebDataSource>
    
    </div>
    <Infolight:WebDefault runat="server" DefaultActive="True" DataSourceID="Master" DataMember="RESAJ" CarryOnActive="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wdRESAJ" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebDefault>
    <InfoLight:WebDataSource ID="WebDataSource1" runat="server" SelectAlias="ERP" 
        SelectCommand="SELECT DRPID,DRPVALUE FROM SYSDRP WHERE DRPNAME='AMSI06'">
    </InfoLight:WebDataSource>
    <InfoLight:WebDataSource ID="WDyear" runat="server" SelectAlias="ERP" SelectCommand="SELECT yyyy FROM wfdate_dim
GROUP BY yyyy
ORDER BY yyyy">
    </InfoLight:WebDataSource>
    <InfoLight:WebDataSource ID="WebDataSource2" runat="server" DataMember="" 
        SelectAlias="ERP" 
        SelectCommand="SELECT SUBSTRING(CONVERT(char,date_id,120),1,10) AS date_id,date,yyyy FROM wfdate_dim" 
        WebDataSetID="">
    </InfoLight:WebDataSource>
    <table class="style1">
        <tr>
            <td class="style12">
                <asp:Label ID="Label1" runat="server" 
                    style="font-family: 微軟正黑體; text-align: center" Text="班別："></asp:Label>
            </td>
            <td class="style13">
                <InfoLight:WebDropDownList ID="WDD1" runat="server" 
                    AutoInsertEmptyData="False" DataSourceID="WebDataSource1" 
                    DataTextField="DRPVALUE" DataValueField="DRPID" DriverObject="" Filter="" 
                    FilterObject="" style="font-family: 微軟正黑體; font-size: medium">
                </InfoLight:WebDropDownList>
            </td>
            <td class="style14">
                <asp:Label ID="Label2" runat="server" CssClass="style10" 
                    style="font-family: 微軟正黑體" Text="請輸入西元年："></asp:Label>
            </td>
            <td class="style15">
                <InfoLight:WebDropDownList ID="WDD2" runat="server" 
                    AutoInsertEmptyData="False" AutoPostBack="True" DataMember="yyyy" 
                    DataSourceID="WDyear" DataTextField="yyyy" DriverObject="" Filter="" 
                    FilterObject="" 
                    onselectedindexchanged="WebDropDownList2_SelectedIndexChanged" 
                    style="font-family: 微軟正黑體; font-size: medium">
                </InfoLight:WebDropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" CssClass="style5" Text="上班時間："></asp:Label>
            </td>
            <td class="style3">
                <InfoLight:WebDropDownList ID="WDD3" runat="server" 
                    AutoInsertEmptyData="False" DriverObject="" Filter="" FilterObject="" 
                    style="font-family: 微軟正黑體; font-size: medium">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                </InfoLight:WebDropDownList>
                <asp:Label ID="Label12" runat="server" CssClass="style18" Text="時"></asp:Label>
                <InfoLight:WebDropDownList ID="WDD4" runat="server" 
                    style="font-family: 微軟正黑體; font-size: medium">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>35</asp:ListItem>
                    <asp:ListItem>40</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                    <asp:ListItem>55</asp:ListItem>
                    <asp:ListItem>60</asp:ListItem>
                </InfoLight:WebDropDownList>
                <asp:Label ID="Label17" runat="server" CssClass="style18" Text="分"></asp:Label>
                <asp:CheckBox ID="cb1" runat="server" style="font-family: 微軟正黑體" />
                <asp:Label ID="Label10" runat="server" Text="隔天" style="font-family: 微軟正黑體"></asp:Label>
            </td>
            <td class="style4">
                <asp:Label ID="Label4" runat="server" CssClass="style11" Text="下班時間："></asp:Label>
            </td>
            <td>
                <InfoLight:WebDropDownList ID="WDD5" runat="server" 
                    AutoInsertEmptyData="False" DriverObject="" Filter="" FilterObject="" 
                    style="font-family: 微軟正黑體; font-size: medium">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                </InfoLight:WebDropDownList>
                <asp:Label ID="Label13" runat="server" CssClass="style18" Text="時"></asp:Label>
                <InfoLight:WebDropDownList ID="WDD6" runat="server" 
                    AutoInsertEmptyData="False" DriverObject="" Filter="" FilterObject="" 
                    style="font-family: 微軟正黑體; font-size: medium">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>35</asp:ListItem>
                    <asp:ListItem>40</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                    <asp:ListItem>55</asp:ListItem>
                    <asp:ListItem>60</asp:ListItem>
                </InfoLight:WebDropDownList>
                <asp:Label ID="Label16" runat="server" CssClass="style18" Text="分"></asp:Label>
                <asp:CheckBox ID="cb2" runat="server" style="font-family: 微軟正黑體" />
                <asp:Label ID="Label11" runat="server" style="font-family: 微軟正黑體" Text="隔天"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" 
                    style="font-family: 微軟正黑體; text-align: center; font-size: medium" 
                    Text="休息起始時間："></asp:Label>
            </td>
            <td class="style3">
                <InfoLight:WebDropDownList ID="WDD7" runat="server" 
                    AutoInsertEmptyData="False" DriverObject="" Filter="" FilterObject="" 
                    style="font-family: 微軟正黑體; font-size: medium">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                </InfoLight:WebDropDownList>
                <asp:Label ID="Label14" runat="server" CssClass="style18" Text="時"></asp:Label>
                <InfoLight:WebDropDownList ID="WDD8" runat="server" 
                    style="font-family: 微軟正黑體; font-size: medium">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>35</asp:ListItem>
                    <asp:ListItem>40</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                    <asp:ListItem>55</asp:ListItem>
                    <asp:ListItem>60</asp:ListItem>
                </InfoLight:WebDropDownList>
                <asp:Label ID="Label18" runat="server" CssClass="style18" Text="分"></asp:Label>
            </td>
            <td class="style4">
                <asp:Label ID="Label7" runat="server" CssClass="style10" 
                    style="font-family: 微軟正黑體; text-align: center" Text="休息結束時間："></asp:Label>
            </td>
            <td>
                <InfoLight:WebDropDownList ID="WDD9" runat="server" 
                    style="font-family: 微軟正黑體; font-size: medium">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>17</asp:ListItem>
                    <asp:ListItem>18</asp:ListItem>
                    <asp:ListItem>19</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>21</asp:ListItem>
                    <asp:ListItem>22</asp:ListItem>
                    <asp:ListItem>23</asp:ListItem>
                </InfoLight:WebDropDownList>
                <asp:Label ID="Label15" runat="server" CssClass="style18" Text="時"></asp:Label>
                <InfoLight:WebDropDownList ID="WDD10" runat="server" 
                    style="font-family: 微軟正黑體; font-size: medium">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>35</asp:ListItem>
                    <asp:ListItem>40</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                    <asp:ListItem>55</asp:ListItem>
                    <asp:ListItem>60</asp:ListItem>
                </InfoLight:WebDropDownList>
                <asp:Label ID="Label19" runat="server" CssClass="style18" Text="分"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="Label6" runat="server" 
                    style="font-family: 微軟正黑體; font-size: medium" Text="國定假日"></asp:Label>
                ：</td>
            <td class="style7">
                <InfoLight:WebListBoxList ID="WebListBoxList1" runat="server" 
                    DataSourceID="WebDataSource2" DataTextField="date_id" DataValueField="date" 
                    Height="140px" TextMode="MultiLine" Width="228px" 
                    style="font-family: 微軟正黑體; font-size: medium"></InfoLight:WebListBoxList>
            </td>
            <td class="style8">
                </td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    style="font-family: 微軟正黑體; font-size: medium" Text="產生行事曆" />
            </td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label20" runat="server" Font-Bold="True" 
                    style="font-family: 微軟正黑體; font-size: medium" Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
<Infolight:WebValidate runat="server" DataSourceID="Master" DataMember="RESAJ" ValidateActive="True" DuplicateCheck="False" DuplicateCheckMode="ByLocal" ValidateStyle="ShowLable" MultiLanguage="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wvRESAJ" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebValidate>
</form>
</body>
</html>
