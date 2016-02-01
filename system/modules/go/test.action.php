<?php
/*  error_reporting(E_ALL);
ini_set("display_errors", 1);  */

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
		$tocode = System::load_app_class("tocode","pay");
		$s='1452088800.000';
		$tocode->run_tocode($s,3,19,3);
		$code =$tocode->go_code;
		echo $code."\r\n".$tocode->count_time;
	}
}
?>