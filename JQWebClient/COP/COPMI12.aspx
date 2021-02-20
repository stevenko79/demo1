<%@ Page Language="C#" AutoEventWireup="true" CodeFile="COPMI12.aspx.cs" Inherits="Template_JQuerySingle1" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../css/Base.css?v=20191002" rel="stylesheet" />
    <link href="css/COPMI12.css?v=20191002" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <JQTools:JQScriptManager ID="JQScriptManager1" runat="server" />
            <JQTools:JQDataGrid ID="dataGridView" data-options="pagination:true,view:commandview" RemoteName="sCOPZL.View_COPZL" runat="server" AutoApply="True"
                DataMember="View_COPZL" Pagination="True" QueryTitle="查詢" EditDialogID="JQDialogEdit"
                Title="試算底稿" AllowAdd="True" AllowDelete="False" AllowUpdate="True" AlwaysClose="True" BufferView="False" CheckOnSelect="True" ColumnsHibeable="False" DeleteCommandVisible="False" DuplicateCheck="False" EditMode="Dialog" EditOnEnter="True" InsertCommandVisible="True" MultiSelect="False" NotInitGrid="False" PageList="10,20,30,40,50" PageSize="10" QueryAutoColumn="False" QueryLeft="10px" QueryMode="Window" QueryTop="45px" RecordLock="False" RecordLockMode="None" RowNumbers="False" ScrollView="False" TotalCaption="總計:" UpdateCommandVisible="True" ViewCommandVisible="False" OnInsert="onInsert" OnUpdate="onEdit">
                <Columns>
                    <JQTools:JQGridColumn Alignment="left" Caption="底稿號碼" Editor="text" FieldName="ZL001" Format="" MaxLength="11" Visible="true" Width="120" />
                    <JQTools:JQGridColumn Alignment="left" Caption="單據日期" Editor="text" FieldName="ZL002" Format="" MaxLength="8" Visible="true" Width="120" FormatScript="formatStringDate" />
                    <JQTools:JQGridColumn Alignment="left" Caption="部門" Editor="text" FieldName="ME002" Format="" MaxLength="6" Visible="true" Width="120" />
                    <JQTools:JQGridColumn Alignment="left" Caption="業務" Editor="text" FieldName="MV002" Format="" MaxLength="10" Visible="true" Width="120" />
                    <JQTools:JQGridColumn Alignment="left" Caption="幣別" Editor="text" FieldName="ZL005" Format="" MaxLength="3" Visible="true" Width="120" />
                    <JQTools:JQGridColumn Alignment="right" Caption="獎金合計" Editor="numberbox" FieldName="ZL006" Format="" Visible="true" Width="120" FormatScript="formatNumber" Total="" />
                    <JQTools:JQGridColumn Alignment="left" Caption="確認碼" Editor="text" FieldName="ZL007" Format="" MaxLength="1" Visible="False" Width="120" />
                </Columns>
                <TooItems>
                    <JQTools:JQToolItem Icon="icon-search" ItemType="easyui-linkbutton" OnClick="openQuery"
                        Text="查詢" />
                    <JQTools:JQToolItem Icon="icon-add" ItemType="easyui-linkbutton"
                        OnClick="insertItem" Text="新增" />
                    <JQTools:JQToolItem Enabled="True" Icon="icon-remove" ItemType="easyui-linkbutton" OnClick="onVoid" Text="作廢" Visible="True" />
                </TooItems>
                <QueryColumns>
                    <JQTools:JQQueryColumn AndOr="and" Caption="底稿號碼" Condition="%" DataType="string" Editor="text" FieldName="ZL001" IsNvarChar="False" NewLine="True" RemoteMethod="False" RowSpan="0" Span="0" Width="125" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="業務工號" Condition="%" DataType="string" Editor="text" FieldName="ZL004" IsNvarChar="False" NewLine="False" RemoteMethod="False" RowSpan="0" Span="0" Width="125" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="單據日期(起)" Condition="&gt;=" DataType="string" Editor="datebox" EditorOptions="dateFormat:'nvarchar',showTimeSpinner:false,showSeconds:false,editable:false" FieldName="ZL002" IsNvarChar="False" NewLine="True" RemoteMethod="False" RowSpan="0" Span="0" Width="125" />
                    <JQTools:JQQueryColumn AndOr="and" Caption="單據日期(迄)" Condition="&lt;=" DataType="string" Editor="datebox" EditorOptions="dateFormat:'nvarchar',showTimeSpinner:false,showSeconds:false,editable:false" FieldName="ZL002" IsNvarChar="False" NewLine="False" RemoteMethod="False" RowSpan="0" Span="0" Width="125" />
                </QueryColumns>
            </JQTools:JQDataGrid>

            <JQTools:JQDialog ID="JQDialogEdit" runat="server" BindingObjectID="dataFormMaster" Title="試算底稿資訊" DialogLeft="0px" DialogTop="0px">
                <JQTools:JQDataForm ID="dataFormMaster" runat="server" DataMember="COPZL" HorizontalColumnsCount="2" RemoteName="sCOPZL.COPZL" AlwaysReadOnly="False" Closed="False" ContinueAdd="False" disapply="False" DivFramed="False" DuplicateCheck="False" HorizontalGap="0" IsAutoPageClose="False" IsAutoPause="False" IsAutoSubmit="False" IsNotifyOFF="False" IsRejectNotify="False" IsRejectON="False" IsShowFlowIcon="False" ShowApplyButton="False" ValidateStyle="Hint" VerticalGap="0" OnApplied="onApplied">

                    <Columns>
                        <JQTools:JQFormColumn Alignment="left" Caption="底稿號碼" Editor="text" FieldName="ZL001" Format="" MaxLength="11" Width="180" ReadOnly="True" />
                        <JQTools:JQFormColumn Alignment="left" Caption="單據日期" Editor="datebox" FieldName="ZL002" Format="" MaxLength="8" Width="180" ReadOnly="True" EditorOptions="dateFormat:'nvarchar',showTimeSpinner:false,showSeconds:false,editable:false" />
                        <JQTools:JQFormColumn Alignment="left" Caption="部門" Editor="infocombobox" FieldName="ZL003" MaxLength="0" NewRow="False" ReadOnly="True" RowSpan="1" Span="1" Visible="True" Width="180" EditorOptions="valueField:'ME001',textField:'ME002',remoteName:'sCOPZL.ZL003_OPTIONS',tableName:'ZL003_OPTIONS',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,onSelect:onZL003Select,panelHeight:200" />
                        <JQTools:JQFormColumn Alignment="left" Caption="業務" Editor="infocombobox" EditorOptions="valueField:'USERID',textField:'USERNAME',remoteName:'sCOPZL.ZL004_OPTIONS',tableName:'ZL004_OPTIONS',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:true,onBeforeLoad:onZL004BeforeLoad,panelHeight:200" FieldName="ZL004" Format="" MaxLength="10" NewRow="False" ReadOnly="False" Width="180" />
                        <JQTools:JQFormColumn Alignment="left" Caption="幣別" Editor="infocombobox" EditorOptions="valueField:'DRPID',textField:'DRPVALUE',remoteName:'sCOPZL.ZL005_OPTIONS',tableName:'ZL005_OPTIONS',pageSize:'-1',checkData:false,selectOnly:true,cacheRelationText:false,panelHeight:100" FieldName="ZL005" Format="" MaxLength="3" NewRow="True" ReadOnly="True" Width="180" Visible="True" />
                        <JQTools:JQFormColumn Alignment="left" Caption="獎金合計" Editor="numberbox" FieldName="ZL006" Format="" MaxLength="0" NewRow="False" ReadOnly="True" Width="180" EditorOptions="precision:3,groupSeparator:'',prefix:''" />
                        <JQTools:JQFormColumn Alignment="left" Caption="確認碼" Editor="text" FieldName="ZL007" Format="" MaxLength="1" ReadOnly="False" Visible="False" Width="180" />
                    </Columns>
                    <TooItems>
                        <JQTools:JQToolItem ID="toolItemAdd" Enabled="True" Icon="icon-add" ItemType="easyui-linkbutton" OnClick="showSource" Text="選擇試算資料" Visible="True" />
                        <JQTools:JQToolItem ID="toolItemSave" Enabled="True" Icon="icon-save" ItemType="easyui-linkbutton" OnClick="onSave" Text="儲存" Visible="True" />
                        <JQTools:JQToolItem ID="toolItemCalc" Enabled="True" Icon="icon-sum" ItemType="easyui-linkbutton" OnClick="onCalc" Text="試算" Visible="True" />
                        <JQTools:JQToolItem ID="toolItemCancel" Enabled="True" Icon="icon-cancel" ItemType="easyui-linkbutton" OnClick="onDialogEditClose" Text="關閉" Visible="True" />
                    </TooItems>
                </JQTools:JQDataForm>
                <br />
                <JQTools:JQDataGrid ID="dataGridDetail" runat="server" AutoApply="False" DataMember="COPZM" EditDialogID="" Pagination="False" ParentObjectID="dataFormMaster" RemoteName="sCOPZL.COPZL" Title="試算資料" AllowDelete="False" ViewCommandVisible="False" RowNumbers="False" ScrollView="False" AllowAdd="True" AllowUpdate="True" AlwaysClose="False" BufferView="True" CheckOnSelect="False" ColumnsHibeable="False" DeleteCommandVisible="False" DuplicateCheck="False" EditMode="Dialog" EditOnEnter="True" InsertCommandVisible="True" MultiSelect="False" NotInitGrid="False" PageList="10,20,30,40,50" PageSize="10" QueryAutoColumn="False" QueryLeft="" QueryMode="Window" QueryTitle="Query" QueryTop="" RecordLock="False" RecordLockMode="None" TotalCaption="Total:" UpdateCommandVisible="False" Height="400px">

                    <Columns>
                        <JQTools:JQGridColumn Alignment="center" Caption="列入&lt;br/&gt;計算" Editor="checkbox" EditorOptions="on:'Y',off:'N'" FieldName="ZM024" Format="" Width="40" FormatScript="formatStringCheckBox" Visible="True" />
                        <JQTools:JQGridColumn Alignment="left" Caption="試算來源單別-單號-序號&lt;br/&gt;品號" Editor="textarea" EditorOptions="height:40" FieldName="ZM00345" Frozen="False" IsNvarChar="False" MaxLength="0" QueryCondition="" ReadOnly="True" Sortable="False" Visible="True" Width="160">
                        </JQTools:JQGridColumn>
                        <JQTools:JQGridColumn Alignment="left" Caption="品名&lt;br/&gt;規格" Editor="textarea" EditorOptions="height:60" FieldName="TB006_TH006" Frozen="False" IsNvarChar="False" MaxLength="0" QueryCondition="" ReadOnly="True" Sortable="False" Visible="True" Width="160">
                        </JQTools:JQGridColumn>
                        <JQTools:JQGridColumn Alignment="right" Caption="單價" Editor="text" FieldName="TB009_TH012" FormatScript="formatNumber" Frozen="False" IsNvarChar="False" MaxLength="0" QueryCondition="" ReadOnly="True" Sortable="False" Visible="True" Width="50">
                        </JQTools:JQGridColumn>
                        <JQTools:JQGridColumn Alignment="right" Caption="數量&lt;br/&gt;(噸)" Editor="text" FieldName="TB007_TH008" FormatScript="formatNumber" Frozen="False" IsNvarChar="False" MaxLength="0" QueryCondition="" ReadOnly="True" Sortable="False" Visible="True" Width="50">
                        </JQTools:JQGridColumn>
                        <JQTools:JQGridColumn Alignment="center" Caption="地區" Editor="text" FieldName="AREA" Frozen="False" IsNvarChar="False" MaxLength="0" QueryCondition="" ReadOnly="True" Sortable="False" Visible="True" Width="50">
                        </JQTools:JQGridColumn>
                        <JQTools:JQGridColumn Alignment="left" Caption="底稿&lt;br/&gt;號碼" Editor="text" FieldName="ZM001" Format="" Width="50" ReadOnly="True" Visible="False" />
                        <JQTools:JQGridColumn Alignment="left" Caption="底稿&lt;br/&gt;序號" Editor="text" FieldName="ZM002" Format="" Width="45" ReadOnly="True" Visible="False" />
                        <JQTools:JQGridColumn Alignment="left" Caption="來源&lt;br/&gt;單別" Editor="text" FieldName="ZM003" Format="" Width="45" ReadOnly="True" Visible="False" />
                        <JQTools:JQGridColumn Alignment="left" Caption="來源&lt;br/&gt;單號" Editor="text" FieldName="ZM004" Format="" Width="90" ReadOnly="True" Visible="False" />
                        <JQTools:JQGridColumn Alignment="left" Caption="來源&lt;br/&gt;序號" Editor="text" FieldName="ZM005" Format="" Width="45" ReadOnly="True" Visible="False" />
                        <JQTools:JQGridColumn Alignment="right" Caption="盤價" Editor="text" FieldName="ZM006" Format="" Width="50" FormatScript="formatNumber" EditorOptions="" ReadOnly="True" />
                        <JQTools:JQGridColumn Alignment="right" Caption="拋砂&lt;br/&gt;加價" Editor="text" FieldName="ZM007" Format="" Width="50" FormatScript="formatNumber" EditorOptions="" ReadOnly="True" />
                        <JQTools:JQGridColumn Alignment="right" Caption="貼膜&lt;br/&gt;加價" Editor="text" FieldName="ZM008" Format="" Width="50" FormatScript="formatNumber" EditorOptions="" ReadOnly="True" />
                        <JQTools:JQGridColumn Alignment="right" Caption="表面&lt;br/&gt;加價" Editor="text" FieldName="ZM009" Format="" Width="50" FormatScript="formatNumber" EditorOptions="" ReadOnly="True" />
                        <JQTools:JQGridColumn Alignment="right" Caption="包裝&lt;br/&gt;加價" Editor="text" FieldName="ZM010" Format="" Width="50" FormatScript="formatNumber" EditorOptions="" ReadOnly="True" />
                        <JQTools:JQGridColumn Alignment="right" Caption="厚度&lt;br/&gt;加價" Editor="text" FieldName="ZM011" Format="" Width="50" FormatScript="formatNumber" EditorOptions="" ReadOnly="True" />
                        <JQTools:JQGridColumn Alignment="right" Caption="寬度&lt;br/&gt;加價" Editor="text" FieldName="ZM012" Format="" Width="50" FormatScript="formatNumber" EditorOptions="" ReadOnly="True" />
                        <JQTools:JQGridColumn Alignment="right" Caption="長度&lt;br/&gt;加價" Editor="numberbox" FieldName="ZM013" Format="" Width="50" FormatScript="formatNumber" EditorOptions="precision:2,groupSeparator:'',prefix:''" />
                        <JQTools:JQGridColumn Alignment="right" Caption="加工&lt;br/&gt;加價" Editor="numberbox" FieldName="ZM014" Format="" Width="50" FormatScript="formatNumber" EditorOptions="precision:2,groupSeparator:'',prefix:''" />
                        <JQTools:JQGridColumn Alignment="right" Caption="其他&lt;br/&gt;加價" Editor="numberbox" FieldName="ZM015" Format="" Width="50" FormatScript="formatNumber" EditorOptions="" />
                        <JQTools:JQGridColumn Alignment="right" Caption="分條&lt;br/&gt;加價" Editor="numberbox" FieldName="ZM016" Format="" Width="50" FormatScript="formatNumber" EditorOptions="precision:2,groupSeparator:'',prefix:''" />
                        <JQTools:JQGridColumn Alignment="right" Caption="切版&lt;br/&gt;加價" Editor="numberbox" FieldName="ZM017" Format="" Width="50" FormatScript="formatNumber" EditorOptions="precision:2,groupSeparator:'',prefix:''" />
                        <JQTools:JQGridColumn Alignment="right" Caption="修邊&lt;br/&gt;加價" Editor="numberbox" FieldName="ZM018" Format="" Width="50" FormatScript="formatNumber" EditorOptions="precision:2,groupSeparator:'',prefix:''" />
                        <JQTools:JQGridColumn Alignment="right" Caption="鎳&lt;br/&gt;加價" Editor="text" FieldName="ZM019" Format="" Width="50" FormatScript="formatNumber" EditorOptions="" ReadOnly="True" />
                        <JQTools:JQGridColumn Alignment="right" Caption="利息&lt;br/&gt;加價" Editor="text" FieldName="ZM020" Format="" Width="50" FormatScript="formatNumber" EditorOptions="" ReadOnly="True" />
                        <JQTools:JQGridColumn Alignment="right" Caption="佣金&lt;br/&gt;加價" Editor="text" FieldName="ZM021" Format="" Width="50" FormatScript="formatNumber" EditorOptions="" ReadOnly="True" />
                        <JQTools:JQGridColumn Alignment="right" Caption="運費&lt;br/&gt;加價" Editor="text" FieldName="ZM022" Format="" Width="50" EditorOptions="" ReadOnly="True" />
                        <JQTools:JQGridColumn Alignment="right" Caption="獎金" Editor="text" FieldName="ZM023" Format="" Width="80" FormatScript="formatNumber" EditorOptions="" ReadOnly="True" />
                        <JQTools:JQGridColumn Alignment="left" Caption="確認碼" Editor="text" FieldName="ZM025" Format="" Width="120" Visible="False" />
                    </Columns>
                    <RelationColumns>
                        <JQTools:JQRelationColumn FieldName="ZM001" ParentFieldName="ZL001" />
                    </RelationColumns>
                    <TooItems>
                        <JQTools:JQToolItem Enabled="True" Icon="icon-excel" ItemType="easyui-linkbutton" OnClick="exportGrid" Text="匯出" Visible="False" />
                    </TooItems>
                </JQTools:JQDataGrid>

                <JQTools:JQDialog ID="JQDialogSelect" runat="server" BindingObjectID="" DialogCenter="False" DialogLeft="0px" DialogTop="0px" ScrollBars="Auto" Title="挑選試算來源" ShowModal="True">
                    <JQTools:JQDataGrid ID="dataGridSelect" runat="server" AllowAdd="False" AllowDelete="False" AllowUpdate="False" AlwaysClose="True" AutoApply="False" BufferView="True" CheckOnSelect="False" ColumnsHibeable="False" DataMember="SourceCOPZM" DeleteCommandVisible="False" DuplicateCheck="False" EditMode="Dialog" EditOnEnter="True" InsertCommandVisible="False" MultiSelect="True" NotInitGrid="False" PageList="10,20,30,40,50" PageSize="10" Pagination="False" QueryAutoColumn="False" QueryLeft="0px" QueryMode="Panel" QueryTitle="試算來源查詢" QueryTop="0px" RecordLock="False" RecordLockMode="None" RemoteName="sCOPZL.SourceCOPZM" RowNumbers="False" ScrollView="False" Title="試算來源" TotalCaption="Total:" UpdateCommandVisible="False" ViewCommandVisible="False" Height="400px">
                        <Columns>
                            <JQTools:JQGridColumn Alignment="left" Caption="日期" Editor="text" FieldName="FilterDate" Frozen="False" IsNvarChar="False" MaxLength="0" QueryCondition="" ReadOnly="False" Sortable="False" Visible="True" Width="100" FormatScript="formatStringDate">
                            </JQTools:JQGridColumn>
                            <JQTools:JQGridColumn Alignment="left" Caption="單別" Editor="text" FieldName="FormType" Frozen="False" IsNvarChar="False" MaxLength="0" QueryCondition="" ReadOnly="False" Sortable="False" Visible="True" Width="40">
                            </JQTools:JQGridColumn>
                            <JQTools:JQGridColumn Alignment="left" Caption="單號" Editor="text" FieldName="FormID" Frozen="False" IsNvarChar="False" MaxLength="0" QueryCondition="" ReadOnly="False" Sortable="False" Visible="True" Width="90">
                            </JQTools:JQGridColumn>
                            <JQTools:JQGridColumn Alignment="left" Caption="客戶名稱" Editor="text" FieldName="CustName" Frozen="False" IsNvarChar="False" MaxLength="0" QueryCondition="" ReadOnly="True" Sortable="False" Visible="True" Width="300">
                            </JQTools:JQGridColumn>
                        </Columns>
                        <TooItems>
                            <JQTools:JQToolItem ID="toolItemSelectOK" Enabled="True" Icon="icon-ok" ItemType="easyui-linkbutton" OnClick="onSelectOK" Text="確認" Visible="True" />
                            <JQTools:JQToolItem ID="toolItemSelectCancel" Enabled="True" Icon="icon-cancel" ItemType="easyui-linkbutton" OnClick="onDialogSelectClose" Text="關閉" Visible="True" />
                        </TooItems>
                        <QueryColumns>
                            <JQTools:JQQueryColumn AndOr="and" Caption="日期(起)" Condition="&gt;=" DataType="string" DefaultMethod="defFormDateS" Editor="datebox" EditorOptions="dateFormat:'nvarchar',showTimeSpinner:false,showSeconds:false,editable:false" FieldName="FilterDate" IsNvarChar="True" NewLine="True" RemoteMethod="False" RowSpan="0" Span="0" Width="125" />
                            <JQTools:JQQueryColumn AndOr="and" Caption="~" Condition="&lt;=" DataType="string" DefaultMethod="defFormDateE" Editor="datebox" EditorOptions="dateFormat:'nvarchar',showTimeSpinner:false,showSeconds:false,editable:false" FieldName="FilterDate" IsNvarChar="True" NewLine="False" RemoteMethod="False" RowSpan="0" Span="0" Width="125" />
                            <JQTools:JQQueryColumn AndOr="and" Caption="單號" Condition="%" DataType="string" Editor="text" FieldName="FormID" IsNvarChar="False" NewLine="True" RemoteMethod="False" RowSpan="0" Span="0" Width="125" />
                        </QueryColumns>
                    </JQTools:JQDataGrid>
                </JQTools:JQDialog>
                <JQTools:JQDefault ID="defaultMaster" runat="server" BindingObjectID="dataFormMaster" EnableTheming="True">
                    <Columns>
                        <JQTools:JQDefaultColumn CarryOn="False" DefaultValue="(自動編號)" FieldName="ZL001" RemoteMethod="False" />
                        <JQTools:JQDefaultColumn CarryOn="False" DefaultMethod="defZL002" FieldName="ZL002" RemoteMethod="False" />
                        <JQTools:JQDefaultColumn CarryOn="False" DefaultMethod="defZL003" FieldName="ZL003" RemoteMethod="False" />
                        <JQTools:JQDefaultColumn CarryOn="False" DefaultMethod="defZL005" FieldName="ZL005" RemoteMethod="False" />
                        <JQTools:JQDefaultColumn CarryOn="False" DefaultMethod="" FieldName="ZL006" RemoteMethod="False" DefaultValue="0" />
                        <JQTools:JQDefaultColumn CarryOn="False" DefaultValue="Y" FieldName="ZL007" RemoteMethod="False" />
                    </Columns>
                </JQTools:JQDefault>
                <JQTools:JQValidate ID="validateMaster" runat="server" BindingObjectID="dataFormMaster" BorderStyle="NotSet" ClientIDMode="Inherit" Enabled="True" EnableTheming="True" EnableViewState="True" ViewStateMode="Inherit">
                    <Columns>
                        <JQTools:JQValidateColumn CheckNull="True" FieldName="ZL001" RemoteMethod="True" ValidateType="None" />
                        <JQTools:JQValidateColumn CheckNull="True" FieldName="ZL004" RemoteMethod="False" ValidateMessage="請選擇業務" ValidateType="None" />
                    </Columns>
                </JQTools:JQValidate>
            </JQTools:JQDialog>
        </div>
        <script src="../js/Base.js?v=20191002"></script>
        <script src="js/COPMI12.js?v=20191002"></script>
    </form>
</body>
</html>
