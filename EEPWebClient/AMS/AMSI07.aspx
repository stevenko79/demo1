<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AMSI07.aspx.cs" Inherits="WSingle_WSingle" Theme="ControlSkin" StylesheetTheme="ControlSkin"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <InfoLight:WebDataSource ID="Master" runat="server" AutoApply="True" 
            WebDataSetID="WMaster" DataMember="Resaj" MasterDataSource="" 
            SelectAlias="">
        </InfoLight:WebDataSource>
        <InfoLight:WebStatusStrip ID="WebStatusStrip1" runat="server" BackColor="White"
            BorderColor="LightGray" BorderStyle="Groove" BorderWidth="2px" ContentBackColor=""
            ContentForeColor="White" Font-Bold="True" ForeColor="MediumBlue" ShowCompany="False"
            ShowDate="True" ShowEEPAlias="True" ShowNavigatorStatus="True" ShowSolution="False"
            ShowTitle="True" ShowUserID="True" ShowUserName="True" Width="100%" 
            StatusForeColor="MediumBlue" TitleBackColor="MediumBlue" TitleForeColor="White" 
            SkinID="StatusStripSkin1" />
        <InfoLight:WebNavigator ID="WebNavigator1" runat="server" BindingObject="wgvMaster"
            Width="100%" BackColor="White" BorderColor="Silver" BorderStyle="Groove" 
            BorderWidth="2px" Height="22px" StatusStrip="WebStatusStrip1" 
            SkinID="WebNavigatorManagerSkin1" QueryMode="ClientQuery">
           <navcontrols>
                <InfoLight:ControlItem ControlName="First" ControlText="首筆" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/first.gif" MouseOverImageUrl="../image/uipics/first2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/first3.gif" />
                <InfoLight:ControlItem ControlName="Previous" ControlText="上筆" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/previous.gif" MouseOverImageUrl="../image/uipics/previous2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/previous3.gif" />
                <InfoLight:ControlItem ControlName="Next" ControlText="下筆" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/next.gif" MouseOverImageUrl="../image/uipics/next2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/next3.gif" />
                <InfoLight:ControlItem ControlName="Last" ControlText="末筆" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/last.gif" MouseOverImageUrl="../image/uipics/last2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/last3.gif" />
                <InfoLight:ControlItem ControlName="Apply" ControlText="保存" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/apply.gif" MouseOverImageUrl="../image/uipics/apply2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/apply3.gif" />
                <InfoLight:ControlItem ControlName="Abort" ControlText="放棄" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/abort.gif" MouseOverImageUrl="../image/uipics/abort2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/abort3.gif" />
                <InfoLight:ControlItem ControlName="Query" ControlText="查詢" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/query.gif" MouseOverImageUrl="../image/uipics/query2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/query3.gif" />
            </navcontrols>
            <queryfields>
                <InfoLight:WebQueryField Caption="班別" Condition="=" DefaultValue="" 
                    FieldName="resaj001" Mode="ComboBox" RefVal="WebRefVal1" />
                <InfoLight:WebQueryField Caption="時間(起)" Condition="&gt;" DefaultValue="" 
                    FieldName="resaj002" Mode="Calendar" />
                <InfoLight:WebQueryField Caption="時間(迄)" Condition="&lt;" DefaultValue="" 
                    FieldName="resaj002" Mode="Calendar" />
            </queryfields>
            <NavStates>
                <InfoLight:WebNavigatorStateItem StateText="Initial" />
                <InfoLight:WebNavigatorStateItem StateText="Browsed" />
                <InfoLight:WebNavigatorStateItem StateText="Inserting" />
                <InfoLight:WebNavigatorStateItem StateText="Editing" />
                <InfoLight:WebNavigatorStateItem StateText="Applying" />
                <InfoLight:WebNavigatorStateItem StateText="Changing" />
                <InfoLight:WebNavigatorStateItem StateText="Querying" />
                <InfoLight:WebNavigatorStateItem StateText="Printing" />
            </NavStates>
        </InfoLight:WebNavigator>
    
    </div>
        <InfoLight:webgridview id="wgvMaster" runat="server" datasourceid="Master" 
        width="100%" AbortIconUrl="../Image/UIPics/Abort.gif" 
        AddIconUrl="../Image/UIPics/Add.gif" ApplyIconUrl="../Image/UIPics/Apply.gif" 
        CancelIconUrl="../Image/UIPics/Cancel.gif" 
        MouseOverAbortIconUrl="../Image/UIPics/Abort2.gif" 
        MouseOverAddIconUrl="../Image/UIPics/Add2.gif" 
        MouseOverApplyIconUrl="../Image/UIPics/Apply2.gif" 
        MouseOverCancelIconUrl="../Image/UIPics/Cancel2.gif" 
        MouseOverOKIconUrl="../Image/UIPics/OK2.gif" 
        MouseOverQueryIconUrl="../Image/UIPics/Query2.gif" 
        OKIconUrl="../Image/UIPics/OK.gif" QueryIconUrl="../Image/UIPics/Query.gif" 
        HeaderStyleWrap="False" SkinID="GridViewSkin1" 
        onrowcommand="wgvMaster_RowCommand" 
        onrowdatabound="wgvMaster_RowDataBound" PageSize="30">
            <navcontrols>
<InfoLight:ControlItem ControlVisible="False" Size="25" 
                    MouseOverImageUrl="../image/uipics/add2.gif" ControlText="add" 
                    ControlName="Add" ControlType="Image" ImageUrl="../image/uipics/add.gif"></InfoLight:ControlItem>
<InfoLight:ControlItem ControlVisible="True" Size="25" MouseOverImageUrl="../image/uipics/ok2.gif" ControlText="Insert" ControlName="OK" ControlType="Image" ImageUrl="../image/uipics/ok.gif"></InfoLight:ControlItem>
<InfoLight:ControlItem ControlVisible="True" Size="25" MouseOverImageUrl="../image/uipics/cancel2.gif" ControlText="cancel" ControlName="Cancel" ControlType="Image" ImageUrl="../image/uipics/cancel.gif"></InfoLight:ControlItem>
</navcontrols>
            <Columns>
<asp:TemplateField ShowHeader="False"><EditItemTemplate>
<asp:ImageButton id="ImageButton1" runat="server" Text="Update" CausesValidation="True" ImageUrl="~/Image/UIPics/OK.gif" CommandName="Update" __designer:wfdid="w3"></asp:ImageButton>&nbsp;<asp:ImageButton id="ImageButton2" runat="server" Text="Cancel" CausesValidation="False" ImageUrl="~/Image/UIPics/Cancel.gif" CommandName="Cancel" __designer:wfdid="w4"></asp:ImageButton>
</EditItemTemplate>
    <headerstyle wrap="False" />
<ItemTemplate>
<asp:ImageButton id="ImageButton3" runat="server" Text="Edit" CausesValidation="False" ImageUrl="~/Image/UIPics/Edit.gif" CommandName="Edit" __designer:wfdid="w1"></asp:ImageButton>&nbsp;<asp:ImageButton id="ImageButton4" runat="server" Text="Delete" CausesValidation="False" ImageUrl="~/Image/UIPics/Delete.gif" CommandName="Delete" __designer:wfdid="w2"></asp:ImageButton>
</ItemTemplate>
</asp:TemplateField>
                <asp:BoundField DataField="COMPANY" HeaderText="COMPANY" 
                    SortExpression="COMPANY" Visible="False" />
                <asp:BoundField DataField="CREATOR" HeaderText="CREATOR" 
                    SortExpression="CREATOR" Visible="False" />
                <asp:BoundField DataField="CREATE_DATE" HeaderText="CREATE_DATE" 
                    SortExpression="CREATE_DATE" Visible="False" />
                <asp:BoundField DataField="USR_GROUP" HeaderText="USR_GROUP" 
                    SortExpression="USR_GROUP" Visible="False" />
                <asp:BoundField DataField="MODIFIER" HeaderText="MODIFIER" 
                    SortExpression="MODIFIER" Visible="False" />
                <asp:BoundField DataField="MODI_DATE" HeaderText="MODI_DATE" 
                    SortExpression="MODI_DATE" Visible="False" />
                <asp:BoundField DataField="FLAG" HeaderText="FLAG" SortExpression="FLAG" 
                    Visible="False" />
                <asp:TemplateField HeaderText="班別" SortExpression="resaj001">
                    <EditItemTemplate>
                        <InfoLight:WebGridDropDown ID="WebGridDropDown1" runat="server" DataField="" 
                            DataSourceID="WebDataSource1" DataTextField="DRPVALUE" DataValueField="DRPID" 
                            KeyValues="" SelectedValue='<%# Bind("resaj001") %>'>
                        </InfoLight:WebGridDropDown>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("resaj001") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="上班日期" SortExpression="resaj002">
                    <EditItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("resaj002", "{0:d}") %>'></asp:Label>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <InfoLight:WebDateTimePicker ID="wdtResajresaj002F" runat="server" 
                            DateFormat="None" DateTimeType="DateTime" Localize="False" MaxYear="2050" 
                            MinYear="1950" ToolTip="resaj002" UseButtonImage="True" Width="100px"></InfoLight:WebDateTimePicker>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lResajresaj002" runat="server" Text='<%# Bind("resaj002", "{0:d}") %>' 
                            ToolTip="resaj002"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="上班時間" SortExpression="resaj003">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("resaj003") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <InfoLight:WebDateTimePicker ID="wdtResajresaj003F" runat="server" 
                            DateFormat="None" DateTimeType="DateTime" Localize="False" MaxYear="2050" 
                            MinYear="1950" ToolTip="resaj003" UseButtonImage="True" Width="100px"></InfoLight:WebDateTimePicker>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lResajresaj003" runat="server" Text='<%# Bind("resaj003") %>' 
                            ToolTip="resaj003"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="下班時間" SortExpression="resaj004">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("resaj004") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <InfoLight:WebDateTimePicker ID="wdtResajresaj004F" runat="server" 
                            DateFormat="None" DateTimeType="DateTime" Localize="False" MaxYear="2050" 
                            MinYear="1950" ToolTip="resaj004" UseButtonImage="True" Width="100px"></InfoLight:WebDateTimePicker>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lResajresaj004" runat="server" Text='<%# Bind("resaj004") %>' 
                            ToolTip="resaj004"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="上班時數" SortExpression="resaj005">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("resaj005") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("resaj005") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="午休起始時間" SortExpression="resaj006">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("resaj006") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <InfoLight:WebDateTimePicker ID="wdtResajresaj006F" runat="server" 
                            DateFormat="None" DateTimeType="DateTime" Localize="False" MaxYear="2050" 
                            MinYear="1950" ToolTip="resaj006" UseButtonImage="True" Width="100px"></InfoLight:WebDateTimePicker>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lResajresaj006" runat="server" Text='<%# Bind("resaj006") %>' 
                            ToolTip="resaj006"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="午休截止時間" SortExpression="resaj007">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("resaj007") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <InfoLight:WebDateTimePicker ID="wdtResajresaj007F" runat="server" 
                            DateFormat="None" DateTimeType="DateTime" Localize="False" MaxYear="2050" 
                            MinYear="1950" ToolTip="resaj007" UseButtonImage="True" Width="100px"></InfoLight:WebDateTimePicker>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lResajresaj007" runat="server" Text='<%# Bind("resaj007") %>' 
                            ToolTip="resaj007"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
</Columns>

<AlternatingRowStyle BorderColor="White"></AlternatingRowStyle>

<PagerSettings Mode="NumericFirstLast"></PagerSettings>
</InfoLight:webgridview>
    <Infolight:WebDefault runat="server" DefaultActive="True" DataSourceID="Master" DataMember="Resaj" CarryOnActive="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wdResaj" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebDefault>
    <InfoLight:WebRefVal ID="WebRefVal1" runat="server" 
        DataSourceID="WebDataSource1" DataTextField="DRPVALUE" 
        DataValueField="DRPID" Visible="False">
    </InfoLight:WebRefVal>
<Infolight:WebValidate runat="server" DataSourceID="Master" DataMember="Resaj" ValidateActive="True" DuplicateCheck="False" DuplicateCheckMode="ByLocal" ValidateStyle="ShowLable" MultiLanguage="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wvResaj" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebValidate>
    <InfoLight:WebDataSource ID="WebDataSource1" runat="server" SelectAlias="ERP" 
        SelectCommand="SELECT * FROM SYSDRP WHERE DRPNAME='AMSI06'">
    </InfoLight:WebDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Data Source=192.168.1.200;Initial Catalog=EFNET;User ID=ERPII;Password=585858yc" 
        DeleteCommand="DELETE FROM [resaj] WHERE [resaj001] = @resaj001 AND [resaj002] = @resaj002" 
        InsertCommand="INSERT INTO [resaj] ([COMPANY], [CREATOR], [CREATE_DATE], [USR_GROUP], [MODIFIER], [MODI_DATE], [FLAG], [resaj001], [resaj002], [resaj003], [resaj004], [resaj005], [resaj006], [resaj007]) VALUES (@COMPANY, @CREATOR, @CREATE_DATE, @USR_GROUP, @MODIFIER, @MODI_DATE, @FLAG, @resaj001, @resaj002, @resaj003, @resaj004, @resaj005, @resaj006, @resaj007)" 
        oninserted="SqlDataSource1_Inserted" SelectCommand="SELECT * FROM [resaj]" 
        
        UpdateCommand="UPDATE [resaj] SET [COMPANY] = @COMPANY, [CREATOR] = @CREATOR, [CREATE_DATE] = @CREATE_DATE, [USR_GROUP] = @USR_GROUP, [MODIFIER] = @MODIFIER, [MODI_DATE] = @MODI_DATE, [FLAG] = @FLAG, [resaj003] = @resaj003, [resaj004] = @resaj004, [resaj005] = @resaj005, [resaj006] = @resaj006, [resaj007] = @resaj007 WHERE [resaj001] = @resaj001 AND [resaj002] = @resaj002" 
        ProviderName="System.Data.SqlClient">
        <DeleteParameters>
            <asp:Parameter Name="resaj001" Type="String" />
            <asp:Parameter Name="resaj002" Type="DateTime" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="COMPANY" Type="String" />
            <asp:Parameter Name="CREATOR" Type="String" />
            <asp:Parameter Name="CREATE_DATE" Type="String" />
            <asp:Parameter Name="USR_GROUP" Type="String" />
            <asp:Parameter Name="MODIFIER" Type="String" />
            <asp:Parameter Name="MODI_DATE" Type="String" />
            <asp:Parameter Name="FLAG" Type="Decimal" />
            <asp:Parameter Name="resaj001" Type="String" />
            <asp:Parameter Name="resaj002" Type="DateTime" />
            <asp:Parameter Name="resaj003" Type="DateTime" />
            <asp:Parameter Name="resaj004" Type="DateTime" />
            <asp:Parameter Name="resaj005" Type="Double" />
            <asp:Parameter Name="resaj006" Type="DateTime" />
            <asp:Parameter Name="resaj007" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="COMPANY" Type="String" />
            <asp:Parameter Name="CREATOR" Type="String" />
            <asp:Parameter Name="CREATE_DATE" Type="String" />
            <asp:Parameter Name="USR_GROUP" Type="String" />
            <asp:Parameter Name="MODIFIER" Type="String" />
            <asp:Parameter Name="MODI_DATE" Type="String" />
            <asp:Parameter Name="FLAG" Type="Decimal" />
            <asp:Parameter Name="resaj003" Type="DateTime" />
            <asp:Parameter Name="resaj004" Type="DateTime" />
            <asp:Parameter Name="resaj005" Type="Double" />
            <asp:Parameter Name="resaj006" Type="DateTime" />
            <asp:Parameter Name="resaj007" Type="DateTime" />
            <asp:Parameter Name="resaj001" Type="String" />
            <asp:Parameter Name="resaj002" Type="DateTime" />
        </UpdateParameters>
    </asp:SqlDataSource>
</form>
</body>
</html>
