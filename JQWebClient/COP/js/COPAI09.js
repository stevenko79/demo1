var $dgView = $("#dataGridViewer");
var $ZP001_Query = $("#ZP001_Query");
var $ZP002_Query = $("#ZP002_Query");
var $ZP003_Query = $("#ZP003_Query");

function doApply() {

    var $zp001Data = $ZP001_Query.combobox('getData');
    var $zp002Data = $ZP002_Query.combobox('getData');
    var $zp003Data = $ZP003_Query.combobox('getData');

    endEdit($dgView);
    // 現有資料
    var viewData = $dgView.datagrid('getRows');
    // 抓出新增的值
    var insertdRows = $dgView.datagrid("getChanges", "inserted");
    var updatedRows = $dgView.datagrid("getChanges", "updated");
    var info = getInfolightOption($dgView);
    // 傳值用
    var data = new Array();
    var invalidData = [];

    if(insertdRows.length > 0) {
        // 錯誤訊息顯示   
        var Msgs = "";    

        for(var i = 0; i < insertdRows.length; i++ ) {
            
             var row = insertdRows[i];
             if(row["ZP001"] == ''){
                 Msgs += "公稱厚、";
             }

             if(row["ZP002"] == ''){
                Msgs += "內包材、";
            }

            if(row["ZP003"] == ''){
                Msgs += "拋砂、";
            }

            if(Msgs.length > 0) {
                Msgs = Msgs.substring(0, Msgs.length-1);
                $.messager.alert('提示', Msgs + "不能為空。");
                return false;
            }
            
            // 用於計算重複顯示的筆數
             var count = 0;
             
             invalidData = viewData.filter(function (dgData) {
                   // 目前要新增的資料的key
                   var insertKey = "'" + row["ZP001"] + "-" + row["ZP002"] + "-" + row["ZP003"] + "'";
                   // 目前Grid的key
                   var viewKey = "'" + dgData["ZP001"] + "-" + dgData["ZP002"] + "-" + dgData["ZP003"] + "'";

                   if(insertKey == viewKey){
                     count++;                    
                 }                    
                 return count >= 2?true: false;
             });

             if (invalidData.length > 0) {
                 Msgs += "已經有重複資料存在(";
                 Msgs += "公稱厚：" + combobxFilter($zp001Data, row["ZP001"]) + "，";
                 Msgs += "內包材：" + combobxFilter($zp002Data, row["ZP002"])+ "，";
                 Msgs += "拋沙：" + combobxFilter($zp003Data, row["ZP003"]);
                 Msgs += ")。<br/>"; 
                 $.messager.alert('提示', Msgs);
                 handleInvalidRowColor(invalidData, "dataGridViewer");
                 return false;
             }

             invalidData = insertdRows.filter(function (row) {
                return isOverflow(row["ZP004"], 4, 3) && row["ZP004"] != "";
            });

            if (invalidData.length > 0) {
                $.messager.alert('提示', '拋砂加價超過字數!');
                handleInvalidRowColor(invalidData, "dataGridViewer");
                return false;
            }

            invalidData = insertdRows.filter(function (row) {
                return isOverflow(row["ZP005"], 4, 3) && row["ZP005"] != "";
            });

            if (invalidData.length > 0) {
                
                $.messager.alert('提示', '貼膜加價超過字數!');
                handleInvalidRowColor(invalidData, "dataGridViewer");
                return false;
            }

              var d = {};          
              d["ZP001"] = row["ZP001"];
              d["ZP002"] = row["ZP002"];
              d["ZP003"] = row["ZP003"];
              data.push(d);
        }
    
        if(Msgs.length > 0) {
            $.messager.alert('提示', Msgs);
            return false;
        }
    }

    if(updatedRows.length > 0){
        
        invalidData = updatedRows.filter(function (row) {
            return isOverflow(row["ZP004"], 4, 3) && row["ZP004"] != "";
        });

        if (invalidData.length > 0) {
            $.messager.alert('提示', '拋砂加價超過字數!');
            handleInvalidRowColor(invalidData, "dataGridViewer");
            return false;
        }

        invalidData = updatedRows.filter(function (row) {
            return isOverflow(row["ZP005"], 4, 3) && row["ZP005"] != "";
        });

        if (invalidData.length > 0) {            
            $.messager.alert('提示', '貼膜加價超過字數!');
            handleInvalidRowColor(invalidData, "dataGridViewer");
            return false;
        }
    }
      
    serverMethod(info.remoteName, "CheckRepeatVal", data, function(data){
        
        if(data.Success) {
            apply($dgView, function () {
                $.messager.alert('提示', '更新成功');
                $dgView.datagrid('reload');
             });
        }else{
            Msgs = "";
            for(var i = 0; i < data.Data.length; i++ ) {
                var row = data.Data[i];
                Msgs += "已經有重複資料存在(";
                Msgs += "公稱厚：" + row["IJ01_MJ004"] + "，";
                Msgs += "內包材：" + row["IJ02_MJ004"] + "，";
                Msgs += "拋沙：" + row["IJ03_MJ004"];
                Msgs += ")。<br/>";    
            }
            if(Msgs.length > 0) {
                $.messager.alert('提示', Msgs);
                return false;
            }

        }
    });
   
}


function onComboxZP001BeforeLoad(params) {
    var selectedRow = $dgView.datagrid('getSelected');
    // 當選擇的資料無 CREATE_DATE = undefined，表示這筆是新增資料
    // 反之如果 CREATE_DATE = 有資料，表示這筆是編輯資料
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {
        };
        // 篩選出選擇的那筆資料
        queryWord.whereString = "MJ003='" + selectedRow["ZP001"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}

function onComboxZP002BeforeLoad(params) {
    var selectedRow = $dgView.datagrid('getSelected');
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {
        };
        queryWord.whereString = "MJ003='" + selectedRow["ZP002"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }
}

function onComboxZP003BeforeLoad(params) {
    var selectedRow = $dgView.datagrid('getSelected');
    
    if (selectedRow != null && selectedRow["CREATE_DATE"] != undefined && selectedRow["CREATE_DATE"] != "") {
        var queryWord = {
        };
        queryWord.whereString = "MJ003='" + selectedRow["ZP003"] + "'";
        params.queryWord = $.toJSONString(queryWord);
        params.equeryWord = null;
    }else{
        params.mode = "method";
        params.method = "AddZP003Option";        
    }    
}

function combobxFilter(data, val){
    var data = data.filter(function(d){
        return d["MJ003"] == val;
    });

    return data[0]["MJ004"];
}
