<?php
defined('G_IN_SYSTEM')or exit('no');
System::load_app_class('admin','goodspecify','no');
class user extends admin {
	public function __construct(){
		parent::__construct();
	}
	
	public function login(){
		if(isset($_POST['ajax'])){
			$location=WEB_PATH.'/'.ROUTE_M.'/index';
			$message=array("error"=>false,'text'=>$location);
			$username=$_POST['username'];
			$password=$_POST['password'];
			$code=strtoupper($_POST['code']);
			if(empty($username)){$message['error']=true;$message['text']="请输入用户名!";echo json_encode($message);exit;}
			if(empty($password)){$message['error']=true;$message['text']="请输入密码!";echo json_encode($message);exit;}
				
			if(_cfg("web_off")){
				if(empty($code)){$message['error']=true;$message['text']="请输入验证码!";echo json_encode($message);exit;}
				if(md5($code)!=_getcookie('checkcode')){$message['error']=true;$message['text']="验证码输入错误";echo json_encode($message);exit;}
			}
	
			if(! isset($this->user[$username]) || $this->user[$username] !== $password){
				$message['error']=true;$message['text']="登录失败,用户名或密码错误!";echo json_encode($message);exit;
			}						
				
			if(!$message['error']){
				_setcookie("ykmxauth",$this->authcode($username."\t".$password,'ENCODE'),86400);				
			}
			echo json_encode($message);
			exit;
		}else{
			include $this->tpl(ROUTE_M,'user.login');
		}
	}
	
	public function out(){
		_setcookie("ykmxauth",'');
		_message("退出成功",G_MODULE_PATH.'/user/login');
	}
	
	//添加白名单
	public function add_white(){
		if(isset($_POST['ajax'])){
			
		}else{
			include $this->tpl(ROUTE_M,'white.edit');
		}
	}
}