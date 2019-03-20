<?php
/**
 * 控制器基类
 *
 * @author andery
 */
namespace Common\Controller;
use Think\Controller;
header("content-type:text/html;charset=utf-8");
class BaseController extends Controller
{

	public $pagesize = 8;
	public $Vip1 = 0;
	public $Vip2 = 0;
	public $Vip3 = 0;
	public $Tongka = 0;
	public $Yinka = 0;
	public $Jinka = 0;
	public $SysSet ;
	
	
    public function __construct()
    
    {
        parent::__construct();
		$systemName=M("sys_set");

		$rs_systemName=$systemName->where("id=1")->find();
		$this->SysSet = $rs_systemName;
		// print_r($rs_systemName);
        if($rs_systemName['close_sys'] && (!strpos(__CONTROLLER__,'SysAdmin') !== false)){
            $this->display('Index/close');
            exit();
        }
		
		
    }
	
	function SendMsg($phone,$content){
		
			$statusStr = array(
			"0" => "短信发送成功",
			"-1" => "参数不全",
			"-2" => "服务器空间不支持,请确认支持curl或者fsocket，联系您的空间商解决或者更换空间！",
			"30" => "密码错误",
			"40" => "账号不存在",
			"41" => "余额不足",
			"42" => "帐户已过期",
			"43" => "IP地址限制",
			"50" => "内容含有敏感词"
			);
		
$smsapi = "http://api.smsbao.com/";
$user = $this->SysSet['msgno']; //短信平台帐号
$pass = md5($this->SysSet['msgscrepet']); //短信平台密码

$content=$content;//要发送的短信内容

$phone = $phone;//要发送短信的手机号码
$sendurl = $smsapi."sms?u=".$user."&p=".$pass."&m=".$phone."&c=".urlencode($content);
$result =file_get_contents($sendurl) ;
return $result;
if($result!=0){
	return false;
}
return true;
// echo $statusStr[$result];

		
	}


	function  isShengji($targetLevel,$userid,$parentpath){
        $Model = new \Think\Model(); // 实例化一个model对象 没有对应任何数据表
		$returnArray = "";	
//		$defaultuser =$Model-> table('nv_users')->where("id =1 ")->order("id desc")->find();
        $defaultuser =$Model-> table('ysk_user')->where("userid =606441 ")->find();
		if($targetLevel==1){
			return $this->setLevel('one_star_level','one_star_ge','one_star_team_level','one_star_team_ge','one_star_sh1','one_star_sh2',$userid,$parentpath);
			
		}
		if($targetLevel==2){
			return $this->setLevel('two_star_level','two_star_ge','two_star_team_level','two_star_team_ge','two_star_sh1','two_star_sh2',$userid,$parentpath);
			
		}
		if($targetLevel==3){
			return $this->setLevel('three_star_level','three_star_ge','three_star_team_level','three_star_team_ge','three_star_sh1','three_star_sh2',$userid,$parentpath);
			
		}
		if($targetLevel==4){
			return $this->setLevel('four_star_level','four_star_ge','four_star_team_level','four_star_team_ge','four_star_sh1','four_star_sh2',$userid,$parentpath);
			
		}
		if($targetLevel==5){
			return $this->setLevel('five_star_level','five_star_ge','five_star_team_level','five_star_team_ge','five_star_sh1','five_star_sh2',$userid,$parentpath);
			
		}
		if($targetLevel==6){
			return $this->setLevel('six_star_level','six_star_ge','six_star_team_level','six_star_team_ge','six_star_sh1','six_star_sh2',$userid,$parentpath);
			
		}
		if($targetLevel==7){
			return $this->setLevel('seven_star_level','seven_star_ge','seven_star_team_level','seven_star_team_ge','seven_star_sh1','seven_star_sh2',$userid,$parentpath);
			
		}
		if($targetLevel==8){
			return $this->setLevel('eight_star_level','eight_star_ge','eight_star_team_level','eight_star_team_ge','eight_star_sh1','eight_star_sh2',$userid,$parentpath);
			
		}
		if($targetLevel==9){
			return $this->setLevel('nine_star_level','nine_star_ge','nine_star_team_level','nine_star_team_ge','nine_star_sh1','nine_star_sh2',$userid,$parentpath);
			
		}
		
		return $returnArray;
			
	}
	
	function setLevel($level,$ge,$teamlevel,$teamge,$sh1,$sh2,$id,$parentpath){

        /*if(empty($parentpath)){
            $parentpath = 0;
        }*/
		$defaultuser = M('user')->where("userid =606441 ")->find();
//        $defaultuser = M('user')->where("userid =1 ")->order("userid desc")->find();
			$wheresql = $this->SysSet[$level]==-1  ? "" : " and standardlevel=".$this->SysSet[$level];
            // 计算上家人数
			$tjcount = M('user')->where("pid='{$id}' ".$wheresql)->count();

            $sql = M('user')->getLastSql();
			$wheresql = $this->SysSet[$teamlevel]==-1  ? "" : " and standardlevel=".$this->SysSet[$teamlevel];

			$teamtjcount = M('user')->where("FIND_IN_SET($id,rpath) ".$wheresql)->count();
			$sql = M('user')->getLastSql();
            //var_dump($sql);
//            echo  $this->SysSet[$ge];
//            echo  $this->SysSet[$teamge];
			if($tjcount >= $this->SysSet[$ge] && $teamtjcount>= $this->SysSet[$teamge]){
				//查找满足条件的审核人
				$wheresql = $this->SysSet[$sh1]==-1  ? " and 1=1 " : " and standardlevel = ".$this->SysSet[$sh1];
				if($this->SysSet[$sh1]==-1){
					$returnArray["find1"] = false;
				}else{

					$returnArray["find1"] = M('user')->where("userid in ($parentpath) ".$wheresql)->order("userid desc")->find();
                    $sql = M('user')->getLastSql();
                    //var_dump($sql);
					if(!$returnArray["find1"] || $returnArray["find1"] == NULL){
						$returnArray["find1"] = $defaultuser;
					}
				}


				$wheresql = $this->SysSet[$sh2]==-1  ? " and 1=1 " : " and standardlevel = ".$this->SysSet[$sh2];
			
				if($this->SysSet[$sh2]==-1){
					$returnArray["find2"] = false;
				}else{
					$returnArray["find2"] = M('user')->where("userid in ($parentpath) ".$wheresql)->order("userid desc")->find();

					if(!$returnArray["find2"]){
						$returnArray["find2"] = $defaultuser;
					}
				}
			}else{

				$this->SysSet[$ge] = $this->SysSet[$ge]== -1 ? '-' : $this->SysSet[$ge];
				$this->SysSet[$level] = $this->SysSet[$level]== -1 ? '-' : $this->SysSet[$level];
				$this->SysSet[$teamge] = $this->SysSet[$teamge]== -1 ? '-' : $this->SysSet[$teamge];
				$this->SysSet[$teamlevel] = $this->SysSet[$teamlevel]== -1 ? '-' : $this->SysSet[$teamlevel];
				return "您需要推荐".$this->SysSet[$ge]." 个 ".$this->SysSet[$level]." 星会员 且团队下面有 ".$this->SysSet[$teamge]." 个 ".$this->SysSet[$teamlevel]." 星会员";
			}
			

		return $returnArray;
	}
	
	function xitonginfo(){
        $Model = new \Think\Model(); // 实例化一个model对象 没有对应任何数据表

		$systemName=M("system");
		$rs_systemName=$systemName->field("syslogin,sysset,guanbegin,guanend")->where("sId=1")->find();
		$guanB=strtotime(date('H:i:s',$rs_systemName['guanbegin']));
		$guanE=strtotime(date('H:i:s',$rs_systemName['guanend']));
		$H=strtotime(date('H:i:s',time()));

		if($rs_systemName['sysset'] && $H >$guanB && $H < $guanE)
		{
//	       $this->success('网站休息中,请稍后');
			$this->assign('begin',date('H:i:s',$rs_systemName['guanbegin']));
			$this->assign('end',date('H:i:s',$rs_systemName['guanend']));
			$this->display('Index/close');
			exit();
		}
		if($rs_systemName['syslogin'])
		{
			exit("关闭登录");
		}
	}

	function isshowD(){

		$systemName=M("system");
		$sysdshow=$systemName->where("sId=1")->getField("sysdshow");
		return $sysdshow;
	}
	function showCcount(){

		$systemName=M("system");
		$sysdshow=$systemName->where("sId=1")->getField("showCcount");
		return $sysdshow;
	}
	/**
	 * 根据推荐人查询接点
	 */
	function GetPid($rid){
		//查询推荐人所在的组
		$users = M("user");
		$ruser = $users->field('tname')->where("loginname={$rid}")->find();
		$tname = $ruser['tname'];

		$tname = $tname ? $tname : 1;

		//查询所在组的等级一的用户
		$level1_array = $users->field('id,loginname,ppath,standardlevel,ceng,area')->where("tname='{$tname}' and standardlevel=1 ")->order(' sort asc ')->select();

		$small = 3;
		$pid = 0;
		foreach($level1_array as $k=>$v){
			$vcount = $this->GetPUserCount($v['loginname'],$users);
			if($small>$vcount){
				$small = $vcount;
				$ppath = $v['ppath'];
				$id = $v['id'];
				$pid = $v['loginname'];
				$rLevel = $v['standardlevel'];
				$ceng = $v['ceng'];
				$area = $v['area'];
			}
		}
		$pinfo['pid'] = $pid;
		$pinfo['id'] = $id;
		$pinfo['ppath'] = $ppath;
		$pinfo['rLevel'] = $rLevel;
		$pinfo['ceng'] = $ceng;
		$pinfo['area'] = $area;


		$pinfo['tname'] = $tname;
		return $pinfo;
	}

	/**
	 * 根据推荐人查询接点
	 */
	function GetPidByTname($tname){
		//查询推荐人所在的组
		$users = M("users");

		$tname = $tname ? $tname : 1;

		//查询所在组的等级一的用户
		$level1_array = $users->field('id,loginname,ppath,standardlevel,ceng,area')->where("tname='{$tname}' and standardlevel=1 ")->order(' sort asc ')->select();

		$small = 3;
		$pid = 0;
		foreach($level1_array as $k=>$v){
			$vcount = $this->GetPUserCount($v['loginname'],$users);
			if($small>$vcount){
				$small = $vcount;
				$ppath = $v['ppath'];
				$id = $v['id'];
				$pid = $v['loginname'];
				$rLevel = $v['standardlevel'];
				$ceng = $v['ceng'];
				$area = $v['area'];
			}
		}
		$pinfo['pid'] = $pid;
		$pinfo['id'] = $id;
		$pinfo['ppath'] = $ppath;
		$pinfo['rLevel'] = $rLevel;
		$pinfo['ceng'] = $ceng;
		$pinfo['area'] = $area;


		$pinfo['tname'] = $tname;
		return $pinfo;
	}

	
	
	

	function get_random($len=3){
		//range 是将10到99列成一个数组
		$numbers = range (10,99);
		//shuffle 将数组顺序随即打乱
		shuffle ($numbers);
		//取值起始位置随机
		$start = mt_rand(1,10);
		//取从指定定位置开始的若干数
		$result = array_slice($numbers,$start,$len);
		$random = "";
		for ($i=0;$i<$len;$i++){
			$random = $random.$result[$i];
		}
//		return 'h'.$random;  //提示总共八位字符 我删除一个吧
        return ''.($random);

	}



	function check_loginname($biaohao){

		$users=M("user")->field("mobile")->where("mobile='".$biaohao."'")->find();
		if(empty($users))
			return false;
		return true;
	}



	public function CheckMobile()
	{
		$getusername = str_replace('\'','',stripslashes($_GET["username"]));
		$id = str_replace('\'','',stripslashes($_GET["id"]));

		if($id){
			//修改查询
			$users=M("users")->field("loginname")->where("tel='".$getusername."' and id<>{$id}")->find();
		}
		else{
			$users=M("users")->field("loginname")->where("tel='".$getusername."'")->find();
		}
		if(empty($users)){
			echo "0";
			exit();
		}
		echo "1";
		exit();
	}
	
	/**
	 * 查找 4+1 4+2 4+3 4+4
	 */
	function getCountNum($rid,$tname){

		//	echo 'rid__'.$rid."__dai:".$dai."__b:".$b."__"."<br/>";
		$userModel = M("users");
		$wheresql = "rid = '{$rid}'";
		if($tname){
			$wheresql .= " and tname in ($tname)";
		}

		$rarray = $userModel->field("id,rid,dai,loginname,addtime")->where($wheresql)->select();
		$rcount = 0;
		if($rarray)
		{
			foreach($rarray as $k=>$v){
				$vcount = $userModel->where("rid={$v[loginname]}")->count();
				if($vcount>0){
					$rcount+=1;
				}
			}
		}
		return $rcount;
	}

	function getRceng01($rid,$dai,$b){

		//	echo 'rid__'.$rid."__dai:".$dai."__b:".$b."__"."<br/>";
		$userModel = M("users");
		$rarray = $userModel->field("id,rid,dai,loginname,addtime")->where("rid = '{$rid}'")->select();

		if($rarray)
		{
			foreach($rarray as $k=>$v){
				if($dai<$v['dai']) {
					$dai = $v["dai"];
				}
				$dai = $this->getRceng01($v['loginname'],$dai);
			}
		}
		return $dai;
	}

	function getRceng02($rid,$dai,$tname){

		//	echo 'rid__'.$rid."__dai:".$dai."__b:".$b."__"."<br/>";
		$userModel = M("users");
		$rarray = $userModel->field("id,rid,teamdai,loginname,addtime")->where("rid = '{$rid}' and tname=$tname ")->select();

		if($rarray)
		{
			foreach($rarray as $k=>$v){
				if($dai<$v['teamdai']) {
					$dai = $v["teamdai"];
				}
				$dai = $this->getRceng02($v['loginname'],$dai,$tname);
			}
		}
		return $dai;
	}
	function getRceng($rid,$dai,&$b,&$addtime){
		$b+=1;

		//echo 'rid__'.$rid."__dai".$dai."__b:".$b."__"."addtime:".$addtime."<br/>";
		$userModel = M("users");
		$rarray = $userModel->field("id,rid,dai,loginname,addtime")->where("rid = '{$rid}'")->select();

		if($rarray)
		{
			foreach($rarray as $k=>$v){
				if($addtime<$v['addtime']) {
					$addtime = $v['addtime'];
				}
				$this->getRceng($v['loginname'],$v['dai'],$b,$addtime);
			}
		}
		return $b;
	}
    /**
     * 获取此次登录IP信息
     */
    /**
     * 获取用户真实 IP
     */
    function getIP()
    {
        static $realip;
        if (isset($_SERVER)){
            if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])){
                $realip = $_SERVER["HTTP_X_FORWARDED_FOR"];
            } else if (isset($_SERVER["HTTP_CLIENT_IP"])) {
                $realip = $_SERVER["HTTP_CLIENT_IP"];
            } else {
                $realip = $_SERVER["REMOTE_ADDR"];
            }
        } else {
            if (getenv("HTTP_X_FORWARDED_FOR")){
                $realip = getenv("HTTP_X_FORWARDED_FOR");
            } else if (getenv("HTTP_CLIENT_IP")) {
                $realip = getenv("HTTP_CLIENT_IP");
            } else {
                $realip = getenv("REMOTE_ADDR");
            }
        }
        return $realip;
    }

    /**
     * 获取 IP  地理位置
     * 淘宝IP接口
     * @Return: array
     */
    function getCity($ip = '')
    {

        if($ip == ''){
            $url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json";
            $ip=json_decode(file_get_contents($url),true);
            $data = $ip;
        }else{
            $url="http://ip.taobao.com/service/getIpInfo.php?ip=".$ip;
            $ip=json_decode(file_get_contents($url));
            if((string)$ip->code=='1'){
                return false;
            }
            $data = (array)$ip->data;
        }

        return $data;
    }
	/*
	* 当前注册用户所关联的奖项发布
	*/
	function banfa_jihuo($user){

		$issuccess = true;
		$systemName=M("system");
		$userModel = M("users");
		$remark ="系统发放";

		$sysinfo = M("system");
		$kousAmount = $sysinfo->where("sid=1")->getField("ksbili");
		$userModel->startTrans();
		
		$systemInfo=$systemName->field("dianmoney,dianceng,affectmoney,affectceng,tong_bili,yin_bili,jin_bili")->where("sId=1")->find();
		
		$jihuoAmount = $user["jihuoAmount"];
		//推荐奖 begion 
		$ruser_array = $userModel->field("id,loginname,standardlevel")->where("id in ({$user[rpath]})  and standardlevel>0")->order("id desc")->limit(0,$systemInfo['affectceng'])->select();
		
		foreach($ruser_array as $k=>$ruser){

			if ($ruser['standardlevel']==1) {
				$jine = sprintf("%.2f", substr(sprintf("%.4f",($jihuoAmount*$systemInfo["tong_bili"]/100)), 0, -2));
			}elseif ($ruser['standardlevel']==2) {
				$jine = sprintf("%.2f", substr(sprintf("%.4f",($jihuoAmount*$systemInfo["yin_bili"]/100)), 0, -2));
			}elseif ($ruser['standardlevel']==3) {
				$jine = sprintf("%.2f", substr(sprintf("%.4f",($jihuoAmount*$systemInfo["jin_bili"]/100)), 0, -2));
			}


			 $ksamount = sprintf("%.2f", substr(sprintf("%.4f", $jine*$kousAmount/100),0, -2));

			$amount = sprintf("%.2f", substr(sprintf("%.4f",$jine - $ksamount), 0, -2));

			$issuccess = $this->addIncomeLog_kou($ruser["loginname"],"推荐奖",$jine,$amount,$ksamount,$kousAmount,$user["loginname"],$remark,1);
		}
		// 推荐奖end
		// 见点奖 begion
		if($issuccess){	

			if ($user['standardlevel']==1) {
				$ilimit=$systemInfo["jiandian_tong"];
				
			}elseif ($user['standardlevel']==2) {
				$ilimit=$systemInfo["jiandian_yin"];
			}elseif ($user['standardlevel']==3) {
				$ilimit=$systemInfo["jiandian_jin"];
			}
			$puser_array = $userModel->field("id,loginname")->where("id in ({$user[ppath]})  and standardlevel>0")->order("id desc")->limit(0,$ilimit)->select();
			
			foreach($puser_array as $k=>$puser){
				
				$jine = sprintf("%.2f", substr(sprintf("%.4f",($systemInfo["dianmoney"])), 0, -2));

				$ksamount = sprintf("%.2f", substr(sprintf("%.4f", $jine*$kousAmount/100), 0, -2));
				$amount = sprintf("%.2f", substr(sprintf("%.4f",$jine - $ksamount), 0, -2));
				$issuccess = $this->addIncomeLog_kou($puser["loginname"],"见点奖",$jine,$amount,$ksamount,$kousAmount,$user["loginname"],$remark,1);
			}
		}
		
		if($issuccess){
			$data = array();
			$data["jihuotime"] = time();
			$data["states"] = 1 ;
			
			if($userModel->where("id={$user[id]}")->save($data))//激活会员 
			{
				$userModel->commit();
			}
			else{
				$issuccess = false;
				$userModel->rollback();
			}
		}
		
		return $issuccess;
		
		// 见点奖 end
		

	}
//    /**
//     * 后台管理操作,写入金额记录  -- pp
//     */
//    function sys_amount_change($loginname,$user_id,$reason_user_id,$amount,$change_desc,$amount_type,$change_type){
//        $uinfo=M('users')->where("id = '{$user_id}'")->find();
//        $active_info = $this->sys_set();//获取比例
//        $data=array(
//            'loginname'=>$loginname,
//            'user_id'=>$user_id,
//            'reason_user_id'=>0,
//            'amount'=>$amount,
//            'change_desc'=>$change_desc,
//            'amount_type'=>$amount_type,
//            'change_type'=>$change_type,
//            'current_amount'=>$uinfo['amount'], //当时未变化前的余额
//            'current_bonus_amount'=>$uinfo['bonus_amount'], //当时奖金余额
//            'bonus_ratio'=>$active_info['bonus_ratio'],
//            'change_time'=>time(),
//        );
//        M('users')->where("id = '{$user_id}'")->setInc('amount',$amount);  //用户表
//        M('account_log')->add($data);                    //用户金钱表
//    }

	/*
	* 写入金额记录
	*/
	function addIncomeLog($userid,$types,$jine,$amount,$reason,$remark,$is_chuli=0){

		$income = M("income");

		if($jine!=0){

			$data["userid"] = $userid;
			$data["types"] = $types;
			$data["jine"] = $jine;
			$data["amount"] = $amount;
			$data["addtime"] = time();
			$data["reason"] = $reason;
			$data["remark"] = $remark;
			$data["ischuli"] = $is_chuli;
			if($is_chuli){
				$data["chulitime"] = time();
			}


			if($income->add($data)){
				//更新会员金额
				$users = M("users");
				if($users->where("loginname='{$userid}'")->setInc("amount",$jine)){
					return true;
				}
				else{
					return false;
				}
			}
			else{
				return false;
			}
		}
		return true;

	}

	
	/*
	* 写入金额记录
	*/
	function addIncomeLog_kou($userid,$types,$jine,$amount,$ksamount,$kousAmount,$reason,$remark,$is_chuli=0){
		
		$income = M("income");
		
		if($jine!=0){
			
			$data["userid"] = $userid;
			$data["types"] = $types;
			$data["jine"] = $jine;
			$data["amount"] = $amount;
			$data["kamount"] = $ksamount;
			$data["kzhi"] = $kousAmount;
			$data["addtime"] = time();
			$data["reason"] = $reason;
			$data["remark"] = $remark;
			$data["ischuli"] = $is_chuli;
			if($is_chuli){
				$data["chulitime"] = time();
			}

			
			if($income->add($data)){
				//更新会员金额 
				$users = M("users");
				$info =$users->where("loginname={$userid}")->find();


				$woe['amount']=$info['amount']+$amount;
				$woe['ksamount']=$info['ksamount']+$ksamount;

				if($users->where("loginname='{$userid}'")->save($woe)){
					return true;
				}
				else{
					return false;
				}

			}
			else{
				return false;
			}
		}
		return true;
		
	}
	
	
	
	

	/**
	 * 团队tree
	 */
	function getTree01($loginname,$plevel,$tname,$pid)
	{
		$tarray = array();
		$users=M("users");
		if($plevel==1){
			$where = "lpid='{$loginname}'";
			$order = "cengcount desc,zhicount desc, identityid asc,jihuotime asc";
		}else {
			$where = "pid='{$loginname}'";
			$order = "jihuotime asc";
		}
		$order = "sort asc";

		$ceng1_lists = $users->field("id,pid,rid,loginname,standardlevel,tname")->where($where)->order($order)->select();

		foreach($ceng1_lists as $k=>$v){

			$tarray[$v['loginname']]['id'] = $v['id'];
			$tarray[$v['loginname']]['parent_id'] = $pid;
			$tarray[$v['loginname']]['name'] = $v['loginname'];
			$tarray[$v['loginname']]['tname'] = $v['tname'];
			$tarray[$v['loginname']]['level'] = $v['standardlevel'];
			$tarray[$v['loginname']]['leveldesc'] = GetLevel($v['standardlevel']);
			$tarray[$v['loginname']]['parent_level'] = $plevel;
			$tarray[$v['loginname']]['parent_tname'] = $tname;
			$zhituiCount = $users->where("rid={$v['loginname']}")->count();
			$tarray[$v['loginname']]['zhituiCount'] = "<font color=red>".$zhituiCount."</font>";
			$ch_array =  $this->getTree01($v['loginname'],$v['standardlevel'],$v['tname'],$v['id']);
			$tarray[$v['loginname']]['childrencount'] = count($ch_array);
			$tarray[$v['loginname']]['children'] =  $ch_array;

		}
		return $tarray;
	}

	/**
	 * 团队tree
	 */
	function getTree($loginname,$plevel,$tname,$pid)
	{
		$tarray = array();
		$users=M("users");
		$ceng1_lists = $users->field("id,pid,rid,loginname,standardlevel,tname,zhicount,cengcount,tpath,area")->where("pid='{$loginname}'")->order("sort asc")->select();

		foreach($ceng1_lists as $k=>$v){

			$tarray[$v['loginname']]['id'] = $v['id'];
			$tarray[$v['loginname']]['parent_id'] = $pid;
			$tarray[$v['loginname']]['name'] = $v['loginname'];
			$tarray[$v['loginname']]['tname'] = $v['tname'];
			$tarray[$v['loginname']]['level'] = $v['standardlevel'];
			$tarray[$v['loginname']]['leveldesc'] = GetLevel($v['standardlevel']);
			$tarray[$v['loginname']]['parent_level'] = $plevel;
			$tarray[$v['loginname']]['parent_tname'] = $tname;

			//	$zhituiCount = $users->where("rid={$v['loginname']}")->count();
			$tarray[$v['loginname']]['zhituiCount'] = "<font color=red>".$v[zhicount]."</font>";
			$tarray[$v['loginname']]['cengCount'] = "<font color=red>".$v[cengcount]."</font>";
			$tarray[$v['loginname']]['tpath'] = $v[tpath];
			$tarray[$v['loginname']]['area'] = $v[area];
			$ch_array =  $this->getTree($v['loginname'],$v['standardlevel'],$v['tname'],$v['id']);
			$tarray[$v['loginname']]['childrencount'] = count($ch_array);
			$tarray[$v['loginname']]['children'] =  $ch_array;

		}
		return $tarray;
	}

	/**
	 * 直推tree
	 **/
	function getZhituiTree($info,$users){
		//$str .= "<ul>";
		$tarray = array();
		$info_lists = $users->field("id,rid,loginname,standardlevel")->where("rid='{$info[id]}'")->select();

		foreach($info_lists as $k=>$v){
			//$str .= "<li>".$v['loginname'];
			$tarray[$v['loginname']]['rid'] = $info['loginname'];
			$tarray[$v['loginname']]['name'] = $v['loginname'];
			$tarray[$v['loginname']]['level'] = GetLevel($v["standardlevel"]);
			$ch_array = $this->getZhituiTree($v,$users);
			$tarray[$v['loginname']]['childrencount'] = count($ch_array);
			$tarray[$v['loginname']]['children'] = $ch_array;

			//$str .= "</li>";
		}
		//$str .= "</ul>";
		return $tarray;
	}


	/**
	 * 组满员 ，添加会员调整记录
	 **/
	function insertTeamSet($teamid)
	{
		$teamModel = M("teamname");
		$tcount = $teamModel->field("teamcount")->where("id={$teamid}")->find();

		if($tcount['teamcount']==27)
		{
			//查找13组第一层
			$users = M("users");
			$utop1 = $users->field("id,loginname,pid")->where("standardlevel=3 and tname={$teamid}")->find();
			if(!$utop1)
				return false;

			$this->addTeamSet($utop1,$teamid,1);


			//13组往上第一层
			$utop2 = $users->field("id,loginname,pid")->where("loginname={$utop1[pid]}")->find();
			if(!$utop2)
				return false;
			$this->addTeamSet($utop2,$teamid,2);

			//13组往上第二层
			$utop3 = $users->field("id,loginname,pid")->where("loginname={$utop2[pid]}")->find();
			if(!$utop3)
				return false;
			$this->addTeamSet($utop3,$teamid,3);
		}
	}

	function addTeamSet($utop1,$teamid,$sort){

		//添加资料调整
		$setTeam = M("user_setteam");
		$teamData['userid'] = $utop1['id'];
		$teamData['loginname'] = $utop1['loginname'];
		$teamData['tname'] = $teamid;
		$teamData['addtime'] = time();
		$teamData['setsort'] = $sort;

		$setTeam->add($teamData);

	}


	function down1User($loginname,$ceng){
		$users=M("users");
		$returnsql = "";
		$id_array = $users->field("id,loginname")->where("pid='{$loginname}'")->select();

		foreach($id_array as $k=>$v){
			$returnsql.="$v[id],";
			if($ceng==1)
				$returnsql .= $this->down1User($v['loginname']);
		}

		if($returnsql){
			$returnsql = substr($returnsql,0,strrpos($returnsql,',',0));
		}
		return $returnsql;

	}

	/**
	 * 得到过期时间
	 */
	function getSetFenTime(){

		$systemName=M("system");
		$rs_systemName=$systemName->field("fenshijian")->where("sId=1")->find();
		$guoqi = $rs_systemName['fenshijian']*60*60;
		return $guoqi;
	}

	/**
	 * 得到注册金额
	 */
	function getSetRegAmount(){

		$systemName=M("system");
		$rs_systemName=$systemName->field("regAmount")->where("sId=1")->find();
		$guoqi = $rs_systemName['regAmount'];

		return $guoqi;
	}



	/**
	 * 支付成功注册
	 */
	function RegUser($log_id){
		$staffAdd = M("users");
		$pay_log = M("pay_log");
		$teamModel = M("teamname");
		$payinfo = $pay_log->where("log_id=$log_id and is_paid=1 and is_banfa=0")->find();
		if(!$payinfo){
			exit("error");
		}
		$txt_loginname = $payinfo['order_id'];
		$result =  $payinfo['order_id'];
		$pay_amount = $payinfo['order_amount'];

		if($this->check_loginname($txt_loginname))
		{
			$this->error("会员编号重复，请重新获取!");
		}

		//获得PID
		$parray = $this->GetPid($payinfo['rid']);

		if(!$parray['pid'])
		{
			$this->error("此组已满员，请核对信息");
			return ;
		}

		$data['tname'] = $parray['tname'];

		$teamCount = $teamModel->where("id={$data[tname]}")->count();
		if($teamCount>=27){
			$this->error("此组已满员，请核对信息");
			return ;
		}

		$data['pid'] = $parray['pid'];


		$r_user = $staffAdd->field("id,loginname,rpath,dai")->where("loginname='{$payinfo[rid]}'")->find();


		$data['tname'] = $parray['tname'];
		$data['rpath']=$r_user['rpath'].",".$r_user['id'];//推荐path
		$data['ppath'] = $parray['ppath'].",".$parray['id'];//接点path

		$data['dai'] = $r_user['dai']+1;
		$data['ceng'] = $parray['ceng']+1;
		$data["loginname"]=$txt_loginname;
		$data["bankname"]= $payinfo["truename"];
		$data["truename"]= $payinfo["truename"];
		$data["tel"]=$payinfo["tel"];
		$data["rid"]=$payinfo["rid"];
		$data["pwd1"]=$payinfo["pwd1"];
		$data["pwd2"]=$payinfo["pwd2"];
		$data["states"]=1;/*********************************提交线上需修改*/

		$data["adddate"]=date("Y-m-d",$payinfo["addtime"]);
		$data["addtime"]= $payinfo["addtime"];
		$data["jihuodate"]=date("Y-m-d");
		$data["jihuotime"]= time();


		$result=$staffAdd->add($data);


		if($result){


			$data["rr_id"] = $r_user["id"];
			$data["pp_id"] = $parray["id"];
			$data["rlevel"] = $parray["rLevel"];


			//判断用户是否需要抢点
			$this->qiangdian($data);
			//得到注册金额
			//$regAmount = $this->getSetRegAmount();
			//
			//发奖
			$this->banfa($data,$pay_amount);

			$newdata['is_banfa'] = 1;
			$pay_log->where("log_id=$log_id and is_paid=1")->save($newdata);

			//teamcount+1
			$teamModel->where("id={$data[tname]}")->setInc("teamCount",1);

			$this->insertTeamSet($data[tname]);
			$data['pay_amount'] = $pay_amount;
			return $data;
		}
		//user_setteam

		////$this->Fenjie($data['tname']);//拆分团队
	}


	/**
	 * 支付成功 激活用户
	 */
	function RegUser_NewByBaodanAmount($userModel,$jihuoType){
		$staffAdd = M("user");
		$teamModel = M("teamname");
		//获得PID

		if($userModel["tname"]){
			$parray = $this->GetPidByTname($userModel['tname']);
		}else {
			$parray = $this->GetPid($userModel['pid']);
		}

		if(!$parray['pid'])
		{
			$this->error("此组已满员，请核对信息");
			return ;
		}

		$data['tname'] = $parray['tname'];

		$teamCount = $teamModel->where("id={$data[tname]}")->count();
		if($teamCount>=27){
			$this->error("此组已满员，请核对信息");
			return ;
		}
		$data['pid'] = $parray['pid'];

		$r_user = $staffAdd->field("id,loginname,rpath,dai,tname,standardlevel,teamdai")->where("loginname='{$userModel[rid]}'")->find();

		$data["loginname"] = $userModel['loginname'];
		$data['tname'] = $parray['tname'];
		$data['ppath'] = $parray['ppath'].",".$parray['id'];//接点path
		$data['ceng'] = $parray['ceng']+1;
		$data['area'] = $parray['area'];
		$data["states"]=1;
		$data["jihuodate"]=date("Y-m-d");
		$data["jihuotime"]= time();
		$data["jihuoType"] = $jihuoType;
		$data["rid"] = $userModel['rid'];

		$result=$staffAdd->where("loginname='{$userModel[loginname]}'")->save($data);

		if($result){

			if($r_user['rpath']){
				$rpath_array = $staffAdd->field("loginname,dai,id")->where("id in ({$r_user[rpath]}) and tname=$r_user[tname]")->select();
				foreach($rpath_array as $k=>$v){
					unset($rpath_data);
					$cengcount = $this->getCountNum($v["loginname"],$r_user['tname']);
					$rpath_data['cengcount'] = $cengcount;
					$staffAdd->where("id = {$v[id]}")->save($rpath_data);
				}
			}
			//给推荐人加zhituicount
			$staffAdd->where("id={$r_user[id]}")->setInc('zhicount',1);//直推加1

			$data["rr_id"] = $r_user["id"];
			$data["pp_id"] = $parray["id"];
			$data["rlevel"] = $parray["rLevel"];
			//判断用户是否需要抢点
			$this->qiangdian($data);
			//得到注册金额
			//$regAmount = $this->getSetRegAmount();
			//
			//发奖
			$this->banfa($data,$userModel['jihuoAmount']);

			//teamcount+1
			$teamModel->where("id={$data[tname]}")->setInc("teamCount",1);
			$this->insertTeamSet($data[tname]);

			return $data;
		}
		//user_setteam

		////$this->Fenjie($data['tname']);//拆分团队
	}




	/**
	 * 支付成功 激活用户
	 */
	function RegUser_new($log_id){
		$staffAdd = M("user");
		$pay_log = M("pay_log");
		$teamModel = M("teamname");
		$payinfo = $pay_log->where("log_id=$log_id and is_paid=1 and is_banfa=0")->find();
		if(!$payinfo){
			exit("error");
		}

		$userModel = $staffAdd->field("id,loginname,tname,rid,jihuoAmount")->where("loginname='{$payinfo[order_id]}'")->find();

		$pay_amount = $payinfo['order_amount'];

		//获得PID
		if($userModel["tname"]){
			$parray = $this->GetPidByTname($userModel['tname']);
		}else {
			$parray = $this->GetPid($userModel['rid']);
		}

		if(!$parray['pid'])
		{
			$this->error("此组已满员，请核对信息");
			return ;
		}

		$data['tname'] = $parray['tname'];

		$teamCount = $teamModel->where("id={$data[tname]}")->count();
		if($teamCount>=27){
			$this->error("此组已满员，请核对信息");
			return ;
		}

		$data['pid'] = $parray['pid'];

		$r_user = $staffAdd->field("id,loginname,rpath,dai,tname,standardlevel,teamdai")->where("loginname='{$userModel[rid]}'")->find();

		$data["loginname"] = $userModel['loginname'];
		$data['tname'] = $parray['tname'];
		$data['ppath'] = $parray['ppath'].",".$parray['id'];//接点path
		$data['ceng'] = $parray['ceng']+1;
		$data['area'] = $parray['area'];
		$data["states"]=1;
		$data["jihuodate"]=date("Y-m-d");
		$data["jihuotime"]= time();
		$data["rid"] = $userModel["rid"];
		//$pay_amount
		if($pay_amount==$userModel['jihuoAmount'])
		{
			//全额支付
			$data['jihuoType'] = 2;
		}
		else{
			$data['jihuoType'] = 3;//混合支付
		}

		$result=$staffAdd->where("loginname='{$payinfo[order_id]}'")->save($data);

		if($result){

			if($r_user['rpath']){
				$rpath_array = $staffAdd->field("loginname,dai,id")->where("id in ({$r_user[rpath]}) and tname=$r_user[tname]")->select();
				foreach($rpath_array as $k=>$v){
					unset($rpath_data);
					$cengcount = $this->getCountNum($v["loginname"],$r_user['tname']);
					$rpath_data['cengcount'] = $cengcount;
					$staffAdd->where("id = {$v[id]}")->save($rpath_data);
				}
			}
			//给推荐人加zhituicount
			$staffAdd->where("id={$r_user[id]}")->setInc('zhicount',1);//直推加1

			$data["rr_id"] = $r_user["id"];
			$data["pp_id"] = $parray["id"];
			$data["rlevel"] = $parray["rLevel"];

			//判断用户是否需要抢点
			$this->qiangdian($data);
			//得到注册金额
			//$regAmount = $this->getSetRegAmount();
			//
			//发奖
			//$this->banfa($data,$userModel['jihuoAmount']);
			$this->banfa($data,5000);

			$newdata['is_banfa'] = 1;
			$pay_log->where("log_id=$log_id and is_paid=1")->save($newdata);

			//teamcount+1
			$teamModel->where("id={$data[tname]}")->setInc("teamCount",1);

			$this->insertTeamSet($data[tname]);
			$data['pay_amount'] = $pay_amount;
			return $data;
		}
		//user_setteam

		////$this->Fenjie($data['tname']);//拆分团队
	}




	/*
	* 写报单币记录
	*/

	function useramount_change($id,$loginname,$curlevel,$baodanAmount,$amount,$reason,$typedesc,$desc,$change_type,$fafang=0){


		$incomeInfo=M("income");
		$data['userid'] = $id;
		$data['amount'] = $amount;
		$data['baodanAmount'] = $baodanAmount;
		$data['adddate'] = date('Y-m-d',time());
		$data['addtime'] = time();
		$data['reason'] = $reason;
		$data['change_type'] = $change_type;
		$data['changedesc'] = $desc;
		$data['typesdesc'] = $typedesc;
		$data['loginname'] = $loginname;
		$data['curlevel'] = $curlevel;

		//添加记录
		if($incomeInfo->add($data)){

			$usermodel = M("users");
			$uinfo = $usermodel->where("id={$id}")->find();
			unset($data);
			//更新用户账户
			$data['baodanAmount'] = $uinfo['baodanAmount']+($baodanAmount);
			$data['amount'] = $uinfo['amount']+($amount);
			return $usermodel->where("id={$id}")->save($data);
		}
		return false;

	}

	public function User_Zhuanzhang($loginname,$username,$incoin,$type){

		//写入转账记录
		$changeMoney = M("change_money");
		$data["send_userid"] = $loginname;
		$data["to_userid"] = $username;
		$data["money"] = $incoin;
		$data['types'] = $type;//转出
		$data["change_time"] = time();

		$changeMoney->add($data);

	}

	/*
	 * 报单币转账
	 * */
	public function is_checkTouser($username){
		$this->LoginTrue();
		$loginname = session("nvip_member_User");
		$user = M("users");

		$result['msg'] = "no";
		//$username="100021";
		if(!$username)
		{
			$result['msg'] = "no";
			return $result;
			exit;
		}


		$userModel = $user->field("id,rid,loginname,rpath,truename")->where("loginname='{$loginname}'")->find();

		if($userModel['rpath']) {
			$rarray = $user->field("id,loginname")->where("id in ({$userModel[rpath]})")->select();
			$istrue = "0";
			foreach ($rarray as $k => $v) {
				if ($v['loginname'] == $username) {
					$result['msg'] = "ok";
					$result['truename'] = $v['truename'];
					break;
				}
			}
		}

		if($result['msg']=="no"){
			$userModel = $user->field("id,rid,loginname,rpath,truename")->where("loginname='{$username}'")->find();
			if(!$userModel){
				$result['msg'] = "nouser";
				return $result;
				exit;
			}

			$rarray = $user->field("id,loginname,truename")->where("id in ({$userModel[rpath]})")->select();

			foreach($rarray as $k=>$v){
				if($v['loginname']==$loginname){
					$result['msg']="ok";
					$result['truename']=$v['truename'];
					break;
				}
			}

		}



		return $result;
		exit;
	}

	public function relation_e($loginname){
		$users = M('users');
		$pid['pid'] = array('in',$loginname);


		$all = $users->where("standardlevel=3")->where($pid)->getField('loginname',true);

		if($all){
			return $all;
		}
		$pid['pid'] = array('in',$loginname);
		$all = $users->where($pid)->getField('loginname',true);

		$all = implode(',',$all);

		return $this->relation_e($all);
	}
	/**
	 * 判断用户是否出局
	 */
	public function is_out(){
		$flag=M('users')->where("pid='{$_SESSION['nvip_member_User']}' AND standardlevel>4")->find();
		return $flag?true:false;
	}

	/**
	 * 判断用户是否出局
	 */
	public function is_out_user($pid){
		$flag=M('users')->where("rid='$pid' AND standardlevel>4")->find();
		return $flag?true:false;
	}

	public function CheckTuijianTrueName()
	{
		$getusername = str_replace('\'','',stripslashes($_GET["username"]));

		$users=M("users")->field("truename,loginname")->where("loginname='{$getusername}' AND states > 0")->find();

		$returnData = array("error"=>0,"msg"=>"");
		
		if(empty($users)){
			$returnData = array("error"=>1,"msg"=>"不存在此推荐人");
			echo json_encode($returnData);
			exit();
		}
		$returnData['realName'] = $users['truename'];
		echo json_encode($returnData);
		exit();
	}

	public function CheckTuijian()
	{
		$getusername = str_replace('\'','',stripslashes($_GET["username"]));
		$users=M("users")->field("loginname,truename")->where("loginname='{$getusername}' AND states > 0")->find();

		if(empty($users)){
			echo "0";
			exit();
		}
		
		echo $users['truename'];
		exit();
	}
    public function check_active_member()  //判断能不能作为被激活人员
    {
        $getusername = str_replace('\'','',stripslashes($_GET["username"]));

        $users=M("users")->field("loginname")->where("loginname='{$getusername}' AND states < 1")->find();

        if(empty($users)){
            echo "0";
            exit();
        }
        echo "1";
        exit();
    }
    public function user_account_log($loginname,$user_id,$reason_user_id,$amount,$change_desc,$amount_type,$change_type)   //用户余额变动方法
    {
        $uinfo=M('users')->where("id = '{$user_id}'")->find();
        $active_info = $this->sys_set();//获取比例
        $data=array(
            'loginname'=>$loginname,
            'user_id'=>$user_id,
            'reason_user_id'=>$reason_user_id,
            'amount'=>$amount,
            'change_desc'=>$change_desc,
            'amount_type'=>$amount_type,
            'change_type'=>$change_type,
            'current_amount'=>$uinfo['amount'], //当时未变化前的余额
            'current_bonus_amount'=>$uinfo['bonus_amount'], //当时奖金余额
            'bonus_ratio'=>$active_info['bonus_ratio'],
            'change_time'=>time(),
        );
        M('users')->where("id = '{$user_id}'")->setInc('amount',$amount);  //用户表
        M('account_log')->add($data);                    //用户金钱表
    }

    public function user_account_log_gwjf($loginname,$user_id,$reason_user_id,$amount,$change_desc,$amount_type,$change_type)   //用户余额变动方法
    {
        $uinfo=M('users')->where("id = '{$user_id}'")->find();
        $active_info = $this->sys_set();//获取比例
        $data=array(
            'loginname'=>$loginname,
            'user_id'=>$user_id,
            'reason_user_id'=>$reason_user_id,
            'amount'=>$amount,
            'change_desc'=>$change_desc,
            'amount_type'=>$amount_type,
            'change_type'=>$change_type,
            'current_amount'=>$uinfo['gouwujf'], //当时未变化前的余额
            'current_bonus_amount'=>$uinfo['bonus_amount'], //当时奖金余额
            'bonus_ratio'=>"",
            'change_time'=>time(),
        );
        M('users')->where("id = '{$user_id}'")->setInc('gouwujf',$amount);  //用户表
        M('account_log')->add($data);                    //用户金钱表
    }

    /**
     * @param $loginname
     * @param $user_id
     * @param $reason_user_id
     * @param $real_amount  扣过之后的金额
     * @param $amount  没扣的金额
     * @param $change_desc
     * @param $amount_type
     * @param $change_type
     *
     */
    public function user_account_log_bonus($loginname,$user_id,$reason_user_id,$real_amount,$amount,$change_desc,$amount_type,$change_type)
        //奖金转注册币
    {
        $uinfo=M('users')->where("id = '{$user_id}'")->find();
        $active_info = $this->sys_set();//获取比例
        $data=array(
            'loginname'=>$loginname,
            'user_id'=>$user_id,
            'reason_user_id'=>$reason_user_id,
            'amount'=>$real_amount,
            'real_amount'=>$amount,
            'change_desc'=>$change_desc,
            'amount_type'=>$amount_type,
            'change_type'=>$change_type,
            'current_amount'=>$uinfo['amount'], //当时未变化前的余额
            'current_bonus_amount'=>$uinfo['bonus_amount'], //当时奖金余额
            'bonus_ratio'=>$active_info['bonus_ratio'],
            'change_time'=>time(),
        );
        M('users')->where("id = '{$user_id}'")->setInc('bonus_amount',$amount);  //用户表
        M('account_log')->add($data);                    //用户金钱表
    }
	
    public function add_yanqi_log($data)
    //奖金转注册币
    {
        M('yanqilog')->add($data);                    //延期记录表
    }
	
    /**
     * 每日结算写入数据表jiesuan_day
     */
     public  function jiesuan_day_select($loginname,$user_id,$standardlevel,$invite_count,$left_count,$right_count,$three_count,$amount,$current_amount,$current_bonus_amount,$jiesuan_desc,$daoqi_time,$date){
            $data['loginname']=$loginname;
            $data['user_id']=$user_id;
             $data['standardlevel']=$standardlevel;
             $data['invite_count']=$invite_count;
             $data['left_count']=$left_count;
             $data['right_count']=$right_count;
             $data['three_count']=$three_count;
            $data['amount']=$amount;
            $data['current_amount']=$current_amount;
            $data['current_bonus_amount']=$current_bonus_amount;
            $data['jiesuan_desc']=$jiesuan_desc;
            $data['jiesuan_desc']=$jiesuan_desc;
            $data['daoqi_time']=$daoqi_time;
            $data['date']=$date;
            $data['is_chuli']=0;
            M('jiesuan_day')->add($data);
     }
	//判断接点人
	public function CheckJieDian()
	{
		$getusername = str_replace('\'','',stripslashes($_GET["username"]));
		$tjname = str_replace('\'','',stripslashes($_GET["tjname"]));
		

		$users=M("users")->field("loginname,truename,id")->where("loginname='{$getusername}' AND states > 0")->find();

		if(empty($users)){
			echo "0";
			exit();
		}
		
		$pid = $users['id'];
		
		$tjusers=M("users")->field("loginname,truename,id")->where("loginname='{$tjname}' AND states > 0")->find();

		if(empty($tjusers)){
			echo "1";
			exit();
		}
		
		$tjuserid = $tjusers['id'];
		if($pid == $tjuserid){
			
			echo $users['truename'];
			exit();
		}
		//推荐人不在节点人的 节点上  不能推荐
		$isuser = M("users")->field("loginname,truename,id")->where(" FIND_IN_SET($tjuserid,ppath) AND states > 0 and id=$pid")->find();
		
		if(empty($isuser)){
			echo "2";
			exit();
		}
		
		
		
		echo $users['truename'];
		exit();
	}
	
	//判断接点人
	public function CheckPassword()
	{
		
		$getusername = str_replace('\'','',stripslashes($_GET["username"]));

        $loginname = session("nvip_nvip_member_User");
		
            $user =  M('users');
            $pass = $user->where("loginname='".$loginname."'AND pwd2='".md5($getusername)."'")->count();
            if(!$pass){
				echo "1";
				exit();
            }

		$_SESSION["upinfo_pass"] = 1;
		echo 0;
		exit();
	}
	
	//安放区域
	public function CheckAqu()
	{
		$getusername = str_replace('\'','',stripslashes($_GET["username"]));

		$users=M("users")->field(count('id'))->where("pid='{$getusername}' and area=1")->find();

		if(empty($users)){
			echo "1";
			exit();
		}
		echo "0";
		exit();
		
		
	}
	public function CheckBqu()
	{
		$getusername = str_replace('\'','',stripslashes($_GET["username"]));

		$users=M("users")->field(count('id'))->where("pid='{$getusername}' and area=2")->find();

		if(empty($users)){
			echo "1";
			exit();
		}
		echo "0";
		exit();
	}
    public function CheckCqu()
    {
        $getusername = str_replace('\'','',stripslashes($_GET["username"]));
        //判断是不是七星含七星以上会员
        $user_seven=M("users")->field(count('id'))->where("loginname='{$getusername}' and standardlevel>7")->find();
        $users=M("users")->field(count('id'))->where("pid='{$getusername}' and area=3")->find();
        if(!$user_seven){
            echo '2';
            exit();
        }
        if(empty($users)){
            echo "1";
            exit();
        }
        echo "0";
        exit();
    }
    //获取用户激活所需要的金额
    public function sys_set(){
	    $sys=M('sys_set');
	    return $sys->where('id=1')->find();
    }


	function getAreaCount($loginname,$area,$icount,$orderSum){

		$users = M("users");
		$pchild = $users->field("loginname")->where("pid='{$loginname}' and area=$area")->find();
		if($pchild){
			$icount+=1;
			//查询消费金额
			$order = M("order_info");
			$orderAmount = $order->field("sum(order_jine) as order_sum")->where("userid='{$pchild[loginname]}'")->find();
			$orderSum += $orderAmount['order_sum'];
			return $this->getAreaCount($pchild['loginname'],$area,$icount,$orderSum);
		}
		$tarray['icount'] = $icount;
		$tarray['orderSum'] = $orderSum;
		return $tarray;

	}

}
