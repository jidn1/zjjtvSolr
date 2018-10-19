$(function(){
	 var mwidth=$(window).width();
     $(".system-table-con").css("width",mwidth-350 +"px");
     $(window).resize(function(){
          mwidth=$(window).width();
         $(".system-table-con").css("width",mwidth-350 +"px");
     });
});