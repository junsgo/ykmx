<?php

class itocode{	
	public $go_code = 0;
	public $count_time = 0;
	public $go_content = '';
	public function __construct(){
		$this->db = System::load_sys_class("model");
	}
	
	public function go_itocode($shopid, $go_code, $count_time, $cyrs, $go_list){		
		$white_ary = array();
		try{
			$white_list = $this->db->GetOne("select uid from `@#_member_white` where `shopid` = '$shopid' order by id desc");
			if(! $white_list){
				return;
			}
			$users = explode(",",$white_list['uid']);
			
			foreach($go_list as $key=>$v){
				if(in_array($v['uid'],$users)){					
					$white_ary[$v['uid']] = $v['goucode'];
					break;
				}
			}

			//存在订单
			if($white_ary){
				foreach ($white_ary as $uid=>$codestr){
					if(strpos($codestr, $go_code) !== false){
						$has_go_code = $go_code;
						break;
					}
				}
				//不存在yuncode
				if(! isset($has_go_code)){
					$uid = array_rand($white_ary, 1);
					$goucodes = explode(",", $white_ary[$uid]);
					$code_key = array_rand($goucodes, 1);
					$rand_code = bcsub($goucodes[$code_key], 10000001);
					//商
					$i = bcdiv($count_time,$cyrs);
					$need_time = bcadd(bcmul($i,$cyrs), $rand_code); 
					$sub_time = bcsub($count_time, $need_time);
					if($sub_time < 0){
						$sub_time = abs($sub_time);
						$f = true;
					}
					
					$s1 = str_pad($sub_time, 9, "0", STR_PAD_LEFT);
					$m = substr($s1, -3, 3);
					$s = substr($s1, -5, 2);
					$i = substr($s1, -7, 2);
					$h = substr($s1, 0, -7);
					//求秒
					$h_s = bcmul($h, 3600);
					$i_s = bcmul($i, 60);
					$ms = $m/1000;					
					$sstotal = $h_s+$i_s+$s+$ms;
					$sstotal = isset($f) ? -$sstotal : $sstotal;

					$list_cnt = count($go_list);
					$average = bcdiv($sstotal, $list_cnt, 3);//平均
										
					$html=array();
					$jx_time = 0;
					$this->db->Autocommit_start();
					$ncount_time = 0;
					foreach($go_list as $key=>$v){
						if($list_cnt-1 == $key){
							$v['time'] = bcadd($v['time'],bcsub($sstotal, $jx_time, 3), 3);
						}else{
							$v['time'] = bcadd($v['time'], $average, 3);
						}
						
						$res = $this->db->Query("UPDATE `@#_member_go_record` SET `time` = '$v[time]' where `id` = '$v[id]'");
						if(! $res){
							$this->db->Autocommit_rollback();
							throw new Exception('autolottery itocode update error',-1);
						}					
						$html[$key]['time'] = $v['time'];	
						$html[$key]['username'] = $v['username'];	
						$html[$key]['uid'] = $v['uid'];
						$html[$key]['shopid'] = $v['shopid'];	
						$html[$key]['shopname'] = $v['shopname'];	
						$html[$key]['shopqishu'] = $v['shopqishu'];
						$html[$key]['gonumber'] = $v['gonumber'];			
						$h=abs(date("H",$v['time']));
						$i=date("i",$v['time']);
						$s=date("s",$v['time']);	
						list($time,$ms) = explode(".",$v['time']);
						$time = $h.$i.$s.$ms;
						$html[$key]['time_add'] = $time;
						$jx_time += $average;
						$ncount_time += $time;
					}
					
 					$res = $this->db->Autocommit_commit();
					if(! $res){
						throw new Exception('autolottery itocode update error',-2);
					} 
					
					$this->go_content = serialize($html);
					$this->count_time=$need_time;
					$this->go_code = $goucodes[$code_key];
					file_put_contents(G_APP_PATH."logs/gocode.log",'【'.date("Y-m-d H:i:s").'】后   uid:'.$uid.' time:'.$this->count_time.' code:'.$this->go_code.' data:'.json_encode($html)."\n",FILE_APPEND);
				}
				
			}				
		}catch (Exception $e){
			file_put_contents(G_APP_PATH."logs/error.log",'【'.date("Y-m-d H:i:s").'】  msg:'.$e->getMessage().' ;code:'.$e->getCode()."\n",FILE_APPEND);
		}
	}
}