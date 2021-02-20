var $dataGridView = $('#dataGridView');
var $dataFormMaster = $('#dataFormMaster');
var $dataGridSelect = $('#dataGridSelect');
var $dataGridDetail = $('#dataGridDetail');
var $dialogEdit = $('#JQDialogEdit');
var $dialogSelect = $('#JQDialogSelect');
var $comboZL003Query = $('#ZL003_Query');
var group = '';
var col2200Hide = ['ZM018', 'ZM013', 'ZM016', 'ZM017']; //外銷隱藏欄位
var col2300Hide = ['AREA', 'ZM020', 'ZM021', 'ZM022', 'ZM014', 'ZM019']; //內銷隱藏欄位
var allowGroups = ['2200', '2300'];
var isAllowClose = false; //是否儲存後要關閉Dialog
var isEditMode = false; //是否為編輯狀態
var isShowAppliedMsg = false; //是否顯示儲存後的訊息
var ishandleSelectedValues = false; //是否處理試算的資料

$(document).ready(function() {

    var groups = getClientInfo("_groupid").split(';'); //取得登入者的groups資料
    var length = allowGroups.length;

    for (var i = 0; i < length; i++) {
        var deptNo = allowGroups[i];
        if (groups.indexOf(deptNo) != -1) {
            group = deptNo;
            break;
        }
    }

    $dataGridView.datagrid({
        onBeforeLoad: function(params) {
            var queryWord = params.queryWord !== '' ? $.parseJSON(params.queryWord) : { whereString: '' };
            queryWord.whereString = queryWord.whereString.replace("1=0", "");
            if (queryWord.whereString.length > 0) {
                queryWord.whereString += ' and ';
            }
            queryWord.whereString += "ZL003='" + group + "'";
            params.queryWord = $.toJSONString(queryWord);
            params.equeryWord = null;
        }
    });

    $dataGridSelect.datagrid({
        onBeforeLoad: function(params) {
            var queryWord = params.queryWord !== '' ? $.parseJSON(params.queryWord) : { whereString: '' };
            var value = $dataFormMaster.find('[comboname="ZL004"]').combo('getValue');

            if (value !== "") {
                queryWord.whereString = queryWord.whereString.replace("1=0", "");
            }

            if (queryWord.whereString.length > 0) {
                queryWord.whereString += ' and ';
            }
            queryWord.whereString += "DeptNo='" + group + "' and EmpNo='" + value + "'";

            params.queryWord = $.toJSONString(queryWord);
            params.equeryWord = null;
        }
    });

    $dialogEdit.dialog({
        closable: false,
        onOpen: function() {
            var $this = $(this);
            $this.panel('resize', {
                width: window.innerWidth - 25,
                height: window.innerHeight,
            });
            $('#dataGridDetail-SubmitDiv').hide();
        },
        onBeforeClose: function() {
            if (isAllowClose) {
                isAllowClose = false;
                $dataGridView.datagrid('reload');
                return true;
            }
            return false;
        }
    });

    $dialogSelect.dialog({
        closable: false,
        onOpen: function() {
            var $this = $(this);
            var handleColumn = group === '2300' ? 'hideColumn' : 'showColumn';

            $dataGridSelect.datagrid('resize');
            $this.panel('maximize');

            $('#dataGridSelect-SubmitDiv').hide();
            $dataGridSelect.datagrid('setWhere', "FilterDate>='" + defFormDateS().replace(/\./g, '') + "' and FilterDate<='" + defFormDateE().replace(/\./g, '') + "'");
        },
        onClose: function() {
            $dataGridSelect.datagrid('setWhere', '1<>1');
            $('#FormID_Query').val('');
        }
    });

    $dataGridDetail.datagrid({
        nowrap: false,
        onBeforeLoad: function(param) {
            var row = $dataGridDetail.datagrid('getSelected');
            if (row != null) {
                endEdit($dataGridDetail);
            }
        }
    });
});

function showSource() {
    var value = $dataFormMaster.find('[comboname="ZL004"]').combo('getValue');
    if (value === '') {
        $.messager.alert('提示', '請先選擇業務');
        return false;
    }
    $dialogSelect.dialog('open');
}

function onVoid() {
    var row = $dataGridView.datagrid('getSelected');

    if (row == null) {
        $.messager.alert('提示', '請選擇要作廢的資料');
        return false;
    }

    var fieldZL001 = row["ZL001"].trim();
    $.messager.confirm({
        title: '提示',
        msg: '確認作廢這筆資料(底稿號碼:' + fieldZL001 + ')?',
        fn: function(r) {
            if (r) {
                var info = getInfolightOption($dataGridView);
                var params = {};
                params["ZL001"] = fieldZL001;
                serverMethod(info.remoteName, "VoidData", params, function(result) {
                    if (result["Success"] === true) {
                        $.messager.alert('提示', '作廢成功');
                        $dataGridView.datagrid('reload');
                    } else {
                        $.messager.alert('提示', '作廢失敗');
                    }
                })
            }
        }
    });
}

function onApplied(rows) {
    var row = rows[0];
    var $fieldZL001 = $dataFormMaster.find('input[name="ZL001"]');
    var rowZL001 = row["ZL001"];

    if (ishandleSelectedValues) {
        ishandleSelectedValues = false;
        handleSaveSelectedValues(rowZL001);
    } else if ($fieldZL001.val() != rowZL001) {
        $dialogEdit.panel('close');
        openForm($dialogEdit.selector, row, "updated", 'dialog', $dataGridView.attr('keyColumns'));
    }

    if (isShowAppliedMsg) {
        $.messager.alert('提示', '儲存成功');
    }

    $.messager.progress('close');
}

function onInsert() {
    isEditMode = false;
    $dataFormMaster.find('[comboname="ZL004"]').combo('enable');
}

function onEdit() {
    isEditMode = true;
    $dataFormMaster.find('[comboname="ZL004"]').combo('disable');
}

function onCalc() {
    endEdit($dataGridDetail);

    var changeRows = $dataGridDetail.datagrid('getChanges');
    if (changeRows.length > 0) {
        $.messager.alert('提示', '請先儲存資料');
        return false;
    }

    $.messager.progress({
        title: '請稍候',
        msg: '資料計算中...'
    });

    var fieldZL001 = $dataFormMaster.find('input[name="ZL001"]').val();
    var info = getInfolightOption($dataGridDetail);
    var params = {};
    params["ZL001"] = fieldZL001;
    serverMethod(info.remoteName, "CalculateData", params, function(data) {
        if (data["Success"] === true) {
            var fieldZL006 = parseFloat(data["Msg"]);

            if (isNaN(fieldZL006)) {
                $.messager.alert('提示', '計算完成，請重新開啟頁面');
                $.messager.progress('close');
                return;
            }

            $dataFormMaster.find('input[numberboxname="ZL006"]').numberbox('setValue', fieldZL006);
            $dataGridDetail.datagrid('reload');
            $.messager.alert('提示', '計算完成');

        } else {
            $.messager.alert('提示', '計算過程發生錯誤，請通知資訊人員');
            console.log(data["Msg"]);
        }

        $.messager.progress('close');
    });
}

function onSave() {

    $.messager.progress({
        title: '請稍候',
        msg: '資料處理中...'
    });

    isShowAppliedMsg = true;

    endEdit($dataGridDetail);
    submitForm($dialogEdit.selector);
}

function onSelectOK() {
    var rows = $dataGridSelect.datagrid('getChecked');

    if (rows.length === 0) {
        $.messager.alert('提示', '請勾選要試算的資料');
        return false;
    }

    $.messager.progress({
        title: '請稍候',
        msg: '資料處理中...'
    });

    var fieldZL001 = $dataFormMaster.find('input[name="ZL001"]').val();
    if (isNaN(parseInt(fieldZL001))) {
        ishandleSelectedValues = true;
        isShowAppliedMsg = false;
        submitForm($dialogEdit.selector);
    } else {
        handleSaveSelectedValues(fieldZL001);
    }
}

function handleSaveSelectedValues(fieldZL001) {
    var rows = $dataGridSelect.datagrid('getChecked');
    var detailRows = $dataGridDetail.datagrid('getRows');
    var value = $dataFormMaster.find('[comboname="ZL004"]').combo('getValue');
    var params = {};
    var msg = '';

    params["ZL001"] = fieldZL001;
    params["DeptNo"] = group;
    params["EmpNo"] = value;
    params["List"] = [];

    rows.forEach(function(row) {

        var existsRows = detailRows.filter(function(item) {
            return item["ZM003"].trim() == row["FormType"].trim() &&
                item["ZM004"].trim() == row["FormID"].trim();
        });

        if (existsRows.length > 0) {
            msg += ('單別-單號：' + row["FormType"].trim() + '-' + row["FormID"].trim() + '已在試算明細<br/>');
        }

        var d = {};
        d["ZM004"] = row["FormType"].trim();
        d["ZM005"] = row["FormID"].trim();

        params["List"].push(d);
    });

    if (msg !== '') {
        $.messager.alert('提示', msg);
        return false;
    }

    $.messager.progress({
        title: '請稍候',
        msg: '資料處理中...'
    });

    var info = getInfolightOption($dataGridSelect);
    serverMethod(info.remoteName, "GetExpandData", params, function(msg) {
        $.messager.progress('close');
        if (isNaN(parseInt(msg))) {
            $.messager.alert('提示', msg);
            return;
        }

        $dialogSelect.panel('close');

        //因為新增時挑選試算來源會自動儲存，所以需要重新開啟編輯dialog
        if (isNaN($dataFormMaster.find('input[name="ZL001"]').val())) {
            var row = $dataGridView.datagrid('getSelected');

            $dialogEdit.panel('close');

            if (row != null) {
                openForm($dialogEdit.selector, row, "updated", 'dialog', $dataGridView.attr('keyColumns'));
                $dataFormMaster.find('[comboname="ZL004"]').combo('disable');
            }
        } else {
            $dataGridDetail.datagrid('reload');
        }
    });
}

function onDialogSelectClose() {
    $dialogSelect.panel('close');
}

function onDialogEditClose() {

    endEdit($dataGridDetail);
    var changeRows = $dataGridDetail.datagrid('getChanges');

    if (changeRows.length > 0) {
        $.messager.confirm({
            title: '提示',
            msg: '試算資料有修改過，確認不儲存就要離開?',
            fn: function(r) {
                if (r) {
                    handleClose();
                }
            }
        });
    } else {
        handleClose();
    }

    function handleClose() {
        $dataGridDetail.datagrid('loadData', []);
        isAllowClose = true;
        $dialogEdit.panel('close');
    }
}

function onZL004BeforeLoad(params) {

    var queryWord = {};
    queryWord.whereString = "GROUPID='" + group + "'";

    if (isEditMode === true) {
        var row = $dataGridView.datagrid('getSelected');
        queryWord.whereString += "and USERID='" + row["ZL004"].trim() + "'";
    }

    params.queryWord = $.toJSONString(queryWord);
    params.equeryWord = null;
}

function onZL003Select(row) {
    $dataFormMaster.find('[comboname="ZL004"]').combobox('reload');

    var handle2200 = 'showColumn';
    var handle2300 = 'showColumn';

    switch (row["ME001"].trim()) {
        case "2200":
            handle2200 = 'hideColumn';
            break;
        case "2300":
            handle2300 = 'hideColumn';
            break;
    }

    col2200Hide.forEach(function(col) {
        $dataGridDetail.datagrid(handle2200, col);
    });
    col2300Hide.forEach(function(col) {
        $dataGridDetail.datagrid(handle2300, col);
    });
}

function defZL002() {
    var today = new Date();
    return today.getUTCFullYear().toString() +
        ((today.getUTCMonth() + 1).toString()).padStart('2', '0') +
        today.getUTCDate().toString().padStart('2', '0');
}

function defZL003() {
    return group;
}

function defZL005() {

    if (group === '2300') {
        return 'NTD';
    }

    if (group === '2200') {
        return 'USD';
    }

    return '';
}

function defFormDateS() {
    var date = new Date();
    var firstDate = new Date(date.getFullYear(), date.getMonth() - 1, 1);
    var result = firstDate.getFullYear() + '.' + (firstDate.getMonth() + 1).toString().padStart(2, '0') + '.' + firstDate.getDate().toString().padStart(2, '0');
    return result;
}

function defFormDateE() {
    var date = new Date();
    var lastDate = new Date(date.getFullYear(), date.getMonth(), 0);
    var result = lastDate.getFullYear() + '.' + (lastDate.getMonth() + 1).toString().padStart(2, '0') + '.' + lastDate.getDate().toString().padStart(2, '0');
    return result;
}