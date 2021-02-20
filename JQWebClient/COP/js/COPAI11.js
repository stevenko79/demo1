var $dgView = $("#dataGridViewer");
var groups = ''; // 使用者所在群組
var currency = ''; // 幣別

$(document).ready(function() { // 載入 jQuery

    // 取得使用者所在群組
    groups = getClientInfo("_groupid").split(';');

    // 設定使用者群組的幣別，外銷2200：USD，內銷2300：NTD
    if (groups.length > 0) {
        for (var i = 0; i < groups.length; i++) {
            if (groups[i] == '2200') {
                currency = 'USD';
                break;
            } else if (groups[i] == '2300') {
                currency = 'NTD';
                break;
            } else {
                currency = '';
            }
        }
    }

    // 初始載入只抓使用者所在群組的幣別資料，查詢時幣別也直接帶該使用者的幣別
    $dgView.datagrid({
        onBeforeLoad: function(params) {
            var queryWord = params.queryWord !== '' ? $.parseJSON(params.queryWord) : { whereString: '' };

            if (currency !== '') {
                queryWord.whereString = queryWord.whereString.replace("1=0", "");
                if (queryWord.whereString.length > 0) {
                    queryWord.whereString += ' and ';
                }
                queryWord.whereString += "ZR001='" + currency + "'";
            }

            params.queryWord = $.toJSONString(queryWord);
            params.equeryWord = null;
        }
    });
})

// 依據使用者部門，設定其幣別欄位預設值
function getZR001() {
    return currency;
}

function doApply() {

    endEdit($dgView);
    var insertData = $dgView.datagrid("getChanges", "inserted"); // 新增的資料
    var changeData = $dgView.datagrid("getChanges"); // 變更的資料
    var invalidData = []; // 檢核後有問題的資料
    var info = getInfolightOption($dgView); // 取得 GridView 的屬性
    var data = new Array(); // 傳值用
    handleInvalidRowColor(invalidData, $dgView.selector.replace('#', ''));

    // 幣別、鋼種、冷熱軋、公稱厚(起)、公稱厚(迄)、公稱寬，為必填欄位
    if (insertData.length > 0) {
        var msg = '';
        for (var i = 0; i < insertData.length; i++) {
            var row = insertData[i];

            if (row["ZR001"] == '') { msg += "幣別、"; } // 表示使用者不在外銷或內銷部門
            if (row["ZR002"] == '') { msg += "鋼種、"; }
            if (row["ZR003"] == '') { msg += "冷熱軋、"; }
            if (row["ZR004"] == '') { msg += "公稱厚(起)、"; }
            if (row["ZR005"] == '') { msg += "公稱厚(迄)、"; }
            if (row["ZR006"] == '') { msg += "公稱寬、"; }

            if (msg.length > 0) {
                msg = msg.substring(0, msg.length - 1);
                $.messager.alert('提示', msg + "，不能為空。");
                handleInvalidRowColor(insertData, $dgView.selector.replace('#', ''));
                return false;
            }

            var d = {};
            d["ZR001"] = row["ZR001"];
            d["ZR002"] = row["ZR002"];
            d["ZR003"] = row["ZR003"];
            d["ZR004"] = row["ZR004"];
            d["ZR005"] = row["ZR005"];
            d["ZR006"] = row["ZR006"];
            data.push(d);
        }
    }

    // 檢查新增的資料，公稱厚(起)不能大於(迄)
    invalidData = insertData.filter(function(row) {
        return row["ZR004"] > row["ZR005"];
    });
    if (invalidData.length > 0) {
        $.messager.alert('提示', '公稱厚(起)不能大於(迄)');
        handleInvalidRowColor(invalidData, $dgView.selector.replace('#', ''));
        return false;
    }

    // 檢查變更的資料，寬度加價是否溢位，目前資料庫欄位格式為 numeric(8,4)
    invalidData = changeData.filter(function(row) {
        return isOverflow(row["ZR007"], 4, 3);
    });
    if (invalidData.length > 0) {
        $.messager.alert('提示', '寬度加價，整數最多四位，小數點最多後三位');
        handleInvalidRowColor(invalidData, $dgView.selector.replace('#', ''));
        return false;
    }

    // 檢查變更的資料，厚度加價是否溢位
    invalidData = changeData.filter(function(row) {
        return isOverflow(row["ZR008"], 4, 3);
    });
    if (invalidData.length > 0) {
        $.messager.alert('提示', '厚度加價，整數最多四位，小數點最多後三位');
        handleInvalidRowColor(invalidData, $dgView.selector.replace('#', ''));
        return false;
    }

    // 新增的資料間彼此做比較，公稱厚起迄區間不能重疊
    for (var i = 0; i < insertData.length; i++) {
        var row = insertData[i];

        invalidData = insertData.filter(function(changeRow) {
            var changeKey = "'" + changeRow["ZR001"] + "-" + changeRow["ZR002"] + "-" + changeRow["ZR003"] + "-" + changeRow["ZR006"] + "'";
            var insertKey = "'" + row["ZR001"] + "-" + row["ZR002"] + "-" + row["ZR003"] + "-" + row["ZR006"] + "'";
            var crZR004 = changeRow["ZR004"];
            var crZR005 = changeRow["ZR005"];
            var irZR004 = row["ZR004"]; // 新增的公稱厚(起)
            var irZR005 = row["ZR005"]; // 新增的公稱厚(迄)

            if (changeKey == insertKey) {
                if (crZR004 <= irZR004 && irZR004 <= crZR005) {
                    return '公稱厚(起)重疊';
                } else if (crZR004 <= irZR005 && irZR005 <= crZR005) {
                    return '公稱厚(迄)重疊';
                } else if (irZR004 <= crZR004 && crZR004 <= irZR005) {
                    return '公稱厚(起)重疊';
                } else if (irZR004 <= crZR005 && crZR005 <= irZR005) {
                    return '公稱厚(迄)重疊';
                } else {
                    return;
                }
            }
        });

        if (invalidData.length > 1) {
            $.messager.alert('提示', '公稱厚(起)(迄)區間不能重疊');
            handleInvalidRowColor([row], $dgView.selector.replace('#', ''));
            return false;
        }
    }

    // 刪除的資料，就不需再丟資料到 serverMethod 做檢核判斷
    if (data.length === 0) {
        apply($dgView, function() {
            $.messager.alert('提示', '更新成功');
            $dgView.datagrid('reload');
        });
        return true;
    }

    // 新增的資料與資料庫上的資料做比較，公稱厚起迄區間不能重疊
    serverMethod(info.remoteName, "CheckRepeatVal", data, function(data) {

        if (data.length === 0) {
            apply($dgView, function() {
                $.messager.alert('提示', '更新成功');
                $dgView.datagrid('reload');
            });
        } else {
            msg = "公稱厚(起)(迄)區間不能重疊";
            var rows = $dgView.datagrid('getRows')
            for (var i = 0; i < data.length; i++) {
                var d = data[i];
                var rs = rows.filter(function(item) {
                    return item["ZR001"] == d["ZR001"] && item["ZR002"] == d["ZR002"] && item["ZR003"] == d["ZR003"] && item["ZR004"] == d["ZR004"] && item["ZR005"] == d["ZR005"] && item["ZR006"] == d["ZR006"]
                });
                handleInvalidRowColor(rs, $dgView.selector.replace('#', ''));
            }

            if (msg.length > 0) {
                $.messager.alert('提示', msg);
                return false;
            }
        }
    });
}

// 鋼種綁定，編輯資料時，下拉只顯示原新增的選項，不允許作變更
function onComboxZR002BeforeLoad(params) {
    var selectedRow = $dgView.datagrid('getSelected');
    // 當選擇的資料 CREATE_DATE 不為空或不是 undefined，表示是在編輯；反之如果沒有 CREATE_DATE，表示在新增
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {};
        queryWord.whereString = "substring(ltrim(MJ004),1,3)='" + selectedRow["ZR002"] + "'"; // 篩選出選擇的那筆資料
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}

// 冷熱軋綁定
function onComboxZR003BeforeLoad(params) {
    var selectedRow = $dgView.datagrid('getSelected');
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {};
        queryWord.whereString = "MJ003='" + selectedRow["ZR003"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}

// 公稱厚(起)綁定
function onComboxZR004BeforeLoad(params) {
    var selectedRow = $dgView.datagrid('getSelected');
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {};
        queryWord.whereString = "MJ003='" + selectedRow["ZR004"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}

// 公稱厚(迄)綁定
function onComboxZR005BeforeLoad(params) {
    var selectedRow = $dgView.datagrid('getSelected');
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {};
        queryWord.whereString = "MJ003='" + selectedRow["ZR005"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}

// 公稱寬綁定
function onComboxZR006BeforeLoad(params) {
    var selectedRow = $dgView.datagrid('getSelected');
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {};
        queryWord.whereString = "MJ003='" + selectedRow["ZR006"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}