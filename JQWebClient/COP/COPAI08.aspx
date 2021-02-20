<%@ Page Language="C#" AutoEventWireup="true" CodeFile="COPAI08.aspx.cs" Inherits="Template_JQuerySingle1" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/Base.css?v=20191005001" rel="stylesheet" />
    <title></title>

</head>
<body>
    <form id="headForm" runat="server">
            <JQTools:JQScriptManager ID="JQScriptManager1" runat="server" />
            <JQTools:JQDataGrid ID="dataGridView" data-options="pagination:true,view:commandview" RemoteName="sCOPZN.COPZN" runat="server" AutoApply="True"
                DataMember="COPZN" Pagination="True" QueryTitle="查詢" EditDialogID="JQDialogMaster"
                Title="每日鎳價維護作業" AllowAdd="True" AllowDelete="False" AllowUpdate="True" AlwaysClose="True" BufferView="False" CheckOnSelect="True" ColumnsHibeable="False" DeleteCommandVisible="False" DuplicateCheck="False" EditMode="Dialog" EditOnEnter="True" InsertCommandVisible="True" MultiSelect="False" NotInitGrid="False" PageList="10,20,30,40,50" PageSize="10" QueryAutoColumn="False" QueryLeft="0px" QueryMode="Window" QueryTop="62px" RecordLock="False" RecordLockMode="None" RowNumbers="False" ScrollView="False" TotalCaption="Total:" UpdateCommandVisible="True" ViewCommandVisible="False">
                <Columns>
                    <JQTools:JQGridColumn Alignment="left" Caption="單號" Editor="text" FieldName="ZN001" Format="" MaxLength="0" Visible="true" Width="120" />
                    <JQTools:JQGridColumn Alignment="left" Caption="日期(起)" Editor="text" FieldName="ZN002" Format="" MaxLength="0" Visible="true" Width="120" FormatScript="formatStringDate" Sortable="False" />
                    <JQTools:JQGridColumn Alignment="left" Caption="日期(迄)" Editor="text" FieldName="ZN003" Format="" MaxLength="0" Visible="True" Width="120" FormatScript="formatStringDate" />
                    <JQTools:JQGridColumn Alignment="left" Caption="幣別" Editor="text" FieldName="ZN004" Format="" MaxLength="0" Visible="False" Width="120" FormatScript="" />
                    <JQTools:JQGridColumn Alignment="left" Caption="鎳價" Editor="numberbox" FieldName="ZN005" Format="" MaxLength="0" Visible="true" Width="120" EditorOptions="precision:3,groupSeparator:'',prefix:''" FormatScript="formatNumber" />
                    <JQTools:JQGridColumn Alignment="left" Caption="備註" Editor="text" FieldName="ZN006" Format="" MaxLength="0" Visible="true" Width="230" />
                </Columns>
                <TooItems>
                    <JQTools:JQToolItem Icon="icon-search" ItemType="easyui-linkbutton" OnClick="doOpenQuery"
                        Text="查詢" ID="doOpenQuery" Enabled="True" />
                    <JQTools:JQToolItem Icon="icon-add" ItemType="easyui-linkbutton"
                        OnClick="insertItem" Text="新增" Enabled="True" ID="doInsertItem" />
                </TooItems>
                <QueryColumns>
                    <JQTools:JQQueryColumn AndOr="and" Caption="日期(起)" Condition="&gt;=" DataType="string" Editor="datebox" FieldName="ZN002" IsNvarChar="False" NewLine="True" RemoteMethod="False" RowSpan="0" Span="0" Width="125" EditorOptions="dateFormat:'nvarchar',showTimeSpinner:true,showSeconds:false,editable:false" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="~" Condition="&lt;=" DataType="string" Editor="datebox" FieldName="ZN002" IsNvarChar="False" NewLine="False" RemoteMethod="False" RowSpan="0" Span="0" Width="125" EditorOptions="dateFormat:'nvarchar',showTimeSpinner:true,showSeconds:false,editable:false" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="日期(迄)" Condition="&gt;=" DataType="string" Editor="datebox" EditorOptions="dateFormat:'nvarchar',showTimeSpinner:true,showSeconds:false,editable:false" FieldName="ZN003" IsNvarChar="False" NewLine="True" RemoteMethod="False" RowSpan="0" Span="0" Width="125" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="~" Condition="&lt;=" DataType="string" Editor="datebox" EditorOptions="dateFormat:'nvarchar',showTimeSpinner:true,showSeconds:false,editable:false" FieldName="ZN003" IsNvarChar="False" NewLine="False" RemoteMethod="False" RowSpan="0" Span="0" Width="125" />
                </QueryColumns>
            </JQTools:JQDataGrid>

            <JQTools:JQDialog ID="JQDialogMaster" runat="server" BindingObjectID="dataFormMaster" Title="資料維護" Closed="False" DialogLeft="0px" DialogTop="0px">
                <JQTools:JQDataForm ID="dataFormMaster" runat="server" DataMember="COPZN" HorizontalColumnsCount="2" RemoteName="sCOPZN.COPZN" AlwaysReadOnly="False" Closed="False" ContinueAdd="False" disapply="False" DivFramed="False" DuplicateCheck="False" HorizontalGap="0" IsAutoPageClose="False" IsAutoPause="False" IsAutoSubmit="False" IsNotifyOFF="False" IsRejectNotify="False" IsRejectON="False" IsShowFlowIcon="False" ShowApplyButton="False" ValidateStyle="Hint" VerticalGap="0" OnLoadSuccess="onDfMasterLoaded" >

                    <Columns>
                        <JQTools:JQFormColumn Alignment="left" Caption="單號" Editor="text" FieldName="ZN001" Format="" maxlength="0" Width="180" PlaceHolder="" ReadOnly="True" NewRow="False" />
                        <JQTools:JQFormColumn Alignment="left" Caption="日期(起)" Editor="datebox" FieldName="ZN002" Format="" maxlength="0" Width="180" NewRow="True" EditorOptions="dateFormat:'nvarchar',showTimeSpinner:false,showSeconds:true,editable:true" />
                        <JQTools:JQFormColumn Alignment="left" Caption="日期(迄)" Editor="datebox" FieldName="ZN003" Format="" maxlength="0" Width="180" Visible="True" EditorOptions="dateFormat:'nvarchar',showTimeSpinner:false,showSeconds:true,editable:true" NewRow="False" />
                        <JQTools:JQFormColumn Alignment="left" Caption="幣別" Editor="text" FieldName="ZN004" Format="" maxlength="0" Width="180" NewRow="True" EditorOptions="capsLock:'none'" ReadOnly="True" Visible="False" />
                        <JQTools:JQFormColumn Alignment="left" Caption="鎳價<br>(MT)" Editor="numberbox" FieldName="ZN005" Format="" maxlength="0" Width="180" Visible="True" EditorOptions="precision:3,groupSeparator:'',prefix:''" NewRow="False" Span="1" />
                        <JQTools:JQFormColumn Alignment="left" Caption="備註" Editor="textarea" FieldName="ZN006" Format="" maxlength="0" Width="400" EditorOptions="height:100" NewRow="True" RowSpan="1" Span="2" />
                    </Columns>
                    <TooItems>
                        <JQTools:JQToolItem Enabled="True" ItemType="easyui-linkbutton" Text="新增盤價" Visible="True" Icon="icon-add" OnClick="addPlate" ID="toolItemAddPlate" />
                        <JQTools:JQToolItem Enabled="True" ItemType="easyui-linkbutton" Text="複製上一期盤價" Visible="True" Icon="icon-redo" ID="toolItemCPPreviousPlate" OnClick="cpPreviousPlate" />
                        <JQTools:JQToolItem Enabled="True" Icon="icon-save" ItemType="easyui-linkbutton" OnClick="doApply" Text="儲存" Visible="True" ID="toolItemApply" />
                        <JQTools:JQToolItem ID="toolItemCanel" Enabled="True" Icon="icon-cancel" ItemType="easyui-linkbutton" OnClick="doCanel" Text="關閉" Visible="True" />
                    </TooItems>
                </JQTools:JQDataForm>
               <div id="divGDetail">
                <JQTools:JQDataGrid ID="dataGridDetail" runat="server" AutoApply="False" DataMember="COPZO" Pagination="False" ParentObjectID="dataFormMaster" RemoteName="sCOPZN.COPZN" Title="明細資料" AllowAdd="True" AllowDelete="True" AllowUpdate="True" AlwaysClose="False" BufferView="False" CheckOnSelect="True" ColumnsHibeable="False" DeleteCommandVisible="True" DuplicateCheck="False" EditMode="Dialog" EditOnEnter="True" InsertCommandVisible="True" MultiSelect="False" NotInitGrid="False" PageList="10,20,30,40,50" PageSize="10" QueryAutoColumn="False" QueryLeft="" QueryMode="Window" QueryTitle="Query" QueryTop="" RecordLock="False" RecordLockMode="None" RowNumbers="False" ScrollView="False" TotalCaption="Total:" UpdateCommandVisible="False" ViewCommandVisible="False" Height="200px" >
                    <Columns>
                        <JQTools:JQGridColumn Alignment="left" Caption="ZO001" Editor="text" FieldName="ZO001" Frozen="False" IsNvarChar="False" MaxLength="0" QueryCondition="" ReadOnly="False" Sortable="False" Visible="False" Width="80">
                        </JQTools:JQGridColumn>
                        <JQTools:JQGridColumn Alignment="left" Caption="序號" Editor="text" FieldName="ZO002" Format="" Width="120" PlaceHolder="(自動編號)" ReadOnly="True" Visible="False" />
                        <JQTools:JQGridColumn Alignment="left" Caption="鋼種" Editor="infocombobox" FieldName="ZO003" Format="" Width="120" EditorOptions="valueField:'MJ004',textField:'MJ004',remoteName:'sCOPZN.ComboxINVMJ_ZO003',tableName:'ComboxINVMJ_ZO003',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZO003BeforeLoad,panelHeight:200" ReadOnly="False" FormatScript="" />
                        <JQTools:JQGridColumn Alignment="left" Caption="板/卷" Editor="infocombobox" FieldName="ZO004" Format="" Width="120" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZN.ComboxINVMJ_ZO004',tableName:'ComboxINVMJ_ZO004',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZO004BeforeLoad,panelHeight:200" ReadOnly="False" FormatScript="" />
                        <JQTools:JQGridColumn Alignment="left" Caption="冷熱軋" Editor="infocombobox" FieldName="ZO005" Format="" Width="120" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZN.ComboxINVMJ_ZO005',tableName:'ComboxINVMJ_ZO005',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZO005BeforeLoad,panelHeight:200" ReadOnly="False" />
                        <JQTools:JQGridColumn Alignment="left" Caption="公稱厚(起)" Editor="infocombobox" FieldName="ZO006" Format="" Width="120" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZN.ComboxINVMJ_ZO006',tableName:'ComboxINVMJ_ZO006',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZO006BeforeLoad,panelHeight:200" ReadOnly="False" />
                        <JQTools:JQGridColumn Alignment="left" Caption="公稱厚(迄)" Editor="infocombobox" FieldName="ZO007" Format="" Width="120" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZN.ComboxINVMJ_ZO007',tableName:'ComboxINVMJ_ZO007',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZO007BeforeLoad,panelHeight:200" ReadOnly="False" />
                        <JQTools:JQGridColumn Alignment="left" Caption="地區" Editor="infocombobox" FieldName="ZO008" Format="" Width="120" EditorOptions="valueField:'DRPID',textField:'DRPVALUE',remoteName:'sCOPZN.ComboxINVMJ_ZO008',tableName:'ComboxINVMJ_ZO008',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZO008BeforeLoad,panelHeight:200" />
                        <JQTools:JQGridColumn Alignment="left" Caption="盤價<br>(MT)" Editor="numberbox" EditorOptions="precision:3,groupSeparator:'',prefix:''" FieldName="ZO009" Frozen="False" IsNvarChar="False" MaxLength="0" QueryCondition="" ReadOnly="False" Sortable="False" Visible="True" Width="80" FormatScript="formatNumber">
                        </JQTools:JQGridColumn>
                    </Columns>
                    <RelationColumns>
                        <JQTools:JQRelationColumn FieldName="ZO001" ParentFieldName="ZN001" />
                    </RelationColumns>
                </JQTools:JQDataGrid>
                </div>

                <JQTools:JQDefault ID="defaultMaster" runat="server" BindingObjectID="dataFormMaster" EnableTheming="True">
                    <Columns>
                        <JQTools:JQDefaultColumn CarryOn="False" DefaultValue="(自動編號)" FieldName="ZN001" RemoteMethod="True" />
                        <JQTools:JQDefaultColumn CarryOn="False" FieldName="ZN004" RemoteMethod="False" DefaultMethod="defZN004" />
                        <JQTools:JQDefaultColumn CarryOn="False" DefaultValue="0" FieldName="ZN005" RemoteMethod="True" />
                    </Columns>
                </JQTools:JQDefault>
                <JQTools:JQValidate ID="validateMaster" runat="server" BindingObjectID="dataFormMaster" EnableTheming="True">
                    <Columns>
                        <JQTools:JQValidateColumn CheckNull="True" FieldName="ZN002" RemoteMethod="False" ValidateMessage="請選擇日期" ValidateType="None" />
                        <JQTools:JQValidateColumn CheckNull="True" FieldName="ZN003" RemoteMethod="False" ValidateMessage="請選擇日期" ValidateType="None" />
                        <JQTools:JQValidateColumn CheckNull="True" FieldName="ZN004" RemoteMethod="False" ValidateMessage="請選擇幣別" ValidateType="None" />
                    </Columns>
                </JQTools:JQValidate>
                <JQTools:JQDefault ID="defaultDetail" runat="server" BindingObjectID="dataGridDetail" EnableTheming="True">
                    <Columns>
                        <JQTools:JQDefaultColumn CarryOn="False" DefaultValue="0" FieldName="ZO009" RemoteMethod="True" />
                    </Columns>
                </JQTools:JQDefault>
                <JQTools:JQValidate ID="validateDetail" runat="server" BindingObjectID="dataGridDetail" BorderStyle="NotSet" ClientIDMode="Inherit" Enabled="True" EnableTheming="True" EnableViewState="True" ViewStateMode="Inherit">
                </JQTools:JQValidate>
                <JQTools:JQAutoSeq ID="JQAutoSeq1" runat="server" BindingObjectID="dataGridDetail" FieldName="ZO002" NumDig="4" />
            </JQTools:JQDialog>

    </form>
    <script src="../js/Base.js?v=20191017001"></script>
    <script src="js/COPAI08.js?v=20191022004"></script>

</body>
</html>
