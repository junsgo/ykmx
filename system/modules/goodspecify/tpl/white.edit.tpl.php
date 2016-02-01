<?php defined('G_IN_ADMIN')or exit('No permission resources.'); ?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台首页</title>
<link rel="stylesheet" href="<?php echo G_GLOBAL_STYLE; ?>/global/css/global.css" type="text/css">
<link rel="stylesheet" href="<?php echo G_GLOBAL_STYLE; ?>/global/css/style.css" type="text/css">
<style>
body{ background-color:#fff}
#category_select span{
	border:1px solid #ccc;
	background:#eee;
	padding:3px;
}
#category_select b{
 color:#f00;cursor:pointer;
}
#category_select input{
	width:0px;border:0px;
}
</style>
</head>
<body>
<div class="header lr10">
	<?php echo $this->headerment();?>
</div>
<div class="bk10"></div>

<div class="table_form lr10">
<?php if(ROUTE_A=='edit'){ ?>
<form name="form" action="" method="post">
<table width="100%"  cellspacing="0" cellpadding="0">
    <tr>
			<td align="right">用户id：</td>
			<td><input type="text" readonly name="uid" id="uid" value="<?php echo $whites['uid'];?>"></span></td>
	</tr>
    <tr>
			<td align="right">用户名：</td>
			<td><input type="text" readonly name="username" id="username" value="<?php echo $whites['username'];?>" ></span></td>			
	</tr>
	<tr>
			<td align="right">备注：</td>
			<td>
            	<textarea id="remark" name="remark" rows="3" cols="20" style="height:40px;" value="<?php echo $whites['remark'];?>"></textarea>
            </td>
	</tr>
    <tr height="60px">
			<td align="right"></td>
			<td><input class="button" type="submit" name="dosubmit" value=" 修改 " /></td>
	</tr>
</form>
</table>
<?php } ?>
<?php if(ROUTE_A=='insert'){ ?>
<form name="form" action="" method="post">
<table width="100%"  cellspacing="0" cellpadding="0">
	<tr>
    		<td align="right" class="wid100">检索条件：</td>
			<td>	
				<a style="color:#f00;float:left;"  class="pay_window_show" data="username"> 【搜索用户】</a>				
    		</td>
    </tr>
    <tr>
			<td align="right">用户id：</td>
			<td><input type="text" readonly name="uid" id="uid"></span></td>
	</tr>
    <tr>
			<td align="right">用户名：</td>
			<td><input type="text" readonly name="username" id="username"></span></td>			
	</tr>
	<tr>
			<td align="right">备注：</td>
			<td>
            	<textarea id="remark" name="remark" rows="3" cols="20" style="height:40px;"></textarea>
            </td>
	</tr>
    <tr height="60px">
			<td align="right"></td>
			<td><input class="button" type="submit" name="dosubmit" value=" 添加 " /></td>
	</tr>
</form>
</table>
<?php } ?>
</div>

<!--期数修改弹出框-->
<style>
#paywindow{position:absolute;z-index:999; display:none}
#paywindow_b{width:412px;height:160px;background:#2a8aba; filter:alpha(opacity=60);opacity: 0.6;position:absolute;left:0px;top:0px; display:block}
#paywindow_c{width:400px;height:138px;background:#fff;display:block;position:absolute;left:6px;top:6px;}
.p_win_title{ line-height:40px;height:40px;background:#f8f8f8;}
.p_win_title b{float:left}
.p_win_title a{float:right;padding:0px 10px;color:#f60}
.p_win_content h1{font-size:25px;font-weight:bold;}
.p_win_but,.p_win_mes,.p_win_ctitle,.p_win_text{ margin:10px 20px;}
.p_win_mes{border-bottom:1px solid #eee;line-height:35px;}
.p_win_mes span{margin-left:10px;}
.p_win_ctitle{overflow:hidden;}
.p_win_x_b{float:left; width:73px;height:68px;background-repeat:no-repeat;}
.p_win_x_t{ font-size:18px; font-weight:bold;font-family: "Helvetica Neue",\5FAE\8F6F\96C5\9ED1,Tohoma;color:#f00; text-align:center}
.p_win_but{ height:40px; line-height:40px;}
.p_win_but a{ padding:8px 15px; background:#f60; color:#fff;border:1px solid #f50; margin:0px 15px;font-family: "Helvetica Neue",\5FAE\8F6F\96C5\9ED1,Tohoma; font-size:15px; }
.p_win_but a:hover{ background:#f50}
.p_win_text a{ font-size:13px; color:#f60}
.pay_window_quit:hover{ color:#f00}
</style>
<div id="paywindow">
	<div id="paywindow_b"></div>
	<div id="paywindow_c">
		<div class="p_win_title"><a href="javascript:;" class="pay_window_quit">[关闭]</a><b>添加用户</b></div>
		<div class="p_win_content">	
			
			<div class="p_win_mes">
            	 <b id="_search">搜索条件:</b>
				 <select name="sousuo" id="sousuo">
					<option value="id">会员uid</option>
					<option value="nickname">会员昵称</option>
					<option value="email">会员邮箱</option>
					<option value="mobile">会员手机</option>
				</select>
				<input type="text" name="content" id="content" class="input-text">
            </div>
		
            <div class="p_win_mes">    	    	
    			 	 <b>　　　　　</b><input type="button" value=" 确定 " class="button" id="set_select_cateid">          
            </div>	
		</div>
	</div>
</div>

<script src="<?php echo G_GLOBAL_STYLE; ?>/global/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="<?php echo G_PLUGIN_PATH; ?>/style/global/js/global.js"></script>
<script>
$(function(){
	var width = ($(window).width()-572)/2;
	var height = ($(window).height()-460)/2;
	$("#paywindow").css("left",width);
	$("#paywindow").css("top",height);
		
	$(".pay_window_quit").click(function(){
		$("#paywindow").hide();								 
	});
		
	$(".pay_window_show").click(function(){
		var id = $(this).attr("data");
		$("#s_search").val(id);
		switch(id){
			case 'username':
				$("#_search").html("请输入用户名：");
			break;
			case 'phone':
				$("#_search").html("请输入手机号：");
			break;
			case 'email':
				$("#_search").html("请输入邮箱：");
			break;
			}
		$("#paywindow").show();	
	});
		
	
	var sid_arr = [];
	$("#set_select_cateid").click(function(){
		$("#remark").val("");
		var sousuo = $("#sousuo").val();
		var content = $("#content").val();
		if(! content){alert("请输入搜索项");return false;}
		$.post("<?php echo G_MODULE_PATH; ?>/white/ajaxSelectmember",{"sousuo":sousuo,"content":content},function(datas){
			if(datas.err == '-1'){		
				alert(datas.meg);		
				return;
			}else{
				$("#paywindow").hide();	
				var info = datas.data;			
				$("#uid").val(info.uid);
				$("#username").val(info.username);				
				return;
			}		
		},"json");
			
	});
});
</script>
<!--期数修改弹出框-->

</body>
</html> 
