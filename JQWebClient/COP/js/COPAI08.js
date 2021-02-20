var $dgView = $("#dataGridView");
var info = getInfolightOption($dgView);

var $ddMaster = $('#JQDialogMaster');
var $dgDetail = $("#dataGridDetail");
// 截取網址用
var $form = $('#headForm');

// Form start
// Form裡的單號
var $formMasterZN001 = $('#dataFormMasterZN001');
// Form裡的日期(起)
var $formMasterZN002 = $('#dataFormMasterZN002');
// Form裡的日期(迄)
var $formMasterZN003 = $('#dataFormMasterZN003');
// 幣別
var $formMasterZN004 = $('#dataFormMasterZN004');
// 鎳價
var $formMasterZN005 = $('#dataFormMasterZN005');
// 備註
var $formMasterZN006 = $('#dataFormMasterZN006');
// Form end

// Dialog start
var $ZN002_Query = $("#ZN002_Query");
var $ZN003_Query = $("#ZN003_Query");
// Dialog end

// 鎳價維護
var $nickel = $form.attr('action').indexOf('Nickel');
// 盤價維護
var $plate = $form.attr('action').indexOf('Plate');

var $doOpenQuery = $("#doOpenQuery");
// 複製上一期盤按鈕
var $toolItemCPPreviousPlate = $("#toolItemCPPreviousPlate");

var allowGroups = ['2200', '2300'];
// 幣別群組
var currencyGroup = '';

var userGroups = getClientInfo("_groupid").split(';');
$(document).ready(function() {
    //取得登入者的groups資料
    $ddMaster.dialog('maximize');

    var length = allowGroups.length;

    for (var i = 0; i < length; i++) {
        var deptNo = allowGroups[i];
        if (userGroups.indexOf(deptNo) != -1) {
            currencyGroup = deptNo;
            switch (currencyGroup) {
                case '2200':
                    currencyGroup = "USD";
                    break;
                case '2300':
                    currencyGroup = "NTD";
                    break;
            }
        }
    }

    // 鎳價(Nickel)時 start
    if ($nickel > 0) {
        // 除了外銷以外，其他的都不能新增、搜尋
        if (userGroups.indexOf(allowGroups[0]) == -1) {
            alert("此功能僅提供外銷同仁使用!");
            var x = document.getElementsByClassName("panel-noscroll");
            x[0].innerHTML = "";
            return false;
        }

        // 日期(起)改成日期
        $ZN002_Query.parent("td").prev("td").text("日期");
        var opts = $dgView.datagrid('getColumnOption', "ZN002");
        opts.title = "日期";

        // 隱藏日期(迄)
        $dgView.datagrid('hideColumn', 'ZN003');
        $ZN003_Query.parent("td").prev("td").attr("hidden", true);
        $ZN003_Query.parent("td").attr('hidden', true);
        $ZN003_Query.parent("td").next("td").attr('hidden', true);
        $ZN003_Query.parent("td").next("td").next("td").attr('hidden', true);

        $dgView.datagrid({
            onBeforeLoad: function(params) {
                var queryWord = params.queryWord !== '' ? $.parseJSON(params.queryWord) : { whereString: '' };

                if (currencyGroup !== '') {
                    queryWord.whereString = queryWord.whereString.replace("1=0", "");
                    if (queryWord.whereString.length > 0) {
                        queryWord.whereString += ' and ';
                    }
                    queryWord.whereString += " ZN004 ='" + currencyGroup + "' AND ZN002 = ZN003";
                }

                params.queryWord = $.toJSONString(queryWord);
                params.equeryWord = null;
            }
        });
    }

    // 鎳價(Nickel)時 end

    // 盤價(Plate)時 start
    if ($plate > 0) {
        // 除了內、外銷以外，其他的都不能新增、搜尋
        if ((userGroups.indexOf(allowGroups[0]) == -1) == (userGroups.indexOf(allowGroups[1]) == -1)) {
            alert("此功能僅提供內、外銷同仁使用!");
            var x = document.getElementsByClassName("panel-noscroll");
            x[0].innerHTML = "";
            return false;
        }

        $dgView.datagrid('hideColumn', 'ZN005'); // 隱藏鎳價欄位
        if (userGroups.indexOf(allowGroups[0]) == -1) {
            $dgDetail.datagrid('hideColumn', 'ZO008'); // 隱藏地區欄位
        }
        $dgView.datagrid({
            onBeforeLoad: function(params) {
                $dgView.datagrid('getPanel').panel('setTitle', '盤價維護作業');

                var queryWord = params.queryWord !== '' ? $.parseJSON(params.queryWord) : { whereString: '' };

                if (currencyGroup !== '') {
                    queryWord.whereString = queryWord.whereString.replace("1=0", "");
                    if (queryWord.whereString.length > 0) {
                        queryWord.whereString += ' and ';
                    }
                    queryWord.whereString += " ZN004 ='" + currencyGroup + "' AND ZN002 < ZN003";
                } else {
                    queryWord.whereString = "1=0";
                }
                params.queryWord = $.toJSONString(queryWord);
                params.equeryWord = null;
            }
        });
    }

    // 盤價時 end
    $dgView.datagrid({
        nowrap: false
    });
});

// 單頭載入時
function onDfMasterLoaded() {
    // 鎳價(Nickel)時 start
    if ($nickel > 0) {

        // 隱藏 start
        // 新增盤價按鈕
        $("#toolItemAddPlate").hide();
        // 複製上一期盤價
        $toolItemCPPreviousPlate.hide();

        // 日期(起)
        $formMasterZN002.parent("td").prev("td").text("日期");
        // 日期(迄)
        $formMasterZN003.parent("td").prev("td").attr("hidden", true);
        $formMasterZN003.parent("td").attr("hidden", true);

        // 盤價用的Detail
        $("#divGDetail").attr("hidden", true);
        // 隱藏 end
    }
    // 鎳價時 end

    // 盤價(Plate)時 start
    if ($plate > 0) {
        // 隱藏鎳價並預設鎳價為0
        $formMasterZN005.parent("td").attr("hidden", true);
        $formMasterZN005.parent("td").prev("td").attr("hidden", true);
        $formMasterZN005.numberbox("setValue", 0);
        // 單號如果是數字，表示在編輯
        // 如果不是數字，表示在新增
        if ($.isNumeric($formMasterZN001.val())) {
            // 隱藏 複製上一期盤價 按鈕
            $toolItemCPPreviousPlate.hide();
        } else {
            $toolItemCPPreviousPlate.show();
        }
    }
    // 盤價時 end

    // 隱藏存檔、關閉按鈕
    $('#dataGridDetail-SubmitDiv').hide();
}

function addPlate() {
    insertItem($dgDetail);
}

function doApply() {
    var data = {};
    // 鎳價時 start
    if ($nickel > 0) {

        var zn005Value = $formMasterZN005.numberbox('getValue');
        if ($formMasterZN002.val() == "" && zn005Value <= 0) {
            $.messager.alert('提示', "日期與鎳價為必填，鎳價必須大於零!");
            return false;
        }
        if (zn005Value <= 0) {
            $.messager.alert('提示', "鎳價必須大於零!");
            return false;
        }
        if (isOverflow(zn005Value, 5, 3)) {
            $.messager.alert('提示', "鎳價超過字數!");
            return false;
        }


        if (getLength($formMasterZN006.val()) > 255) {
            $.messager.alert('提示', "備註字數超過囉!");
            return false;
        }
        // 日期(迄) = 日期
        $formMasterZN003.datebox('setValue', $formMasterZN002.datebox('getValue'));
        data["ZN001"] = $formMasterZN001.val();
        data["ZN002"] = $formMasterZN002.datebox("getValue").replace(/\./g, '');
        data["ZN003"] = $formMasterZN003.datebox("getValue").replace(/\./g, '');
        data["ZN004"] = $formMasterZN004.val();
        data["Uri"] = "Nickel";
    }
    // 鎳價時 end

    // 盤價(Plate)時 start
    if ($plate > 0) {

        endEdit($dgDetail);
        var znoo2Val = $formMasterZN002.datebox('getValue');
        var znoo3Val = $formMasterZN003.datebox('getValue');

        // 日期(起)必須小於日期(迄) 
        if (znoo2Val > znoo3Val || znoo2Val == znoo3Val) {
            $.messager.alert('提示', "日期(起)必須大於日期(迄)!");
            return false;
        }
        // 鎳價=0
        if ($formMasterZN005.textbox('getValue') > 0) {
            $.messager.alert('提示', "鎳價必須為零!");
            return false;
        }

        if (getLength($formMasterZN006.val()) > 255) {
            $.messager.alert('提示', "備註字數超過囉!");
            return false;
        }

        // 抓出新增的值
        var insertdRows = $dgDetail.datagrid("getChanges", "inserted");

        data["ZN001"] = $formMasterZN001.val();
        data["ZN002"] = znoo2Val.replace(/\./g, '');
        data["ZN003"] = znoo3Val.replace(/\./g, '');
        data["ZN004"] = $formMasterZN004.val();
        data["Uri"] = "Plate";

        if (insertdRows.length > 0) {

            // 錯誤訊息顯示   
            var Msgs = "";
            var dgDetailData = $dgDetail.datagrid("getRows");

            for (var i = 0; i < insertdRows.length; i++) {

                var row = insertdRows[i];

                if (row["ZO003"] == '') {
                    Msgs += "鋼種、";
                }

                if (row["ZO005"] == '') {
                    Msgs += "冷熱軋、";
                }

                if (row["ZO006"] == '') {
                    Msgs += "公稱厚度(起)、";
                }

                if (row["ZO007"] == '') {
                    Msgs += "公稱厚度(迄)、";
                }

                if (userGroups.indexOf(allowGroups[0]) != -1 && row["ZO008"] == '') {
                    Msgs += "地區、";
                }

                if (Msgs.length > 0) {
                    Msgs = Msgs.substring(0, Msgs.length - 1) + "不能為空。<br/>";
                    handleInvalidRowColor([row], "dataGridDetail");
                    $.messager.alert('提示', Msgs);
                    return false;
                }

                var invalidData = [];
                // 公稱起迄有無在區間
                // 新增的公稱厚度是否包含於現有區間內
                invalidData = dgDetailData.filter(function(dgData) {
                    var judge =
                        dgData["ZO002"] != row["ZO002"] &&
                        dgData["ZO003"] == row["ZO003"] &&
                        dgData["ZO004"] == row["ZO004"] &&
                        dgData["ZO005"] == row["ZO005"] &&
                        ((
                            dgData["ZO006"] <= row["ZO006"] && row["ZO006"] <= dgData["ZO007"] ||
                            dgData["ZO006"] <= row["ZO007"] && row["ZO007"] <= dgData["ZO007"] ||
                            row["ZO006"] <= dgData["ZO006"] && dgData["ZO006"] <= row["ZO007"] ||
                            row["ZO006"] <= dgData["ZO007"] && dgData["ZO007"] <= row["ZO007"]
                        )) &&
                        dgData["ZO008"] == row["ZO008"];
                    return judge;
                });

                if (invalidData.length > 0) {
                    $.messager.alert('提示', '設定的公稱厚度區間資料與現有資料重複');
                    handleInvalidRowColor(invalidData, "dataGridDetail");
                    return false;
                }
                invalidData = insertdRows.filter(function(row) {
                    return isOverflow(row["ZO009"], 5, 3) && row["ZO009"] != "";
                });

                if (invalidData.length > 0) {
                    $.messager.alert('提示', '盤價超過字數!');
                    handleInvalidRowColor(invalidData, "dataGridDetail");
                    return false;
                }
            }
        }
    }
    // 盤價時 end
    if ($.isNumeric(data["ZN001"])) {
        data["Status"] = "Update";
    } else {
        data["Status"] = "Insert";
    }
    serverMethod(info.remoteName, "CheckRepeatVal", data, function(data) {

        if (data.Success) {
            submitForm($ddMaster);
            $.messager.alert('提示', "更新成功");
        } else {
            $.messager.alert('提示', data.Msg);
            return false;
        }
    });
}

// 盤價 start

// 鋼種
function onComboxZO003BeforeLoad(params) {

    var selectedRow = $dgDetail.datagrid('getSelected');
    // 當選擇的資料無 CREATE_DATE = undefined，表示這筆是新增資料
    // 反之如果 CREATE_DATE = 有資料，表示這筆是編輯資料
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {};
        // 篩選出選擇的那筆資料
        queryWord.whereString = "MJ004='" + selectedRow["ZO003"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}

// 類型
function onComboxZO004BeforeLoad(params) {
    var selectedRow = $dgDetail.datagrid('getSelected');
    // 當選擇的資料無 CREATE_DATE = undefined，表示這筆是新增資料
    // 反之如果 CREATE_DATE = 有資料，表示這筆是編輯資料
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {};
        // 篩選出選擇的那筆資料
        queryWord.whereString = "MJ003='" + selectedRow["ZO004"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}

// 冷熱軋
function onComboxZO005BeforeLoad(params) {
    var selectedRow = $dgDetail.datagrid('getSelected');
    // 當選擇的資料無 CREATE_DATE = undefined，表示這筆是新增資料
    // 反之如果 CREATE_DATE = 有資料，表示這筆是編輯資料
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {};
        // 篩選出選擇的那筆資料
        queryWord.whereString = "MJ003='" + selectedRow["ZO005"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}

// 公稱厚度(起)
function onComboxZO006BeforeLoad(params) {
    var selectedRow = $dgDetail.datagrid('getSelected');
    // 當選擇的資料無 CREATE_DATE = undefined，表示這筆是新增資料
    // 反之如果 CREATE_DATE = 有資料，表示這筆是編輯資料
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {};
        // 篩選出選擇的那筆資料
        queryWord.whereString = "MJ003='" + selectedRow["ZO006"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}

// 公稱厚度(迄)
function onComboxZO007BeforeLoad(params) {
    var selectedRow = $dgDetail.datagrid('getSelected');
    // 當選擇的資料無 CREATE_DATE = undefined，表示這筆是新增資料
    // 反之如果 CREATE_DATE = 有資料，表示這筆是編輯資料
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {};
        // 篩選出選擇的那筆資料
        queryWord.whereString = "MJ003='" + selectedRow["ZO007"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}

// 地區
function onComboxZO008BeforeLoad(params) {
    var selectedRow = $dgDetail.datagrid('getSelected');
    // 當選擇的資料無 CREATE_DATE = undefined，表示這筆是新增資料
    // 反之如果 CREATE_DATE = 有資料，表示這筆是編輯資料
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {};
        // 篩選出選擇的那筆資料
        queryWord.whereString = "DRPID='" + selectedRow["ZO008"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}

// 複製上一期盤價按鈕
function cpPreviousPlate() {

    if ($.isNumeric($formMasterZN001.val())) {
        $.messager.alert('提示', "此功能只能在新增時使用。");
        return false;
    }

    var data = {};

    data["ZO001"] = $formMasterZN001.val();
    data["ZN004"] = currencyGroup;

    serverMethod(info.remoteName, "CPPreviousPlate", data, function(data) {

        if (data.Success) {
            $dgDetail.datagrid('loadData', data.Data);
        } else {
            $.messager.alert('提示', data.Msg);
            return false;
        }
    });

}
// 盤價 end

// 開啟dialog
function doOpenQuery() {
    $("#ZN004_Query").combobox("readonly", true);
    openQuery($dgView);
}

// 關閉dialog
function doCanel() {
    isAutoCloseDialog = true;
    closeForm($ddMaster.selector);
}

function defZN004() {
    return currencyGroup;
}