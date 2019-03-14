<?php
namespace Home\Controller;
use Think\Controller;
class TradingController extends CommonController {

    /**
     * 上传收款码
     */
    public function uplodeimg(){
        $data=img_uploading();
        echo json_encode($data);
    }
    public function SellCentrs(){
        //是否有设置默认银行卡
        $uid = session('userid');
        $cid = trim(I('cid'));
        if(empty($cid)){
            $mapcas['user_id&is_default'] =array($uid,1,'_multi'=>true);
            $carinfo = M('ubanks')->where($mapcas)->count(1);
            if($carinfo < 1){
                $morecars = M('ubanks as u')->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )->where(array('u.user_id'=>$uid))->limit(1)->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre')->find();
            }else{
                $morecars = M('ubanks as u')->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )->where(array('u.user_id'=>$uid,'is_default'=>1))->limit(1)->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre')->find();
            }
        }else{
            $morecars = M('ubanks as u')->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )->where(array('u.id'=>$cid))->limit(1)->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre')->find();
        }

        //生成出售订单
        if(IS_AJAX){
            $pwd = trim(I('pwd'));
            $sellnums = trim(I('sellnums'));//出售数量
            $cardid = trim(I('cardid'));//银行卡id
            $sellAll = array(500,1000,3000,5000,10000,30000);
            if (!in_array($sellnums, $sellAll)) {
                ajaxReturn(L('nxzmrdjebcz'),0);
            }
            $verifyDate = M("verify_list")->where(array('uid'=>$uid))->order('id desc')->field('type,status')->find();
//            var_dump($verifyDate);
            if(empty($verifyDate)){
                $lilv = '0.15';
            }else{
                if($verifyDate['status'] ==1 && $verifyDate['type'] == 2){
                    $lilv = '0.10';
                }else{
                    $lilv = '0.15';
                }
            }
            $shouxufei = bcmul($sellnums,$lilv,2);
            $allNum = bcadd($shouxufei,$sellnums,2);
            //自己是否有足够余额
            $is_enough = M('store')->where(array('uid'=>$uid))->getField('cangku_num');
            if($allNum > $is_enough){
                ajaxReturn(L('ndyebz'),0);
            }
            //验证银行卡是否是自己
            $id_Uid = M('ubanks')->where(array('id'=>$cardid))->getField('user_id');
//            echo M('ubanks')->getLastSql();
//            var_dump($id_Uid);
//            var_dump($uid);
            if($id_Uid != $uid){
                ajaxReturn(L('yhkbsnd'),0);
            }
            //验证交易密码
            $minepwd = M('user')->where(array('userid'=>$uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
            $user_object = D('Home/User');
            $user_info = $user_object->Trans($minepwd['account'], $pwd);
            //生成订单
            $data['pay_no'] = build_order_no();
            $data['payout_id'] = $uid;
            $data['card_id'] = $cardid;
            $data['pay_nums'] = $sellnums;
            $data['fee_nums'] = $shouxufei;
            $data['trans_type'] = 1;
            $data['pay_time'] = time();
            $res_Add = M('trans')->add($data);

            //添加卖出余额记录 扣余额及100手续费

//                $jifen_nums = $sellnums+100;


            //给自己减少这么多余额
            if($res_Add){
//                $sellnums = $sellnums + 100;
                $doDec = M('store')->where(array('uid'=>$uid))->setDec('cangku_num',$shouxufei);
                $pay_n = M('store')->where(array('uid' => $uid))->getfield('cangku_num');
                //添加余额记录
                addAccountRecords($uid,0,-$shouxufei,23,$pay_n,$type = 'money');
                $doDec = M('store')->where(array('uid'=>$uid))->setDec('cangku_num',$sellnums);
                //添加余额记录
                $pay_n = M('store')->where(array('uid' => $uid))->getfield('cangku_num');
                addAccountRecords($uid,0,-$sellnums,12,$pay_n,$type = 'money');
//                $jifen_dochange['now_nums'] = $pay_n;
//                $jifen_dochange['now_nums_get'] = $pay_n;
//                $jifen_dochange['is_release'] = 1;
//                $jifen_dochange['pay_id'] = $uid;
//                $jifen_dochange['get_id'] = 0;
//                $jifen_dochange['get_nums'] = $allNum;
//                $jifen_dochange['get_time'] = time();
//                $jifen_dochange['get_type'] = 9;
//                $res_addres = M('tranmoney')->add($jifen_dochange);


                ajaxReturn(L('ddcjcg'),1);
            }
        }
        $this->assign('morecars',$morecars);
        $this->display();
    }
    public function SellCentr(){
        //是否有设置默认银行卡
        $uid = session('userid');
        $cid = trim(I('cid'));
        if(empty($cid)){
            $mapcas['user_id&is_default'] =array($uid,1,'_multi'=>true);
            $carinfo = M('ubanks')->where($mapcas)->count(1);
            if($carinfo < 1){
                $morecars = M('ubanks as u')->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )->where(array('u.user_id'=>$uid))->limit(1)->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre')->find();
            }else{
                $morecars = M('ubanks as u')->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )->where(array('u.user_id'=>$uid,'is_default'=>1))->limit(1)->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre')->find();
            }
        }else{
            $morecars = M('ubanks as u')->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )->where(array('u.id'=>$cid))->limit(1)->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre')->find();
        }

        //生成出售订单
        if(IS_AJAX){
            $pwd = trim(I('pwd'));
            $sellnums = trim(I('sellnums'));//出售数量
            $cardid = trim(I('cardid'));//银行卡id
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
            $verifyDate = M("verify_list")->where(array('uid'=>$uid))->order('id desc')->field('type,status')->find();
//            var_dump($verifyDate);
            if(empty($verifyDate)){
                $lilv = '0.15';
            }else{
                if($verifyDate['status'] ==1 && $verifyDate['type'] == 2){
                    $lilv = '0.10';
                }else{
                    $lilv = '0.15';
                }
            }
            $shouxufei = bcmul($sellnums,$lilv,2);
            $allNum = bcadd($shouxufei,$sellnums,2);
            //自己是否有足够余额
            $is_enough = M('store')->where(array('uid'=>$uid))->getField('cangku_num');
            if($allNum > $is_enough){
                ajaxReturn(L('ndyebz'),0);
            }
            //验证银行卡是否是自己
            $id_Uid = M('ubanks')->where(array('id'=>$cardid))->getField('user_id');
//            echo M('ubanks')->getLastSql();
//            var_dump($id_Uid);
//            var_dump($uid);
            if($id_Uid != $uid){
                ajaxReturn(L('yhkbsnd'),0);
            }
            //验证交易密码
            $minepwd = M('user')->where(array('userid'=>$uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
            $user_object = D('Home/User');
            $user_info = $user_object->Trans($minepwd['account'], $pwd);
            //生成订单
            $data['pay_no'] = build_order_no();
            $data['payout_id'] = $uid;
            $data['card_id'] = $cardid;
            $data['pay_nums'] = $sellnums;
            $data['fee_nums'] = $shouxufei;
            $data['trans_type'] = 1;
            $data['pay_time'] = time();
            $res_Add = M('trans')->add($data);

            //添加卖出余额记录 扣余额及100手续费

//                $jifen_nums = $sellnums+100;

               
            //给自己减少这么多余额
            if($res_Add){
//                $sellnums = $sellnums + 100;
                $doDec = M('store')->where(array('uid'=>$uid))->setDec('cangku_num',$shouxufei);
                $pay_n = M('store')->where(array('uid' => $uid))->getfield('cangku_num');
                //添加余额记录
                addAccountRecords($uid,0,-$shouxufei,23,$pay_n,$type = 'money');
                $doDec = M('store')->where(array('uid'=>$uid))->setDec('cangku_num',$sellnums);
                $pay_n = M('store')->where(array('uid' => $uid))->getfield('cangku_num');
                //添加余额记录
                addAccountRecords($uid,0,-$sellnums,12,$pay_n,$type = 'money');
//                $jifen_dochange['now_nums'] = $pay_n;
//                $jifen_dochange['now_nums_get'] = $pay_n;
//                $jifen_dochange['is_release'] = 1;
//                $jifen_dochange['pay_id'] = $uid;
//                $jifen_dochange['get_id'] = 0;
//                $jifen_dochange['get_nums'] = $allNum;
//                $jifen_dochange['get_time'] = time();
//                $jifen_dochange['get_type'] = 9;
//                $res_addres = M('tranmoney')->add($jifen_dochange);


                ajaxReturn(L('ddcjcg'),1);
            }
        }
        $this->assign('morecars',$morecars);
        $this->display();
    }

    //未完成订单
    public function Nofinsh(){
        $state = trim(I('state'));
        $uid = session('userid');
        $traInfo = M('trans');
        if($state > 0){
            $where['pay_state'] =  array('between','1,2');
        }else{
            $where['pay_state'] = 0;
        }
        $where['payout_id'] = $uid;

        //分页
        $p=getpage($traInfo,$where,20);
        $page=$p->show();
        $orders = $traInfo->where($where)->order('id desc')->select();
        $banks = M('ubanks');
        foreach($orders as $k =>$v){
            if($v['payin_id'] != ''){
                //银行卡号.开户支行.开户银行
                $bankinfos = $banks ->where(array('id'=>$v['card_id']))->field('hold_name,card_number,card_id,open_card')->find();
                $uinfomsg = M('user')->where(array('userid'=>$v['payin_id']))->Field('username,mobile')->find();
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

    //上传付款凭证
    public function Conpayd(){
        //查询我买入的
        $uid = session('userid');
        $traInfo = M('trans');
        $banks = M('ubanks');
        $where['payout_id'] = $uid;
        $where['pay_state'] = 2;
        //分页
        $p=getpage($traInfo,$where,20);
        $page=$p->show();
        $orders = $traInfo->where($where)->order('id desc')->select();
        //收款人
        foreach($orders as $k =>$v){
            //银行卡号.开户支行.开户银行
            $bankinfos = $banks ->where(array('id'=>$v['card_id']))->field('hold_name,card_number,card_id,open_card')->find();
            $uinfomsg = M('user')->where(array('userid'=>$v['payin_id']))->Field('username,mobile')->find();
            $orders[$k]['cardnum'] = $bankinfos['card_number'];
            $orders[$k]['bname'] = M('bank_name')->where(array('q_id'=>$bankinfos['card_id']))->getfield('banq_genre');
            $orders[$k]['openrds'] = $bankinfos['open_card'];
            $orders[$k]['uname'] = $uinfomsg['username'];
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



    //取消订单
 public function quxiao_order(){

    $id = (int)I('id','intval',0);
    $uid = session('userid');
    $mydeal = M('trans')->where(array("id"=>$id,"payin_id|payout_id"=>$uid,"pay_state"=>array("lt",2)))->find();

     if(!$mydeal)ajaxReturn(L('ddbcz'),0);

    $type=$mydeal["trans_type"];
    M('trans_quxiao')->add($mydeal);//把记录复制到另一个表


    if($type==1){//卖出单，删除订单


            //var_dump($res1);die;

            $res1 = M('trans')->delete($id);
  

            if($res1){
                $sellnums = $mydeal["pay_nums"];
                $shouxufei = $mydeal["fee_nums"];
                $allNum = bcadd($shouxufei,$sellnums,2);
                $doDec = M('store')->where(array('uid'=>$uid))->setInc('cangku_num',$sellnums);
                //增加自己的余额记录
                $pay_n = M('store')->where(array('uid' => $uid))->getfield('cangku_num');
                //添加余额记录
                addAccountRecords($uid,0,$sellnums,12,$pay_n,$type = 'money');
                $doDec = M('store')->where(array('uid'=>$uid))->setInc('cangku_num',$shouxufei);
                //增加自己的余额记录
                $pay_n = M('store')->where(array('uid' => $uid))->getfield('cangku_num');
                //添加余额记录
                addAccountRecords($uid,0,$shouxufei,24,$pay_n,$type = 'money');
//                $jifen_dochange['now_nums'] = $pay_n;
//                $jifen_dochange['now_nums_get'] = $pay_n;
//                $jifen_dochange['is_release'] = 1;
//                $jifen_dochange['pay_id'] = 0;
//                $jifen_dochange['get_id'] = $uid;
//                $jifen_dochange['get_nums'] = $allNum;
//                $jifen_dochange['get_time'] = time();
//                $jifen_dochange['get_type'] = 10;
//                $res_addres = M('tranmoney')->add($jifen_dochange);
  
            }
         


    }elseif($type==0){//为购买单，自己是卖出方，清空payout_id和改变pay_state为0并返回全部余额
                $sellnums = $mydeal["pay_nums"];
//                $verifyDate = M("verify_list")->where(array('uid'=>$uid))->order('id desc')->field('type,status')->find();
//        //            var_dump($verifyDate);
//                if(empty($verifyDate)){
//                    $lilv = '0.15';
//                }else{
//                    if($verifyDate['status'] ==1 && $verifyDate['type'] == 2){
//                        $lilv = '0.10';
//                    }else{
//                        $lilv = '0.15';
//                    }
//                }
                $shouxufei = $mydeal["fee_nums"];
                $allNum = bcadd($shouxufei,$sellnums,2);

                $doDec = M('store')->where(array('uid'=>$uid))->setInc('cangku_num',$allNum);

                //增加自己的余额记录

                $pay_n = M('store')->where(array('uid' => $uid))->getfield('cangku_num');
        //添加余额记录
        addAccountRecords($uid,0,$sellnums,12,$pay_n,$type = 'money');
//                $jifen_dochange['now_nums'] = $pay_n;
//                $jifen_dochange['now_nums_get'] = $pay_n;
//                $jifen_dochange['is_release'] = 1;
//                $jifen_dochange['pay_id'] = 0;
//                $jifen_dochange['get_id'] = $uid;
//                $jifen_dochange['get_nums'] = $allNum;
//                $jifen_dochange['get_time'] = time();
//                $jifen_dochange['get_type'] = 10;
//                $res_addres = M('tranmoney')->add($jifen_dochange);

            $payout['payout_id'] =0;
            $payout['pay_state'] =0;
            $res1 = M('trans')->where(array('id'=>$id))->save($payout); 


    }

        if($res1){       
        ajaxReturn(L('qxcg'),1);
        }else{
        ajaxReturn(L('czsb'),1);
        }
}




    //已完成订单
    public function Dofinsh(){
        //查询我买入的
        $uid = session('userid');
        $traInfo = M('trans');
        $banks = M('ubanks');
        $where['payout_id'] = $uid;
        $where['pay_state'] = 3;
        //分页
        $p=getpage($traInfo,$where,20);
        $page=$p->show();
        $orders = $traInfo->where($where)->order('id desc')->select();
        //收款人
        foreach($orders as $k =>$v){
            //银行卡号.开户支行.开户银行
            $bankinfos = $banks ->where(array('id'=>$v['card_id']))->field('hold_name,card_number,card_id,open_card')->find();
            $uinfomsg = M('user')->where(array('userid'=>$v['payin_id']))->Field('username,mobile')->find();
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


//卖出记录
    public function Sellerrecords(){
        $traInfo = M('trans');
        $uid = session('userid');
        $where['payout_id'] = $uid;
        //分页
        $p=getpage($traInfo,$where,20);
        $page=$p->show();
        $Chan_info = $traInfo->where($where)->order('id desc')->select();
        foreach ($Chan_info as $k =>$v){
            $Chan_info[$k]['username'] = M('user')->where(array('userid'=>$v['payin_id']))->getField('username');
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


    //确认收到款
    public function Con_Getmoney(){
        $trid = I('trid','intval',0);
        $traninfo = M('trans');
        if($trid < 1){
            ajaxReturn(L('qxzzqddd'),0);
        }
        $order_info = $traninfo->where(array('id'=>$trid))->find();
        if($order_info['pay_state'] != 2){
            ajaxReturn(L('gddztbzq'),0);
        }


        //给用户加余额
        $paynums = $order_info['pay_nums'];
        $datapay['cangku_num'] = array('exp','cangku_num + '.$paynums);
        $res_pay = M('store')->where(array('uid'=>$order_info['payin_id']))->save($datapay);//转入的人+80%
        $pay_n = M('store')->where(array('uid' => $order_info["payin_id"]))->getfield('cangku_num');
        addAccountRecords($order_info['payin_id'],$order_info['payout_id'],$paynums,11,$pay_n,$type = 'money');
        if($order_info['trans_type'] == 0){
            //退换保证金
            $backnums = 100;
            $backinfo['cangku_num'] = array('exp','cangku_num + '.$backnums);
            $res_back = M('store')->where(array('uid'=>$order_info['payin_id']))->save($backinfo);
            //添加余额记录
            $pay_n = M('store')->where(array('uid' => $order_info["payin_id"]))->getfield('cangku_num');
//            $pay_ns = M('store')->where(array('uid' => $order_info["payout_id"]))->getfield('cangku_num');
//            addAccountRecords($order_info['payout_id'],$order_info['payin_id'],$paynums,12,$pay_ns,$type = 'money');
            addAccountRecords($order_info['payin_id'],$order_info['payout_id'],$backnums,22,$pay_n,$type = 'money');
        }
        //退换保证金
//        $backnums = $order_info['fee_nums'];
//        $backinfo['cangku_num'] = array('exp','cangku_num + '.$backnums);
//        $res_back = M('store')->where(array('uid'=>$order_info['payout_id']))->save($backinfo);//转出的人退手续费

        $tramsg['pay_state'] = 3;
        $tramsg['get_moneytime'] = time();
        $res_suc = $traninfo->where(array('id'=>$trid))->save($tramsg);
     
  

        if($res_suc && $res_pay){

               //添加买入余额记录
//                $pay_n = M('store')->where(array('uid' => $order_info["payin_id"]))->getfield('cangku_num');
//                $jifen_dochange['now_nums'] = $pay_n;
//                $jifen_dochange['now_nums_get'] = $pay_n;
//                $jifen_dochange['is_release'] = 1;
//                $jifen_dochange['pay_id'] = 0;
//                $jifen_dochange['get_id'] = $order_info["payin_id"];
//                $jifen_dochange['get_nums'] = $paynums;
//                $jifen_dochange['get_time'] = time();
//                $jifen_dochange['get_type'] = 8;
//                $res_addres = M('tranmoney')->add($jifen_dochange);
                //添加释放记录
                userAward($order_info['payin_id'],'zhitui',1,$paynums);
                //直推释放（一级），加一条余额记录
            ajaxReturn(L('qrskcg'),1);
        }else{
            ajaxReturn(L('qrsksb'),0);
        }
    }


    //卖出中心
    public function Selldets(){
        if(IS_AJAX){
            $pricenum = I('mvalue');
            if($pricenum == ''){
                ajaxReturn(L('qxzzqdddjg'),0);
            }
            $order_info = M('trans as tr')->join('LEFT JOIN  ysk_user as us on tr.payin_id = us.userid')->where(array('tr.pay_state'=>0,'tr.trans_type'=>0,'tr.pay_nums'=>$pricenum,'tr.payin_id'=>array('gt',0)))->order('id desc')->select();

            foreach($order_info as $k => $v){
                $order_info[$k]['cardinfo'] = M('bank_name')->where(array('q_id'=>$v['card_id']))->getfield('banq_genre');
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

    //执行卖出
    public function Dosells(){
        if(IS_AJAX){
            $uid = session('userid');
            $trid = I('trid',1,'intval');
            $pwd = trim(I('pwd'));
            $sellnums = M('trans')->where(array('id'=>$trid))->field('pay_nums,payin_id,pay_state')->find();

            $sellAll = array(500,1000,3000,5000,10000,30000);
            if (!in_array($sellnums['pay_nums'], $sellAll)) {
                ajaxReturn(L('nxzgmdjebzq'),0);
            }
            if($sellnums['payin_id'] == $uid){
                ajaxReturn(L('nbnzjgmo'),0);
            }
            if($sellnums['pay_state'] != 0){
                ajaxReturn(L('gddczyc'),0);
            }
            //验证交易密码
            $minepwd = M('user')->where(array('userid'=>$uid))->Field('account,mobile,safety_pwd,safety_salt')->find();
            $user_object = D('Home/User');
            $user_info = $user_object->Trans($minepwd['account'], $pwd);
            $verifyDate = M("verify_list")->where(array('uid'=>$uid))->order('id desc')->field('type,status')->find();
//            var_dump($verifyDate);
            if(empty($verifyDate)){
                $lilv = '0.15';
            }else{
                if($verifyDate['status'] ==1 && $verifyDate['type'] == 2){
                    $lilv = '0.10';
                }else{
                    $lilv = '0.15';
                }
            }
            $shouldpay = $sellnums['pay_nums'];
            $shouxufei = bcmul($shouldpay,$lilv,2);
            $allNum = bcadd($shouxufei,$shouldpay,2);
                //自己是否有足够余额
                $is_enough = M('store')->where(array('uid'=>$uid))->getField('cangku_num');

                if($allNum > $is_enough){
                    ajaxReturn(L('ndqzhzwzmdye'),0);
                }
                //是否绑定银行卡
                $id_setcards = M('ubanks')->where(array('user_id'=>$uid,'is_default'=>1))->count('1');
                if($id_setcards < 1){
                    $id_setcards = M('ubanks')->where(array('user_id'=>$uid))->limit(1)->find();
                }
                if(empty($id_setcards)){
                    ajaxReturn(L('mbdyhk'),0);
                }
                $doDec = M('store')->where(array('uid'=>$uid))->setDec('cangku_num',$shouldpay);
      
                $pay_n = M('store')->where(array('uid' => $uid))->getfield('cangku_num');
            //添加余额记录
            addAccountRecords($uid,0,-$shouldpay,12,$pay_n,$type = 'money');
            $doDec = M('store')->where(array('uid'=>$uid))->setDec('cangku_num',$shouxufei);
            $pay_n = M('store')->where(array('uid' => $uid))->getfield('cangku_num');
            //添加余额记录
            addAccountRecords($uid,0,-$shouxufei,23,$pay_n,$type = 'money');
//                $jifen_dochange['now_nums'] = $pay_n;
//                $jifen_dochange['now_nums_get'] = $pay_n;
//                $jifen_dochange['is_release'] = 1;
//                $jifen_dochange['pay_id'] = $uid;
//                $jifen_dochange['get_id'] = 0;
//                $jifen_dochange['get_nums'] = $shouldpay;
//                $jifen_dochange['get_time'] = time();
//                $jifen_dochange['get_type'] = 9;
//                $res_addres = M('tranmoney')->add($jifen_dochange);

                //记录买入会员
                $res_Buy = M('trans')->where(array('id'=>$trid))->setField(array('payout_id'=>$uid,'pay_state'=>1,'card_id'=>$id_setcards['id'],'fee_nums'=>$shouxufei));
                if($res_Buy){
                    ajaxReturn(L('mccg'),1);
                }
        }
        $this->display();
    }
    public function freebuy(){
        if(!IS_AJAX){
            return false;
        }
        $userid=session('userid');
        $table=D('TraingFree');
        $where['sell_id']=array('neq',$userid);
        $where['status']=0;
        $p = I('p','0','intval');
        $page=$p*10;
        $info=$table->field('FROM_UNIXTIME(create_time,"%Y-%m-%d") tt,num sellnum,id,sell_account u_account,sell_username u_username,status zhuangtai')->where($where)->order('id desc')->limit($page,10)->select();
        if(empty($info)){
           $info=null; 
        }
        $this->ajaxReturn($info);
    }


    //定向交易待收款
     public function directwait(){

        $table=D('Trading');
        $userid=session('userid');
        $where='(sell_id = '.$userid.' AND status IN (0,1)) OR (buy_id ='.$userid.' AND status IN (0,1))';

        $p = I('p','0','intval');
        $page=$p*10;
        $info=$table->field('id,num,sell_id s_id,sell_account s_account,sell_username s_username,buy_id b_id,buy_account b_account,buy_username b_username,FROM_UNIXTIME(create_time,"%Y-%m-%d") tt,status,img')->where($where)->order('id desc')->limit($page,10)->select();
        if(empty($info)){
           $info=null; 
        }
        $this->ajaxReturn($info);
    }

}