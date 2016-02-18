<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);  

defined('G_IN_SYSTEM')or exit('no');
System::load_app_fun('global',G_ADMIN_DIR);
System::load_app_fun('my','go');
System::load_app_fun('user','go');
System::load_app_class("base","member","no");
System::load_sys_fun('user');
class test extends base {
	public $db;
	public function __construct(){	
		parent::__construct();
		$this->db=System::load_sys_class('model');		
		
	}	
	//晒单分享
	public function init(){
		$id = $_GET['id'];
		$sss = $this->curl_post($id);
		var_dump($sss);
		/* $tocode = System::load_app_class("tocode","pay");
		$s='1452088800.000';
		$tocode->run_tocode($s,3,19,3);
		$code =$tocode->go_code;
		echo $code."\r\n".$tocode->count_time; */
	}
	
	public function curl_post($id){
		$url = "http://www.chuchujie.com/workspaces/ykmx/go/autolottery/autolottery_ret_install";
		$post_data = array ("shopid" => $id);
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_POST, 1);
		curl_setopt($ch, CURLOPT_POSTFIELDS, $post_data);
		$output = curl_exec($ch);
		curl_close($ch);
		return $output;
	}
}
?>