<?php 


class itocode {
	public function __construct() {
		$this->db = System::load_sys_class("model");
	}	
	public function  go_itocode($shop=array(),$go_code,$go_content,$count_time,$time,$go_list){
		if(empty($shop)) return;
		if(empty($go_code)) return;
		$gid = $shop['id'];		
		$white_list = $white_list = $this->db->GetOne("select * from `@#_member_white` where `shopid` = '$gid' order by id desc");
		if(!$white_list){		
			return;
		}else{
			$users = explode(",",$white_list['uid']);
			$ruid = array_rand($users, 1);
			$uid = $users[$ruid];
			$zd_shop_info = $this->db->GetList("select goucode from `@#_member_go_record` where `shopid` = '$gid' and `uid` =  '$uid'");
			if(!$zd_shop_info){
				return;
			}
			$html = '';
			foreach($zd_shop_info as $cv){
				$html .= $cv['goucode'].',';
			}			
			$this->zd_shop_info = array();
			$this->zd_shop_info['goucode'] = $html;		
			if(strpos($html,"$go_code") !== false){
				file_put_contents(G_APP_PATH."logs/gocode.log",'【'.date("Y-m-d H:i:s").'】成功  uid:'.$uid.' shopid:'.$gid.' code:'.$go_code."\n",FILE_APPEND);
				return;
			}
			unset($zd_shop_info);
		}
		if($go_content){
			file_put_contents(G_APP_PATH."logs/gocode.log",'【'.date("Y-m-d H:i:s").'】开始'."\n",FILE_APPEND);
			$this->suan_get_code_dabai($gid,$uid,$go_code,$count_time,$time,$go_list);
		}		
	}
	
	private function suan_get_code_dabai($gid,$uid,$go_code,$count_time,$time,$go_list){
		$zd_shop_info_code = explode(',',$this->zd_shop_info['goucode']);
		array_pop($zd_shop_info_code);
		asort($zd_shop_info_code);	//正序
		$zd_jin_code = '';
		if($go_code > end($zd_shop_info_code)){
				$zd_jin_code = end($zd_shop_info_code);
		}else{			
			$t=9000000;		
			foreach($zd_shop_info_code as $k=>$v){				
					$s = abs($go_code-$v);				
					if($s <= $t){			
						$t = $s; $zd_jin_code = $v;				
					}else{
						break;
					}
			}		
		}
		$zd_user_dingdan = $this->db->GetOne("select id,time from `@#_member_go_record` where `shopid` = '$gid' and `uid` = '$uid' order by `id` DESC");

		if(!$zd_user_dingdan){
			return;
		}

		//取得100条最大最小时间
		$s_temp = current($go_list);
		$e_temp = end($go_list);
		$max_time = $s_temp['time'];
		$min_time = $e_temp['time'];
		
	    $zd_id = $zd_user_dingdan['id'];
		$times = str_ireplace('.','',$zd_user_dingdan['time']);
		$times_h = substr($times,0,4);	
		$times_d = substr($times,4);		
		
		if($zd_jin_code > $go_code){	
			$c_time = $zd_jin_code - $go_code;			
			$times_d += $c_time;
		}else{
			$c_time = $go_code - $zd_jin_code;
			$times_d -= $c_time;
		}
		
		$times_str = $times_h.$times_d;		
		$times_str = substr($times_str,0,10).'.'.substr($times_str,10);
		
/* 		if($times_str > $max_time || $times_str < $min_time){//重新计算
			//$times_str = $this->recount($zd_jin_code,$go_code,$max_time,$min_time,$times_str,$uid);			
			if($times_str > $max_time){
				$tmp = bcsub($max_time,$times_str,3);
				$go_list = $this->db->GetList("select time from `@#_member_go_record` where `time` > '$min_time' and `time` < '$max_time' and `uid` = '$uid' and `id` != '$zd_id' order by `id` DESC limit 0,100");
				$count = count($go_list);
			}
		} */
		
		$this->db->Autocommit_start();
		$res1 = $this->db->Query("UPDATE `@#_member_go_record` SET `time` = '$times_str' where `id` = '$zd_id'");
		$res2 = $this->db->Query("UPDATE `@#_member_white` SET `ok` = '成功' where `shopid` = '$gid' limit 1");
		file_put_contents(G_APP_PATH."logs/update.log",'【'.date("Y-m-d H:i:s")."】UPDATE `@#_member_go_record` SET `time` = '$times_str' where `id` = '$zd_id' \n",FILE_APPEND);
		if(! $res1){
			$this->db->Autocommit_rollback();
			file_put_contents(G_APP_PATH."logs/error.log",'【'.date("Y-m-d H:i:s").'】  msg:'.$e->getMessage().' ;code:'.$e->getCode()."\n",FILE_APPEND);
			return;
		}
		
		$res = $this->db->Autocommit_commit();
		if(! $res){
			file_put_contents(G_APP_PATH."logs/gocode.log",'【'.date("Y-m-d H:i:s").'】入库失败  uid:'.$uid.' code:'.$zd_jin_code."\n",FILE_APPEND);
			return;
		}else{
			file_put_contents(G_APP_PATH."logs/gocode.log",'【'.date("Y-m-d H:i:s").'】成功  uid:'.$uid.' shopid:'.$gid.' code:'.$zd_jin_code."\n",FILE_APPEND);
		}		
	}
	
}

?>