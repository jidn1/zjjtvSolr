


//修改头像
function updateLogo() {
	$("#excelPath").val("");
	$("#excelPath").removeClass("errorC");
	$("#excelPath").nextAll('span').attr("style","display:none;");
	openModalWindow("myModal");
}
//上传图片直接在页面显示
function uploadFile(file, fileid) {
	var MAXWIDTH = 206;
	var MAXHEIGHT = 131;
	var filesize = file.files[0].size;
	var filename = $("#"+file.id).val().substring(pos+1);
    if(filesize>1024*1024){
    	confirm("文件超过1M，请在重新选择");
    	$("#myFile").val("");
    	return false;
    }
    var aaa = filename.substring(filename.lastIndexOf('.')).toUpperCase();
    var geshi ='.JPG,.JPEG,.TGA,.BMP,.PNG';
    if(filename.lastIndexOf('.')==-1 || geshi.indexOf(aaa)==-1){
    	confirm("请选择格式为.JPG,.JPEG,.TGA,.BMP,.PNG的图片");
    	$("#myFile").val("");
    	return false;
    }
    if(filename.length>50){
    	confirm("文件名太长，请在重新选择");
    	$("#myFile").val("");
    	return false;
    }
	if (file.files && file.files[0]) {
		var img = document.getElementById(fileid);
		img.onload = function() {
			var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth,
					img.offsetHeight);
			img.width = rect.width;
			img.height = rect.height;
			// img.style.marginLeft = rect.left+'px';
			img.style.marginTop = rect.top + 'px';
		}
		var reader = new FileReader();
		reader.onload = function(evt) {
			img.src = evt.target.result;
		}
		reader.readAsDataURL(file.files[0]);
	} else // 兼容IEserviceStation!addServiceStation.do
	{
		var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
		file.select();
		var src = document.selection.createRange().text;
		var img = document.getElementById(fileid);
		img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
		var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth,
				img.offsetHeight);
		status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
		div.innerHTML = "<div id=divhead style='width:" + rect.width
				+ "px;height:" + rect.height + "px;margin-top:" + rect.top
				+ "px;" + sFilter + src + "\"'></div>";
	}
	$(file).parent().find("span").find("a").each(function() {
		var text = $(this).text();
		if(text=="删除"){
			$(this).remove();
		}
	})
	//$(file).parent().find("span").html("<a href='javascript:' fileid ='"+fileid+"' onclick='delImage(this)' style='color: red;font-size: 15px'>删除</a>");
	var pos = $("#" + file.id).val().lastIndexOf("\\") * 1;
	var filename = $("#" + file.id).val().substring(pos + 1);
	$("input[name='" + fileid + "']").val(filename);
}	
//logo保存方法
function subLogo(){
	var file = $("#myFile").val();
	if(file=="" || file ==null){
		confirm("请选择文件");
		return false;
	}
	$("#logo").submit();
}
//修改密码保存方法
function submitpass(){
	var path = $("#path").val();
	var password = $("input[name='password']").val();
	var newPassword = $("input[name='newPassword']").val();
	var newPasswordVerify = $("input[name='newPasswordVerify']").val();
	if(password == null || password == ""){
		confirm("旧密码不能为空！");
		return false;
	}
	if(newPassword == null || newPassword == ""){
		confirm("新密码不能为空！");
		return false;
	}
	if(newPasswordVerify == null || newPasswordVerify == ""){
		confirm("确认密码不能为空！");
		return false;
	}
	if(newPasswordVerify != newPassword){
		confirm("两次密码不一致！");
		return false;
	}
//$('#updatepassword').attr('action',path+"/user/").submit();    	
}
