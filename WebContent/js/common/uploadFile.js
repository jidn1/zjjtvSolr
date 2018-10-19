function upload(self,type){
	var name = $(self).attr("id");
	if(type == 'standard_dynamic_img'){
		if(CheckExt($(self).val())){
			$('#'+name+"-err").text("请上传" + ImgExt + "类型的图片");
			return false;
		}
	}
	$('#path').val();
	var array = [];
	array.push(name);
	$.ajaxFileUpload({
		url : $('#path').val()+"/upload/ajaxUpload.html?type="+type+"&oldName="+$(self).prev().val(),
		fileElementId: array, // 上传文件的id、name属性名
		dataType: 'text',
		success : function (data) {
			var start = data.indexOf(">");
			if(start != -1) {
				var end = data.indexOf("<", start + 1);
				if(end != -1) {
					data = data.substring(start + 1, end);
				}
			}
			data = eval("("+data+")");
			if(data.msg == 'success'){
				//$('#'+name).prev().val(data.img);
				$('#'+name+"-err").text('');
				if(type == 'standard_dynamic_img'){
					$('#'+name+name).attr("src","/signFile/"+data.img);
					$('#realImg').val(data.img);
				}
			}else {
				$('#'+name+"-err").text(data.re);
			}
			$("#"+name).replaceWith($("#"+name).clone(true));
		}
	});
	$("#"+name).replaceWith($("#"+name).clone(true));
};

function uploadTemplateFile(self){
	var name = $(self).attr("id");
	var array = [];
	array.push(name);
	$.ajaxFileUpload({
		url : $('#path').val()+"/upload/uploadTemplateFile.html?oldName="+$(self).prev().val()+"&status="+$('#template').val(),
		fileElementId: array, // 上传文件的id、name属性名
		dataType: 'text',
		success : function (data) {
			var start = data.indexOf(">");
			if(start != -1) {
				var end = data.indexOf("<", start + 1);
				if(end != -1) {
					data = data.substring(start + 1, end);
				}
			}
			data = eval("("+data+")");
			if(data.msg == 'success'){
				$("#templateName").text(data.fileName);
				$("#tempSize").val(data.size);//文件大小
				$("#tempPath").val("\\"+data.fileName);//路径
				$("#tempExtName").val(data.prefix);
			}else {
				$('#'+name+"-err").text(data.re);
			}
			$("#"+name).replaceWith($("#"+name).clone(true));
		} 
	});
	$("#"+name).replaceWith($("#"+name).clone(true));
}

/**
 * 验证图片的扩展名
 * @param obj
 * @param id
 * @returns  .jpg|.jpeg|.gif|.bmp|.png|
 */
var ImgExt = "jpg,jpeg,bmp,png";
var AllImgExt = ".jpg|.jpeg|.bmp|.png|";// 全部图片格式类型
function CheckExt(obj) {
	FileExt = obj.substr(obj.lastIndexOf(".")).toLowerCase();
	if (AllImgExt.indexOf(FileExt + "|") == -1){// 如果图片文件，则进行图片信息处理
		return true;
	}else{
		return false;
	}
}




