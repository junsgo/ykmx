<?php defined('G_IN_ADMIN')or exit('No permission resources.'); ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8"> 
<link rel="Shortcut Icon" href="<?php echo G_WEB_PATH;?>/favicon.ico">
<link rel="stylesheet" href="<?php echo G_GLOBAL_STYLE; ?>/global/css/global.css" type="text/css">
<link rel="stylesheet" href="<?php echo G_GLOBAL_STYLE; ?>/global/css/index.css" type="text/css">
<script src="<?php echo G_GLOBAL_STYLE; ?>/global/js/jquery-1.8.3.min.js"></script>
<script src="<?php echo G_PLUGIN_PATH; ?>/layer/layer.min.js"></script>
<script src="<?php echo G_GLOBAL_STYLE; ?>/global/js/global.js"></script>
<title>后台首页</title>
<script type="text/javascript">
var ready=1;
var kj_width;
var kj_height;
var header_height=100;
var R_label;
var R_label_one = "当前位置: 系统设置 >";


function left(init){
	var left = document.getElementById("left");
	var leftlist = left.getElementsByTagName("ul");
	
	for (var k=0; k<leftlist.length; k++){
		leftlist[k].style.display="none";
	}
	document.getElementById(init).style.display="block";
}

function secBoard(elementID,n,init,r_lable) {
			
	var elem = document.getElementById(elementID);
	var elemlist = elem.getElementsByTagName("li");
	for (var i=0; i<elemlist.length; i++) {
		elemlist[i].className = "normal";		
	}
	elemlist[n].className = "current";
	R_label_one="当前位置: "+r_lable+" >";
	R_label.text(R_label_one);
	left(init);
}


function set_div(){
		kj_width=$(window).width();
		kj_height=$(window).height();
		if(kj_width<1000){kj_width=1000;}
		if(kj_height<500){kj_height=500;}

		$("#header").css('width',kj_width); 
		$("#header").css('height',header_height);
		$("#left").css('height',kj_height-header_height); 
	    $("#right").css('height',kj_height-header_height); 
		$("#left").css('top',header_height); 
		$("#right").css('top',header_height);
		
		$("#left").css('width',180);		
		$("#right").css('width',kj_width-182); 
		$("#right").css('left',182);
		
		$("#right_iframe").css('width',kj_width-206); 
		$("#right_iframe").css('height',kj_height-148);
		 		
		$("#iframe_src").css('width',kj_width-208); 
		$("#iframe_src").css('height',kj_height-150); 	
		
		$("#off_on").css('height',kj_height-180);
		
		var nav=$("#nav");		
		nav.css("left",(kj_width-nav.get(0).offsetWidth)/2);
		nav.css("top",61);
		
}


$(document).ready(function(){	
		set_div();		
		$("#off_on").click(function(){
				if($(this).attr('val')=='open'){
					$(this).attr('val','exit');
					$("#right").css('width',kj_width);
					$("#right").css('left',1);
					$("#right_iframe").css('width',kj_width-25); 
					$("iframe").css('width',kj_width-27);
				}else{
					$(this).attr('val','open');
					$("#right").css('width',kj_width-182);
					$("#right").css('left',182);
					$("#right_iframe").css('width',kj_width-206); 
					$("iframe").css('width',kj_width-208);
				}
		});
		
		left('shop');
		$(".left_date a").click(function(){
				$(".left_date li").removeClass("set");						  
				$(this).parent().addClass("set");
				R_label.text(R_label_one+' '+$(this).text()+' >');
				$("#iframe_src").attr("src",$(this).attr("src"));
		});
		$("#iframe_src").attr("src","<?php echo G_MODULE_PATH; ?>/index/Tdefault");
		R_label=$("#R_label");
		$('body').bind('contextmenu',function(){return false;});
		$('body').bind("selectstart",function(){return false;});
				
});

function api_off_on_open(key){
	if(key=='open'){
				$("#off_on").attr('val','exit');
				$("#right").css('width',kj_width);
				$("#right").css('left',1);
				$("#right_iframe").css('width',kj_width-25); 
				$("iframe").css('width',kj_width-27);
	}else{
					$("#off_on").attr('val','open');
					$("#right").css('width',kj_width-182);
					$("#right").css('left',182);
					$("#right_iframe").css('width',kj_width-206); 
					$("iframe").css('width',kj_width-208);
	}
}
</script>

<style>
.header_case{  position:absolute; right:10px; top:10px; color:#fff}
.header_case a{ padding-left:5px}
.header_case a:hover{ color:#fff; }

.left_date a{color:#444;}
.left_date{overflow:hidden;}
.left_date ul{ margin:0px; padding:0px;}
.left_date li{line-height:25px; height:25px; margin:0px 10px; margin-left:15px; overflow:hidden;}
.left_date li a{ display:block;text-indent:5px;  overflow:hidden}
.left_date li a:hover{ background-color:#d3e8f2;text-decoration:none;border-radius:3px;}
.left_date .set a{background-color:#d3e8f2;border-radius:3px; font-weight:bold}
.head{ border-bottom:1px solid #c5e8f1; color:#2a8bbb; font-weight:bold; margin-bottom:10px;}

</style>

</head>
<body onResize="set_div();">

<div id="header">
	<div class="logo"></div>
    <div class="header_case">
    欢迎您：<a href="javascript:;" title="<?php echo $info['username']; ?>"><?php echo $info['username']; ?> [超级管理员]</a>
    <a href="<?php echo G_MODULE_PATH; ?>/user/out" title="退出">[退出]</a>
    <a href="<?php echo G_WEB_PATH; ?>" title="网站首页" target="_blank">网站首页</a>
    <a href="<?php echo G_MODULE_PATH; ?>/index/map" title="地图">地图</a>
    <a href="http:/www.yungoucms.com/" title="官方网站" target="_blank">官方网站</a>
	<a href="http://bbs.tao-long.com/forum.php?gid=37" title="官方论坛" target="_blank">官方论坛</a>
    <button  style="width:0px;height:0px;" onClick="document.location.hash='hello'"></button>
    </div>
    <div class="nav" id="nav">    
    	<ul>	
            <li class="normal"><a href="#" onClick="secBoard('nav',0,'shop','商品管理');">商品管理</a></li>
            <li class="normal"><a href="#" onClick="secBoard('nav',1,'white','白名单管理');">白名单管理</a></li>
        </ul>
    </div>
</div><!--header end-->
<div id="left">
     <ul class="left_date" id="shop">   
     	<li class="head">商品管理</li>
        <li><a href="javascript:void(0);" src="<?php echo G_MODULE_PATH; ?>/content/goods_list">商品列表</a></li>        
    </ul>
    <ul class="left_date" id="white">   
     	<li class="head">白名单</li>
        <li><a href="javascript:void(0);" src="<?php echo G_MODULE_PATH; ?>/white/lists">白名单列表</a></li>        
    </ul>
	 <div style="padding:30px 10px; color:#ccc">
     	<p>
        	© 2013 YunGouCMS.com<br>
			All Rights Reserved.
        </p>
     </div>

</div><!--left end-->
<div id="right">
	<div class="right_top">
    	<ul class="R_label" id="R_label">
        	当前位置: 系统设置 >  后台主页 >
        </ul>
    	<ul class="R_btn">
    	<a href="javascript:;" onClick="btn_iframef5();" class="system_button"><span>刷新框架</span></a>
        <!--<a href="javascript:;" onClick="btn_checkbom('<?php echo WEB_PATH; ?>/api/plugin/get/bom');" class="system_button"><span>检查BOM</span></a>-->
        <a href="javascript:;" onClick="btn_delahche('<?php echo G_MODULE_PATH; ?>/cache/init');" class="system_button"><span>清空缓存</span></a>
		<a href="javascript:;" onClick="btn_gongdan();" class="system_button"><span>提交工单</span></a>
        <a href="javascript:;" onClick="btn_map('<?php echo G_MODULE_PATH; ?>/index/map');" class="system_button"><span>后台地图</span></a>
        </ul>
    </div>
    <div class="right_left">
    	<a href="#" val="open" title="全屏" id="off_on">全屏</a>
    </div>
    <div id="right_iframe">
        
         <iframe id="iframe_src" name="iframe" class="iframe"
         frameborder="no" border="1" marginwidth="0" marginheight="0" 
         src="" 
         scrolling="auto" allowtransparency="yes" style="width:100%; height:100%">
         </iframe>
        
    </div>
</div><!--right end-->

<script>
	var upfile_num = <?php echo $upfile_num; ?>;
	if(upfile_num){
		//alert("你有"+upfile_num+'个补丁可升级,请到【云应用】-【在线升级】去更新系统！');
		//window.message("你有"+upfile_num+'个补丁可升级,请到【云应用】-【在线升级】去更新系统！',8,5);
	}
</script>
</body>
</html>