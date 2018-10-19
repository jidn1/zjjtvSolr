

//导出器具
function excel(){
	var path = $("#path").val();
	
	var ids = [];
	$('input[name="ids"]:checked').each(function(){ 
	 	id =  $(this).val();
		ids.push(id);
	});
	var idsAll = [];
	$('input[name="ids"]').each(function(){ 
	 	id =  $(this).val();
		idsAll.push(id);
	});
	
	if(ids.length > 0){
		 if(confirm("确定导出所选择的数据吗?")){
			 $("#id").val(ids);
			 $("#MyInstruments").attr("action",path+"/equip/exportEquipAccountByExcel.do").submit();
	    } 
	}else if(idsAll.length > 0){
		if(confirm("您没有选择数据,将导出全部数据!")){
			$("#id").val(idsAll);
			$("#MyInstruments").attr("action",path+"/equip/exportEquipAccountByExcel.do").submit();
		}
	}
	
	
}
//全文查询
function query(){
	var path = $("#path").val();
	var filed = $("#controlCode").val();
	var starTime = $("#starTime").val();
	var endTime = $("#endTime").val();
	$("#filed").val(filed);
	$("#starTimes").val(starTime);
	$("#endTimes").val(endTime);
	$("#pageForm").attr("action",path+"/equip/myAppliances.do").submit();
} 

//添加器具
function addEquipment(){
	var path = $("#path").val();
	$("#MyInstruments").attr("action",path+"/equip/toEquip.do").submit();
	//$("#MyInstruments").attr("action",path+"/page/demotohtml.do").submit();
} 
//列表双击编辑
function dbClickUpdate(obj){
	obj.readOnly=false;
	$(obj).css("border","1px solid #ff7496");
	
}
//列表失焦后变为只读
function inputContet(obj){
	obj.readOnly=true;
	$(obj).css("border","");
}
//删除器具
function deleteEquip(){
	var ischecked = false;
	var path = $("#path").val();
	var select=document.getElementsByName("ids");
	 for(var i=0;i<select.length;i++){    
		 if(select[i].checked == true){
	    		ischecked = true;
	    	}
     }
	 var ids = [];
		$('input[name="ids"]:checked').each(function(){ 
		 	id =  $(this).val();
			ids.push(id);
		});
		$("#id").val(ids);
	 if(!ischecked){
			confirm("请选择要删除的器具！");
		}else{
			$("#MyInstruments").attr("action",path+"/equip/deleteEquipment.do").submit();
		}
	
}

//单个修改保存器具
function updateEquip(obj,id){
	 var path = $("#path").val();
	 var $td = $(obj).parents('tr').children('td');
	 var equipmentName = $td.eq(2).children('input').val();
	 var manufacturer = $td.eq(3).children('input').val();
	 var serialNumber = $td.eq(4).children('input').val();
	 var equipmentModel = $td.eq(5).children('input').val();
	 var validDate = $td.eq(6).children('input').val();
	 var verificationInstitution = $td.eq(7).children('input').val();
	 var subordinateSector = $td.eq(8).children('input').val();
	
	 $("#equipmentName").val(equipmentName);
     $("#manufacturer").val(manufacturer);
     $("#serialNumber").val(serialNumber);
     $("#equipmentModel").val(equipmentModel);
     $("#validDate").val(validDate);
     $("#verificationInstitution").val(verificationInstitution);
     $("#subordinateSector").val(subordinateSector);
     $("#id").val(id);
	$("#MyInstruments").attr("action",path+"/equip/updateEquipment.do").submit();
	
}

//check全选按钮
function checkedAll(){
	var allcheckBoxs=document.getElementById("checkbox_project");    
    var select=document.getElementsByName("ids");
    
    if(allcheckBoxs.checked){ //全选按钮选中其他的都选中  
       for(var i=0;i<select.length;i++){    
    	   select[i].checked = true;    
       }    
    }else{  //取消则都取消
      for(var i=0;i<select.length;i++){    
    	  select[i].checked = false;    
      }    
    }    
}
//单个check选中
function checksingle(){
	var ischecked = true;
	var allcheckBoxs=document.getElementById("checkbox_project");  
	var select=document.getElementsByName("ids");
	for(var i =0;i<select.length;i++){
		
    	if(select[i].checked == false){
    		ischecked = false;
    	}
    }
	if(ischecked){
		allcheckBoxs.checked = true;
	}else{
		allcheckBoxs.checked = false;
	}
	
}

//展示批量修改页面
function batchUpdate() {
	var ids = [];
	$('input[name="ids"]:checked').each(function(){ 
	 	id =  $(this).val();
		ids.push(id);
	});
	
	if(ids.length>0){
		openModalWindow('deptInfoModal');
	}else{
		confirm("请勾选要修改的器具！")
	}
	
}
//批量修改方法
function seebatchUpdate(){
	var equipmentName = $("#equipmentNames").val().trim();
	var manufacturer = $("#manufacturers").val().trim();
	var verificationInstitution = $("#verificationInstitutions").val().trim();
	var equipmentModel = $("#equipmentModels").val().trim();
	var subordinateSector = $("#subordinateSectors").val().trim();
	var validDate=$("#validDates").val().trim();
	var serialNumber = $("#serialNumbers").val().trim();
	
	$('input[name="ids"]:checked').each(function(){ 
		var $td = $(this).parents('tr').children('td');
		if(equipmentName != "" && equipmentName != null){
			 $td.eq(2).children('input').val(equipmentName);
		}
		if(manufacturer != "" && manufacturer != null){
			 $td.eq(3).children('input').val(manufacturer);
		}
		if(serialNumber != "" && serialNumber != null){
			$td.eq(4).children('input').val(serialNumber);
		}
		if(equipmentModel != "" && equipmentModel != null){
			$td.eq(5).children('input').val(equipmentModel);
		}
		if(validDate != "" && validDate != null){
			$td.eq(6).children('input').val(validDate);
		}
		if(verificationInstitution != "" && verificationInstitution != null){
			$td.eq(7).children('input').val(verificationInstitution);
		}
		if(subordinateSector != "" && subordinateSector != null){
			$td.eq(8).children('input').val(subordinateSector);
		}
	});
}

//批量修改保存方法
function savebatchUpdate(){
	var path = $("#path").val();
	var ids = [];
	$('input[name="ids"]:checked').each(function(){ 
	 	id =  $(this).val();
		ids.push(id);
	});
	$("#equipmentId").val(ids);
	$("#batchForm").attr("action",path+"/equip/batchUpdateEquipment.do").submit();
}

    function uploadExcelInstrumentsData() {
    	$("#excelPath").val("");
    	$("#excelPath").removeClass("errorC");
    	$("#excelPath").nextAll('span').attr("style","display:none;");
    	openModalWindow("myModal");
    }
//导入Excel数据
function saveFile(formId){
	    var flag = true; 
    	var path = $("#path").val();
    	var formData = new FormData($("#ImportInstrumentsByExcel")[0]); 
    	var obj=$("#excelPath");
    	if($("#excelPath").val()=='' || $("#excelPath").val()=='undefined' || $("#excelPath").val()==null){
    		confirm("请选择要上传的文件！");
    		return false;
    	}else{
    		var excelPath = $("#excelPath").val();
    		var suffix = excelPath.substring(excelPath.lastIndexOf(".")+1,excelPath.length);
        	if(suffix.indexOf("xls")!=0){
        		confirm("请上传xls格式的文件！");
        		$("#excelPath").val("");
        		return false;
        	}
    	}
    	
    		$('.alert-btn-a').css("background-color","#ddd");
    		$('.alert-btn-a').attr("disabled","true");
    		$.ajax({
    			url : ""+path+"/equip/importEquipmentByExcel.do",
    			type : 'POST',
    			data : formData,
    			async:false,
    			cache: false,  
    	        contentType: false,  
    	        processData: false,
    			error : function(data) {
    			},
    			success : function(data) {
    				if(confirm("数据导入成功！总数："+data.sheetLastRowNumber+"条,\n其中上传的文件中有"+data.excelRepeatCount+"条重复\n确定则覆盖已重复的数据？")){
    					closeModalWindow('myModal');
    					$("#ImportInstrumentsByExcel").attr("action",path+"/equip/myAppliances.do").submit();
    				}
    			}
    		 });
}
    
	
	function excel_upload_callback(msg){
		window.location.href="MyInstruments";
		if(msg)alert(msg);
	}
    /**
     *生成送检计划
     **/
    function GenerateEquipAccountPlan() {
    	var str = '';
    	var equipCheckStatusFlag = false;
    	var equipStatus = false;
	    $("input[name='ids']:checked").each(function (i, o) {
	    	var pId = $(this).val();
	    	var planId = $('#equipSendPlan_'+pId).val();
	    	var equipStatusId = $('#equipStatus_'+pId).val();
	    	if(equipStatusId!="EQUIP_STATUS1"&&equipStatusId!="EQUIP_STATUS10"){
	    		equipStatus= true;
			}
	    	if(planId){
	    		equipCheckStatusFlag = true;
	    		return false;
    		}
	        str += pId;
	        str += ",";
	    });
	    if (equipCheckStatusFlag) {
	    	alert("器具已在计划中！" );
	    	return false;
	    }
	    if (equipStatus) {
	    	alert("器具不可用！" );
    		return false;
	    }
	    if (str.length > 0) {
	        var ids = str.substr(0, str.length - 1);
	    	window.location.href="GenerateEquipAccountPlan?equipIds="+ids;
	    } else {
	        alert("至少选择一条记录操作");
	    }
	}
	
	
	
	function GenerateEquipTaskOrder(){
	    var str = '';
	    var equipCheckStatusFlag = false;
	    var equipStatus = false;
	    var equipOrderTypes=[];
	    $("input[name='ids']:checked").each(function (i, o){
	    	var pId = $(this).val();
			if(!in_array(equipOrderTypes,$("#equipOrderType"+pId).val())){
				equipOrderTypes.push($("#equipOrderType"+pId).val());
			}
		});
	    
	    if(equipOrderTypes.length>1){
			alert("所选择的器具中 [送检类型] 不一致!");
			return false;
	    }
	    
	    $("input[name='ids']:checked").each(function (i, o) {
	    	var pId = $(this).val();
	    	var taskOrderId = $('#equipTaskOrder_'+pId).val();
	    	var equipStatusId = $('#equipStatus_'+pId).val();
	    	if(equipStatusId!="EQUIP_STATUS1"&&equipStatusId!="EQUIP_STATUS10"){
	    		equipStatus= true;
			}
	    	if(taskOrderId){
	    		equipCheckStatusFlag = true;
	    		return false;
    		}
	        str += pId;
	        str += ",";
	    });
	    if (equipCheckStatusFlag) {
	    	alert("器具已在订单中！" );
	    	return false;
	    }
	 	if (equipStatus) {
	    	alert("器具不可用！" );
    		return false;
	    }
	    if (str.length > 0) {
	        var ids = str.substr(0, str.length - 1);
	    	window.location.href="GenerateEquipTaskOrder?ids="+ids;
	    } else {
	        alert("至少选择一条记录操作");
	    }
	}
	/**
	 * 判断arr中是否有已有str
	 */
function in_array(arr,str){
	for(var i=0;i<arr.length;i++){
		if(arr[i]==str){
			return true;
		}
	}
	return false;
}

