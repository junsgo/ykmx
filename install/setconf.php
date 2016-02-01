<?php
header('Content-type: text/html; charset=utf-8');
if(file_exists("ok.lock")){
	echo "程序已经安装过";
	echo "<br>";
	echo "重新安装请删除,install 文件夹下的 <font color='red'>ok.lock</font> 文件";
	exit;
}

?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>云购系统安装</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel='stylesheet' type='text/css' href='images/install.css'>
<script src="images/JQuery.js"></script>
<style>
#test_conn{
	padding:5px 8px; font-size:12px; border:1px solid #ccc; background:#eee; color:#666;text-decoration:none
}
#test_conn:hover{
	border:1px solid #f60; background:#f70; color:#fff;text-decoration:none
}
</style>
</head>
<body>
<div id='installbox'>
<div class='msgtitle'>云购系统 安装向导</div>
<table width="780" height="30" border="0" cellpadding="0" cellspacing="0" class="intable3">
  <tr>
    <td style="color:#f5f5f5; text-align:center">
        <span style="display:block;float:left;width:23%;font-size:12px;">1. 许可协议</span>
        <span style="display:block;float:left;width:25%;font-size:12px;">2. 环境检测</span>
        <span style="display:block;float:left;width:25%;font-size:12px;">3. 数据库设置</span>
        <span style="display:block;float:left;width:25%;font-size:12px;color:#FFF;">4. 安装完成</span>
    </td>
  </tr>
</table>

        <h3>数据库设置：</h3>
        <form  method="post" action="" name="conf" id="gxform" style="margin:0; padding:0;" target="procsss" onsubmit="return start_process();">
            <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableoutline" style="font-size:12px; color:#666;">
                <tr bgcolor="#fdefe5" class="firstalt">
                    <td width="25%" valign="top"><b>数据库主机</b></td>
                    <td width="45%"><input type="text" id="db_host" value="localhost" maxlength="50" style="width:250px;" > *</td>
                    <td><font>一般为localhost</font></td>
                </tr>
                <tr class="firstalt">
                    <td width="25%"><b>数据库用户名</b></td>
                    <td width="45%"><input type="text" id="db_user" value="" maxlength="50" style="width:250px;"> *</td>
                    <td><font></font></td>
                </tr>
                <tr bgcolor="#fdefe5" class="firstalt">
                    <td width="25%"><b>数据库密码</b></td>
                    <td width="45%"><input type="password" value="" id="db_pwd" maxlength="50" style="width:250px;" ></td>
                    <td><font></font></td>
                </tr>
                <tr class="firstalt">
                    <td width="25%"><b>数据库名称</b></td>
                    <td width="45%"><input type="text" id="db_name" value="" maxlength="50" style="width:250px;"> *</td>
                    <td><font>请填写已存在的数据库名</font></td>
                </tr>
                <tr bgcolor="#fdefe5" class="firstalt">
                    <td width="25%"><b>数据库表前缀</b></td>
                    <td width="45%"><input type="text"  id="db_prefix" value="go_"  maxlength="50"  valid="required"  style="width:250px;" > *</td>
                    <td><font>建议您修改表前缀</font></td>
                </tr>

                <tr class="firstalt">
                    <td width="25%"><b>默认数据库扩展</b></td>
                    <td width="45%">
                        <input type="radio" name="db_sql_type" value="db_mysql" checked="true" /> MYSQL
                        <?php if(function_exists("mysqli_query")){ ?>
                            <input type="radio" name="db_sql_type" value="db_mysqli" /> MYSQLI (PHP5.5以上选用)
                        <?php } ?>
                    </td>
                    <td><font></font></td>
                </tr>
                <tr bgcolor="#fdefe5" class="firstalt">
                    <td width="25%"><b>是否安装默认数据</b></td>
                    <td width="45%">
                        <input type="radio" name="db_data_type" value="1" /> 是
                        <input type="radio" name="db_data_type" checked="true" value="0" /> 否
                    </td>
                    <td><font></font></td>
                </tr>
                <tr bgcolor="#fdefe5" class="firstalt">
                    <td width="25%"><b></b></td>
                    <td width="45%" style="line-height:30px;">
                        <a href="javascript:;" id="test_conn" onclick="return test_conn();">测试链接</a>
                    </td>
                    <td id="test_alt" style="font-weight: bold;"></td>
                </tr>
            </table>
            <h3>授权码设置：</h3>
            <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableoutline" style="font-size:12px; color:#666;">
                <tr class="firstalt">
                    <td width="25%"><b>授权码</b></td>
                    <td width="45%"><input type="text" id="sqm_num" value="975E312DA2618F549446B6523A6F9730E059AA112448"  maxlength="50"  valid="required"  style="width:250px;" > *</td>
                    <td><font><a target="_blank" href="http://www.yungoucms.com/goodsshow.php?cid=12&tid=34&id=10">购买授权码 </a></font></td>
                </tr>
            </table>
            <h3>后台设置：</h3>
            <table width="98%" border="0" align="center" cellpadding="3" cellspacing="1" class="tableoutline" style="font-size:12px; color:#666;">
                <tr bgcolor="#fdefe5" class="firstalt">
                    <td width="25%"><b>管理员帐号</b></td>
                    <td width="45%"><input type="text" name="user_name" id="user_name" value="admin"  maxlength="50"  valid="required"  style="width:250px;" > *</td>
                    <td><font>一般不用修改</font></td>
                </tr>
                <tr class="firstalt">
                    <td width="25%"><b>密码</b></td>
                    <td width="45%"><input type="password" name="password" id="password" value=""  maxlength="50"  valid="required"  style="width:250px;" > *</td>
                    <td><font>密码大于6位</font></td>
                </tr>
                <tr bgcolor="#fdefe5" class="firstalt">
                    <td width="25%"><b>确认密码</b></td>
                    <td width="45%"><input type="password" name="repassword" id="repassword" value=""  maxlength="50"  valid="required"  style="width:250px;" > *</td>
                    <td></td>
                </tr>
				
				 <tr class="firstalt" id="process" style="display:none">
                    <td width="25%"><b>安装进度</b></td>
                    <td width="45%">
						<div style="border: 1px solid #f60;width: 500px;height: 20px;background:#eee">
                            <div id="process_tip" style="background:#f60;width:0%;line-height: 20px;height: 20px; color:#fff;overflow:hidden"></div>
                        </div>
					</td>
                    <td></td>
                </tr>
				
            </table>
			
    			
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr class="firstalt" style="height:10px">
                    <td height="70" colspan="2" align="center">
                        <input style="width:120px; height:30px;" type="button" class="btn"  value="上一步" onClick="history.back();"/>
                        <input style="width:120px; height:30px;" type="submit" name="edit" value="安装" class="btn" id="submit">
                        <span id="loading" style="font-size:13px;color:#FF0000;display:none"><font color="#0066CC">请稍等...正在与MYSQL数据库进行连接。</font></span>
                    </td>
                </tr>
                <tr class="firstalt" style="height:10px">
                    <td colspan="2" align="center"><div id='msgbottom'>Powered By <a target="_blank" href="http://www.yungoucms.com/">YunGouCMS </a></div></td>
                </tr>
            </table>
        </form>
    <iframe style="width: 0;height:0px;overflow:hidden; display:none" id="iframe_procsss" name="iframe_procsss"></iframe>
</div>
</body>
</html>
<script language="javascript">

	var obj = {};
	//测试连接
    function test_conn(func){
		if(db_name.value == ''){
			alert("请填写数据库名称");return false;
		}		
        $.post("import.php",{action:"connect",host:db_host.value,user:db_user.value,pass:db_pwd.value,table:db_name.value},function(data){  
			$("#test_alt").html(data.msg);
            if(data.status==0){
                $("#test_alt").css("color","red");
				return false;
            }else{
				obj.host = db_host.value;
				obj.user = db_user.value;
				obj.pass = db_pwd.value;
				obj.table = db_name.value;		
                $("#test_alt").css("color","blue");
				if(func != undefined){
					return func();
				}
				return true;
            }

        },"json");
    }
	  
	
	function get_import(){
	
		obj.admin_user = user_name.value;
		obj.admin_pass = repassword.value;
		obj.code = sqm_num.value;
		obj.prefix = db_prefix.value;
		obj.ceshidata = $("input[name=db_data_type]:checked").val();
		obj.sqltype = $("input[name=db_sql_type]:checked").val();
		
		var query = "";
		var ret = "";
		for(var p in obj){
			query += "&"+p+"="+obj[p];
		}
		var timer;
		var process_tip = $("#process_tip");
		var iframe = $("#iframe_procsss");
			iframe.attr("src","import.php?action=import"+query);
		clearInterval(timer);
		timer = setInterval(function(){
			 ret = iframe.contents().find("div:last");			
			if(ret.find("i").text() == "101%"){
				 process_tip.css("width","100%");
				 var text = ret.find("p").text();
				 process_tip.text(text);	
				 clearInterval(timer);
				 
				 var ii = 5;
				 setInterval(function(){
					ii--;
					if(ii==0){
						 window.location.href = "finish.php";		
					}else{
						 process_tip.text(text+" --"+ii+"秒后跳转!");
					}
				 },1000);
							 
			}else{
				process_tip.css("width",ret.find("i").text());
				process_tip.text(ret.find("p").text());				
			}
		 },100);
		 
	}
	
	//初始化进度条
    function start_process(){	
		if(password.value != repassword.value){
			alert("2次密码输入不一致");return false;
		}
		if(password.value.length < 6){
			alert("密码不能小于6位");return false;
		}		
	
		test_conn(function(){			
			$("#process").show();
			get_import();	
		})
        return false;
    }
</script>
