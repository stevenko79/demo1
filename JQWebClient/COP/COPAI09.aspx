<%@ Page Language="C#" AutoEventWireup="true" CodeFile="COPAI09.aspx.cs" Inherits="Template_JQuerySingle1" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/Base.css?v=20191002001" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <JQTools:JQScriptManager ID="JQScriptManager1" runat="server" />
            <JQTools:JQDataGrid ID="dataGridViewer" data-options="pagination:true,view:commandview" RemoteName="sCOPZP.COPZP" runat="server" AutoApply="False"
                DataMember="COPZP" Pagination="True" QueryTitle="查詢"
                Title="拋砂貼膜加價表維護作業" AllowAdd="True" AllowDelete="True" AllowUpdate="True" AlwaysClose="False" BufferView="False" CheckOnSelect="True" ColumnsHibeable="False" DeleteCommandVisible="True" DuplicateCheck="False" EditMode="Dialog" EditOnEnter="True" InsertCommandVisible="True" MultiSelect="False" NotInitGrid="False" PageList="10,20,30,40,50" PageSize="10" QueryAutoColumn="False" QueryLeft="9px" QueryMode="Window" QueryTop="72px" RecordLock="False" RecordLockMode="None" RowNumbers="False" ScrollView="False" TotalCaption="Total:" UpdateCommandVisible="False" ViewCommandVisible="False">
                <Columns>
                    <JQTools:JQGridColumn Alignment="left" Caption="公稱厚" Editor="infocombobox" FieldName="ZP001" Format="" MaxLength="0" Width="70" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZP.ComboxINVMJ_ZP001',tableName:'ComboxINVMJ_ZP001',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZP001BeforeLoad,panelHeight:200" FormatScript="" TableName="" />
                    <JQTools:JQGridColumn Alignment="left" Caption="內包材" Editor="infocombobox" FieldName="ZP002" Format="" MaxLength="0" Width="270" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZP.ComboxINVMJ_ZP002',tableName:'ComboxINVMJ_ZP002',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZP002BeforeLoad,panelHeight:200" />
                    <JQTools:JQGridColumn Alignment="left" Caption="拋砂" Editor="infocombobox" FieldName="ZP003" Format="" MaxLength="0" Width="200" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZP.ComboxINVMJ_ZP003',tableName:'ComboxINVMJ_ZP003',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZP003BeforeLoad,panelHeight:200" FormatScript="" />
                    <JQTools:JQGridColumn Alignment="right" Caption="拋砂加價<br>(MT)" Editor="numberbox" FieldName="ZP004" Format="" MaxLength="0" Width="80" EditorOptions="precision:3,groupSeparator:'',prefix:''" />
                    <JQTools:JQGridColumn Alignment="right" Caption="貼膜加價<br>(MT)" Editor="numberbox" FieldName="ZP005" Format="" MaxLength="0" Width="80" EditorOptions="precision:3,groupSeparator:'',prefix:''" />
                </Columns>
                <TooItems>
                    <JQTools:JQToolItem Icon="icon-search" ItemType="easyui-linkbutton" OnClick="openQuery" Text="查詢" />
                    <JQTools:JQToolItem Icon="icon-add" ItemType="easyui-linkbutton" OnClick="insertItem" Text="新增" />
                    <JQTools:JQToolItem Icon="icon-save" ItemType="easyui-linkbutton" OnClick="doApply" Text="儲存" />
                </TooItems>
                <QueryColumns>
                    <JQTools:JQQueryColumn AndOr="and" Caption="公稱厚(起)" Condition="&gt;=" DataType="string" Editor="infocombobox" FieldName="ZP001" IsNvarChar="False" NewLine="False" RemoteMethod="False" RowSpan="0" Span="0" Width="125" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZP.ComboxINVMJ_ZP001',tableName:'ComboxINVMJ_ZP001',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,panelHeight:200" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="公稱厚(迄)" Condition="&lt;=" DataType="string" Editor="infocombobox" FieldName="ZP001" IsNvarChar="False" NewLine="False" RemoteMethod="False" RowSpan="0" Span="0" Width="125" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZP.ComboxINVMJ_ZP001',tableName:'ComboxINVMJ_ZP001',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,panelHeight:200" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="內包材" Condition="%" DataType="string" Editor="infocombobox" FieldName="ZP002" IsNvarChar="False" NewLine="True" RemoteMethod="False" RowSpan="0" Span="0" Width="125" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZP.ComboxINVMJ_ZP002',tableName:'ComboxINVMJ_ZP002',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,panelHeight:200" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="拋砂" Condition="%" DataType="string" Editor="infocombobox" FieldName="ZP003" IsNvarChar="False" NewLine="False" RemoteMethod="False" RowSpan="0" Span="0" Width="125" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZP.ComboxINVMJ_ZP003',tableName:'ComboxINVMJ_ZP003',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,panelHeight:200" />
                </QueryColumns>
            </JQTools:JQDataGrid>
        </div>
    <JQTools:JQDefault runat="server" BindingObjectID="dataGridMaster" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="defaultMaster" EnableViewState="True" ViewStateMode="Inherit" >
</JQTools:JQDefault>
<JQTools:JQValidate runat="server" BindingObjectID="dataGridMaster" BorderStyle="NotSet" Enabled="True" EnableTheming="True" ClientIDMode="Inherit" ID="validateMaster" EnableViewState="True" ViewStateMode="Inherit" >
</JQTools:JQValidate>
</form>
    <script src="../js/Base.js?v=20191021001"></script>
    <script src="js/COPAI09.js?v=20191022001"></script>
</body>
</html>
