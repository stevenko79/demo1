var $dgView = $("#dataGridViewer");

function doApply() {

    endEdit($dgView);
    // 現有資料
    var viewData = $dgView.datagrid('getRows');
    // 改變資料
    var changesData = $dgView.datagrid('getChanges', "inserted");

    var info = getInfolightOption($dgView);
    // 傳值用
    var data = new Array();
    // // 用於比對資料
    var invalidData = [];
    for (var i = 0; i < changesData.length; i++) {

        var row = changesData[i];
        // 用於計算是否有重複值
        var count = 0;
        // 成品表面 start
        if (row["ZQ001"] == "") {
            $.messager.alert('提示', '成品表面不能為空');
            return false;
        }

        invalidData = viewData.filter(function(vData) {
            if (row["ZQ001"] == vData["ZQ001"]) {
                count++;
            }
            return count >= 2;
        });

        if (invalidData.length > 0) {
            $.messager.alert('提示', '成品表面不能重複');
            // 設定資料檢核樣式
            handleInvalidRowColor(invalidData);
            return false;
        }
        // 成品表面 end


        // 表面加價 start
        if (row["ZQ002"] === "") {
            $.messager.alert('提示', '表面加價不能為空');
            return false;
        }

        var checkDigit = ('' + row["ZQ002"]).split('.');
        if (checkDigit.length > 1 && checkDigit[1].length > 4) {
            $.messager.alert('提示', '表面加價只存至小數點後第四位');
            return false;
        }
        // 表面加價 end

        var d = {};
        d["ZQ001"] = row["ZQ001"];
        data.push(d);
    }

    serverMethod(info.remoteName, "CheckRepeatVal", data, function(data) {

        if (data.Success) {
            apply($dgView, function() {
                $.messager.alert('提示', '更新成功');
                $dgView.datagrid('reload');
            });
        } else {
            var Msgs = "";
            for (var i = 0; i < data.Data.length; i++) {
                var row = data.Data[i];
                Msgs += "已經有重複資料存在(成品表面：";
                Msgs += row["MJ004"] + ")。<br/>";
            }
            if (Msgs.length > 0) {
                $.messager.alert('提示', Msgs);
                return false;
            }

        }
    });
}


function onComboxZQ001BeforeLoad(params) {
    var selectedRow = $dgView.datagrid('getSelected');
    // 當選擇的資料無 CREATE_DATE = undefined，表示這筆是新增資料
    // 反之如果 CREATE_DATE = 有資料，表示這筆是編輯資料
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {};
        // 篩選出選擇的那筆資料
        queryWord.whereString = "MJ003='" + selectedRow["ZQ001"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}