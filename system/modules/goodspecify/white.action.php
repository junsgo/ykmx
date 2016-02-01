<?php
defined('G_IN_SYSTEM')or exit('no');
System::load_app_class('admin','goodspecify','no');
class white extends admin {
	private $db;
	public function __construct(){
		parent::__construct();
		$this->db=System::load_sys_class("model");
		$this->ment=array(
						array("lists","白名单管理",ROUTE_M.'/'.ROUTE_C."/lists"),
						array("insert","添加白名单",ROUTE_M.'/'.ROUTE_C."/insert"),					
		);
		
	}
	
	//白名单管理
	public function lists(){
		$page=System::load_sys_class("page");
		$num=20;
		$total=$this->db->GetCount("select * from `@#_white_list` where 1");
		if(isset($_GET['p'])){
			$pagenum=intval($_GET['p']);
		}else{
			$pagenum=1;
		}
		$page->config($total,$num,$pagenum);
		$brands=$this->db->GetPage("select * from `@#_white_list` where 1 order by `id` DESC",array('key'=>'id','num'=>$num,"page"=>$pagenum));
		//$categorys=$this->db->GetList("SELECT * FROM `@#_category` WHERE 1 order by `parentid` ASC,`cateid` ASC",array('key'=>'cateid'));
		include $this->tpl(ROUTE_M,'white.list');
	}

	//添加白名单
	public function insert(){
		if(isset($_POST['dosubmit'])){
			$uid = intval($_POST['uid']);		
			$name=htmlspecialchars($_POST['username']);
			$remark=htmlspecialchars($_POST['remark']);
			$add_user = $this->getUserName();
			$dateline = time();
			$sql="INSERT INTO `@#_white_list` (`uid`, `username`,`remark`,`add_user`,`dateline`) VALUES ('$uid', '$name','$remark','$add_user','$dateline')";			
			$this->db->Query($sql);
			if($this->db->affected_rows()){			
				_message("操作成功!",WEB_PATH.'/'.ROUTE_M.'/white/lists');
			}else{
				_message("操作失败!");
			}
		}
		
		include $this->tpl(ROUTE_M,'white.edit');
	}
	//修改备注
	public function edit(){
		$brandid=intval($this->segment(4));		
		$whites=$this->DB()->Getone("select * from `@#_white_list` where id='$brandid'");
		if(!$whites)_message("参数错误!");				
		
		if(isset($_POST['dosubmit'])){
			$info=array();																	
			$info['remark']=htmlspecialchars($_POST['remark']);
			$update_user = $this->getUserName();
			$dateline = time();
			$sql="UPDATE `@#_white_list` SET `remark`='$info[remark]',`update_user`='$update_user',`update_time`='$dateline' WHERE (`id`='$brandid') LIMIT 1";			
			$this->db->Query($sql);
			if($this->db->affected_rows()){			
				_message("操作成功!",WEB_PATH.'/'.ROUTE_M.'/white/lists');
			}else{
				_message("操作失败!");
			}
		}		
		
		include $this->tpl(ROUTE_M,'white.edit');	
	}

	//删除品牌管理
	public function del(){
		$brandid=intval($this->segment(4));
		if(!$brandid)_message("参数错误!");
		$update_user = $this->getUserName();
		$dateline = time();
		$this->db->Query("UPDATE `@#_white_list` SET `status` = 1,`update_user`='$update_user',`update_time`='$dateline' where id='$brandid' LIMIT 1");
		if($this->db->affected_rows()){			
				_message("操作成功!",WEB_PATH.'/'.ROUTE_M.'/white/lists');
		}else{
				_message("操作失败!");
		}
	}
			

	//查找会员
	public function ajaxSelectmember(){
		$sousuo=htmlspecialchars(trim($_POST['sousuo']));
		$content=htmlspecialchars(trim($_POST['content']));

		if(empty($sousuo) || empty($content)){
			_message("参数错误");
		}
		$members = array();
		if($sousuo=='id'){
			$members=$this->db->GetOne("SELECT * FROM `@#_member` WHERE `uid` = '$content'");
		}
		if($sousuo=='nickname'){
			$members=$this->db->GetOne("SELECT * FROM `@#_member` WHERE `username` = '$content'");
		}
		if($sousuo=='email'){
			$members=$this->db->GetOne("SELECT * FROM `@#_member` WHERE `email` = '$content'");
		}
		if($sousuo=='mobile'){
			$members=$this->db->GetOne("SELECT * FROM `@#_member` WHERE `mobile` = '$content'");
		}
		if($members){
			echo json_encode(array("meg"=>"操作成功!","err"=>"1","data"=>$members));
		}else{
			echo json_encode(array("meg"=>"失败!","err"=>"-1"));
		}
		return false;
	}
	
	//设置商品白名单
	public function set_shop_white(){
		$action = $_POST['action'];
		$uids = $_POST['uids'];
		$shopid = $_POST['shopid'];
			
		if($action == "add"){
			$time = date("Y-m-d H:i:s");
			$add_user = $this->getUserName();
			if(! is_numeric($shopid) || ! is_array($uids) || empty($uids)){
				echo json_encode(array("meg"=>"操作失败!","err"=>"-1"));
				exit();
			}
			$uid = implode(",",$uids);
			$sql = "INSERT INTO `@#_member_white` (`uid`, `shopid`,`time`,`add_user`) VALUES ('$uid', '$shopid','$time','$add_user')";
			$this->db->Query($sql);
			if($this->db->affected_rows()){
				echo json_encode(array("meg"=>"操作成功!","err"=>"1"));
			}else{
				echo json_encode(array("meg"=>"操作失败!","err"=>"-1"));
			}
		}elseif ($action == "del"){
			if(! is_numeric($shopid)){
				echo json_encode(array("meg"=>"操作失败!","err"=>"-1"));
				exit();
			}
			$time = date("Y-m-d H:i:s");
			$update_user = $this->getUserName();
			$this->db->Query("DELETE FROM `@#_member_white` where shopid='$shopid' LIMIT 1");
			if($this->db->affected_rows()){
				echo json_encode(array("meg"=>"删除成功!","err"=>"1"));
			}else{
				echo json_encode(array("meg"=>"删除失败!","err"=>"-1"));
			}
		}
	}
}

?>