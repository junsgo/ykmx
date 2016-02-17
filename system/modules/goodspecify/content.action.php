<?php 
defined('G_IN_SYSTEM')or exit('no');
System::load_app_class('admin','goodspecify','no');
System::load_app_fun('global',G_ADMIN_DIR);
System::load_sys_fun('user');
class content extends admin {
	private $db;
	public function __construct(){		
		parent::__construct();		
		$this->db=System::load_sys_class('model');
		$this->ment=array();
		$this->categorys=$this->db->GetList("SELECT * FROM `@#_category` WHERE 1 order by `parentid` ASC,`cateid` ASC",array('key'=>'cateid'));
		$this->models=$this->db->GetList("SELECT * FROM `@#_model` WHERE 1",array('key'=>'modelid'));
	}
		
	//模型
	public function model(){
		$models=$this->models;	
		include $this->tpl(ROUTE_M,'content.model');
	}
	
	//商品列表	
	public function goods_list(){
		$this->ment=array(
						array("lists","商品管理",ROUTE_M.'/'.ROUTE_C."/goods_list"),						
						array("renqi","人气商品",ROUTE_M.'/'.ROUTE_C."/goods_list/renqi"),
						array("xsjx","限时揭晓商品",ROUTE_M.'/'.ROUTE_C."/goods_list/xianshi"),
						array("qishu","期数倒序",ROUTE_M.'/'.ROUTE_C."/goods_list/qishu"),
						array("danjia","单价倒序",ROUTE_M.'/'.ROUTE_C."/goods_list/danjia"),
						array("money","商品价格倒序",ROUTE_M.'/'.ROUTE_C."/goods_list/money"),
						array("money","已揭晓",ROUTE_M.'/'.ROUTE_C."/goods_list/jiexiaook"),
						array("money","<font color='#f00'>期数已满商品</font>",ROUTE_M.'/'.ROUTE_C."/goods_list/maxqishu"),
		);		
	    $cateid=$this->segment(4);
	
		$list_where = '';
		if($cateid){
			if($cateid=='jiexiaook'){
				$list_where = "`q_uid` is not null";
			}
			if($cateid=='maxqishu'){
				$list_where = "`qishu` = `maxqishu` and `q_end_time` is not null";
			}			
			if($cateid=='renqi'){
				$list_where = "`renqi` = '1'";
			}
			if($cateid=='xianshi'){
				$list_where = "`xsjx_time` != '0'";
			}
			if($cateid=='qishu'){
				$list_where = "1 order by `qishu` DESC";
				$this->ment[4][1]="期数正序";
				$this->ment[4][2]=ROUTE_M.'/'.ROUTE_C."/goods_list/qishuasc";
			}
			if($cateid=='qishuasc'){
				$list_where = "1 order by `qishu` ASC";
				$this->ment[4][1]="期数倒序";
				$this->ment[4][2]=ROUTE_M.'/'.ROUTE_C."/goods_list/qishu";
			}
			if($cateid=='danjia'){
				$list_where = "1 order by `yunjiage` DESC";
				$this->ment[5][1]="单价正序";
				$this->ment[5][2]=ROUTE_M.'/'.ROUTE_C."/goods_list/danjiaasc";
			}
			if($cateid=='danjiaasc'){
				$list_where = "1 order by `yunjiage` ASC";
				$this->ment[5][1]="单价倒序";
				$this->ment[5][2]=ROUTE_M.'/'.ROUTE_C."/goods_list/danjia";
			}
			if($cateid=='money'){
				$list_where = "1 order by `money` DESC";
				$this->ment[6][1]="商品价格正序";
				$this->ment[6][2]=ROUTE_M.'/'.ROUTE_C."/goods_list/moneyasc";
			}
			if($cateid=='moneyasc'){
				$list_where = "1 order by `money` ASC";
				$this->ment[6][1]="商品价格倒序";
				$this->ment[6][2]=ROUTE_M.'/'.ROUTE_C."/goods_list/money";
			}
			if($cateid==''){
				$list_where = "`q_uid` is null  order by `order` ASC,`id` DESC";
			}
			if(intval($cateid)){
				$list_where = "`cateid` = '$cateid'";
			}			
		}else{
			$list_where = "`q_uid` is null order by  `order` ASC,`id` DESC";
		}

		
		if(isset($_POST['sososubmit'])){			
			$posttime1 = !empty($_POST['posttime1']) ? strtotime($_POST['posttime1']) : NULL;
			$posttime2 = !empty($_POST['posttime2']) ? strtotime($_POST['posttime2']) : NULL;			
			$sotype = $_POST['sotype'];
			$sosotext = $_POST['sosotext'];			
			if($posttime1 && $posttime2){
				if($posttime2 < $posttime1)_message("结束时间不能小于开始时间");
				$list_where = "`time` > '$posttime1' AND `time` < '$posttime2'";
			}
			if($posttime1 && empty($posttime2)){				
				$list_where = "`time` > '$posttime1'";
			}
			if($posttime2 && empty($posttime1)){				
				$list_where = "`time` < '$posttime2'";
			}
			if(empty($posttime1) && empty($posttime2)){				
				$list_where = false;
			}			
			
			if(!empty($sosotext)){			
				if($sotype == 'cateid'){
					$sosotext = intval($sosotext);
					if($list_where)
						$list_where .= "AND `cateid` = '$sosotext'";
					else
						$list_where = "`cateid` = '$sosotext'";
				}
				if($sotype == 'brandid'){
					$sosotext = intval($sosotext);
					if($list_where)
						$list_where .= "AND `brandid` = '$sosotext'";
					else
						$list_where = "`brandid` = '$sosotext'";
				}
				
				if($sotype == 'brandname'){
					$sosotext = htmlspecialchars($sosotext);
					$info = $this->db->GetOne("SELECT * FROM `@#_brand` where `name` LIKE '%$sosotext%' LIMIT 1");
					
					if($list_where && $info)
						$list_where .= "AND `brandid` = '$info[id]'";
					elseif ($info)
						$list_where = "`brandid` = '$info[id]'";
					else
						$list_where = "1";
				}
				
				
				if($sotype == 'catename'){
					$sosotext = htmlspecialchars($sosotext);
					$info = $this->db->GetOne("SELECT * FROM `@#_category` where `name` LIKE '%$sosotext%' LIMIT 1");
					
					if($list_where && $info)
						$list_where .= "AND `cateid` = '$info[cateid]'";
					elseif ($info)
						$list_where = "`cateid` = '$info[cateid]'";
					else
						$list_where = "1";
				}
				if($sotype == 'title'){
					$sosotext = htmlspecialchars($sosotext);
					$list_where = "`title` = '$sosotext'";
				}
				if($sotype == 'id'){
					$sosotext = intval($sosotext);
					$list_where = "`id` = '$sosotext'";
				}
			}else{
				if(!$list_where) $list_where='1';					
			}		
		}		
		
	
		$num=20;
		$total=$this->db->GetCount("SELECT COUNT(*) FROM `@#_shoplist` WHERE $list_where"); 
		$page=System::load_sys_class('page');
		if(isset($_GET['p'])){$pagenum=$_GET['p'];}else{$pagenum=1;}	
		$page->config($total,$num,$pagenum,"0");
		$shoplist=$this->db->GetPage("SELECT a.*,b.uid as uids FROM `@#_shoplist` as a LEFT JOIN `@#_member_white` as b on b.shopid = a.id WHERE $list_where ",array("num"=>$num,"page"=>$pagenum,"type"=>1,"cache"=>0));
		//whitelist
		$whitelist = $this->db->GetList("SELECT * FROM `@#_white_list` WHERE `status` = 0");
		$temp = array();
		foreach ($whitelist as $v){
			$temp[$v['uid']] = $v['username'];
		}
		foreach ($shoplist as $k=>$v){
			$usernames = array();
			if($v['uids']){
				$arr = explode(",",$v['uids']);
				foreach ($arr as $uid){
					$usernames[] = $temp[$uid];
				}
			}
			$shoplist[$k]['usernames'] = implode(",",$usernames);
		}
		print_r($shoplist);
		foreach($shoplist as $v) {
			echo $v['id']."\r\n";
		}
		include $this->tpl(ROUTE_M,'shop.lists');
	}

	//添加白名单
	public function edit(){
		if(isset($_POST['ajax'])){
				
		}else{
			include $this->tpl(ROUTE_M,'white.edit');
		}
	}
	
	public function insert(){
		
	}
	
}//
?>