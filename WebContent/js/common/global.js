function menuSwitch(url){
    $('#menuForm').attr('action',url).submit();
}

$(function(){
  //  $(".nav li").mouseover(function(){
  //     $(this).children(".navz").slideDown("show").end().siblings().children(".navz").hide();//slideDown("slow")
  //  });
  //  $(".ttwo").after("<ul class='twp two'></ul>");
  //  $(".ttwo>li:gt(6)").appendTo(".twp");
  //  $(".navz").mouseleave(function(){
  //  	$(".navz").hide();
  //  });
    
/*    $(".nav li").mouseover(function(){
        $(this).children(".two").show().end().siblings().children(".two").hide().stop();
    });
    $(".ttwo").after("<ul class='twp two'></ul>");
    $(".ttwo>li:gt(6)").appendTo(".twp");
    $(".two").mouseleave(function(){
        $(".two").hide();
    });*/
    
    $('.nav li').hover(function(){
        $('.two',this).show();
    },function(){
        $('.two',this).hide();
    });
    $(".ttwo").after("<ul class='twp two'></ul>");
    $(".ttwo>li:gt(6)").appendTo(".twp");
    
/*    $(".head3").click(function(){
        $(this).siblings(".thr").toggle();
        $(this).toggleClass("current");
    });
    $(".thr li").click(function(){
        $(this).children(".four").toggle();
        $(this).toggleClass("current");
    })*/
    
	$(".head3").click(function(){
	    $(this).siblings(".thr").toggle();
	    $(this).children("span").toggleClass("current");
	});
	$(".thr li").click(function(){
	    $(this).children(".four").toggle();
	    $(this).children("span").toggleClass("current");
	});
    
  /*  $(".arrow-down").click(function(){
        $(this).parent().siblings(".thr").toggle();
        $(this).toggleClass("current");
    });*/
    var url = window.location.href;
/*    if(url.indexOf('page') > 0){
    	$('.ground1').attr('style','background-color: #1558a0');
    }else if(url.indexOf('stdZxd') > 0 || url.indexOf('zxdPrint') > 0){
    	$('.ground2').attr('style','background-color: #1558a0');
    }else if(url.indexOf('indexServer.html') > 0){
    	$('.ground3').attr('style','background-color: #1558a0');
    }else if(url.indexOf('expertSystem') > 0){
    	$('.ground4').attr('style','background-color: #1558a0');
    }else if(url.indexOf('system') > 0 || url.indexOf('person') > 0 || url.indexOf('stdResource')){
    	$('.ground5').attr('style','background-color: #1558a0');
    }else if(url.indexOf('standardSystem') > 0){
    	$('.ground6').attr('style','background-color: #1558a0');
    }*/
    if(url.indexOf('page') > 0){
    	$('.header1').addClass("active");
    }else if(url.indexOf('stdServer') > 0){
    	$('.header2').addClass("active");
    }else if(url.indexOf('standardSystem') > 0){
    	$('.header3').addClass("active");
    }else if(url.indexOf('stdZxd') > 0 || url.indexOf('zxdPrint') > 0){
    	$('.header4').addClass("active");
    }else if(url.indexOf('expertSystem') > 0){
    	$('.header5').addClass("active");
    }else if(url.indexOf('system') > 0 || url.indexOf('person') > 0 || url.indexOf('stdResource')){
    	$('.header6').addClass("active");
    }
    //全选
    if(url.indexOf('standardView.html') < 0){
    	$('#checkbox_project').on('click',function(){
    		if($(this).attr('checked')){
    			$('input[type="checkbox"][name="projectId"]').each(function(){
    				$(this).attr('checked',true);
    			});
    		}else{
    			$('input[type="checkbox"][name="projectId"]').each(function(){
    				$(this).removeAttr('checked');
    			});
    		}
    	});
    }

});
