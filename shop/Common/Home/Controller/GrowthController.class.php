<?php
namespace Home\Controller;
use Think\Controller;
class GrowthController extends CommonController {


     //===========采蜜记录===============
    public function StealDeatail(){
        if(!IS_AJAX){
            return false;
        }
        $userid=session('userid');
        $m=M('steal_detail');
        $where['uid']=$userid;

        $p = I('p','0','intval');
        $page=$p*10;
        $arr=$m->field("num s_num,username uname,type_name,FROM_UNIXTIME(create_time,'%Y-%m-%d %H:%i') as tt ")->where($where)->order('id desc')->limit(
            $page,10)->select();
       if(empty($arr)){
               $arr=null; 
        }
        $this->ajaxReturn($arr);
    }

//    转入
    public function Intro(){
        $time = time();
        $userid = session('userid');
       $uinfo = M('user')->where(array('userid' => $userid))->field('username,is_dailishang,userid,img_head,use_grade,user_credit,vip_grade')->find();
		$u_ID = $userid;
		$drpath = './Uploads/Rcode';
		$imgma = 'codes' . $userid . '.png';
		$urel = '/Uploads/Rcode/' . $imgma;
		if (!file_exists($drpath . '/' . $imgma)) {
            sp_dir_create($drpath);
            vendor("phpqrcode.phpqrcode");
            $phpqrcode = new \QRcode();
            $hurl = "http://{$_SERVER['HTTP_HOST']}" . U('Index/Changeout/sid/' . $u_ID);
           // $hurl = "http://www.huiyunx.com" . U('Index/Changeout/sid/' . $u_ID);
            $size = "7";
            //$size = "10.10";
            $errorLevel = "L";
            $phpqrcode->png($hurl, $drpath . '/' . $imgma, $errorLevel, $size);
        }
		$this->urel = $urel;
     	 $moneyinfo = M('store')->where(array('uid' => $userid))->field('cangku_num,fengmi_num')->find();
     	 $coindets=array();
		for($i=1;$i<=5;$i++){
			$coindets[]= D('coindets')->where("cid=".$i)->order('coin_addtime desc')->find();
		}
      //当前我的资产
        $minecoins = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>array("neq",0)))->order('cid asc')->select();
        $this->assign('minecoins',$minecoins);
		$this->assign('coindets',$coindets);
		$this->assign('moneyinfo', $moneyinfo);
      	$this->assign('uinfo',$uinfo);
        $this->display();
    }

    //转入明细
    public function Introrecords(){
        $uid = session('userid');
        $where['get_id'] = $uid;
        $where['get_type'] = 0;
        $Chan_info = M('tranmoney')->where($where)->order('id desc')->select();
        $this->assign('Chan_info',$Chan_info);
        $this->assign('uid',$uid);
        $this->display();
    }


    //取消订单
 public function quxiao_order(){

    $id = (int)I('id','intval',0);
    $uid = session('userid');
    $mydeal = M('trans')->where(array("id"=>$id,"payin_id|payout_id"=>$uid,"pay_state"=>array("lt",2)))->find();

     if(!$mydeal)ajaxReturn(L('ddbcz'),0);

    $type=$mydeal["trans_type"];
    M('trans_quxiao')->add($mydeal);//把记录复制到另一个表


    if($type==1){//卖出单，自己是购买方，只清空payin_id和改变pay_state为0

            $payout['payin_id'] =0;
            $payout['pay_state'] =0;
            $res1 = M('trans')->where(array('id'=>$id))->save($payout); 


    }elseif($type==0){//为购买单，删除订单
        if(!empty($mydeal['payout_id'])){
            $sellnums = $mydeal["pay_nums"];
            $shouxufei = $mydeal["fee_nums"];
            $allNum = bcadd($shouxufei,$sellnums,2);
            $uidSale = $mydeal['payout_id'];
            $doDec = M('store')->where(array('uid'=>$uidSale))->setInc('cangku_num',$allNum);

            //增加卖出方的余额记录

            $pay_n = M('store')->where(array('uid' => $uidSale))->getfield('cangku_num');
            addAccountRecords($mydeal['payout_id'],0,$mydeal['pay_nums'],13,$pay_n,$type = 'money');
//            $jifen_dochange['now_nums'] = $pay_n;
//            $jifen_dochange['now_nums_get'] = $pay_n;
//            $jifen_dochange['is_release'] = 1;
//            $jifen_dochange['pay_id'] = 0;
//            $jifen_dochange['get_id'] = $uidSale;
//            $jifen_dochange['get_nums'] = $allNum;
//            $jifen_dochange['get_time'] = time();
//            $jifen_dochange['get_type'] = 10;
//            $res_addres = M('tranmoney')->add($jifen_dochange);
        }
        $res1 = M('trans')->delete($id); 


    }

        if($res1){       
        ajaxReturn(L('qxcg'),1);
        }else{
        ajaxReturn(L('czsb'),1);
        }
}


    //买入
    public function Purchase(){

        $uid = session('userid');
        $cid = trim(I('cid'));
        if(empty($cid)){
            $mapcas['user_id&is_default'] = array($uid,1,'_multi'=>true);
            $carinfo = M('ubanks')->where($mapcas)->count(1);
            if($carinfo < 1){
                $morecars = M('ubanks as u')
                    ->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )
                    ->where(array('u.user_id'=>$uid))
                    ->limit(1)
                    ->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre')
                    ->find();
            }else{
                $morecars = M('ubanks as u')
                    ->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )
                    ->where(array('u.user_id'=>$uid,'is_default'=>1))
                    ->limit(1)
                    ->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre')
                    ->find();
            }
        }else{
            $morecars = M('ubanks as u')
                ->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )
                ->where(array('u.id'=>$cid))
                ->limit(1)
                ->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre')
                ->find();
        }

        //生成买入订单
        if(IS_AJAX){
            $pwd = trim(I('pwd'));
            $sellnums = trim(I('sellnums'));//出售数量
            $cardid = trim(I('cardid'));//银行卡id
            $messge = trim(I('messge'));//留言
            $sellAll = array(500,1000,3000,5000,10000,30000);

            //判断是否有未处理订单==yuan==
            $statusOrder = M('trans')->where(array('pay_state'=>['in',['0,1,2']],'payin_id'=>$uid,
            ))->select();
            $statusOrder1 = M('trans')->where(array('pay_state'=>['in',['0,1,2']],'payout_id'=>$uid,
            ))->select();
            //dump($statusOrder);exit;
            if($statusOrder || $statusOrder1){
                ajaxReturn(L('cldd'),0);
            }

            if (!in_array($sellnums, $sellAll)) {
                ajaxReturn(L('nxzmrdjebcz'),0);
            }
//            //自己是否有足够余额
            $is_enough = M('store')->where(array('uid'=>$uid))->getField('cangku_num');
            if(100 > $is_enough){
                ajaxReturn(L('ndyebz'),0);
            }
            //验证银行卡是否是自己
            $id_Uid = M('ubanks')->where(array('id'=>$cardid))->getField('user_id');
            if($id_Uid != $uid){
                ajaxReturn(L('yhkbsnd'),0);
            }
            //验证交易密码
            $minepwd = M('user')->where(array('userid'=>$uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
            $user_object = D('Home/User');
            $user_info = $user_object->Trans($minepwd['account'], $pwd);
            //生成订单
            $data['pay_no'] = build_order_no();
            $data['payin_id'] = $uid;
            $data['out_card'] = $cardid;
            $data['pay_nums'] = $sellnums;
            $data['trade_notes'] = $messge;
            $data['pay_time'] = time();
            $data['trans_type'] = 0;
            $res_Add = M('trans')->add($data);
            //给自己减少这么多余额
            if($res_Add){
                $doDec = M('store')->where(array('uid'=>$uid))->setDec('cangku_num',100);
                $cangkuNum = M('store')->where(array('uid'=>$uid))->getField('cangku_num');
                //添加余额记录
                addAccountRecords($uid,0,-100,21,$cangkuNum,$type = 'money');
                ajaxReturn(L('mrddcjcg'),1);
            }
        }
      $coindets=array();
      for($i=1;$i<=5;$i++){
      $coindets[]= D('coindets')->where("cid=".$i)->order('coin_addtime desc')->find();

      }
      //当前我的资产
        $minecoins = M('ucoins')->where(array('c_uid'=>$uid,'cid'=>array("neq",0)))->order('cid asc')->select();
        $this->assign('minecoins',$minecoins);
		$this->assign('coindets',$coindets);
      	$moneyinfo = M('store')->where(array('uid' => $uid))->field('cangku_num,fengmi_num')->find();
		$this->assign('moneyinfo', $moneyinfo);
        $this->assign('morecars',$morecars);
        $this->display();

    }

    //添加银行卡
    public function test1(){
        $sellnums = array(500,1000,3000,5000,10000,30000);
        $sellnums = 5000;//出售数量
        $sellAll = array(500,1000,3000,'5000',10000,30000);
        if (!in_array(500, $sellAll)) {
            echo "Got Irix";
        }
    }
    /**
     *
     */
    public function Addbank(){
        $bakinfo = M('bank_name')->order('q_id asc')->select();
        $this->assign('bakinfo',$bakinfo);
        if(IS_AJAX){
            $uid = session('userid');
            $crkxm = I('crkxm');
            $khy = I('khy');
            $yhk = I('yhk');
            $khzy = I('khzy');

            if(empty($crkxm)){
                ajaxReturn(L('qsrzsxm'),0);
            }
            if(empty($khy)){
               ajaxReturn(L('addcard3'),0);
            }
            if(empty($yhk)){
                ajaxReturn(L('qsryhkh'),0);
            }
            if(empty($khzy)){
                ajaxReturn(L('qsrkhzh'),0);
            }

            $data['hold_name'] = $crkxm;
            $data['card_id'] = $khy;
            $data['card_number'] = $yhk;
            $data['open_card'] = $khzy;
            $data['add_time'] = time();
            $data['user_id'] = $uid;

            $res_addcard = M('ubanks')->add($data);
            if($res_addcard){
                //设置用户银行卡姓名
                $bank_uname = M('user')->where(array('userid'=>$uid))->getField('bank_uname');
                if(empty($bank_uname)){
                    M('user')->where(array('userid'=>$uid))->setField('bank_uname',$crkxm);
                }
                    ajaxReturn(L('yhktjcg'),1,'/Growth/Purchase');
            }
        }
        $this->display();
    }
    //订单中心
    public function Nofinsh(){
        $state = trim(I('state'));
        $uid = session('userid');
        $traInfo = M('trans');
        if($state > 0){
            $where['pay_state'] =  array('between','1,2');
        }else{
            $where['pay_state'] = 0;
        }
        $where['payin_id'] = $uid;

        //分页
        $p=getpage($traInfo,$where,20);
        $page=$p->show();
        $orders = $traInfo->where($where)->order('id desc')->select();
        $banks = M('ubanks');
        foreach($orders as $k =>$v){
            if($v['payin_id'] != ''){
                //银行卡号.开户支行.开户银行
                $bankinfos = $banks ->where(array('id'=>$v['card_id']))->field('hold_name,card_number,card_id,open_card')->find();
                $uinfomsg = M('user')->where(array('userid'=>$v['payout_id']))->Field('username,mobile')->find();
                $orders[$k]['cardnum'] = $bankinfos['card_number'];
                $orders[$k]['bname'] = M('bank_name')->where(array('q_id'=>$bankinfos['card_id']))->getfield('banq_genre');
                $orders[$k]['openrds'] = $bankinfos['open_card'];
                $orders[$k]['uname'] = $uinfomsg['username'];
                $orders[$k]['umobile'] = $uinfomsg['mobile'];

            }
        }
        $this->assign('state',$state);
        $this->assign('orders',$orders);
        $this->assign('page',$page);
        $this->display();
    }
    //确认打款
    public function Conpay(){
        //查询我买入的
        $uid = session('userid');
        $traInfo = M('trans');
        $banks = M('ubanks');
        $where['payin_id'] = $uid;
        $where['pay_state'] = 1;
        //分页
        $p=getpage($traInfo,$where,20);
        $page=$p->show();
        $orders = $traInfo->where($where)->order('id desc')->select();
        //收款人
        foreach($orders as $k =>$v){
            //银行卡号.开户支行.开户银行
            $bankinfos = $banks ->where(array('id'=>$v['card_id']))->field('hold_name,card_number,card_id,open_card')->find();
            $uinfomsg = M('user')->where(array('userid'=>$v['payout_id']))->Field('username,mobile')->find();
            $orders[$k]['cardnum'] = $bankinfos['card_number'];
            $orders[$k]['bname'] = M('bank_name')->where(array('q_id'=>$bankinfos['card_id']))->getfield('banq_genre');
            $orders[$k]['openrds'] = $bankinfos['open_card'];
            $orders[$k]['uname'] = $bankinfos['hold_name'];
            $orders[$k]['umobile'] = $uinfomsg['mobile'];
        }
        if(IS_AJAX){
            $uid = session('userid');
            $picname = $_FILES['uploadfile']['name'];
            $picsize = $_FILES['uploadfile']['size'];
            $trid = trim(I('trid'));

            if($trid <= 0){
                ajaxReturn(L('tjsbcxd'),0);
            }
            if ($picname != "") {
                if ($picsize > 2014000) { //限制上传大小
                    ajaxReturn(L('tpdxbncg'),0);
                }
                $type = strstr($picname, '.'); //限制上传格式
                if ($type != ".gif" && $type != ".jpg" && $type != ".png"  && $type != ".jpeg") {
                    ajaxReturn(L('tpgsbd'),0);
                }
                $rand = rand(100, 999);
                $pics = uniqid() . $type; //命名图片名称
                //上传路径
                $pic_path = "./Uploads/Payvos/". $pics;
                move_uploaded_file($_FILES['uploadfile']['tmp_name'], $pic_path);
            }
            $size = round($picsize/1024,2); //转换成kb
            $pic_path = trim($pic_path,'.');
            if($size){
                $res = M('trans')->where(array('id'=>$trid))->setField(array('trans_img'=>$pic_path,'pay_state'=>2));
                if($res){
                    ajaxReturn(L('dktjcg'),1,'/Growth/Conpay');
                }else{
                    ajaxReturn(L('dktjsb'),0);
                }
            }
        }
        $this->assign('page',$page);
        $this->assign('orders',$orders);
        $this->display();
    }

    public function Paidimg(){
        $id = I('id');
        $imginfo = M('trans')->where(array('id'=>$id))->getField('trans_img');
        $this->assign('imginfo',$imginfo);

        $this->display();
    }

    //已完成订单
    public function Dofinsh(){
        //查询我买入的
        $uid = session('userid');
        $traInfo = M('trans');
        $banks = M('ubanks');
        $where['payin_id'] = $uid;
        $where['pay_state'] = 3;
        //分页
        $p=getpage($traInfo,$where,20);
        $page=$p->show();
        $orders = $traInfo->where($where)->order('id desc')->select();
        //收款人
        foreach($orders as $k =>$v){
            //银行卡号.开户支行.开户银行
            $bankinfos = $banks ->where(array('id'=>$v['card_id']))->field('hold_name,card_number,card_id,open_card')->find();
            $uinfomsg = M('user')->where(array('userid'=>$v['payout_id']))->Field('username,mobile')->find();
            $orders[$k]['cardnum'] = $bankinfos['card_number'];
            $orders[$k]['bname'] = M('bank_name')->where(array('q_id'=>$bankinfos['card_id']))->getfield('banq_genre');
            $orders[$k]['openrds'] = $bankinfos['open_card'];
            $orders[$k]['uname'] = $uinfomsg['username'];
            $orders[$k]['umobile'] = $uinfomsg['mobile'];
        }
        $this->assign('page',$page);
        $this->assign('orders',$orders);
        $this->display();
    }
    //判断是否处于交易时间
    public function jsajax()
    {
        if(!empty($_POST) && $_POST['ac']=='create'){
           $arr = D('config')->where('id=77')->find();
            $arrone = explode("-",$arr['options']);
            $time = date('H:i',time());
            if ($time>$arrone[0] && $time<$arrone[1]) {
               echo "1";
            }else{
               echo "0";
            }
            
        }
    }
    //买入记录
    public function Buyrecords(){
        $traInfo = M('trans');
        $uid = session('userid');
        $where['payin_id'] = $uid;
        //分页
        $p=getpage($traInfo,$where,20);
        $page=$p->show();
        $Chan_info = $traInfo->where($where)->order('id desc')->select();
        foreach ($Chan_info as $k =>$v){
            $Chan_info[$k]['username'] = M('user')->where(array('userid'=>$v['payout_id']))->getField('username');
            $Chan_info[$k]['get_timeymd'] = date('Y-m-d',$v['pay_time']);
            $Chan_info[$k]['get_timedate'] = date('H:i:s',$v['pay_time']);
        }
        if(IS_AJAX){
            if(count($Chan_info) >= 1) {
                ajaxReturn($Chan_info,1);
            }else{
                ajaxReturn(L('zwjl1'),0);
            }
        }
        $this->assign('page',$page);
        $this->assign('Chan_info',$Chan_info);
        $this->assign('uid',$uid);
        $this->display();
    }


//卖入中心
    public function Buycenter(){
        if(IS_AJAX){
            $pricenum = I('mvalue');
            if($pricenum == ''){
                ajaxReturn(L('qxzzqdddjg'),0);
            }
            $order_info = M('trans as tr')
                ->join('LEFT JOIN  ysk_user as us on tr.payout_id = us.userid')
                ->where(array('tr.pay_state'=>0,'tr.trans_type'=>1,'tr.pay_nums'=>$pricenum,'tr.payout_id'=>array('gt',0)))
                ->order('id desc')
                ->select();
            foreach($order_info as $k => $v){
                $order_info[$k]['cardinfo'] = M('bank_name bn')
                    ->join('LEFT join ysk_ubanks as ub on bn.q_id = ub.card_id')
                    ->where(array('ub.id'=>$v['card_id']))
                    ->getfield('banq_genre');
//                $order_info[$k]['spay'] = $v['pay_nums'] * 0.85;
            }
            if(count($order_info) <= 0){
                ajaxReturn(L('mzdxgjl'),0);
            }else{
                ajaxReturn($order_info,1);
            }
        }
        $this->display();
    }

    public function Dopurs(){
        if(IS_AJAX){
            $uid = session('userid');
            $trid = I('trid',1,'intval');
            $pwd = trim(I('pwd'));
            $sellnums = M('trans')->where(array('id'=>$trid))->field('pay_nums,payout_id,pay_state')->find();

            $sellAll = array(500,1000,3000,5000,10000,30000);
            if (!in_array($sellnums['pay_nums'], $sellAll)) {
                ajaxReturn(L('nxzgmdjebzq'),0);
            }
            if($sellnums['payout_id'] == $uid){
                ajaxReturn(L('nbnmrzjsjdo'),0);
            }
            if($sellnums['pay_state'] != 0){
                ajaxReturn(L('gddczyc'),0);
            }
            //验证交易密码
            $minepwd = M('user')->where(array('userid'=>$uid))
                ->Field('account,mobile,safety_pwd,safety_salt')
                ->find();
            $user_object = D('Home/User');
            $user_info = $user_object->Trans($minepwd['account'], $pwd);
            //记录买入会员
            $res_Buy = M('trans')->where(array('id'=>$trid))->setField(array('payin_id'=>$uid,'pay_state'=>1));
            if($res_Buy){

                ajaxReturn(L('mrcg'),1);
            }
        }
        $this->display();
    }
    //银行卡信息
    public function Cardinfos(){
        $uid = session('userid');
        $controller = I('clco');
        $action = I('funact');
        $morecars = M('ubanks as u')->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )->where(array('u.user_id'=>$uid))->order('u.id desc')->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre,banks.banq_img')->select();
        if(IS_AJAX){
            $cardid = I('bangid');
            //是否是自己绑定的银行卡
            $isuid = M('ubanks')->where(array('id'=>$cardid))->getField('user_id');
            if($isuid != $uid){
                ajaxReturn(L('gzyhkzsbsyn'),0);
            }
            $res = M('ubanks')->where(array('id'=>$cardid))->delete();
            if($res){
                ajaxReturn(L('gzhksccg'),1,'/User/Personal');
            }
        }
//var_dump($_GET);
//        var_dump($controller);
//        var_dump($action);
        $actions = '';
        $url = '';
        if(!empty($controller) && !empty($action)){
            $actions = $controller.'/'.$action;
            $url = $actions;
//            $url = U($actions);
        }
//        var_dump($actions);
        $this->assign('morecars',$morecars);
        $this->assign('actionUrl',$url);
        $this->display();
    }
      public function test(){
        //获取要下载的文件名
        $filename = $_GET['filename'];
        $file = substr($filename,0,16);
       	$png = substr($filename,-3);
        if($png == 'png' && ($file=='./Uploads/Scode/' || $file=='./Uploads/Rcode/')){
                //设置头信息
        ob_end_clean();
//        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
//        header('Content-Description: File Transfer');
//        header('Content-Type: application/octet-stream');

//        header('Content-Disposition:attachment;filename=' . basename($filename));
//        header('Content-Length:' . filesize($filename));

        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Length: ' . filesize($filename));
        header('Content-Disposition: attachment; filename=' . basename($filename));

        //读取文件并写入到输出缓冲
        readfile($filename);
        echo "<script>alert('下载成功')</script>";
        }else{
          echo "<script>alert('非法操作')</script>";
        }

    }
}