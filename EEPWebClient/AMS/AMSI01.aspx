<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AMSI01.aspx.cs" Inherits="Template_WMasterDetail1" Theme="ControlSkin" StylesheetTheme="ControlSkin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>AMSI01</title>
    <link href="../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <InfoLight:webdatasource id="Master" runat="server" autoapply="true" 
            WebDataSetID="WMaster" DataMember="AMSZA"></InfoLight:webdatasource>
    
    </div>
        <InfoLight:WebDataSource ID="Detail" runat="server" DataMember="AMSZB" 
        WebDataSetID="WMaster" MasterDataSource="Master">
    </InfoLight:WebDataSource>
        <InfoLight:WebDataSource ID="WDSWork" runat="server" SelectAlias="ERP" 
        SelectCommand="SELECT DRPID,DRPVALUE FROM SYSDRP WHERE DRPNAME='AMSMB002'">
    </InfoLight:WebDataSource>
        <InfoLight:WebDataSource ID="WDSZB004" runat="server" SelectAlias="ERP" SelectCommand="select top 10 * from
(select DRPVALUE,resaj003,resaj004,resaj002,resaj001,CONVERT(nvarchar(15),CAST(resaj002 AS datetime) ,112 ) as sDate,substring(CONVERT(varchar,resaj003,120),1,10) as resaj003_1,substring(CONVERT(varchar,resaj003, 120),12,5)  as resaj003_2
from EFNET..resaj
LEFT JOIN [SYSDRP] ON resaj001=[SYSDRP].DRPID) Data
where  resaj001 not in ('A','B')
">
    </InfoLight:WebDataSource>
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
        SkinID="WebNavigatorManagerSkin1" QueryMode="AnyQuery" 
        style="margin-bottom: 0px">
            <NavControls>
                <InfoLight:ControlItem ControlName="First" ControlText="首筆" ControlType="Image" ControlVisible="False"
                    ImageUrl="../image/uipics/first.gif" MouseOverImageUrl="../image/uipics/first2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/first3.gif" />
                <InfoLight:ControlItem ControlName="Previous" ControlText="上筆" ControlType="Image"
                    ControlVisible="False" ImageUrl="../image/uipics/previous.gif" MouseOverImageUrl="../image/uipics/previous2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/previous3.gif" />
                <InfoLight:ControlItem ControlName="Next" ControlText="下筆" ControlType="Image" ControlVisible="False"
                    ImageUrl="../image/uipics/next.gif" MouseOverImageUrl="../image/uipics/next2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/next3.gif" />
                <InfoLight:ControlItem ControlName="Last" ControlText="末筆" ControlType="Image" ControlVisible="False"
                    ImageUrl="../image/uipics/last.gif" MouseOverImageUrl="../image/uipics/last2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/next3.gif" />
                <InfoLight:ControlItem ControlName="Add" ControlText="新增" ControlType="Image" ControlVisible="False"
                    ImageUrl="../image/uipics/add.gif" MouseOverImageUrl="../image/uipics/add2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/add3.gif" />
                <InfoLight:ControlItem ControlName="Update" ControlText="更改" ControlType="Image"
                    ControlVisible="False" ImageUrl="../image/uipics/edit.gif" MouseOverImageUrl="../image/uipics/edit2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/edit3.gif" />
                <InfoLight:ControlItem ControlName="Delete" ControlText="刪除" ControlType="Image"
                    ControlVisible="False" ImageUrl="../image/uipics/delete.gif" MouseOverImageUrl="../image/uipics/delete2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/delete3.gif" />
                <InfoLight:ControlItem ControlName="OK" ControlText="確認" ControlType="Image" ControlVisible="False"
                    ImageUrl="../image/uipics/ok.gif" MouseOverImageUrl="../image/uipics/ok2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/ok3.gif" />
                <InfoLight:ControlItem ControlName="Cancel" ControlText="取消" ControlType="Image"
                    ControlVisible="False" ImageUrl="../image/uipics/cancel.gif" MouseOverImageUrl="../image/uipics/cancel2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/cancel3.gif" />
                <InfoLight:ControlItem ControlName="Apply" ControlText="存檔" ControlType="Image" ControlVisible="False"
                    ImageUrl="../image/uipics/apply.gif" MouseOverImageUrl="../image/uipics/apply2.gif"
                    Size="25" DisenableImageUrl="../image/uipics/apply3.gif" />
                <InfoLight:ControlItem ControlName="Abort" ControlText="放棄" ControlType="Image" ControlVisible="False"
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
                <InfoLight:WebQueryField Caption="員工代號" Condition="=" DefaultValue="" 
                    FieldName="ZA001" Mode="TextBox" />
                <InfoLight:WebQueryField Caption="排班年月" Condition="=" DefaultValue="" 
                    FieldName="ZA002" Mode="TextBox" />
            </queryfields>
            <NavStates>
                <InfoLight:WebNavigatorStateItem StateText="Initial" 
                    EnableControls="Export;Print;Query;Abort;Apply;Cancel;OK;Delete;Update;Add;Last;Next;Previous;First" />
                <InfoLight:WebNavigatorStateItem StateText="Browsed" 
                    EnableControls="Export;Print;Query;Abort;Apply;Cancel;OK;Delete;Update;Add;Last;Next;Previous;First" />
<InfoLight:WebNavigatorStateItem StateText="Inserting"></InfoLight:WebNavigatorStateItem>
                <InfoLight:WebNavigatorStateItem StateText="Editing" EnableControls="" />
                <InfoLight:WebNavigatorStateItem StateText="Applying" />
                <InfoLight:WebNavigatorStateItem StateText="Changing" EnableControls="Query" />
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
            <Fields>
                <InfoLight:FormViewField ControlID="COMPANYTextBoxI" FieldName="COMPANY" />
                <InfoLight:FormViewField ControlID="CREATORTextBoxI" FieldName="CREATOR" />
                <InfoLight:FormViewField ControlID="USR_GROUPTextBoxI" FieldName="USR_GROUP" />
                <InfoLight:FormViewField ControlID="CREATE_DATETextBoxI" 
                    FieldName="CREATE_DATE" />
                <InfoLight:FormViewField ControlID="MODIFIERTextBoxI" FieldName="MODIFIER" />
                <InfoLight:FormViewField ControlID="MODI_DATETextBoxI" FieldName="MODI_DATE" />
                <InfoLight:FormViewField ControlID="FLAGTextBoxI" FieldName="FLAG" />
                <InfoLight:FormViewField ControlID="ZA001TextBoxI" FieldName="ZA001" />
                <InfoLight:FormViewField ControlID="ZA002TextBoxI" FieldName="ZA002" />
                <InfoLight:FormViewField ControlID="ZA003TextBoxI" FieldName="ZA003" />
            </Fields>
            <EditItemTemplate>
                <table class="container_table">
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionZA001" runat="server" EnableTheming="True" Text="員工代號"></asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("MV002") %>'></asp:Label>
                        </td>
                        <td class="caption_td">
                            <asp:Label ID="CaptionZA002" runat="server" EnableTheming="True" Text="排班年月"></asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ZA002_1") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionZA003" runat="server" EnableTheming="True" Text="異動日期"></asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("ZA003_1") %>'></asp:Label>
                        </td>
                        <td class="caption_td">
                            &nbsp;</td>
                        <td class="value_td">
                            &nbsp;</td>
                    </tr>
                </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                <table class="container_table">
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionCOMPANY" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="COMPANY" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="COMPANYTextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="0" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("COMPANY") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True">
                            </asp:TextBox>
                        </td>
                        <td class="caption_td">
                            <asp:Label ID="CaptionCREATOR" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="CREATOR" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="CREATORTextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="0" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("CREATOR") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionUSR_GROUP" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="USR_GROUP" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="USR_GROUPTextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="0" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("USR_GROUP") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True">
                            </asp:TextBox>
                        </td>
                        <td class="caption_td">
                            <asp:Label ID="CaptionCREATE_DATE" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="CREATE_DATE" ViewStateMode="Inherit">
                            </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="CREATE_DATETextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="0" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("CREATE_DATE") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMODIFIER" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="MODIFIER" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="MODIFIERTextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="0" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("MODIFIER") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True">
                            </asp:TextBox>
                        </td>
                        <td class="caption_td">
                            <asp:Label ID="CaptionMODI_DATE" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="MODI_DATE" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="MODI_DATETextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="0" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("MODI_DATE") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionFLAG" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="FLAG" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="FLAGTextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="0" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("FLAG") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True">
                            </asp:TextBox>
                        </td>
                        <td class="caption_td">
                            <asp:Label ID="CaptionZA001" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="ZA001" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="ZA001TextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="0" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("ZA001") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True">
                            </asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionZA002" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="ZA002" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="ZA002TextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="0" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("ZA002") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True">
                            </asp:TextBox>
                        </td>
                        <td class="caption_td">
                            <asp:Label ID="CaptionZA003" runat="server" BorderStyle="NotSet" 
                                ClientIDMode="Inherit" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" Text="ZA003" ViewStateMode="Inherit"> </asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:TextBox ID="ZA003TextBoxI" runat="server" AutoCompleteType="None" 
                                AutoPostBack="False" BorderStyle="NotSet" CausesValidation="False" 
                                ClientIDMode="Inherit" Columns="0" Enabled="True" EnableTheming="True" 
                                EnableViewState="True" MaxLength="0" ReadOnly="False" Rows="0" 
                                Text='<%# Bind("ZA003") %>' TextMode="SingleLine" ViewStateMode="Inherit" 
                                Wrap="True">
                            </asp:TextBox>
                        </td>
                    </tr>
                </table>
            </InsertItemTemplate>
            <InsertRowStyle BackColor="LightCyan" ForeColor="Blue" />
            <ItemTemplate>
                <table class="container_table">
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionZA001Label" runat="server" EnableTheming="True" 
                                Text="員工代號" style="text-align: center"></asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:Label ID="ZA001Label" runat="server" EnableTheming="True" 
                                Text='<%# Bind("MV002") %>'></asp:Label>
                        </td>
                        <td class="caption_td">
                            <asp:Label ID="CaptionZA002Label" runat="server" EnableTheming="True" 
                                Text="排班年月" style="text-align: center"></asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:Label ID="ZA002Label" runat="server" EnableTheming="True" 
                                Text='<%# Bind("ZA002_1") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="caption_td">
                            <asp:Label ID="CaptionZA003Label" runat="server" EnableTheming="True" 
                                Text="異動日期" style="text-align: center"></asp:Label>
                        </td>
                        <td class="value_td">
                            <asp:Label ID="ZA003Label" runat="server" EnableTheming="True" 
                                Text='<%# Bind("ZA003_1") %>'></asp:Label>
                        </td>
                        <td class="caption_td">
                            &nbsp;</td>
                        <td class="value_td">
                            &nbsp;</td>
                    </tr>
                </table>
            </ItemTemplate>
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
        HeaderStyleWrap="False" SkinID="GridViewSkin1" style="text-align: center" 
        ondatabound="wgvDetail_DataBound" onrowdatabound="wgvDetail_RowDataBound" 
        onrowupdated="wgvDetail_RowUpdated" onrowupdating="wgvDetail_RowUpdating">
            <navcontrols>
                <InfoLight:ControlItem ControlName="Add" ControlText="add" ControlType="Image" 
                    ControlVisible="False" DisenableImageUrl="../image/uipics/add3.gif" 
                    ImageUrl="../image/uipics/add.gif" MouseOverImageUrl="../image/uipics/add2.gif" 
                    Size="25" />
                <InfoLight:ControlItem ControlName="Query" ControlText="query" 
                    ControlType="Image" ControlVisible="False" 
                    DisenableImageUrl="../image/uipics/query3.gif" 
                    ImageUrl="../image/uipics/query.gif" 
                    MouseOverImageUrl="../image/uipics/query2.gif" Size="25" />
                <InfoLight:ControlItem ControlName="Apply" ControlText="apply" 
                    ControlType="Image" ControlVisible="False" 
                    DisenableImageUrl="../image/uipics/apply3.gif" 
                    ImageUrl="../image/uipics/apply.gif" 
                    MouseOverImageUrl="../image/uipics/apply2.gif" Size="25" />
                <InfoLight:ControlItem ControlName="Abort" ControlText="abort" 
                    ControlType="Image" ControlVisible="False" 
                    DisenableImageUrl="../image/uipics/abort3.gif" 
                    ImageUrl="../image/uipics/abort.gif" 
                    MouseOverImageUrl="../image/uipics/abort2.gif" Size="25" />
                <InfoLight:ControlItem ControlName="OK" ControlText="Insert" 
                    ControlType="Image" ControlVisible="False" 
                    DisenableImageUrl="../image/uipics/ok3.gif" ImageUrl="../image/uipics/ok.gif" 
                    MouseOverImageUrl="../image/uipics/ok2.gif" Size="25" />
                <InfoLight:ControlItem ControlName="Cancel" ControlText="cancel" 
                    ControlType="Image" ControlVisible="False" 
                    DisenableImageUrl="../image/uipics/cancel3.gif" 
                    ImageUrl="../image/uipics/cancel.gif" 
                    MouseOverImageUrl="../image/uipics/cancel2.gif" Size="25" />
            </navcontrols>
            <addnewrowcontrols>
                <InfoLight:AddNewRowControlItem ControlID="wdtAMSZBZB006F" 
                    ControlType="DateTimePicker" FieldName="ZB006" />
                <InfoLight:AddNewRowControlItem ControlID="wdtAMSZBZB007F" 
                    ControlType="DateTimePicker" FieldName="ZB007" />
            </addnewrowcontrols>
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="True" 
                            CommandName="Update" ImageUrl="~/Image/UIPics/OK.gif" Text="更新" />
                        &nbsp;<asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" 
                            CommandName="Cancel" ImageUrl="~/Image/UIPics/Cancel.gif" Text="取消" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" 
                            CommandName="Edit" ImageUrl="~/Image/UIPics/Edit.gif" Text="編輯" />
                        &nbsp;&nbsp;
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="COMPANY" HeaderText="COMPANY" 
                    SortExpression="COMPANY" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="CREATOR" HeaderText="CREATOR" 
                    SortExpression="CREATOR" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="USR_GROUP" HeaderText="USR_GROUP" 
                    SortExpression="USR_GROUP" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="CREATE_DATE" HeaderText="CREATE_DATE" 
                    SortExpression="CREATE_DATE" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="MODIFIER" HeaderText="MODIFIER" 
                    SortExpression="MODIFIER" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="MODI_DATE" HeaderText="MODI_DATE" 
                    SortExpression="MODI_DATE" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="FLAG" HeaderText="FLAG" SortExpression="FLAG" 
                    Visible="False"></asp:BoundField>
                <asp:TemplateField HeaderText="排班日期" SortExpression="ZB003_1">
                    <EditItemTemplate>
                        <asp:Label ID="LabDate" runat="server" Text='<%# Eval("ZB003_1") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ZB003_1") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="班別" SortExpression="ZB004">
                    <EditItemTemplate>
                        <InfoLight:WebRefVal ID="wrvZB004" runat="server" AllowAddData="False" 
                            BindingText="" BindingValue='<%# Bind("ZB004") %>' 
                            ButtonImageUrl="../Image/refval/RefVal.gif" DataBindingField="ZB004" 
                            DataSourceID="WDSZB004" DataTextField="DRPVALUE" DataValueField="resaj001" 
                            MultiLanguage="False" PostBackButonClick="False" ReadOnly="False" 
                            ResxDataSet="" ResxFilePath="" SessionMode="False" UpdatePanelID="" 
                            UseButtonImage="True" ValueChangedJs="">
                            <whereitem>
                                <InfoLight:WebWhereItem Condition="%" FieldName="sDate" Value="GetDate()" />
                            </whereitem>
                            <columnmatch>
                                <InfoLight:WebColumnMatch DestControlID="txtSdatetime" SrcField="resaj003" />
                                <InfoLight:WebColumnMatch DestControlID="txtEdatetime" SrcField="resaj004" />
                            </columnmatch>
                            <Columns>
                                <InfoLight:WebRefColumn ColumnName="DRPVALUE" HeadText="班別" Width="100" />
                                <InfoLight:WebRefColumn ColumnName="resaj003" HeadText="上班時間" Width="200" />
                                <InfoLight:WebRefColumn ColumnName="resaj004" HeadText="下班時間" Width="200" />
                                <InfoLight:WebRefColumn ColumnName="resaj001" HeadText="代號" Width="100" />
                                <InfoLight:WebRefColumn ColumnName="resaj002" HeadText="歸屬日" Width="100" />
                            </Columns>
                        </InfoLight:WebRefVal>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ZB004_1") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="假日別" SortExpression="ZB005">
                    <EditItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("ZB005_1") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ZB005_1") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="80px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="上班時間" SortExpression="ZB006">
                    <EditItemTemplate>
                        <InfoLight:WebDateTimePicker ID="dtpSdate" runat="server" 
                            ButtonImageUrl="../Image/datetimepicker/datetimepicker.gif" 
                            DateFormat="ShortDate" DateFormatString="yyyyMMdd" DateTimeType="DateTime" 
                            Localize="False" LocalizeForROC="False" MaxYear="2050" MinYear="1950" UpdatePanelID="" 
                            UseButtonImage="True" Width="100px"></InfoLight:WebDateTimePicker>
                        <InfoLight:WebTimePicker ID="tpStime" runat="server" DayLight="False" 
                            MinuteInterval="30"></InfoLight:WebTimePicker>
                        <asp:TextBox ID="txtSdatetime" runat="server" Text='<%# Bind("ZB006") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("ZB006") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="下班時間" SortExpression="ZB007">
                    <EditItemTemplate>
                        <InfoLight:WebDateTimePicker ID="dtpEdate" runat="server" DateFormat="ShortDate"></InfoLight:WebDateTimePicker>
                        <InfoLight:WebTimePicker ID="tpEtime" runat="server" MinuteInterval="30"></InfoLight:WebTimePicker>
                        <asp:TextBox ID="txtEdatetime" runat="server" Text='<%# Bind("ZB007") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ZB007") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="ZB001">
                    <EditItemTemplate>
                        <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Bind("ZB001") %>' 
                            Visible="False" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("ZB001") %>' 
                            Visible="False" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="ZB003">
                    <EditItemTemplate>
                        <asp:HiddenField ID="HiddenField5" runat="server" 
                            Value='<%# Bind("ZB003") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenField5" runat="server" 
                            Value='<%# Bind("ZB003") %>' />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField SortExpression="ZB002">
                    <EditItemTemplate>
                        <asp:HiddenField ID="HiddenField4" runat="server" Value='<%# Bind("ZB002") %>' 
                            Visible="False" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenField3" runat="server" Value='<%# Bind("ZB002") %>' 
                            Visible="False" />
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>

<PagerSettings Mode="NumericFirstLast"></PagerSettings>
</InfoLight:webgridview>
    <Infolight:WebDefault runat="server" DefaultActive="True" DataSourceID="Master" DataMember="AMSZA" CarryOnActive="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wdAMSZA" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebDefault>
<Infolight:WebValidate runat="server" DataSourceID="Master" DataMember="AMSZA" ValidateActive="True" DuplicateCheck="False" DuplicateCheckMode="ByLocal" ValidateStyle="ShowLable" MultiLanguage="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wvAMSZA" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebValidate>
<Infolight:WebDefault runat="server" DefaultActive="True" DataSourceID="Detail" DataMember="AMSZB" CarryOnActive="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wdAMSZB" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebDefault>
<Infolight:WebValidate runat="server" DataSourceID="Detail" DataMember="AMSZB" ValidateActive="True" DuplicateCheck="False" DuplicateCheckMode="ByLocal" ValidateStyle="ShowLable" MultiLanguage="False" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="wvAMSZB" EnableViewState="True" ViewStateMode="Inherit" >
</Infolight:WebValidate>
</form>
</body>
</html>
