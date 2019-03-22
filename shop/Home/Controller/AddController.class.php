<?php
namespace Home\Controller;

class AddController extends LoginTrueController
{
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
        //$this->LoginTrue();
     /* if($_POST["code"] != session('code') ){
            $this->error("验证码错误");
        }*/

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


        $r_user = M("user")->where(array('mobile'=>$rid))->find();//path根据推荐人来计算

        if ($r_user['path']) {

            $data['path'] = $r_user['path'] . "," . $r_user['userid'];//推荐path
        } else {
            $data['path'] = $r_user['userid'];//推荐rpath
        }
       /* if ($r_user['rpath']) {
            $data['rpath'] = $r_user['rpath'] . "," . $r_user['userid'];//推荐rpath
        } else {
            $data['rpath'] = $r_user['userid'];//推荐rpath
        }*/


        $data['wximg'] = $file_path;//微信二维码
//        var_dump($file_path);
//        exit;
        $data['ceng'] = $r_user['ceng'] + 1;//层
         // 第几代
        $data['dai'] = $r_user['dai'] + 1;

        $data['user_credit'] = '0';//刚开始就是临时会员
        // 等级
        $data['use_grade'] = '0';//刚开始就是临时会员
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
        $data['deep']=$r_user['deep']+1;



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




    // 升级申请页面
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


        $user = M('user')->where("userid='{$id}'")->field("use_grade")->find();

        $user['standardlevelname'] = GetLevel($user['use_grade']);
        if($user['use_grade']+1>9){
            $user['target_standardlevelname'] = "已是最高等级";
        }else{
            $user['target_standardlevelname'] = GetLevel($user['use_grade']+1);
        }
        $info = M('user')->where("userid='{$id}'")->find();
        $user['userid'] = $info['userid'];
        $user['username'] = $info['username'];


        $this->assign("userinfo",$user);
        //var_dump($user);
        $this->display();

    }

    public function sjaction()
    {
        $this->LoginTrue();
        if(IS_AJAX){
            if(!empty($_POST['uid'])){
                $id = $_SESSION['nvip_member_id'];

                //判断是否有正在升级的宴请  and ((status1=0 and status2=0) or (status1=2 or status2=2)
                $isExists =M("usersjinfo")->where("user_id=$id")->order("id desc")->find();
                if($isExists){
                    if($isExists['status1'] == 0 && $isExists['status2'] ==0){
                        ajaxReturn("你有申请正在处理",0);
                    }
                }



                $user = M('user')->where("userid='{$id}'")->field("use_grade,mobile,path")->find();
                if($user['use_grade']+1>9){

                    // $this->error("已经是最高等级");
                    ajaxReturn("已经是最高等级",0);
                }
                $targetlevel = $user['use_grade']+1;
                // $tjcount = M('users')->where("rid='{$id}'")->count();

                $sjshuser = $this->isShengji($targetlevel,$id,$user['path']);
                //var_dump($sjshuser);
                if(!is_array($sjshuser)){

//                    $this->error("升级条件未满足<br/>".$sjshuser);
                    ajaxReturn("\"升级条件未满足<br/>\"",0);
                }

                if($sjshuser['find1'])
                    $shuser1 = $sjshuser['find1']['mobile'];

                if($sjshuser['find2'])
                    $shuser2 = $sjshuser['find2']['mobile'];

                //var_dump($shuser1);

                $data = array(
                    "user_id" => $id,
                    "loginname" => $user['mobile'],
                    "curlevel" => $user['use_grade'],
                    "targetlevel" => ($user['use_grade'])+1,
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

                    //$this->success("申请成功");
                    $this->ajaxReturn("申请成功",1);

                }else{
//                    $this->error("申请失败");
                    $this->ajaxReturn("申请失败",0);
                }

                $this->assign("userinfo",$user);
            }
        }

/*        $id = $_SESSION['nvip_member_id'];

        //判断是否有正在升级的宴请  and ((status1=0 and status2=0) or (status1=2 or status2=2)
        $isExists =M("usersjinfo")->where("user_id=$id")->order("id desc")->find();
        if($isExists){
            if($isExists['status1'] == 0 && $isExists['status2'] ==0){
                $this->error("你有申请正在处理");
            }

        }



        $user = M('user')->where("userid='{$id}'")->field("use_grade,mobile,rpath")->find();

        var_dump($user);
        exit;

        $user = M('user')->where("userid='{$id}'")->field("standardlevel,mobile,path")->find();

//        var_dump($user);

        if($user['use_grade']+1>9){
            $this->error("已经是最高等级");
        }


        $targetlevel = $user['use_grade']+1;
        // $tjcount = M('users')->where("rid='{$id}'")->count();
        $sjshuser = $this->isShengji($targetlevel,$id,$user['rpath']);

        $sjshuser = $this->isShengji($targetlevel,$id,$user['path']);
r
//        var_dump($sjshuser);
//        exit;
        if(!is_array($sjshuser)){
            $this->error("升级条件未满足<br/>".$sjshuser);
        }

        if($sjshuser['find1'])
            $shuser1 = $sjshuser['find1']['loginname'];

        if($sjshuser['find2'])
            $shuser2 = $sjshuser['find2']['loginname'];



        $data = array(
            "user_id" => $id,
            "loginname" => $user['loginname'],
            "curlevel" => $user['use_grade'],
            "targetlevel" => $user['use_grade']+1,
            "shuser1" => $shuser1,
            "shuser2" => $shuser2,
            "addtime" => time()
        );


        if(M("usersjinfo")->add($data)){
            $msgtext = "【创客联盟】用户".$user['loginname']."向您发来审核申请，请尽快处理。";
            if($shuser1){
                $this->SendMsg($shuser1,$msgtext);
            }
            if($shuser2){
                $this->SendMsg($shuser2,$msgtext);
            }

            $this->success("申请成功");
            exit;
        }

        $this->assign("userinfo",$user);*/
        $this->display();
    }

    //提交会员升级申请
   /* public function sjaction()
    {
        $this->LoginTrue();
        if(IS_AJAX){
            if(!empty($_POST['uid'])){
                $id = $_SESSION['nvip_member_id'];

                //判断是否有正在升级的宴请  and ((status1=0 and status2=0) or (status1=2 or status2=2)
                $isExists =M("usersjinfo")->where("user_id=$id")->order("id desc")->find();
                if($isExists){
                    if($isExists['status1'] == 0 && $isExists['status2'] ==0){
                       ajaxReturn("你有申请正在处理",0);
                    }
                }


                $user = M('user')->where("userid='{$id}'")->field("use_grade,mobile,rpath")->find();
                if($user['use_grade']+1>9){
                   // $this->error("已经是最高等级");
                    ajaxReturn("已经是最高等级",0);
                }
                $targetlevel = $user['use_grade']+1;
                // $tjcount = M('users')->where("rid='{$id}'")->count();

                $sjshuser = $this->isShengji($targetlevel,$id,$user['rpath']);
                //var_dump($sjshuser);
                if(!is_array($sjshuser)){

//                    $this->error("升级条件未满足<br/>".$sjshuser);
                    ajaxReturn("\"升级条件未满足<br/>\".$sjshuser",0);
                }

                if($sjshuser['find1'])
                    $shuser1 = $sjshuser['find1']['mobile'];

                if($sjshuser['find2'])
                    $shuser2 = $sjshuser['find2']['mobile'];

                //var_dump($shuser1);

                $data = array(
                    "user_id" => $id,
                    "loginname" => $user['mobile'],
                    "curlevel" => $user['use_grade'],
                    "targetlevel" => ($user['use_grade'])+1,
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

                    //$this->success("申请成功");
                    $this->ajaxReturn("申请成功",1);

                }else{
//                    $this->error("申请失败");
                    $this->ajaxReturn("申请失败",0);
                }

                $this->assign("userinfo",$user);
            }
        }

        $this->display();
    }*/

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
    /*public function userchecksjlog()
    {
        $this->LoginTrue();

        $loginname = $_SESSION['nvip_nvip_member_User'];

        //$shList = M("usersjinfo")->where("(shuser1='$loginname' or shuser2='$loginname'  )and ( status1=2 and status2=2)")->order("id desc")->select();
        $shList = M("usersjinfo")->where("((shuser1='$loginname' and status1=2) or (shuser2='$loginname' and status2=2)) and status1=2 and status2=2 ")->order("id desc")->select();
        foreach($shList as $key=>$val){

            $shList[$key]['user'] = M("user")->where("userid=".$val['user_id'])->find();
            $shList[$key]['levelname'] = GetLevel($val['targetlevel']);

        }
//        var_dump($shList);
        $this->assign("shList",$shList);

        $this->display();
    }*/


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
//        var_dump($shList);
//        exit;
        if(!$shList){
            $this->error("不正确的操作");
        }
        $status = "";
        if($shList['shuser1'] == $loginname){
            echo 3;
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
            echo 2;
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
            echo 1;
            $save = array(
                "status1" => $op,
                "shtime1" => time(),
                "status2" => $op,
                "shtime2" => time()
            );
        }
//        var_dump($save);
        $ispass = 0;
        if($save['status1'] == 2 && $save['status2'] ==2 ){
            $ispass = 1;
        }
        elseif($save['status1'] == 1 && $save['status2'] ==1 ){
            $ispass = 3;
        }

        M("usersjinfo")->startTrans();
//        echo $id;
        echo $ispass;
//        exit;
        if(M("usersjinfo")->where("id=$id")->save($save)){
            if($ispass==1){
                M("users")->where("id=$shList[user_id]")->save(array("use_grade"=>$shList['targetlevel']));
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
        else {
            $this->error("操作失败");
        }




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
                $res[] =  M("user")->where("userid=$shList[user_id]")->save(array("use_grade"=>$shList['targetlevel']));
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

    public function GetStatus($opstatus){

        if($opstatus==0)
            return "未审核";
        if($opstatus==1)
            return "未通过";
        if($opstatus==2)
            return "已通过";
    }

    public function ecosystem()
    {
        $this->display();
    }

}