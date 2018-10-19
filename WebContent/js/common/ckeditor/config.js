/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	
	// 界面语言，默认为 'en'
    config.language = 'zh-cn';
    // 设置宽高
    config.width = 830;
    config.height = 300;
    config.pasteFromWordRemoveFontStyles = false;
    config.pasteFromWordRemoveStyles = false;
    //config.image_previewText='';//预览区域显示内容
    config.removeDialogTabs = 'image:advanced;link:advanced';
    //上传图片路径
    config.filebrowserImageUploadUrl = $('#path').val()+"/system/imageUpload.html";
    //config.filebrowserImageBrowseUrl = '/SNP/system/imageUpload.html';  
};
