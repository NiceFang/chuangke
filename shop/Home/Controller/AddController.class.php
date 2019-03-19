<?php
namespace Home\Controller;

class AddController extends LoginTrueController
{
    // 帮助注册
    public function register1(){
        // 推荐人pid 是本人 userid
        // 商家手机号码不能重复
        // 微信二维码上传并保存到数据库
        // 刚注册是临时会员
        // 商家姓名 username
        // 手机短信验证吗



        if(IS_AJAX){

            //接收数据
            $user=D('User');
            var_dump($user);
            $data        = $user->create();
            //var_dump($data);
            if(!$data){

                ajaxReturn(L($user->getError()),0);
                return ;
            }
            ob_clear();
            return 1;

//            $imgCode = I('verify');
//            check_verify($imgCode);
////            check_add($imgCode);
//            //dump(11);
//            //验证码
//            $code = I('code');
//            $mobile = I('mobile');
//            $isEmail = true;
//            //$mobile = '1587229752@qq.com';
//            //验证邮箱
//            $checkmail="/\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/";
//           /* if(preg_match($checkmail,$mobile)){
//                if(!check_mail($code,$mobile)){
//                    $set_code = session('EmailCode');
//                    ajaxReturn(L('yzmcwhygq'));
//                }
//            }else{
//                if(!check_sms($code,$mobile)){
//                    ajaxReturn(L('yzmcwhygq'));
//                }
//                $isEmail = false;
//            }*/
//
//
//            //判断仓库
//            $store=D('Store');
//            if($isEmail){
//                //ajaxReturn(1232);
//                unset($data['mobile']);
//                $data['mobile']='';
//                $data['email'] = $mobile;
//                $result = $user->where(['email'=>$mobile])->find();
//                //ajaxReturn($result);
//                if($result){
//                    ajaxReturn(L('yxbncf'),0);
//                }
//
//            }else{
//                //ajaxReturn(1232);
//                $data['mobile']  = $mobile;
//            }
//            $data['account']= $mobile;
//            //密码加密
//            $salt= substr(md5(time()),0,3);
//            $data['login_pwd']=$user->pwdMd5($data['login_pwd'],$salt);
//            $data['login_salt']=$salt;
//
//
//            $data['safety_pwd']=$user->pwdMd5($data['safety_pwd'],$salt);
//            $data['safety_salt']=$salt;
//
//
//            //推荐人
//            $pid=$data['pid'];
//            if(empty($pid) && $pid==''){
//                ajaxReturn('推荐人不能为空',0);
//            }
////            ajaxReturn($pid);
//            $last['userid|mobile|email'] = $pid;
//            $p_info=$user->where(array('userid'=>$pid))->field('userid,pid,gid,username,account,mobile,email,path,deep')->find();
////            $p_info=$user->field('pid,gid,username,account,mobile,path,deep')->find($pid);
////            $p_info=$user->where($last)->field('userid,pid,gid,username,account,mobile,email,path,deep')->find();
//
//            //推荐人判断2018-11-23
////            if($p_info['recommend']==0){
////                ajaxReturn('推荐人无效',0);
////            }
//
//            $gid=$p_info['pid'];//上上级ID
//            $ggid=$p_info['gid'];//上上上级ID
//
//            if($gid){
//                $data['gid']=$gid;
//            }
//            if($ggid){
//                $data['ggid']=$ggid;
//            }
//
//            //拼接路径
//            $path=$p_info['path'];
//            $deep=$p_info['deep'];
//            if(empty($path)){
//                $data['path']='-'.$pid.'-';
//            }else{
//                $data['path']=$path.$pid.'-';
//            }
//            $data['deep']=$deep+1;
//
//            $user->startTrans();//开启事务
//            $uid=$user->add($data);
//
//            if(!$uid){
//                $user->rollback();
//                ajaxReturn(L('zcsb'));
//            }
//
//            //给上级添加值推人数
//            M('user_level')->where(array('uid'=>$pid))->setInc('children_num',1);
//
//
//            $jifens= D('config')->where("name='jifens'")->getField("value");
//            $jifens= (float)$jifens;
//            $rens= D('config')->where("name='rens'")->getField("value");
//            $pid_n=M('user')->where(array('pid'=>$pid))->count(1);
//
//
//            if($pid_n<=$rens && $jifens>0){
//
//
//                $datapay22['fengmi_num'] = array('exp', 'fengmi_num + ' . $jifens);
//                $res_pay_get = M('store')->where(array('uid' => $pid))->save($datapay22);//推荐一人增加
//
//
//                $get_n = M('store')->where(array('uid' => $pid))->getfield('fengmi_num');
//                //添加积分记录
//                addAccountRecords($pid,0,$jifens,5,$get_n,$type = 'scores');
////                    $datass['pay_id'] = $pid;
////                    $datass['get_id'] = $pid;
////                    $datass['get_nums'] = $jifens;
////                    $datass['now_nums_get'] = $get_n;
////                    $datass['now_nums'] = $get_n;
////                    $datass['is_release'] = 1;
////                    $datass['get_time'] = time();
////                    $datass['get_type'] = 23;
////                    $res_addrs = M('tranmoney')->add($datass);
//            }
//
//
//
//
//            //给用户添加等级
//            AddUserLevel($pid);
//
//            if($uid){
//                $user->commit();
//                AddUserLevel($pid);
//
//                //创建钱包
//                $jifen=0;
//                $regjifen= D('config')->where("name='regjifen'")->getField("value");//奖励开启才送
//                $time = M('config')->where(['name'=>'awardTime'])->getField('options');
//                $data = explode('~',$time);
//                $startTime = $data[0];
//                $endTime = $data[1];
//                $nowTime = time();
//                if($regjifen==1){
//                    $jifen=M('config')->where(array('name'=>'jifen'))->getField('value');
//                    $jifen=(float)$jifen;
//
//                }
//                $store = array();
//                $store['uid'] = $uid;
//                $store['cangku_num'] = 0;
//                $store['fengmi_num'] = $jifen;
//                $store['plant_num'] = 0;
//                $store['huafei_total'] = 0;
//                M("store")->add($store);
//
//                if($jifen > 0){
//                    //添加积分记录
//                    $getFengmi = M('store')->where(array('uid' => $uid))->getfield('fengmi_num');
//                    addAccountRecords($uid,0,$jifen,6,$getFengmi,$type = 'scores');
//                }
//
//
//                $lang = I('l');
////                https://copy.im/a/KkJhEm?l=
////                https://copy.im/index/down/id/18466.html
////                ajaxReturn(L('zccg'),1,'https://copy.im/a/QmJeR6');
//                ajaxReturn(L('zccg'),1,'/Login/login');
//            }
//            else{
//
//                $user->rollback();
//                ajaxReturn(L('zccg'),0);
//            }
        }

        $lang = I('get.l');
        //dump($lang);exit;
        $this->assign('lang',$lang);
        $mobile = trim(I('UID'));
        $parent_account = session("parent_account");
        if(empty($mobile)){
            if($parent_account){
                $mobile = $parent_account;
            }
        }

        $user_id = session('userid');
        $user_info = M('user');
        $mobile = $user_info->where(array('userid'=>$user_id))->getField('mobile');
        $this->assign('mobile',$mobile);
        $this->display();
    }

    /**
     *  注册会员-pp
     **/
    public function add_user()
    {
        $this->LoginTrue();


        $this->assign("tuijianma", $_SESSION['nvip_member_tuijianma']);

        $i = 0;

        $this->display();
    }


    public function register()
    {
        $this->LoginTrue();


        $this->assign("tuijianma", $_SESSION['nvip_member_tuijianma']);

        $i = 0;

        $this->display();
    }

    /**
     * 注册会员提交后的处理-pp
     */
    public function Add_Action()
    {

        $this->LoginTrue();
     if($_POST["code"] != session('code') ){
            $this->error("验证码错误");
        }
        $txt_loginname = $_POST["mobile"];
        if (!$txt_loginname) {
            $this->error("手机号不能为空");
            exit();
        }
        // 手机号 DHT 是mobile
        if ($this->check_loginname($txt_loginname)) {
            $this->error("手机号重复，请重新获取!");
            exit();
        }
        //验证身份证是不是重复
        $id_sfz = $_POST['txt_identityid'];
        // 推荐码是手机号码
        $rid = $_SESSION['nvip_member_tuijianma'];
        if (!$rid) {
            $this->error("推荐人不能为空");
            exit();
        }

        if (!$_POST["realname"]) {
            $this->error("商家姓名不能为空");
            exit();
        }
        if (!$_POST["password"]) {
            $this->error("请填写密码");
            exit();
        }
        if ($_POST["cpassword"] != $_POST["password"]) {
            $this->error("两次输入的密码不一致");
            exit();
        }


        $upload = new \Think\Upload();// 实例化上传类
        $upload->rootPath = './uploads/';
        if(!is_dir($upload->rootPath)){
            mkdir($upload->rootPath,0777,true);
        }
        $upload->maxSize   =     3145728 ;// 设置附件上传大小
        $upload->saveName = array('uniqid','');
        $upload->exts     = array('jpg', 'gif', 'png', 'jpeg');
        $upload->autoSub  = false;
        $upload->subName  = array('date','Ymd');
        $info   =   $upload->upload();
        //var_dump($info);
        if(!$info) {// 上传错误提示错误信息
            $this->error($upload->getError());
        }else{// 上传成功 获取上传文件信息
            foreach($info as $file){
                $file_path =  $file['savepath'].$file['savename'];
            }
        }
        if (!$file_path) {
            $this->error("请选择微信二维码上传");
            exit();
        }


        $r_user = M("user")->where(array('mobile'=>$rid))->find();//rpath根据推荐人来计算

        if ($r_user['rpath']) {
            $data['rpath'] = $r_user['rpath'] . "," . $r_user['userid'];//推荐rpath
        } else {
            $data['rpath'] = $r_user['userid'];//推荐rpath
        }


        $data['wximg'] = $file_path;//微信二维码
//        var_dump($file_path);
//        exit;
        $data['ceng'] = $r_user['ceng'] + 1;//层
         // 第几代
        $data['dai'] = $r_user['dai'] + 1;
        // 等级
        $data['user_credit'] = '0';//刚开始就是临时会员

        $data['standardlevel'] = '0';//刚开始就是临时会员
        // 手机号
        $data["mobile"] = $txt_loginname;

       // // 推荐码$data["tuijianma"] = $this->SysSet['inviteStart'].$this->get_random(3);;
        $data["username"] = $_POST['realname'];
       // $data["tel"] = $txt_loginname;

        // 上级id
        $data["pid"] = $r_user['userid'];
        // 上上级id
        $data["gid"] = $r_user['pid'];
        // 上上上级id
        $data["ggid"] = $r_user['gid'];



        // 登录密码 盐值
        $salt= substr(md5(time()),0,3);
        $data['login_pwd']=D('user')->pwdMd5($_POST["password"],$salt);
        $data['login_salt']=$salt;

//        $data["pwd1"] = md5(trim($_POST["password"]));
//        $data["pwd2"] = md5(trim($_POST["password"]));

        $data["states"] = 1;
        $data["reg_ip"] = get_client_ip();
        $data["reg_source"] = '';
        $data["reg_date"] = time();
        $data["account"] = $txt_loginname;
        // 账号不锁定
        $data["status"] = 1;



        $result = D('user')->add($data);
        if ($result) {

            $this->assign("txt_loginname", $data['mobile']);
            $this->assign("txt_pwd1",$_POST["password"]);
            $this->assign("rid", base64_encode($data["pid"]));
            $this->assign("result", $result);
        } else {
            $this->error("注册失败,请重新注册");
            exit();
        }


        $this->display();
    }



    //会员升级
    public function usersj()
    {
        $this->LoginTrue();

        $id = $_SESSION['nvip_member_id'];

        //判断是否有正在升级的宴请  and (status1!=1 and status2!=1)
        $isExists =M("usersjinfo")->where("user_id=$id")->order("id desc")->find();

        if($isExists){
            if($isExists['status1'] ==0 or $isExists['status2'] ==0){
                if((!($isExists['status1'] ==1 or $isExists['status2'] ==1))){
                    $this->assign("isExists",1);
                    $isExists["shuser1"] = $isExists["shuser1"] ?: "无";
                    $isExists["shuser2"] = $isExists["shuser2"] ?: "无";
                    $isExists["shuserstatus1"] = $isExists["shuser1"] ? ' - '.$this->GetStatus($isExists['status1']): '';
                    $isExists["shuserstatus2"] = $isExists["shuser2"] ? ' - '.$this->GetStatus($isExists['status2']) : '';
                    $this->assign("shinfo",$isExists);

                }
            }

        }


        $user = M('user')->where("userid='{$id}'")->field("standardlevel")->find();

        $user['standardlevelname'] = GetLevel($user['standardlevel']);
        if($user['standardlevel']+1>9){
            $user['target_standardlevelname'] = "已是最高等级";
        }else{
            $user['target_standardlevelname'] = GetLevel($user['standardlevel']+1);
        }

        var_dump($user);
        $this->assign("userinfo",$user);

        $this->display();
    }

    public function upgrade()
    {
        $this->LoginTrue();

        $id = $_SESSION['nvip_member_id'];

        //判断是否有正在升级的宴请  and (status1!=1 and status2!=1)
        $isExists =M("usersjinfo")->where("user_id=$id")->order("id desc")->find();
//        var_dump($isExists);
        if($isExists){
            if($isExists['status1'] ==0 or $isExists['status2'] ==0){
                if((!($isExists['status1'] ==1 or $isExists['status2'] ==1))){
                    $this->assign("isExists",1);
                    $isExists["shuser1"] = $isExists["shuser1"] ?: "无";
                    $isExists["shuser2"] = $isExists["shuser2"] ?: "无";
                    $isExists["shuserstatus1"] = $isExists["shuser1"] ? ' - '.$this->GetStatus($isExists['status1']): '';
                    $isExists["shuserstatus2"] = $isExists["shuser2"] ? ' - '.$this->GetStatus($isExists['status2']) : '';

                    $this->assign("shinfo",$isExists);
                    //var_dump($isExists);
                }
            }

        }


        $user = M('user')->where("userid='{$id}'")->field("standardlevel")->find();

        $user['standardlevelname'] = GetLevel($user['standardlevel']);
        if($user['standardlevel']+1>9){
            $user['target_standardlevelname'] = "已是最高等级";
        }else{
            $user['target_standardlevelname'] = GetLevel($user['standardlevel']+1);
        }
        $info = M('user')->where("userid='{$id}'")->find();
        $user['userid'] = $info['userid'];
        $user['username'] = $info['username'];
       

        $this->assign("userinfo",$user);
        //var_dump($user);
        $this->display();

    }


    public function GetStatus($opstatus){

        if($opstatus==0)
            return "未审核";
        if($opstatus==1)
            return "未通过";
        if($opstatus==2)
            return "已通过";
    }

    /* 	//会员升级
        public function usersj()
        {
            $this->LoginTrue();

            $id = $_SESSION['nvip_member_id'];

            //判断是否有正在升级的宴请
            $isExists =M("usersjinfo")->where("user_id=$id and (status1=0 or status2=0)")->find();
            if($isExists){
                $this->assign("isExists",1);
                $isExists["shuser1"] = $isExists["shuser1"] ?: "无";
                $isExists["shuser2"] = $isExists["shuser2"] ?: "无";
                $this->assign("shinfo",$isExists);

            }
            else{
                $user = M('users')->where("id='{$id}'")->field("standardlevel")->find();

                $user['standardlevelname'] = GetLevel($user['standardlevel']);
                if($user['standardlevel']+1>9){
                    $user['target_standardlevelname'] = "已是最高等级";
                }else{
                    $user['target_standardlevelname'] = GetLevel($user['standardlevel']+1);
                }
            }


            $this->assign("userinfo",$user);
            $this->display();
        } */


    //提交会员升级申请
    public function sjaction()
    {
        $this->LoginTrue();

        $id = $_SESSION['nvip_member_id'];

        //判断是否有正在升级的宴请  and ((status1=0 and status2=0) or (status1=2 or status2=2)
        $isExists =M("usersjinfo")->where("user_id=$id")->order("id desc")->find();
        if($isExists){
            if($isExists['status1'] == 0 && $isExists['status2'] ==0){
                $this->error("你有申请正在处理");
            }

        }


        $user = M('user')->where("userid='{$id}'")->field("standardlevel,mobile,rpath")->find();
        if($user['standardlevel']+1>9){
            $this->error("已经是最高等级");
        }
        $targetlevel = $user['standardlevel']+1;
        // $tjcount = M('users')->where("rid='{$id}'")->count();

        $sjshuser = $this->isShengji($targetlevel,$id,$user['rpath']);
//        var_dump($sjshuser);exit;
        if(!is_array($sjshuser)){

            $this->error("升级条件未满足<br/>".$sjshuser);
        }
       // var_dump($sjshuser);
        if($sjshuser['find1'])
            $shuser1 = $sjshuser['find1']['mobile'];

        if($sjshuser['find2'])
            $shuser2 = $sjshuser['find2']['mobile'];

        //var_dump($shuser1);

        $data = array(
            "user_id" => $id,
            "loginname" => $user['mobile'],
            "curlevel" => $user['standardlevel'],
            "targetlevel" => ($user['standardlevel'])+1,
            "shuser1" => $shuser1,
            "shuser2" => $shuser2,
            "addtime" => time()
        );

        if(M("usersjinfo")->add($data)){
            // 发送短信
            $msgtext = "【DHT】用户".$user['mobile']."向您发来审核申请，请尽快处理。";
            if($shuser1){
                $res[] = newMsg($shuser1,$msgtext);
//                 $res = $this->SendMsg('18214969531',$msgtext);

            }

            if($shuser2){
                $res[] = newMsg($shuser2,$msgtext);
                $res[] = $this->SendMsg($shuser2,$msgtext);
            }

            $this->success("申请成功");
            exit;
        }else{

            $this->error("申请失败");
        }

        $this->assign("userinfo",$user);
        $this->display();
    }

    //商家信息
    public function shuserlist()
    {
        $this->LoginTrue();

        $id = $_SESSION['nvip_member_id'];

        //判断是否有正在升级的宴请
        $isExists =M("usersjinfo")->where("user_id=$id")->order("id desc")->find();
//        var_dump($isExists);
        $sjarray=array();
        if($isExists['shuser1']){
            $sjarray[] = M("user")->where("mobile='".$isExists['shuser1']."'")->find();
        }
        if($isExists['shuser2']){
            $sjarray[] = M("user")->where("mobile='".$isExists['shuser2']."'")->find();
        }

        $this->assign("sjarray",$sjarray);
        $this->display();
    }


    //审核升级历史订单页面
    public function userchecksjlog()
    {
        $this->LoginTrue();

        $loginname = $_SESSION['nvip_nvip_member_User'];

        //$shList = M("usersjinfo")->where("(shuser1='$loginname' or shuser2='$loginname'  )and ( status1=2 and status2=2)")->order("id desc")->select();
        $shList = M("usersjinfo")->where("((shuser1='$loginname' and status1=2) or (shuser2='$loginname' and status2=2)) and status1=2 and status2=2 ")->order("id desc")->select();
        foreach($shList as $key=>$val){

            $shList[$key]['user'] = M("user")->where("userid=".$val['user_id'])->find();
            $shList[$key]['levelname'] = GetLevel($val['targetlevel']);

        }
        $this->assign("shList",$shList);

        $this->display();
    }

    //审核升级
    public function userchecksj()
    {
        $this->LoginTrue();

        $loginname = $_SESSION['nvip_nvip_member_User'];


        $shList = M("usersjinfo")->where("(shuser1='$loginname' and status1=0) or (shuser2='$loginname' and status2=0)")->order("id desc")->select();
        $sql = M("usersjinfo")->getLastSql();
        //var_dump($sql);
        foreach($shList as $key=>$val){

            $shList[$key]['user'] = M("user")->where("userid=".$val['user_id'])->find();
            $shList[$key]['levelname'] = GetLevel($val['targetlevel']);

        }
        $this->assign("shList",$shList);

        $this->display();
    }

    //审核升级页面
    public function audit()
    {
        $this->LoginTrue();

        $loginname = $_SESSION['nvip_nvip_member_User'];


        $shList = M("usersjinfo")->where("(shuser1='$loginname' and status1=0) or (shuser2='$loginname' and status2=0)")->order("id desc")->select();
        $sql = M("usersjinfo")->getLastSql();
        //var_dump($sql);
        foreach($shList as $key=>$val){

            $shList[$key]['user'] = M("user")->where("userid=".$val['user_id'])->find();
            $shList[$key]['levelname'] = GetLevel($val['targetlevel']);

        }
        $this->assign("shList",$shList);

        $this->display();
    }


    //审核操作
    public function checksjop()
    {
        $this->LoginTrue();

        $loginname = $_SESSION['nvip_nvip_member_User'];

        $id = $_REQUEST['id'];
        $op = intval($_REQUEST['op']);
        if(!$id || !$op){
            $this->error("非法操作");
        }


        $shList = M("usersjinfo")->where("id='$id'  and (shuser1='$loginname' or shuser2='$loginname' )")->order("id desc")->find();
        if(!$shList){
            $this->error("不正确的操作");
        }
        $status = "";
        if($shList['shuser1'] == $loginname){

            if($shList['status1'] !=0){
                $this->error("您已经审核过此订单");
            }
            $save = array(
                "status1" => $op,
                "shtime1" => time(),
                "status2" => $shList['status2'],
                "shtime2" => $shList['shtime2'],
            );
            if(!$shList['shuser2']){
                $save["status2"] = $op;
                $save["shtime1"] = time();
            }

        }else if($shList['shuser2'] == $loginname){
            $status = "status2";
            if($shList['status2'] !=0){
                $this->error("您已经审核过此订单");
            }
            $save = array(
                "status1" => $shList['status1'],
                "shtime1" => $shList['shtime1'],
                "status2" => $op,
                "shtime2" => time()
            );
            if(!$shList['shuser1']){
                $save["status1"] = $op;
                $save["shtime1"] = time();
            }
        }
        if($shList['shuser1'] == $shList['shuser2']){

            $save = array(
                "status1" => $op,
                "shtime1" => time(),
                "status2" => $op,
                "shtime2" => time()
            );
        }
        $ispass = 0;
        if($save['status1'] == 2 && $save['status2'] ==2 ){
            $ispass = 1;
        }
        elseif($save['status1'] == 1 && $save['status2'] ==1 ){
            $ispass = 3;
        }

        M("usersjinfo")->startTrans();

        $mo = M("usersjinfo");

     /*     if(M("usersjinfo")->where("id=$id")->save($save)){


              $data['master_id'] = $id;
             // 当前审核人的id
             $data['deputy_id'] = session("nvip_member_id");
             // 数量
             $data['get_nums'] = 398*3;
              // 类型
              $data['get_type'] = 56;
              // 当前总额
              $scoresDate = M('userscores_record')->field('now_nums')->where(array('master_id'=>$id))->find();
              $data['now_nums'] = $scoresDate + $data['get_nums'];
              // 审核通过 增加积分
              $res[] = M('userscores_record')->add($data);

            if($ispass==1){
                M("user")->where("userid=$shList[user_id]")->save(array("standardlevel"=>$shList['targetlevel']));
                $msgtext = "【创客联盟】您的审核已通过，恭喜您成功升级为".$shList['targetlevel']."级会员。";
                $this->SendMsg($shList['loginname'],$msgtext);
            }
            if($ispass ==3){

                $msgtext = "【创客联盟】您的审核申请被拒绝，请重新申请，如果被多次拒绝请联系客服。";
                $this->SendMsg($shList['loginname'],$msgtext);
            }

            M("usersjinfo")->commit();

            $this->success("操作成功");
            exit;
        }
        else{
            $this->error("操作失败");
        }*/

           $res[] = M("usersjinfo")->where("id=$id")->save($save);
            $data['master_id'] = $id;
            // 当前审核人的id
            $data['deputy_id'] = $_REQUEST['user_id'];
            // 数量
            $data['get_nums'] = 398*3;
            // 类型
            $data['get_type'] = 56;

            // 当前总额
           // $scoresDate = M('userscores_record')->where(array('master_id'=>$id))->find();


            $data['now_nums'] =  $data['get_nums'];
            // 审核通过 增加积分
           // $res[] = M('userscores_record')->add($data);



           if($ispass==1){
               // 改变用户级别
                $res =  M("user")->where("userid=$shList[user_id]")->save(array("standardlevel"=>$shList['targetlevel']));
                $msgtext = "【创客联盟】您的审核已通过，恭喜您成功升级为".$shList['targetlevel']."级会员。";
                $this->SendMsg($shList['loginname'],$msgtext);
            }
            if($ispass ==3){
                $msgtext = "【创客联盟】您的审核申请被拒绝，请重新申请，如果被多次拒绝请联系客服。";
                $this->SendMsg($shList['loginname'],$msgtext);
            }
            if($res){
                $mo->commit();
                $this->success("操作成功");
                exit;
            }else{
                $mo->rollback();
                $this->error("操作失败");
            }












        $this->assign("shList",$shList);

        $this->display();
    }
}