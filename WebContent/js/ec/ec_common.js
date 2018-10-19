function goEdit(url){
	if(url){
		window.location.href=url;
	}else{
		alert("请填写返回的url");
	}
}
/**
 * modal访问url
 * @param url
 * @param data
 */
function openModalUrl(url,data){
	if(url.indexOf('?')!=-1){
		url += '&t=' + Math.random(1000); 
	}else{
		url += '?t=' + Math.random(1000); 
	}
    $.ajax({
        url: url,
        type: 'POST',
        datatype:"json",
        cache:false,
        data: data,
        async:false,
        success: function(result) {
        	$('#remoteModal').html(result);
        	$('#remoteModal').modal("show");
        }
    });
}
/**
 * 打开模态窗口
 * @param id
 */
function openModalWindow(id){
	$("#gray").css("display","block");
	 $("#"+id).css("display","block");
}
/**
 * 关闭模态窗口
 * @param id
 */
function closeModalWindow(id){
	$("#"+id).hide();
	$("#gray").hide();
}
/**
 * 列表上的复选框全选
 * @returns
 */
function selectTblCheckIds() {
	var group=$("#checkAll").attr("group");
	if ($("#checkAll").prop("checked")) {
        $("input[name='"+group+"']").prop("checked", true);
        //$("input[name='"+group+"']").parents('tr').addClass('selected')
    } else {
        $("input[name='"+group+"']").prop("checked", false);
        //$("input[name='"+group+"']").parents('tr').removeClass('selected')
    }
}
/**
 * 列表上的复选框全选
 * @returns
 */
function selectCheckIds(group) {
	if ($("#checkAll").prop("checked")) {
        $("input[name='"+group+"']").prop("checked", true);
    } else {
        $("input[name='"+group+"']").prop("checked", false);
    }
}
/**
 * 获取复选框选中的值
 * @param group 复选框name
 * @returns
 */
function getIdsSimpleTable(group) {
	var ids = [];
	$("input[name='"+group+"']:checked").each(function() {
		ids.push($(this).val());
	});
	return ids.join(',');
}
/**
 * 查询表单提交
 * @param searchFormId
 * @returns
 */
function searchFormFun(searchFormId){
	$("#pageForm").find(":input").each(function(i,m){
		$("#" + searchFormId).append( "<input type='hidden' id='"+m.id+"' value='" + m.value + "' name='" + m.name + "'>");
	});
	$("#" + searchFormId).submit();
}
/**
 * 判断arr中是否有已有str
 */
function strInArray(arr,str){
	for(var i=0;i<arr.length;i++){
		if(arr[i]==str){
			return true;
		}
	}
	return false;
}
/**
 * ie版本是否低于版本9
 * @returns
 */
function ieLt9() {
	var flag=false;
	if(navigator.appName == "Microsoft Internet Explorer"){
		if(navigator.userAgent.indexOf("MSIE 6.0")>0 
				|| navigator.userAgent.indexOf("MSIE 7.0")>0
				|| navigator.userAgent.indexOf("MSIE 8.0")>0){
			flag=true;
		}else{
			if(document.documentMode<9){
				flag=true;
			}
		}
	}
	if(flag){
		alert("尊敬的用户！\n\n  您目前使用的Internet Explorer版本低于IE9，请升级至IE9"); 
	}
}
/**
 * 设置排序字段
 * @param orderByName
 * @param formId
 */
function setSortField(orderByName,formId){
	var orderAscBy=$("#orderAscBy").val();
		if(orderAscBy=="ASC"){
			orderAscBy="DESC";
		}else{
			orderAscBy="ASC";
		}
	$("#orderAscBy").attr("value",orderAscBy);
	$("#orderBy").attr("value",orderByName+" "+orderAscBy);
	quickSearchFormFun(formId);
}
/**
 * 设置排序字段样式
 * @param filedNameString
 */
function setSortFieldDisplay(filedNameString) {
	var filedNames = filedNameString.split("|");
	if(filedNames.length > 0){
		for(var i = 0; i < filedNames.length; i++){
			if(filedNames[i].split(" ").length > 0){
				var orderBy=filedNames[i].split(" ")[0];
				var orderAscBy=filedNames[i].split(" ")[1];
				if(orderAscBy != undefined && orderBy != ""){
					if(orderAscBy == "ASC"){
						$("#" + orderBy + "SortLable").html("<img src='/sysCommon/images/icons/famfamfam/arrow_red_up.png' />");
					}else if(orderAscBy=="DESC"){
						$("#" + orderBy + "SortLable").html("<img src='/sysCommon/images/icons/famfamfam/arrow_red_down.png' />");
					}
				}
			}
		}
	}
}
//快速查询
function quickSearchFormFun(formId) {
	var searchItem=$("#searchItem").val();
	var searchText=$("#searchText").val();
	if(searchItem&&searchText){
		$("#"+searchItem).val(searchText);
	}
	$("#viewIndex").attr("value",0);
	 searchFormFun(formId);
	 
}
//表单提交验证（表单内id和name相同）
function validateForm(formId){
	values = $("#"+formId).serializeArray();  
  	var values, index;  
	var flag=true;
    for(index = 0; index < values.length; ++index){  
    	var fieldClass = $('#'+values[index].name).attr("class");
    	if(fieldClass!=""&&fieldClass!="undefined"&&fieldClass!=null){
	    	if(fieldClass.indexOf("required")>=0){
		    	var returnFlag=checkNotEmpty(values[index].name);
		    	if(!returnFlag){
		    		flag=false;
		    	}
		    }
    	}
    }
	return flag;
} 
function checkNotEmpty(field){
	var fieldId = $('#'+field);
	var fieldValue = fieldId.val();
	if (fieldValue==""||fieldValue=="undefined"||fieldValue==null) {
		var fieldName=$("."+field).html();
		fieldId.addClass("errorC");
		fieldId.next('span').html(fieldName+"不能为空");
		fieldId.next('span').css("display","block");
		return false;
	} else {
		fieldId.addClass("checkedN");
		fieldId.removeClass("errorC");
		fieldId.next('span').css("display","none");
		$(".eee").css("display","none");
		return true;
	}
}
function submitForm(formId){
	$("#" + formId).submit();
}
//通过id验证非空
function checkFormTC(id){
 	var formObj = $('#'+id);
 	var formName = $('#'+id).val();
	 if (formName==""||formName=="undefined"||formName==null) {
		var fieldName=$("."+id).html();
		formObj.addClass("errorC");
		formObj.next('span').html(fieldName+"不能为空");
		formObj.next('span').css("display","block");
		return false;
	} else {
		formObj.addClass("checkedN");
		formObj.removeClass("errorC");
		formObj.next('span').css("display","none");
		$(".eee").css("display","none");
		return true;
	}	 
 }
function mysearch(){
	  if($('.btnw-img').hasClass("dddds")){
		   $('.btnw-img').removeClass('dddds');	
	   }else{
		   $('.btnw-img').addClass('dddds');
	   }

  if($('#z_search').is(':hidden')){
    $('#z_search').show();
	  $('.tabs_con').css('border','1px solid #ddd');
  }
  else{
    $('#z_search').hide();
	  $('.tabs_con').css('border','none');
  }
}