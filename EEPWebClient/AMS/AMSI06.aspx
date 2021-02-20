<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AMSI06.aspx.cs" Inherits="Template_WMasterDetail1" Theme="ControlSkin" StylesheetTheme="ControlSkin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>AMSI06</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <InfoLight:webdatasource id="Master" runat="server" autoapply="true" 
            WebDataSetID="WMaster" DataMember="AMSMH"></InfoLight:webdatasource>
    
    </div>
        <InfoLight:webdatasource id="Detail" runat="server" 
        MasterDataSource="Master" WebDataSetID="WMaster" DataMember="AMSMG"></InfoLight:webdatasource>
        <InfoLight:WebStatusStrip ID="WebStatusStrip1" runat="server" BackColor="White"
            BorderColor="LightGray" BorderStyle="Groove" BorderWidth="2px" ContentBackColor=""
            ContentForeColor="White" Font-Bold="True" ForeColor="MediumBlue" ShowCompany="False"
            ShowDate="True" ShowEEPAlias="True" ShowNavigatorStatus="True" ShowSolution="False"
            ShowTitle="True" ShowUserID="True" ShowUserName="True" Width="100%" 
        StatusBackColor="White" StatusForeColor="MediumBlue" 
        TitleBackColor="MediumBlue" TitleForeColor="White" SkinID="StatusStripSkin1" />
        <InfoLight:WebNavigator ID="WebNavigator1" runat="server" BindingObject="wfvMaster"
            OnCommand="WebNavigator1_Command" ShowDataStyle="FormViewStyle" 
        Width="100%" BackColor="White" BorderColor="#E0E0E0" BorderStyle="Groove" 
        BorderWidth="2px" StatusStrip="WebStatusStrip1" 
        SkinID="WebNavigatorManagerSkin1">
            <NavControls>
                <InfoLight:ControlItem ControlName="First" ControlText="首筆" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/first.gif" MouseOverImageUrl="../image/uipics/first2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/first3.gif" />
                <InfoLight:ControlItem ControlName="Previous" ControlText="上筆" ControlType="Image"
                    ControlVisible="True" ImageUrl="../image/uipics/previous.gif" MouseOverImageUrl="../image/uipics/previous2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/previous3.gif" />
                <InfoLight:ControlItem ControlName="Next" ControlText="下筆" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/next.gif" MouseOverImageUrl="../image/uipics/next2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/next3.gif" />
                <InfoLight:ControlItem ControlName="Last" ControlText="末筆" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/last.gif" MouseOverImageUrl="../image/uipics/last2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/next3.gif" />
                <InfoLight:ControlItem ControlName="Update" ControlText="更改" ControlType="Image"
                    ControlVisible="True" ImageUrl="../image/uipics/edit.gif" MouseOverImageUrl="../image/uipics/edit2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/edit3.gif" />
                <InfoLight:ControlItem ControlName="OK" ControlText="確認" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/ok.gif" MouseOverImageUrl="../image/uipics/ok2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/ok3.gif" />
                <InfoLight:ControlItem ControlName="Cancel" ControlText="取消" ControlType="Image"
                    ControlVisible="True" ImageUrl="../image/uipics/cancel.gif" MouseOverImageUrl="../image/uipics/cancel2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/cancel3.gif" />
                <InfoLight:ControlItem ControlName="Apply" ControlText="存檔" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/apply.gif" MouseOverImageUrl="../image/uipics/apply2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/apply3.gif" />
                <InfoLight:ControlItem ControlName="Abort" ControlText="放棄" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/abort.gif" MouseOverImageUrl="../image/uipics/abort2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/abort3.gif" />
                <InfoLight:ControlItem ControlName="Query" ControlText="查詢" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/query.gif" MouseOverImageUrl="../image/uipics/query2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/query3.gif" />
                <InfoLight:ControlItem ControlName="Print" ControlText="打印" ControlType="Image" ControlVisible="True"
                    ImageUrl="../image/uipics/print.gif" MouseOverImageUrl="../image/uipics/print2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/print3.gif" />
                <InfoLight:ControlItem ControlName="Export" ControlType="Image" ControlVisible="True"
                    DisenableImageUrl="../Image/UIPics/Export3.gif" ImageUrl="../Image/UIPics/Export.gif"
                    MouseOverImageUrl="../Image/UIPics/Export2.gif" Size="25" />
            </NavControls>
            <queryfields>
                <InfoLight:WebQueryField Caption="月份" Condition="=" DefaultValue="" 
                    FieldName="MH001" Mode="TextBox" />
                <InfoLight:WebQueryField Caption="工號" Condition="=" DefaultValue="" 
                    FieldName="MH002" Mode="TextBox" />
                <InfoLight:WebQueryField Caption="姓名" Condition="=" DefaultValue="" 
                    FieldName="MH003" Mode="TextBox" />
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
        <InfoLight:WebFormView ID="wfvMaster" runat="server" 
        OnPageIndexChanged="wfvMaster_PageIndexChanged" AllowPaging="True" 
        DataSourceID="Master" LayOutColNum="2" 
        OnAfterInsertLocate="wfvMaster_AfterInsertLocate" 
        OnCanceled="wfvMaster_Canceled" Height="87px" Width="100%" 
        SkinID="FormViewSkin1">
            <EditItemTemplate>
                <table class="container_table">
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMH001" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="月份" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="MH001TextBoxE" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="6" ReadOnly="True" Rows="0" 
                                Text='<%# Bind("MH001") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True"></asp:TextBox>
                        </td>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMH002" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="工號" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="MH002TextBoxE" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="4" ReadOnly="True" Rows="0" 
                                Text='<%# Bind("MH002") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMH003" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="姓名" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="MH003TextBoxE" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="20" ReadOnly="True" Rows="0" 
                                Text='<%# Bind("MH003") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True"></asp:TextBox>
                        </td>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMH004" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="備註" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="MH004TextBoxE" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="600" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("MH004") %>' TextMode="MultiLine" ViewStateMode="Inherit" 
                                Wrap="True" Height="100px" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table class="container_table">
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMH001" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="月份" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="MH001TextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="6" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("MH001") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True">
                            </asp:TextBox>
                        </td>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMH002" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="工號" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="MH002TextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="4" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("MH002") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMH003" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="姓名" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="MH003TextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="20" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("MH003") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True">
                            </asp:TextBox>
                        </td>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMH004" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="備註" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="MH004TextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="600" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("MH004") %>' TextMode="MultiLine" ViewStateMode="Inherit" 
                                Wrap="True" Height="100px" Width="300px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <ItemTemplate>
                <table class="container_table">
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMH001Label" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="月份" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:Label ID="MH001Label" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text='<%# Bind("MH001") %>' ViewStateMode="Inherit">
                            </asp:Label>
                        </td>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMH002Label" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="工號" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:Label ID="MH002Label" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text='<%# Bind("MH002") %>' ViewStateMode="Inherit">
                            </asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMH003Label" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="姓名" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:Label ID="MH003Label" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text='<%# Bind("MH003") %>' ViewStateMode="Inherit">
                            </asp:Label>
                        </td>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMH004Label" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="備註" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="MH004TextBoxE" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Height="100px" MaxLength="600" ReadOnly="True" Rows="0" 
                                Text='<%# Bind("MH004") %>' TextMode="MultiLine" ViewStateMode="Inherit" 
                                Width="300px" Wrap="True"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
            <Fields>
                <InfoLight:FormViewField ControlID="MH001TextBoxI" FieldName="MH001" />
                <InfoLight:FormViewField ControlID="MH002TextBoxI" FieldName="MH002" />
                <InfoLight:FormViewField ControlID="MH003TextBoxI" FieldName="MH003" />
                <InfoLight:FormViewField ControlID="MH004TextBoxI" FieldName="MH004" />
            </Fields>
            <InsertRowStyle BackColor="LightCyan" ForeColor="Blue" />
        </InfoLight:WebFormView>
        <InfoLight:webgridview id="wgvDetail" runat="server" datasourceid="Detail"
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
        HeaderStyleWrap="False" SkinID="GridViewSkin1" PageSize="31">
            <navcontrols>
                <InfoLight:ControlItem ControlName="Query" ControlText="query" 
                    ControlType="Image" ControlVisible="False" 
                    DisenableImageUrl="../image/uipics/query3.gif" 
                    ImageUrl="../image/uipics/query.gif" 
                    MouseOverImageUrl="../image/uipics/query2.gif" Size="25" />
                <InfoLight:ControlItem ControlName="Apply" ControlText="apply" 
                    ControlType="Image" ControlVisible="True" 
                    DisenableImageUrl="../image/uipics/apply3.gif" 
                    ImageUrl="../image/uipics/apply.gif" 
                    MouseOverImageUrl="../image/uipics/apply2.gif" Size="25" />
                <InfoLight:ControlItem ControlName="Abort" ControlText="abort" 
                    ControlType="Image" ControlVisible="True" 
                    DisenableImageUrl="../image/uipics/abort3.gif" 
                    ImageUrl="../image/uipics/abort.gif" 
                    MouseOverImageUrl="../image/uipics/abort2.gif" Size="25" />
                <InfoLight:ControlItem ControlName="OK" ControlText="Insert" 
                    ControlType="Image" ControlVisible="True" 
                    DisenableImageUrl="../image/uipics/ok3.gif" ImageUrl="../image/uipics/ok.gif" 
                    MouseOverImageUrl="../image/uipics/ok2.gif" Size="25" />
                <InfoLight:ControlItem ControlName="Cancel" ControlText="cancel" 
                    ControlType="Image" ControlVisible="True" 
                    DisenableImageUrl="../image/uipics/cancel3.gif" 
                    ImageUrl="../image/uipics/cancel.gif" 
                    MouseOverImageUrl="../image/uipics/cancel2.gif" Size="25" />
            </navcontrols>
            <addnewrowcontrols>
                <InfoLight:AddNewRowControlItem ControlID="wdtAMSMGMG008F" 
                    ControlType="DateTimePicker" FieldName="MG008" />
                <InfoLight:AddNewRowControlItem ControlID="wdtAMSMGMG009F" 
                    ControlType="DateTimePicker" FieldName="MG009" />
                <InfoLight:AddNewRowControlItem ControlID="wdtAMSMGMG008F" 
                    ControlType="DateTimePicker" FieldName="MG008" />
                <InfoLight:AddNewRowControlItem ControlID="wdtAMSMGMG009F" 
                    ControlType="DateTimePicker" FieldName="MG009" />
                <InfoLight:AddNewRowControlItem ControlID="wdtAMSMGMG008F" 
                    ControlType="DateTimePicker" FieldName="MG008" />
                <InfoLight:AddNewRowControlItem ControlID="wdtAMSMGMG009F" 
                    ControlType="DateTimePicker" FieldName="MG009" />
            </addnewrowcontrols>
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <edititemtemplate>
                        <asp:ImageButton ID="ImageButton6" runat="server" CausesValidation="True" 
                            CommandName="Update" ImageUrl="~/Image/UIPics/OK.gif" Text="Update" />
                        &nbsp;<asp:ImageButton ID="ImageButton7" runat="server" CausesValidation="False" 
                            CommandName="Cancel" ImageUrl="~/Image/UIPics/Cancel.gif" Text="Cancel" />
                    </edititemtemplate>
                    <headerstyle wrap="False" />
                    <itemtemplate>
                        <asp:ImageButton ID="ImageButton8" runat="server" CausesValidation="False" 
                            CommandName="Edit" ImageUrl="~/Image/UIPics/Edit.gif" Text="Edit" />
                        &nbsp;
                    </itemtemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="MG001" HeaderText="刷卡日期" SortExpression="MG001" 
                    ReadOnly="True" />
                <asp:BoundField DataField="MG002" HeaderText="員工代號" SortExpression="MG002" 
                    ReadOnly="True" />
                <asp:BoundField DataField="MG003" HeaderText="員工姓名" SortExpression="MG003" 
                    Visible="False" />
                <asp:BoundField DataField="MG004" HeaderText="上班時間" SortExpression="MG004" />
                <asp:BoundField DataField="MG005" HeaderText="下班時間" SortExpression="MG005" />
                <asp:BoundField DataField="MG006" HeaderText="假日別" SortExpression="MG006" 
                    Visible="False" />
                <asp:BoundField DataField="MG007" HeaderText="備註" SortExpression="MG007" />
                <asp:TemplateField HeaderText="MG008" SortExpression="MG008" Visible="False">
                    <EditItemTemplate>
                        <InfoLight:WebDateTimePicker ID="wdtAMSMGMG008E" runat="server" 
                            DateFormat="None" DateTimeType="DateTime" Localize="False" MaxYear="2050" 
                            MinYear="1950" Text='<%# Bind("MG008") %>' ToolTip="MG008" 
                            UseButtonImage="True" Width="100px"></InfoLight:WebDateTimePicker>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <InfoLight:WebDateTimePicker ID="wdtAMSMGMG008F" runat="server" 
                            DateFormat="None" DateTimeType="DateTime" Localize="False" MaxYear="2050" 
                            MinYear="1950" ToolTip="MG008" UseButtonImage="True" Width="100px"></InfoLight:WebDateTimePicker>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lAMSMGMG008" runat="server" Text='<%# Bind("MG008") %>' 
                            ToolTip="MG008"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="MG009" SortExpression="MG009" Visible="False">
                    <EditItemTemplate>
                        <InfoLight:WebDateTimePicker ID="wdtAMSMGMG009E" runat="server" 
                            DateFormat="None" DateTimeType="DateTime" Localize="False" MaxYear="2050" 
                            MinYear="1950" Text='<%# Bind("MG009") %>' ToolTip="MG009" 
                            UseButtonImage="True" Width="100px"></InfoLight:WebDateTimePicker>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <InfoLight:WebDateTimePicker ID="wdtAMSMGMG009F" runat="server" 
                            DateFormat="None" DateTimeType="DateTime" Localize="False" MaxYear="2050" 
                            MinYear="1950" ToolTip="MG009" UseButtonImage="True" Width="100px"></InfoLight:WebDateTimePicker>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lAMSMGMG009" runat="server" Text='<%# Bind("MG009") %>' 
                            ToolTip="MG009"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="MG010" HeaderText="MG010" SortExpression="MG010" 
                    Visible="False" />
                <asp:BoundField DataField="location" HeaderText="location" 
                    SortExpression="location" Visible="False" />
                <asp:BoundField DataField="sWeekend" HeaderText="sWeekend" 
                    SortExpression="sWeekend" Visible="False" />
                <asp:BoundField DataField="MEMO" HeaderText="MEMO" SortExpression="MEMO" 
                    Visible="False" />
                <asp:BoundField DataField="bLate" HeaderText="bLate" SortExpression="bLate" 
                    Visible="False" />
                <asp:BoundField DataField="bEarly" HeaderText="bEarly" 
                    SortExpression="bEarly" Visible="False" />
                <asp:BoundField DataField="MG004_1" HeaderText="MG004_1" 
                    SortExpression="MG004_1" Visible="False" />
                <asp:BoundField DataField="MG005_1" HeaderText="MG005_1" 
                    SortExpression="MG005_1" Visible="False" />
            </Columns>

<PagerSettings Mode="NumericFirstLast"></PagerSettings>
</InfoLight:webgridview>
    <Infolight:WebDefault runat="server" DefaultActive="True" DataSourceID="Master" DataMember="AMSMH" CarryOnActive="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wdAMSMH" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebDefault>
<Infolight:WebValidate runat="server" DataSourceID="Master" DataMember="AMSMH" ValidateActive="True" DuplicateCheck="False" DuplicateCheckMode="ByLocal" ValidateStyle="ShowLable" MultiLanguage="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wvAMSMH" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebValidate>
<Infolight:WebDefault runat="server" DefaultActive="True" DataSourceID="Detail" DataMember="AMSMG" CarryOnActive="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wdAMSMG" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebDefault>
<Infolight:WebValidate runat="server" DataSourceID="Detail" DataMember="AMSMG" ValidateActive="True" DuplicateCheck="False" DuplicateCheckMode="ByLocal" ValidateStyle="ShowLable" MultiLanguage="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wvAMSMG" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebValidate>
</form>
</body>
</html>
