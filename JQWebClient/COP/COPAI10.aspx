<%@ Page Language="C#" AutoEventWireup="true" CodeFile="COPAI10.aspx.cs" Inherits="Template_JQuerySingle1" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <JQTools:JQScriptManager ID="JQScriptManager1" runat="server" />
            <JQTools:JQDataGrid ID="dataGridViewer" data-options="pagination:true,view:commandview" RemoteName="sCOPZQ.COPZQ" runat="server" AutoApply="False"
                DataMember="COPZQ" Pagination="True" QueryTitle="Query"
                Title="表面加價表維護作業" AllowAdd="True" AllowDelete="True" AllowUpdate="True" AlwaysClose="False" BufferView="False" CheckOnSelect="True" ColumnsHibeable="False" DeleteCommandVisible="True" DuplicateCheck="False" EditMode="Dialog" EditOnEnter="True" InsertCommandVisible="True" MultiSelect="False" NotInitGrid="False" PageList="10,20,30,40,50" PageSize="10" QueryAutoColumn="False" QueryLeft="" QueryMode="Window" QueryTop="" RecordLock="False" RecordLockMode="None" RowNumbers="False" ScrollView="False" TotalCaption="Total:" UpdateCommandVisible="False" ViewCommandVisible="False">
                <Columns>
                    <JQTools:JQGridColumn Alignment="left" Caption="成品表面" Editor="infocombobox" FieldName="ZQ001" MaxLength="2" Width="200" Visible="True" EditorOptions="valueField:'MJ003',textField:'MJ004',remoteName:'sCOPZQ.INVMJ',tableName:'INVMJ',pageSize:'-1',checkData:false,selectOnly:false,cacheRelationText:false,onBeforeLoad:onComboxZQ001BeforeLoad,panelHeight:200" />
                    <JQTools:JQGridColumn Alignment="right" Caption="表面加價<br>(MT)" Editor="numberbox" FieldName="ZQ002" Width="90" MaxLength="17" Visible="True" />
                </Columns>
                <TooItems>
                    <JQTools:JQToolItem Icon="icon-add" ItemType="easyui-linkbutton" OnClick="insertItem" Text="新增" />
                    <JQTools:JQToolItem Icon="icon-edit" ItemType="easyui-linkbutton" OnClick="updateItem" Text="Update" Visible="False" />
                    <JQTools:JQToolItem Icon="icon-remove" ItemType="easyui-linkbutton" OnClick="deleteItem" Text="Delete" Visible="False" />
                    <JQTools:JQToolItem Icon="icon-save" ItemType="easyui-linkbutton" OnClick="doApply" Text="儲存" />
                    <JQTools:JQToolItem Icon="icon-cancel" ItemType="easyui-linkbutton" OnClick="cancel" Text="取消" />
                    <JQTools:JQToolItem Icon="icon-search" ItemType="easyui-linkbutton" OnClick="openQuery" Text="Query" Visible="False" />
                    <JQTools:JQToolItem Enabled="True" Icon="icon-excel" ItemType="easyui-linkbutton" OnClick="exportGrid" Text="Export" Visible="False" />
                </TooItems>
                <QueryColumns>
                </QueryColumns>
            </JQTools:JQDataGrid>
        </div>
    <JQTools:JQDefault runat="server" BindingObjectID="dataGridViewer" EnableTheming="True" ID="defaultMaster" >
        <Columns>
            <JQTools:JQDefaultColumn CarryOn="False" FieldName="COMPANY" RemoteMethod="True" />
            <JQTools:JQDefaultColumn CarryOn="False" FieldName="CREATOR" RemoteMethod="True" />
            <JQTools:JQDefaultColumn CarryOn="False" FieldName="USR_GROUP" RemoteMethod="True" />
            <JQTools:JQDefaultColumn CarryOn="False" FieldName="CREATE_DATE" RemoteMethod="True" />
            <JQTools:JQDefaultColumn CarryOn="False" FieldName="MODIFIER" RemoteMethod="True" />
            <JQTools:JQDefaultColumn CarryOn="False" FieldName="MODI_DATE" RemoteMethod="True" />
            <JQTools:JQDefaultColumn CarryOn="False" DefaultValue="1" FieldName="FLAG" RemoteMethod="True" />
        </Columns>
</JQTools:JQDefault>
<JQTools:JQValidate runat="server" BindingObjectID="dataGridViewer" EnableTheming="True" ID="validateMaster" >
	<Columns>
		<JQTools:JQValidateColumn FieldName="ZQ001" CheckNull="True" ValidateType="None" RemoteMethod="True" />
	</Columns>

</JQTools:JQValidate>
</form>
    <script src="../js/Base.js?v=20191001"></script>
    <script src="js/COPAI10.js?v=20191001"></script>
</body>
</html>
