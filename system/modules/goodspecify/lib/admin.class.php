<?php
define('G_IN_ADMIN',true);
define('G_ADMIN_PATH',WEB_PATH.'/goodspecify');

class admin extends SystemAction {	
	public $user = array('test'=>'test');//用户名=》密码
	public function __construct(){		
		$this->CheckAdmin();
	}

	//判断用户是否登陆
	final protected function CheckAdmin(){
		if(ROUTE_A != 'login'){
			$check = $this->CheckAdminInfo();
			if(!$check)_message("请登录后在查看页面",WEB_PATH.'/goodspecify/user/login');
			
		}
	}
	
	final protected function tpl($module = 'admin', $template = 'index'){	
		$file =  G_SYSTEM.'modules/'.$module.'/tpl/'.$template.'.tpl.php';
		if(file_exists($file))return $file;
		elseif(defined("G_IN_ADMIN")){
			_message("没有找到<font color='red'>".$module."</font>模块下的<font color='red'>".$template.".tpl.php</font>文件!");
		}else{
			_error('template message','The "'.$module.'.'.$template .'" template file does not exist');
		}
	}
	
	public function getUserName(){
		$authcode = _getcookie('ykmxauth');
		$str_code = $this->authcode($authcode);
		$temp = explode("\t",$str_code);
		return $temp[0];
	}
	
	public function CheckAdminInfo(){
		$authcode = _getcookie('ykmxauth');
		$str_code = $this->authcode($authcode);
		$temp = explode("\t",$str_code);
		if(! isset($this->user[$temp[0]]) || $this->user[$temp[0]] !== $temp[1]){
			return false;
		}else{
			//_setcookie("ykmxauth",$authcode,3600);
		}
		return true;
	}
	
	function authcode($string, $operation = 'DECODE', $key = '', $expiry = 0){
	
		if($operation == 'DECODE') {
			$string = str_replace('[a]','+',$string);
			$string = str_replace('[b]','&',$string);
			$string = str_replace('[c]','/',$string);
		}
		$ckey_length = 4;
		$key = md5($key ? $key : 'ykmxauthorhand');
		$keya = md5(substr($key, 0, 16));
		$keyb = md5(substr($key, 16, 16));
		$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';
		$cryptkey = $keya.md5($keya.$keyc);
		$key_length = strlen($cryptkey);
		$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
		$string_length = strlen($string);
		$result = '';
		$box = range(0, 255);
		$rndkey = array();
		for($i = 0; $i <= 255; $i++) {
			$rndkey[$i] = ord($cryptkey[$i % $key_length]);
		}
		for($j = $i = 0; $i < 256; $i++) {
			$j = ($j + $box[$i] + $rndkey[$i]) % 256;
			$tmp = $box[$i];
			$box[$i] = $box[$j];
			$box[$j] = $tmp;
		}
		for($a = $j = $i = 0; $i < $string_length; $i++) {
			$a = ($a + 1) % 256;
			$j = ($j + $box[$a]) % 256;
			$tmp = $box[$a];
			$box[$a] = $box[$j];
			$box[$j] = $tmp;
			$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
		}
		if($operation == 'DECODE') {
			if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
				 
				return substr($result, 26);
			} else {
				return '';
			}
		} else {
			$ustr = $keyc.str_replace('=', '', base64_encode($result));
			$ustr = str_replace('+','[a]',$ustr);
			$ustr = str_replace('&','[b]',$ustr);
			$ustr = str_replace('/','[c]',$ustr);
			return $ustr;
		}
	}
	
	final protected function headerment($ments=null){
		$html='';
		$html_l='';
		$URL=trim(get_web_url(),'/');
		if(is_array($ments)){
			$ment=$ments;
		}else{
			if(!isset($this->ment))return false;
			$ment=$this->ment;
		}
		foreach($ment as $k=>$v){
			if(WEB_PATH.'/'.$v[2]==$URL){
				$html_l='<h3 class="nav_icon">'.$v[1].'</h3><span class="span_fenge lr10"></span>';
			}
			if(!isset($v[3])){
				$html.='<a href="'.WEB_PATH.'/'.$v[2].'">'.$v[1].'</a>';
				$html.='<span class="span_fenge lr5">|</span>';
			}
		}
	
		return $html_l.$html;
	}
}
?>
