<%@ Page Language="C#" AutoEventWireup="true" CodeFile="COPAI11.aspx.cs" Inherits="Template_JQuerySingle1" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/Base.css?v=20190927" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <JQTools:JQScriptManager ID="JQScriptManager1" runat="server" />
            <JQTools:JQDataGrid ID="dataGridViewer" data-options="pagination:true,view:commandview" RemoteName="sCOPZR.COPZR" runat="server" AutoApply="False"
                DataMember="COPZR" Pagination="True" QueryTitle="查詢"
                Title="寬厚度加價表維護作業" AllowDelete="True" AllowAdd="True" AllowUpdate="True" AlwaysClose="True" BufferView="False" CheckOnSelect="True" ColumnsHibeable="False" DeleteCommandVisible="True" DuplicateCheck="False" EditMode="Dialog" EditOnEnter="True" InsertCommandVisible="True" MultiSelect="False" NotInitGrid="False" PageList="10,20,30,40,50" PageSize="10" QueryAutoColumn="False" QueryLeft="" QueryMode="Window" QueryTop="" RecordLock="False" RecordLockMode="None" RowNumbers="False" ScrollView="False" TotalCaption="Total:" UpdateCommandVisible="False" ViewCommandVisible="False">
                <Columns>
                    <JQTools:JQGridColumn Alignment="center" Caption="幣別" Editor="text" FieldName="ZR001" Format="" MaxLength="3" Width="120" EditorOptions="capsLock:'none'" Visible="False" />
                    <JQTools:JQGridColumn Alignment="center" Caption="鋼種" Editor="infocombobox" FieldName="ZR002" Format="" MaxLength="3" Width="120" EditorOptions="valueField:'MJ004',textField:'MJ004',remoteName:'sCOPZR.INVMJ_ZR002',tableName:'INVMJ_ZR002',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZR002BeforeLoad,panelHeight:200" Sortable="False" />
                    <JQTools:JQGridColumn Alignment="center" Caption="冷熱軋" Editor="infocombobox" FieldName="ZR003" Format="" MaxLength="1" Width="120" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZR.INVMJ_ZR003',tableName:'INVMJ_ZR003',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZR003BeforeLoad,panelHeight:200" Sortable="False" />
                    <JQTools:JQGridColumn Alignment="center" Caption="公稱厚(起)" Editor="infocombobox" FieldName="ZR004" Format="" MaxLength="4" Width="120" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZR.INVMJ_ZR004',tableName:'INVMJ_ZR004',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZR004BeforeLoad,panelHeight:200" Sortable="False" />
                    <JQTools:JQGridColumn Alignment="center" Caption="公稱厚(迄)" Editor="infocombobox" FieldName="ZR005" Format="" MaxLength="4" Width="120" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZR.INVMJ_ZR004',tableName:'INVMJ_ZR004',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZR005BeforeLoad,panelHeight:200" Sortable="False" />
                    <JQTools:JQGridColumn Alignment="center" Caption="公稱寬" Editor="infocombobox" FieldName="ZR006" Format="" MaxLength="5" Width="120" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZR.INVMJ_ZR006',tableName:'INVMJ_ZR006',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onComboxZR006BeforeLoad,panelHeight:200" Sortable="False" />
                    <JQTools:JQGridColumn Alignment="right" Caption="寬度加價<br>(MT)" Editor="numberbox" FieldName="ZR007" Format="" Width="120" EditorOptions="precision:3,groupSeparator:'',prefix:''" MaxLength="0" FormatScript="formatNumber" />
                    <JQTools:JQGridColumn Alignment="right" Caption="厚度加價<br>(MT)" Editor="numberbox" FieldName="ZR008" Format="" MaxLength="0" Width="120" EditorOptions="precision:3,groupSeparator:'',prefix:''" FormatScript="formatNumber" />
                </Columns>
                <TooItems>
                    <JQTools:JQToolItem Icon="icon-search" ItemType="easyui-linkbutton" OnClick="openQuery" Text="查詢" />
                    <JQTools:JQToolItem Icon="icon-add" ItemType="easyui-linkbutton" OnClick="insertItem" Text="新增" />
                    <JQTools:JQToolItem Icon="icon-save" ItemType="easyui-linkbutton" OnClick="doApply" Text="儲存" />
                </TooItems>
                <QueryColumns>
                    <JQTools:JQQueryColumn AndOr="and" Caption="鋼種" Condition="%" DataType="string" Editor="infocombobox" FieldName="ZR002" IsNvarChar="False" NewLine="True" RemoteMethod="False" RowSpan="0" Span="0" Width="125" EditorOptions="valueField:'MJ004',textField:'MJ004',remoteName:'sCOPZR.INVMJ_ZR002',tableName:'INVMJ_ZR002',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,panelHeight:200" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="冷熱軋" Condition="%" DataType="string" Editor="infocombobox" FieldName="ZR003" IsNvarChar="False" NewLine="False" RemoteMethod="False" RowSpan="0" Span="0" Width="125" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZR.INVMJ_ZR003',tableName:'INVMJ_ZR003',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,panelHeight:200" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="公稱厚(起)" Condition="&gt;=" DataType="string" Editor="infocombobox" FieldName="ZR004" IsNvarChar="False" NewLine="True" RemoteMethod="False" RowSpan="0" Span="0" Width="125" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZR.INVMJ_ZR004',tableName:'INVMJ_ZR004',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,panelHeight:200" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="～" Condition="&lt;=" DataType="string" Editor="infocombobox" FieldName="ZR004" IsNvarChar="False" NewLine="False" RemoteMethod="False" RowSpan="0" Span="0" Width="125" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZR.INVMJ_ZR004',tableName:'INVMJ_ZR004',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,panelHeight:200" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="公稱厚(迄)" Condition="&gt;=" DataType="string" Editor="infocombobox" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZR.INVMJ_ZR004',tableName:'INVMJ_ZR004',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,panelHeight:200" FieldName="ZR005" IsNvarChar="False" NewLine="True" RemoteMethod="False" RowSpan="0" Span="0" Width="125" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="～" Condition="&lt;=" DataType="string" Editor="infocombobox" FieldName="ZR005" IsNvarChar="False" NewLine="False" RemoteMethod="False" RowSpan="0" Span="0" Width="125" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZR.INVMJ_ZR004',tableName:'INVMJ_ZR004',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,panelHeight:200" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="公稱寬(起)" Condition="&gt;=" DataType="string" Editor="infocombobox" FieldName="ZR006" IsNvarChar="False" NewLine="True" RemoteMethod="False" RowSpan="0" Span="0" Width="125" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZR.INVMJ_ZR006',tableName:'INVMJ_ZR006',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,panelHeight:200" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="公稱寬(迄)" Condition="&lt;=" DataType="string" Editor="infocombobox" FieldName="ZR006" IsNvarChar="False" NewLine="False" RemoteMethod="False" RowSpan="0" Span="0" Width="125" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZR.INVMJ_ZR006',tableName:'INVMJ_ZR006',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,panelHeight:200" />
                </QueryColumns>
            </JQTools:JQDataGrid>
        </div>
    <JQTools:JQDefault runat="server" BindingObjectID="dataGridViewer" EnableTheming="True" ID="defaultMaster" >
        <Columns>
            <JQTools:JQDefaultColumn CarryOn="False" DefaultMethod="getZR001" FieldName="ZR001" RemoteMethod="False" />
        </Columns>
</JQTools:JQDefault>
<JQTools:JQValidate runat="server" BindingObjectID="dataGridMaster" EnableTheming="True" ID="validateMaster" >
</JQTools:JQValidate>
</form>
    <script src="../js/Base.js?v=20191007"></script>
    <script src="js/COPAI11.js?v=20191023"></script>
</body>
</html>
