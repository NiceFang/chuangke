<?php
namespace Home\Controller;
use Home\Lookget\CardWidge;
use Think\Controller;
use Home\Model\UserModel as UserModel;
class UserController extends CommonController
{
   public function Personal()
    {
        $uid = session('userid');
        $uinfo = M('user')->where(array('userid' => $uid))
            ->field('username,is_dailishang,userid,img_head,use_grade,user_credit,use_grade')
            ->find();
     	$moneyinfo = M('store')->where(array('uid' => $uid))->field('cangku_num,fengmi_num')->find();
        $moneyinfo['cangku_num'] = bcadd($moneyinfo['cangku_num'],0.00,2);
        $moneyinfo['fengmi_num'] = bcadd($moneyinfo['fengmi_num'],0.00,2);

        //判断当前语言
        $lang = LANG_SET;
        if (preg_match("/zh-C/i", $lang))
            $lantype = 1;//简体中文
        if (preg_match("/en/i", $lang))
            $lantype = 2;//English
//        $level = $this->userLevel[$uinfo['use_grade']];
        $level = GetLevel($uinfo["use_grade"]);

        $uinfo['use_grade_name'] = L($level);
        $mobile = session('user_login.mobile');
        $isM = strstr($mobile,'m');
        $isAndMobile = array(
            'isM' => $isM,
            'mobile' => $mobile
        );
        $this->assign('uid', $uid);
        $this->assign('uinfo', $uinfo);
     	$this->assign('moneyinfo', $moneyinfo);
        $this->assign('lantype', $lantype);
        $this->assign('isAndMobile', $isAndMobile);
        $this->display();
    }

    public function Imgup()
    {
        $uid = session('userid');
        $picname = $_FILES['uploadfile']['name'];
        $picsize = $_FILES['uploadfile']['size'];
        if ($uid != "") {
            if ($picsize > 2014000) { //限制上传大小
                ajaxReturn(L('tpdxbncg'), 0);
            }
            $type = strstr($picname, '.'); //限制上传格式
            if ($type != ".gif" && $type != ".jpg" && $type != ".png" && $type != ".jpeg") {
                ajaxReturn(L('tpgsbd'), 0);
            }
            $rand = rand(100, 999);
            $pics = uniqid() . $type; //命名图片名称
            //上传路径
            $pic_path = "./Public/home/wap/heads/" . $pics;
            move_uploaded_file($_FILES['uploadfile']['tmp_name'], $pic_path);
        }
        $size = round($picsize / 1024, 2); //转换成kb
        $pic_path = trim($pic_path, '.');
        if ($size) {
            $res = M('user')->where(array('userid' => $uid))->setField('img_head', $pics);
            ajaxReturn($pic_path, 1);
        }
    }

    public function test()
    {
        $this->display();
    }

    public function imgUps()
    {
        if (IS_AJAX) {
            $uid = session('userid');
            $dataflow = trim(I('dataflow'));
            $base64 = str_replace('data:image/jpeg;base64,', '', $dataflow);
            $img = base64_decode($base64);
            //保存地址
            $imgDir = './Public/home/wap/heads/';
            //要生成的图片名字
            $filename = md5(time() . mt_rand(10, 99)) . ".png"; //新图片名称
            $newFilePath = $imgDir . $filename;
            $res = file_put_contents($newFilePath, $img);//返回的是字节数
            if ($res > 1000) {
                //修改头像
                $res_change = M('user')->where(array('userid' => $uid))->setField('img_head', $filename);
                if ($res_change) {
                    ajaxReturn(L('xgcg'), 1);//头像修改成功
                } else {
                    ajaxReturn(L('xgsb'), 0);//头像修改失败
                }
            } else {
                ajaxReturn(L('xgsb'), 0);
            }
        }
    }


    public function Setuname()
    {
        $uid = session('userid');
        $uname = M('user')->where(array('userid' => $uid))->getField('username');
        if (IS_AJAX) {
            $uname = trim(I('uname'));
            if ($uname == '') {
                ajaxReturn(L('qtxxm'), 0);//请填写姓名
            } else {
                $res_Save = M('user')->where(array('userid' => $uid))->setField('username', $uname);
                if ($res_Save) {
                    ajaxReturn(L('ncxgcg'), 1, '/User/Personal');//昵称修改成功
                } else {
                    ajaxReturn(L('ncxgsb'), 0, '/User/Personal');//昵称修改失败
                }
            }
        }
        $this->assign('uname', $uname);
        $this->display();
    }

   public function Mobile()
    {
        $uid = session('userid');
        $uname = M('user')->where(array('userid' => $uid))->getField('mobile');
        // if (IS_AJAX) {
        //     $uname = trim(I('uname'));
        //     if ($uname == '') {
        //         ajaxReturn('请填写姓名', 0);
        //     } else {
        //         $res_Save = M('user')->where(array('userid' => $uid))->setField('username', $uname);
        //         if ($res_Save) {
        //             ajaxReturn('昵称修改成功', 1, '/User/Personal');
        //         } else {
        //             ajaxReturn('昵称修改失败', 0, '/User/Personal');
        //         }
        //     }
        // }
        $this->assign('uname', $uname);
        $this->display();
    }
       

    public function Setpwd()
    {
        $type = trim(I('get.type'));
        if ($type == 1) {
            $title = L('uplogpwd');
        } else {
            $title = L('paypwdup');
        }
        if (IS_AJAX) {
            $user = D('Home/User');
            $user_object = D('Home/User');
            $uid = session('userid');
            $pwd = trim(I('pwd'));//新密码
            $pwdrpt = trim(I('pwdrpt'));//旧密码
            $type = trim(I('pwdtype'));
            if ($pwdrpt == '') {
                ajaxReturn(L('xmmbnwk'), 0);
            }
            $account = M('user')->where(array('userid' => $uid))->Field('account,mobile,login_pwd')->find();
            //验证初始密码
            $user_info = $user_object->Savepwd($account['account'], $pwd, $type);
            $salt = substr(md5(time()), 0, 3);
            if ($type == 1) {
                //密码加密
                $data['login_pwd'] = $user->pwdMd5($pwdrpt, $salt);
                $data['login_salt'] = $salt;
            } else {
                $data['safety_pwd'] = $user->pwdMd5($pwdrpt, $salt);
                $data['safety_salt'] = $salt;
            }
            $res_Sapwd = M('user')->where(array('userid' => $uid))->save($data);
            if ($res_Sapwd) {
                ajaxReturn(L('xgcg'), 1, '/User/Personal');
            } else {
                ajaxReturn(L('xgsb'), 0);
            }
        }
        $this->assign('title', $title);
        $this->assign('type', $type);
        $this->display();
    }
    //ajax删除/更新支付宝 微信 imtoken方法
    public function dele()
    {
        if ($_POST['clickName']=='weichar' | $_POST['clickName']=='imtoken' | $_POST['clickName']=='alipay'){
            switch ($_POST['clickName']){
                case 'weichar':
                    $type = 3;
                    break;
                case 'alipay':
                    $type = 2;
                    break;
                case 'imtoken':
                    $type = 4;
                    break;
            }
            //判断有没有该付款方式的订单
            $uid = session('userid');
            $model = D('Trading');
            $result = D($_POST['clickName'])->where(['id'=>$_POST['id']])->getField($_POST['clickName'].'_default');
            if($result == 1){
                $result = $model->hasOrder($type,$uid);
                if(!$result){
                    $this->ajaxReturn('您有订单选择该银行卡，请先取消订单');
                }
            }
            if ($_POST['ac'] == 'dele'){
                $table = $_POST['clickName'];
                $sqlwhere = $table.'_imgs';
                $table = M($table);
                $arr = $table->field($sqlwhere)->where("id=".$_POST['id'])->find();
                $tai = $table->delete($_POST['id']);
                if ($tai){
                    unlink ( ".".$arr[$sqlwhere]);
                    $this->ajaxReturn('删除成功');
                }else{
                    $this->ajaxReturn('删除失败');
                }
            }else if($_POST['ac'] == 'update'){
                $updeta = [
                    $_POST['clickName'].'_default'=>"0",
                ];
                $zhuangtai  =  $this->ACIupdate($_POST['clickName'],$_SESSION['userid'],$updeta,$_POST['id']);
                if($zhuangtai="1"){
                    $this->ajaxReturn('更新成功');
                }else{
                    $this->ajaxReturn('更新失败');
                }
            }
        }else{
            $this->ajaxReturn('页面访问错误');
        }
    }

    /**
     * ajax绑定支付宝 微信 imtoken 修改设为默认字段里修改方法
     * @param 需要更新的表明
     * @param $uid 用户id
     * @param 传入需要更新的数组字段
     * @param $id 需要更新成默认字段的id
     * @return string 1 成功 0失败
     */
    public function ACIupdate($table, $uid,$arr,$id){
       $tableName = M($table);
       $up = [
           $_POST['clickName'].'_default'=>"1"
       ];
       M()->startTrans();
       try{
           $updeta = $tableName->where("$tableName.'_default'=1")->where("userid=$uid")->save($arr);
           $tableName->where("id=$id")->save($up);
           M()->commit();
           return '1';
       }catch (\Exception $ex){
           M()->rollback();//回滚
           return '0';
       }
    }
    //ajax绑定支付宝 微信 imtoken方法
    public function AddBound()
    {
        $data = I('post.');
        if(!$data['userName']){
            ajaxReturn('姓名不能为空',0);
        }
        if(!$data['sizeName']){
            ajaxReturn('支付宝账号不能为空',0);
        }
        if(!$data['phoneName']){
            ajaxReturn('手机号不能为空',0);
        }
        if($data['file_img'] === 'undefined'){
            ajaxReturn('请上传收款二维码图片',0);
        }

        if($_POST['clickName']=='weichar' | $_POST['clickName']=='imtoken' | $_POST['clickName']=='alipay'){
            $tahleName = $_POST['clickName'];
            $table = M($tahleName);
            $fileName =   MD5($_SESSION['userid'].time());
            $usid = $_SESSION['userid'];
            $fileName = "./Uploads/imgACI/$fileName.png";
            if(!file_exists('./Uploads/imgACI')){
                mkdir('./Uploads/imgACI');
            }
            $data=[
                'userid'=>$usid,
                $tahleName.'_name'=>$_POST['userName'],
                $tahleName.'_num'=>$_POST['sizeName'],
                $tahleName.'_phone'=>$_POST['phoneName'],
                $tahleName.'_default'=>$_POST['checked'],
                $tahleName.'_imgs'=>ltrim($fileName,'.')
            ];
            if ($_POST['checked']==1){
                M()->startTrans();
                try{
                    $updeta = [
                        $tahleName.'_default'=>"0",
                    ];
                    $table->where("$tahleName.'_default'=1")->where("userid=$usid")->save($updeta);
                    $table->add($data);
                    $state = move_uploaded_file($_FILES['file_img']['tmp_name'],$fileName);
                    if(!$state){
                        $this->ajaxReturn('图片上传失败,请联系管理员');
                    }
                    M()->commit();
                    $this->ajaxReturn('添加成功');
                }catch (\Exception $ex){
                    M()->rollback();//回滚
                    $this->ajaxReturn('添加失败，联系管理员');
                }
            }else{
                $arr =  $table->add($data);
                if ($arr){
                    move_uploaded_file($_FILES['file_img']['tmp_name'],$fileName);
                    $this->ajaxReturn('添加成功');
                }else{
                    $this->ajaxReturn('添加失败');

                }
            }
        }else{
            $this->ajaxReturn('访问错误');

        }
    }

    public function News()
    {
        $newinfo = M('news')->order('id desc')->limit(8)->select();
        foreach ($newinfo as $key =>$val){
            $newinfo[$key]['content'] = html_entity_decode($val['content']);
        }
        $this->assign('newinfo', $newinfo);
        $this->display();
    }

    public function Newsdetail()
    {
        $nid = I('nid', 'intval', 0);
        $newdets = M('news')->where(array('id' => $nid))->find();
        $newdets['content'] = html_entity_decode($newdets['content']);
        $this->assign('newdets', $newdets);
        $this->display();
    }

    //个人二维码
    public function Sharecode()
    {
        $time = time();
        $userid = session('userid');
        $uinfo = M('user')
            ->where(array('userid' => $userid))
            ->field('username,mobile,is_dailishang,userid,img_head,use_grade,user_credit,vip_grade')
            ->find();
        //        $u_ID = M('user')->where(array('userid'=>$userid))->getField('mobile');
        $u_ID = $userid;
        $drpath = './Uploads/Scode';
        $imgma = 'codes' . $userid . '.png';
        $urel = './Uploads/Scode/' . $imgma;
//       if (!file_exists($drpath . '/' . $imgma)) {
        if (true) {
            sp_dir_create($drpath);
            vendor("phpqrcode.phpqrcode");
            $phpqrcode = new \QRcode();
            $hurl ="http://".$_SERVER['SERVER_NAME']. U('Login/register/UID/' . $uinfo['userid']);
//            dump($hurl);exit;
            $size = "7";
            //$size = "10.10";
            $errorLevel = "L";
            $phpqrcode->png($hurl, $drpath . '/' . $imgma, $errorLevel, $size);

            $phpqrcode->scerweima1($hurl,$urel,$hurl);


        }
        $aurl = $_SERVER['SERVER_NAME']. U('Login/register/UID/' . $uinfo['userid'].'/l/'.LANG_SET);
        //$aurl = $_SERVER['SERVER_NAME'].':806'. U('Login/register/UID/' . $uinfo['userid'].'/l/'.LANG_SET);
        $moneyinfo = M('store')->where(array('uid' => $userid))->field('cangku_num,fengmi_num')->find();
        $this->assign('moneyinfo', $moneyinfo);
        $this->urel = ltrim($urel,".");
        $this->aurl = $aurl;
        $userLevel = $this->userLevel;
        $uinfo['use_grade_name'] = $userLevel[$uinfo['use_grade']]?$userLevel[$uinfo['use_grade']]:$userLevel[1];
        $uinfo['use_grade_name'] = L($uinfo['use_grade_name']);

        $this->assign('url',$aurl);
        $this->assign('uinfo',$uinfo);
        $this->display();
    }

    public function Teamdets()
    {
        //查询我的会员
        $uid = session('userid');
        if (IS_POST) {
            $uinfo = trim(I('uinfo'));
            if (!empty($uinfo) && $uinfo != '') {
                $where['userid|mobile'] = array('like', '%' . $uinfo . '%');
                $this->assign('uinfo',$uinfo);
            }
        }
        $where['pid'] = $uid;
        $muinfo = M('user')->where($where)->order('userid desc')->select();
        //中间4位隐藏
//        foreach ($muinfo as $k=>$v){
//            $v['mobile'] = substr_replace($v['mobile'],'****',3,4);
//            $muinfo[$k]['mobile'] = $v['mobile'];
//        }
        $this->assign('muinfo', $muinfo);
        $this->display();
    }

    /**
     * [Friends 我的好友]
     */
    public function FriendsData()
    {
        $userid = session('userid');
        $where['pid'] = $userid;
        $where['gid'] = $userid;
        $where['ggid'] = $userid;
        $where['_logic'] = 'or';
        if (IS_AJAX) {
            $p = I('p', '0', 'intval');
            $page = $p * 10;
            $u_info = M('user a')->join('ysk_user_huafei b ON a.userid=b.uid')->field('username as u_name,account as u_zh,pid as u_fuji,gid as u_yeji,ggid as u_yyj,pid_caimi,gid_caimi,ggid_caimi,datestr,uid')->where($where)->limit($page, 10)->order('userid')->select();


            if (empty($u_info)) {
                $u_info = null;
            }

            $this->ajaxReturn($u_info);
        }
    }

    //判断是否自己好友
    private function isfriend($uid, $fid)
    {
        $user = M('user');
        $c_info = $user->where(array('userid' => $fid))->field('pid,gid,ggid')->find();
        $pid = $c_info['pid'];
        $gid = $c_info['gid'];
        $ggid = $c_info['ggid'];

        if ($pid == $uid) { //一级
            $lv = M('config')->where(array('id' => 24))->getField('value');
            $lv = $lv / 100;
            $data['lever'] = 1;
            $data['lv'] = $lv;
            return $data;
        } elseif ($pid == $gid) { //二级
            $lv = M('config')->where(array('id' => 25))->getField('value');
            $lv = $lv / 100;
            $data['lever'] = 2;
            $data['lv'] = $lv;
            return $data;
        } elseif ($pid == $gid) { //三级
            $lv = M('config')->where(array('id' => 35))->getField('value');
            $lv = $lv / 100;
            $data['lever'] = 3;
            $data['lv'] = $lv;
            return $data;
        } else {
            return false;
        }
    }

    /**
     * 修改密码
     */
    public function updatepassword()
    {
        if (!IS_AJAX)
            return;

        $password_old = I('post.old_pwdt');
        $password = I('post.new_pwd');
        $passwordr = I('post.rep_pwd');
        $two_password = I('post.new_pwdt');
        $two_passwordr = I('post.rep_pwdt');
        if (empty($password_old)) {
            ajaxReturn(L('qsrddlmm'));
            return;
        }
        if ($password != $passwordr) {
            ajaxReturn(L('lcsrdlmmbyz'));
            return;
        }

        if ($two_password != $two_passwordr) {
            ajaxReturn(L('lcsrdmmbyz'));
        }

        $user = D('User');
        $user->startTrans();
        //验证旧密码
        if (!$user->check_pwd_one($password_old)) {
            ajaxReturn(L('jdlmmcw'));
        }

        //=============登录密码加密==============
        if ($password) {
            $salt = substr(md5(time()), 0, 3);
            $data['login_salt'] = $salt;
            $data['login_pwd'] = md5(md5(trim($password)) . $salt);
        }

        //=============安全密码加密==============
        if ($two_password) {
            $two_salt = substr(md5(time()), 0, 3);
            $data['safety_salt'] = $two_salt;
            $data['safety_pwd'] = $two_password = md5(md5(trim($two_passwordr)) . $two_salt);
        }
        if (empty($data)) {
            ajaxReturn(L('qsryxgdmm'));
        }
        $userid = session('userid');
        $where['userid'] = $userid;
        $res = $user->where($where)->save($data);

        if ($res) {
            $user->commit();
            ajaxReturn(L('xgcg'), 1);
        } else {
            $user->rollback();
            ajaxReturn(L('xgsb'));
        }

    }
    //投诉建议
    public function Complaint()
    {
        $uid = session('userid');
        if (IS_POST) {
            $content = I('post.content');
            $data['mobile'] = I('mobile');
            $data['content'] = $content;
            $data['user_id'] = $uid;
            $data['create_time'] = time();
            $Complaint = M('complaint');
            $data['imgs'] = I('imgs');
            $result = $Complaint->add($data);
            if($result){
                ajaxReturn(L('tjcg'), 1,'/User/Personal');
            }else{
                ajaxReturn(L('tjsb'));
            }
            exit;
        }
        $this->display();
    }

    //关于我们
    public function Aboutus()
    {
        $this->display();
    }

    //退出登录
    public function Loginout()
    {
        cookie(session('userid'),null);
        session_destroy();
//        $this->redirect('all/shop');
        $this->redirect('index/index');
    }

    public function addBank(){
        $uid = session('userid');
        $controller = I('clco');
        $action = I('funact');
        $morecars = M('ubanks as u')
            ->join('RIGHT JOIN ysk_bank_name as banks ON u.card_id = banks.pid' )
            ->join('LEFT JOIN ysk_user as user ON user.userid = u.user_id')
            ->where(array('u.user_id'=>$uid))
            ->order('u.id desc')
            ->field('u.hold_name,u.id,u.card_number,u.user_id,banks.banq_genre,banks.banq_img,user.mobile')
            ->select();
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
        //dump($morecars);exit;
        $this->assign('morecars',$morecars);
        $this->assign('actionUrl',$url);
        $this->display();
    }


    //历史记录
    public function historyOrder(){
        $userId = intval(session('userid'));
        $sql = 'SELECT * FROM(
        SELECT id,payout_id,payin_id,pay_nums,pay_type,pay_time,1 as type 
        FROM ysk_trans 
        WHERE (payin_id = '. $userId .' OR payout_id = ' . $userId . ') 
        AND pay_state = 3 
        UNION ALL 
        SELECT id,payout_id,payin_id,pay_nums,pay_type,pay_time,2 as type 
        FROM ysk_trans_quxiao 
        WHERE payin_id = '. $userId .' OR payout_id = ' .$userId. ') as a 
        ORDER BY pay_time DESC';
        $model = M();
    //  $transData = $model->query($sql);
       // $transData = D('trans')->where("payin_id = $userId AND pay_state=3")->where("payout_id = $userId AND pay_state=3")->select();
        $sql = 'SELECT * FROM(ysk_trans)
        WHERE(payin_id = '. $userId .' OR payout_id = ' . $userId . ')
        AND pay_state = 3 ORDER BY pay_time DESC';
        $transData = $model->query($sql);
      //  $userData = $model->table('ysk_user')->field('userid,username')->where(array('userid'=>$userId))->find();
//        $uid = session('userid');
//        $data['cancel'] = M('trans_quxiao as tr')
//            ->join("LEFT JOIN ysk_user u ON tr.")
//            ->where("payout_id=$uid or payin_id=$uid and pay_state = 4")
//            ->select();
//        $data['confirm'] = M('trans')
//            ->where("payout_id=$uid or payin_id=$uid and pay_state=3")
//            ->select();
//        //dump($data);exit;
        foreach ($transData as $key => $val){
            $transData[$key]['pay_nums'] = bcadd($val['pay_nums'],0,0);
            if($val['trans_type'] == '1' ){
                $id = $val['payout_id'];
                $id = $userId==$id?$val['payin_id']:$val['payout_id'];
                $arr  = D('user')->where("userid=$id")->field('username,userid')->find();
                $transData[$key]['userid'] = $arr['userid'];
                $transData[$key]['username'] = $arr['username'];
            }else{
                $id = $val['payin_id'];
                $id = $userId==$id?$val['payout_id']:$val['payin_id'];
                $arr  = D('user')->where("userid=$id")->field('username,userid')->find();
                $transData[$key]['userid'] = $arr['userid'];
                $transData[$key]['username'] = $arr['username'];
            }
        }
        $this -> assign('userId',$userId);
        $this -> assign('transData',$transData);
        //$this-> assign('userData',$userData);
        $this -> display();
    }

    public function Iccparticulars(){
        $model = new UserModel();
        $id = I('id');
        $type = I('type');
        $data = $model -> getDetail($id,$type);
//      dump($data);exit;
        $this -> assign('data',$data);
        $this -> display();
    }

    //上传图片
    public function upload_img(){
//        ajaxReturn(file_exists('./Public/home/wap/heads/toux-icon.png'));
        $upload = new \Think\Upload();// 实例化上传类
        $upload->maxSize   =     3145728 ;// 设置附件上传大小
        $upload->autoSub = false;
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg');// 设置附件上传类型
//        $upload->savePath  =      './Public/home/wap/heads/1.jpg'; // 设置附件上传目录
        $upload->rootPath = './Public/home/wap/heads/'; // 设置附件上传目录
        // 上传文件
        $info   =   $upload->uploadOne($_FILES['header_img']);
        $path = ltrim($info,'.');
        $path = $path.$info['savepath'].$info['savename'];
        if(!$info) {// 上传错误提示错误信息
            ajaxReturn($upload->getError(),0);
        }else{// 上传成功
            $uid = session('userid');
            $updateImg = D('user')->where("userid=$uid")->field('img_head')->find()['img_head'];
            $filesize = @getimagesize("./Public/home/wap/heads/".$updateImg);
            if($filesize  && $updateImg!="toux-icon.png"){
                unlink("./Public/home/wap/heads/".$updateImg);
            }

            $imgStatus = M('user')->where(['userid'=>$uid])->setField(['img_head'=>$info['savename']]);
            if(!$imgStatus){
                M('user')->where(['userid'=>$uid])->setField(['img_head'=>$updateImg]);
                ajaxReturn($upload->getError(),0);
            }
            ajaxReturn($path,1);
        }
    }

    //反馈信息列表
    public function feedbackInfo(){
        $uid = session('userid');
        $table = M('complaint');
        $startPage = I('page',0,'intval')*25; //默认为25条数据
        $Complaint = $table
            ->where(array('user_id'=>$uid))
            ->order('create_time desc')
            ->limit($startPage,25)
            ->select();

        foreach($Complaint as $key => $value){
            //将数据库时间戳格式转换成日期格式
            $Complaint[$key]['time'] = date("Y-m-d H:i:s",$value['create_time']);
            //第一个标题 限制显示字符个数
            $str=$value['content'];
            $str1 = mb_strimwidth($str,0,24,'...','utf-8');
            $Complaint[$key]['toushu'] = $str1;  //toushu 投诉

            //第二个标题 限制显示字符数量
            $str2=$value['reply'];
            $str3 = mb_strimwidth($str2,0,24,'...','utf-8');
            //后台如果未回复，前台显示待回复
            if($value['status'] != 2 ){
                $Complaint[$key]['huifu'] = "待回复"; //huifu 回复
            }else{
                $Complaint[$key]['huifu'] = $str3;
            }

        }
        //刷新执行刷新更多数据
        if (IS_AJAX) {
            if (count($Complaint) >= 1) {
                ajaxReturn($Complaint, 1);
            } else {
                ajaxReturn('暂无记录', 0);
            }
        }

        $this -> assign('list',$Complaint);
        $this -> display();
    }

    //反馈列表回复详情
    public function revertParticulars(){
        $id = I('get.id');
        $reply = M('complaint')->where(array('id'=>$id))->find();
        //将数据库时间戳变为日期格式
//        $time = date("Y-m-d H:i:s",$reply['create_time']);
        $this -> assign('reply',$reply);
        $this -> display();
    }




    public function upImg($image)
    {
        //判断获得变量
        if ($image['error'] > 0) {
            $error = "上传失败了,原因是";

            switch ($image['error']) {
                case 1:
                    $error .= "大小超过了服务器设置的限制！";
                    break;
                case 2:
                    $error .= "文件大小超过了表单的限制！";
                    break;
                case 3:
                    $error .= "文件只有部分被上传！";
                    break;
                case 4:
                    $error .= "没有文件被上传!";
                    break;
                case 6:
                    $error .= "上传文件的临时目录不存在！";
                    break;
                case 7:
                    $error .= "写入失败!";
                    break;
                default:
                    $error .= "未知的错误！";
                    break;
            }
            //输出错误
            exit($error);
        } else {
            //截取文件后缀名
            $type = strrchr($image['name'], ".");

            //设置上传路径
            $path = "./Uploads/" . $image['name'];

            //判断上传的文件是否为图片格式
            if (strtolower($type) == '.png' || strtolower($type) == '.jpg' || strtolower($type) == '.bmp' || strtolower($type) == '.gif') {
                //将图片文件移到该目录下
                move_uploaded_file($image['tmp_name'], $path);
            }
        }


    }





}