<?php
namespace Admin\Controller;

use Think\Page;

/**
 * 用户控制器
 * 
 */
class UserController extends AdminController
{


    /**
     * 用户列表
     * 
     */
     public function index()
    {


         // 搜索
        $keyword    = I('keyword', '', 'string');
        $querytype  = I('querytype','userid','string');
        $status     = I('status');
        if($keyword){
            $condition = $keyword ;
            $map[$querytype] = $condition;
        }


         //按日期搜索
        $date=date_query('reg_date');
        if($date){
            $where=$date;
            if(isset($map))
                $map=array_merge($map,$where);
            else
                $map=$where;
        }

        if($level!=''){
            $map['a.level']=$level;
        }

        // 获取所有用户
        $user   = M('user a');
        if(!isset($map)){
            $map=true;
        }


        // //按日期搜索
        // $date=date_query('reg_date');
        // if($date){
        //     $where=$date;
        //     if($map)
        //         $map=array_merge($map,$where).' and sex==0';
        //     else
        //         $map=$where.' and sex==0';
        // }

        // if($status=='0' || $status=='1'){
        //      $map['a.status']=$status;
        // }
        //  //$map=$map.' sex=0';
        // // 获取所有用户
        // $user   = M('user a');

        //========排序=========
        $order_str='a.userid desc';

        //========排序=========

        //分页
        $isLead = I('isLead');
        $table=$user->join('ysk_store b on a.userid=b.uid','left');
        if($isLead != 1){
            $p=getpage($table,$map,30);
            $page=$p->show();
        }
        $data_list     = $table
            ->field('a.userid,a.username,a.email,a.yinbi,a.account,a.mobile,a.reg_date,a.status,a.pid,b.cangku_num,b.fengmi_num,b.tongzheng')
            ->where($map)
            ->order($order_str)
            ->select();

         //取管理员会员列表的权限
        $uids= is_login();
        $hylbs="1,2,3,4,5";
        $auth_id    = M('admin')->where(array('id'=>$uids))->getField('auth_id');
        if($auth_id<>1){
        $auth_id    = M('admin')->where(array('id'=>$uids))->getField('auth_id');
        $hylbs    = M('group')->where(array('auth_id'=>$auth_id))->getField('hylb');

        }
        //到处excel

//        dump($data_list);exit;
        if($isLead == 1){
            $this -> export($data_list);
        }
        $hylb=explode(",",$hylbs);
        $this->assign('hylb',$hylb);
        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }

    /**
     *
     */
    public function recharge(){
        // 获取所有用户
        //$tranmoney   = M('tranmoney t');
        // 搜索
        $querytype  = I('querytype','','string');
        $keyword    = I('keyword', '', 'string');
        $p          = I('p',0,'int');
        /*if($querytype){
            if($querytype == 1){
                $map['t.get_type'] = array('eq', 11);
            }else{
                $map['t.get_type'] = array('eq', 12);
            }
        }else{
            $map['t.get_type'] = array('in', '11,12');
        }
        if($keyword){
            $map['b.master_id'] = array('eq', $keyword);
        }
        $order_str='a.id desc';*/
        //分页
        /*
        $tranmoney = M('usermoney_record')->field('id,master_id,get_nums,get_type,now_nums,get_time')
            //->table('ysk_usermoney_record')
                ->where(['get_type'=>'41'])
            ->union('SELECT id,master_id,get_nums,get_type,now_nums,get_time FROM ysk_userscores_record where get_type = 41',true)
            ->alias('a');
           // ->select();
        //echo M('usermoney_record')->getLastSql();
        $table=$tranmoney->join('ysk_user u on a.master_id = u.userid','left')->alias('b')->order('a.id desc')->select();
        echo M('usermoney_record')->getLastSql();exit;
        $p=getpage($table,$map,15);
        $page=$p->show();
        $data_list     = $table
            ->field('u.userid,u.username,u.account,u.mobile,b.get_nums,b.get_time,b.get_type')
            ->where($map)
            ->order($order_str)
            ->select();
        echo M('usermoney_record')->getLastSql();
        if(!empty($data_list)){
            foreach ($data_list as $k=>$v){
                if($v['get_type'] == 11){
                    $data_list[$k]['name'] = '矿晶';
                }else if($v['get_type'] == 12){
                    $data_list[$k]['name'] = '矿池';
                }
                if($v['get_nums'] < 0 ){
                    $data_list[$k]['type'] = '减少';
                }else{
                    $data_list[$k]['type'] = '增加';
                }
            }
        }*/
        /*$m1=clone $m;//浅复制一个模型
        $count = $m->where($where)->count();//连惯操作后会对join等操作进行重置
        $m=$m1;//为保持在为定的连惯操作，浅复制一个模型
        $p=new Think\PageAdmin($count,$pagesize);
        $p->lastSuffix=false;
        $p->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
        $p->setConfig('prev','上一页');
        $p->setConfig('next','下一页');
        $p->setConfig('last','末页');
        $p->setConfig('first','首页');

        $p->parameter=I('get.');

        $m->limit($p->firstRow,$p->listRows);

        return $p;*/
        $where = '';
        if($keyword){
            $where = ' and master_id = '.intval($keyword);
        }
        $offSite = $p?($p-1)*15:$p;
        $pagesize = 15;
        $limit = ' limit '.$offSite.','.$pagesize;
        $model = new \Think\Model();
        if($querytype == 0){
            $sql = 'SELECT count(*) countnum FROM (SELECT a.id,a.master_id,a.get_nums,a.get_type,a.now_nums,a.get_time,u1.userid,u1.username,u1.account,u1.mobile 
                FROM ysk_usermoney_record a left JOIN ysk_user u1 on a.master_id = u1.userid
                WHERE a.get_type = 41 '. $where .' UNION ALL SELECT b.id,b.master_id,b.get_nums,b.get_type,b.now_nums,b.get_time,u2.userid,u2.username,
                u2.account,u2.mobile FROM ysk_userscores_record b left JOIN ysk_user u2 on b.master_id = u2.userid WHERE b.get_type = 42 '. $where .') b';
            $count = $model->query($sql);

            $data_list = $model->query('SELECT id,master_id,get_nums,get_type,now_nums,get_time,userid,username,account,mobile
                FROM (SELECT a.id,a.master_id,a.get_nums,a.get_type,a.now_nums,a.get_time,u1.userid,u1.username,u1.account,u1.mobile
                FROM ysk_usermoney_record a left JOIN ysk_user u1 on a.master_id = u1.userid WHERE a.get_type = 41 '. $where .' UNION ALL SELECT
                b.id,b.master_id,b.get_nums,b.get_type,b.now_nums,b.get_time,u2.userid,u2.username,u2.account,u2.mobile FROM
                ysk_userscores_record b left JOIN ysk_user u2 on b.master_id = u2.userid WHERE b.get_type = 42  '. $where .' ) al ORDER BY
                al.get_time DESC '.$limit);
        }elseif ($querytype == 1){
            $count = $model->query('SELECT count(*) countnum FROM ysk_usermoney_record a left JOIN ysk_user u1 on a.master_id = u1.userid WHERE a.get_type = 41 '. $where);

            $data_list = $model->query('SELECT a.id,a.master_id,a.get_nums,a.get_type,a.now_nums,a.get_time,u1.userid,u1.username,u1.account,u1.mobile
                FROM ysk_usermoney_record a left JOIN ysk_user u1 on a.master_id = u1.userid WHERE a.get_type = 41 '. $where .'
                ORDER BY get_time DESC'.$limit);
        }elseif ($querytype == 2){
            $count = $model->query('SELECT count(*) countnum FROM ysk_userscores_record b left JOIN ysk_user u2 on b.master_id = u2.userid WHERE b.get_type = 42 '. $where);

            $data_list = $model->query('SELECT
                b.id,b.master_id,b.get_nums,b.get_type,b.now_nums,b.get_time,u2.userid,u2.username,u2.account,u2.mobile FROM
                ysk_userscores_record b left JOIN ysk_user u2 on b.master_id = u2.userid WHERE b.get_type = 42  '. $where .'  
                ORDER BY get_time DESC'.$limit);
        }

        if(!empty($data_list)){
            foreach ($data_list as $key => $val){
                if($val['get_type'] == 41){
                    $data_list[$key]['name'] = '矿晶';
                }else{
                    $data_list[$key]['name'] = '矿池';
                }
                if($val['get_nums'] < 0){
                    $data_list[$key]['type'] = '减少';
                }else{
                    $data_list[$key]['type'] = '增加';
                }
            }
        }

        $p=new \Think\PageAdmin($count[0]['countnum'],$pagesize);
        $p->lastSuffix=false;
        $p->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
        $p->setConfig('prev','上一页');
        $p->setConfig('next','下一页');
        $p->setConfig('last','末页');
        $p->setConfig('first','首页');
        $p->parameter=I('get.');
        $page=$p->show();

        //var_dump($data_list);exit;
        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }
//    public function recharge(){
//        // 获取所有用户
//        $tranmoney   = M('tranmoney t');
//        // 搜索
//        $querytype  = I('querytype','','string');
//        $keyword    = I('keyword', '', 'string');
//        if($querytype){
//            if($querytype == 1){
//                $map['t.get_type'] = array('eq', 11);
//            }else{
//                $map['t.get_type'] = array('eq', 12);
//            }
//        }else{
//            $map['t.get_type'] = array('in', '11,12');
//        }
//        if($keyword){
//            $map['t.get_id'] = array('eq', $keyword);
//        }
//        $order_str='t.id desc';
//        //分页
//        $table=$tranmoney->join('ysk_user u on t.get_id = u.userid','left');
//        $p=getpage($table,$map,15);
//        $page=$p->show();
//        $data_list     = $table
//            ->field('u.userid,u.username,u.account,u.mobile,t.get_nums,t.get_time,t.get_type')
//            ->where($map)
//            ->order($order_str)
//            ->select();
//        if(!empty($data_list)){
//            foreach ($data_list as $k=>$v){
//                if($v['get_type'] == 11){
//                    $data_list[$k]['name'] = '余额';
//                }else if($v['get_type'] == 12){
//                    $data_list[$k]['name'] = '';
//                }
//                if($v['get_nums'] < 0 ){
//                    $data_list[$k]['type'] = '减少';
//                }else{
//                    $data_list[$k]['type'] = '增加';
//                }
//            }
//        }
//        $this->assign('list',$data_list);
//        $this->assign('table_data_page',$page);
//        $this->display();
//    }

    /**
     * 新增用户
     * 
     */
    public function add()
    {
        if (IS_POST) {

           $admin_kucun=M('admin_kucun');//平台仓库表
            #查询平台总充值了多少水果
           $kucun_info=$admin_kucun->order('id')->find();
           $less_num=$kucun_info['less_num'];
           $kucun_id=$kucun_info['id'];
           if ($less_num < 300) {
                $this->error('平台库存不足'); 
           }


            // 提交数据
            $user_object = D('User');

            $data        = $user_object->create();
            if(!$data){
                $this->error($user_object->getError());
            }
            $parent=I('post.paccount');
            if(empty($parent)){
                $this->error('上级不能为空');
            }
            $where['account']=$parent;
            $p_info=$user_object->where($where)->field('userid,pid,username,mobile')->find();
            if(empty($p_info)){
                $this->error('上级账号错误或不存在');
            }

            $pid=$p_info['userid']; //上级ID

            $data['pid']=$p_info['userid'];
            $gid=$p_info['pid'];//上上级ID
            if($gid){
                $data['gid']=$gid;
            }

            //登录密码加密
            $salt= substr(md5(time()),0,3);
            $data['login_pwd']=$user_object->pwdMd5($data['login_pwd'],$salt);
            $data['login_salt']=$salt;
            //交易密码加密
            $data['safety_pwd']=$user_object->pwdMd5($data['safety_pwd'],$salt);
            $data['safety_salt']=$salt;

            $user_object->startTrans();
            if ($data) {
                $result = $user_object->add($data);
                if ($result) {
                    $uid=$result;
                    //为新会员创建仓库和土地
                    if(!D('Home/Store')->CreateCangku(300,$result)){
                        $user_object->rollback();
                        $this->error('仓库创建失败');
                    }

                    //判断他直推的人是多少奖励稻草人
                    $count=$user_object->where(array('pid'=>$pid))->count(1); 
                    if($count>=10){

                        if($count>=10 && $count<20){
                          $ren=1;
                        }
                        if($count>=20 && $count<30){
                          $ren=2;
                        }
                        if($count>=30 && $count<40){
                          $ren=3;
                        }
                        if($count>=40){
                          $ren=4;
                        }
                        if($ren){
                          M('user_level')->where(array('uid'=>$pid))->setField('dcr_num',$ren);
                        }
                    }

                    //给推荐人奖励20个种子
                    $table=M('user_seed');
                    $seed_where['uid']=$pid;
                    $count=$table->where($seed_where)->count(1);
                    if($count==0){
                      $data['uid']=$pid;
                      $data['zhongzi_num']=20;
                      $table->where($seed_where)->add($data);
                    }else{
                      $table->where($where)->setInc('zhongzi_num',20);
                    }


                    
                    //添加种子明细
                    $zz['uid']=$pid;
                    $zz['recommond_id']=$uid;
                    $zz['recommond_account']=$data['account'];
                    $zz['recommond_name']=$data['username'].'(后台注册)';
                    $zz['seed_num']=20;
                    $zz['time']=time();
                    $hdzz=M('zhongzijiangli')->data($zz)->add();



                    //减少系统总库存
                    if(!$admin_kucun->where(array('id'=>$kucun_id))->setDec('less_num',300)){
                        $user_object->rollback();
                        $this->error('操作失败');
                    }

                    //把数据记录到流水明细
                     $m_info=session('user_auth');
                     $manage_id=$m_info['uid'];
                     $data['manage_id']=$manage_id;//管理者ID
                     $data['manage_name']=$m_info['username'];
                     $data['uid']=$result; //用户ID
                     $data['guozi_num']=300; //转账数量
                     $data['create_time']=time();
                     $data['before_cangku_num']=0; //转账前仓库数量
                     $data['after_cangku_num']=300; //转账后仓库数量
                     $data['ip']=get_client_ip();
                     $data['type']=1;
                     $data['content']='后台注册会员:'.$data['account'];
                     $data['username']=$data['username'];
                     $data['account']=$data['account'];
                     $jl=M('admin_zhuangz')->data($data)->add();



                    $user_object->commit();
                    $this->success('操作成功', U('index'));
                } else {
                    $user_object->rollback();
                    $this->error('操作失败', $user_object->getError());
                }
            } else {
                $this->error($user_object->getError());
            }
        } else {
               
                $this->display();
        }
    }

    /**
     * 编辑用户
     * 
     */
    public function edit($id)
    {
        if (IS_POST) {
            if(empty($_POST['login_pwd'])){
                unset($_POST['relogin_pwd']);
            }
            if(empty($_POST['safety_pwd'])){
                unset($_POST['resafety_pwd']);
            }


            // 提交数据
            $user_object = D('User');
//            dump(I('post.'));exit;
            $data        = $user_object->create();
//            var_dump($data);exit;
            //如果没有密码，去掉密码字段
            if(empty($data['login_pwd']) || trim($data['login_pwd'])==''){
                unset($data['login_pwd']);
            }
            else{
              $salt= substr(md5(time()),0,3);
               $data['login_pwd']=$user_object->pwdMd5($data['login_pwd'],$salt);
               $data['login_salt']=$salt;
            }
            if(empty($data['safety_pwd']) || trim($data['safety_pwd'])==''){
                unset($data['safety_pwd']);
            }
            else{
              $salt= substr(md5(time()),0,3);
               $data['safety_pwd']=$user_object->pwdMd5($data['safety_pwd'],$salt);
               $data['safety_salt']=$salt;
            }

            if(empty($data['quanxian']) ){
                $data['quanxian'] = '';
            }
            else{

              $quanxian= join("-",$data['quanxian']);

               $data['quanxian']=$quanxian;
            }
//            var_dump($data);exit;
            if(empty($data['mobile'])){
                unset($data['mobile']);
            }
//            strlen($str);

            if ($data) {
//              var_dump($data);die; //问题描述，不填手机号时显示更新失败，输入查询不正确的语句
                $result = $user_object
                    ->field('userid,account,quanxian,username,mobile,email,safety_pwd,safety_salt,login_pwd,login_salt,sex,is_degraded,is_center')
                    ->save($data);
//                dump($result);exit;
                if ($result) {
                    $this->success('更新成功', U('index'));
                } else {
                    $this->error('更新失败'.$user_object->getError());
                }
            } else {
                $this->error($user_object->getError());
            }
        } else {

            // 获取账号信息
            $info = D('User')->find($id);
            unset($info['password']);
            $parent=D('User')->where(array('userid'=>$info['pid']))->getField('account');
            $info['parent']=$parent ? $parent :'无';
            $quanxian=explode("-",$info['quanxian']);
            $this->assign('info',$info);
            $this->assign('quanxian',$quanxian);
            //var_dump($quanxian);die;
            $this->display();
        }
    }

    /**
     * 设置一条或者多条数据的状态
     * 
     */
    public function setStatus($model = CONTROLLER_NAME)
    {
        $ids = I('request.ids');
        if (is_array($ids)) {
            if (in_array('1', $ids)) {
                $this->error('超级管理员不允许操作');
            }
        } else {
            if ($ids === '1') {
                $this->error('超级管理员不允许操作');
            }
        }
        parent::setStatus($model);
    }


 /**
     * 设置会员隐蔽的状态
     * 
     */
    public function setStatus1($model = CONTROLLER_NAME)
    {
        $id =(int)I('request.id');    
        $userid =(int)I('request.userid');    
        
         $user_object = D('User');    
        $result=D('User')->where(array('userid'=>$userid))->setField('yinbi',$id);
        if ($result) {
                    $this->success('更新成功', U('index'));
         }else {
                    $this->error('更新失败', $user_object->getError());
                }
    }



     /**
     * 编辑用户
     * 
     */
    public function AddFruits($id)
    {
        if (IS_POST) {

           $dbst=M('store');
           $dbazg=M('admin_zhuangz'); // 播发给用户记录表
           $admin_kucun=M('admin_kucun');//平台仓库表
           $uid=I('post.userid',0,'intval');
           $cangku_num=I('post.cangku_num');
           if(empty($cangku_num)){
                $this->error('数量不能为空');
           }
           if(!preg_match('/^[1-9]\d*$/',$cangku_num)){
               $this->error('请输入整数');
           }
            $opetype=I('post.opetype');

            if($opetype < 1){
                $this->error('请选择操作类型');
            }

            $dbst->startTrans();

            if($opetype == 1){
                $sqlname='cangku_num';
                $type = 'money';
                $getType = 41;
            }elseif($opetype == 2){
                $sqlname='fengmi_num';
                $type = 'scores';
                $getType = 42;
            }else{
                $sqlname='tongzheng';
                $type = 'scores';
                $getType = 70;
            }


           //判断库存是否还大于0
           $add_cangku=I('post.add_cangku');
           $des_cangku=I('post.des_cangku');
           #++++添加+++++
           if(!empty($add_cangku) && empty($des_cangku)){
               $before_cangku_num=$dbst->where('uid='.$uid)->getField($sqlname);
//               dump($uid);exit;
               $up=$dbst->where('uid='.$uid)->setInc($sqlname,$cangku_num);

               //添加释放记录
               //userAward($uid,'zhitui',1,$cangku_num);

                //添加余额记录
                $pay_n = M('store')->where(array('uid' => $uid))->getfield($sqlname);
//                $jifen_dochange['now_nums'] = $pay_n;
//                $jifen_dochange['now_nums_get'] = $pay_n;
//                $jifen_dochange['is_release'] = 1;
//                $jifen_dochange['pay_id'] = 0;
//                $jifen_dochange['get_id'] = $uid;
//                $jifen_dochange['get_nums'] = $cangku_num;
//                $jifen_dochange['get_time'] = time();
//                if($sqlname=="cangku_num"){
//                $jifen_dochange['get_type'] = 11; //余额
//                }else{
//                $jifen_dochange['get_type'] = 12; //
//                }
               //添加账户记录
               addAccountRecords($uid,0,$cangku_num,$getType,$pay_n,$type);
//                $res_addres = M('tranmoney')->add($jifen_dochange);
                 if ($up) {
                    $dbst->commit();

                     //更改会员等级
                     $userInfo = M('user')->where(array('userid' => $uid))->Field('use_grade,is_degraded')->find();
                    // formatLevel($uid,$userInfo['use_grade'],$userInfo['is_degraded']);

                    $this->success('修改成功');
                 }else{
                    $dbst->rollback();
                    $this->error('修改失败');
                 }

            }
            #++++减少+++++
            if(empty($add_cangku) && !empty($des_cangku))
            {
                 $up=$dbst->where('uid='.$uid)->setDec($sqlname,$cangku_num);

                //添加记录
                $pay_n = M('store')->where(array('uid' => $uid))->getfield($sqlname);
//                $jifen_dochange['now_nums'] = $pay_n;
//                $jifen_dochange['now_nums_get'] = $pay_n;
//                $jifen_dochange['is_release'] = 1;
//                $jifen_dochange['pay_id'] = 0;
//                $jifen_dochange['get_id'] = $uid;
//                $jifen_dochange['get_nums'] = -$cangku_num;
//                $jifen_dochange['get_time'] = time();
//                if($sqlname=="cangku_num"){
//                $jifen_dochange['get_type'] = 11; //余额
//                }else{
//                $jifen_dochange['get_type'] = 12; //
//                }
//
//                $res_addres = M('tranmoney')->add($jifen_dochange);
                //添加账户记录
                addAccountRecords($uid,0,-$cangku_num,$getType,$pay_n,$type);

                 if(!$up){
                    $dbst->rollback();
                 }
                if ($up) {
                    $dbst->commit();

                    //更改会员等级
                    $userInfo = M('user')->where(array('userid' => $uid))->Field('use_grade,is_degraded')->find();
                   // formatLevel($uid,$userInfo['use_grade'],$userInfo['is_degraded']);

                    $this->success('修改成功');

                }else{
                    $dbst->rollback();
                    $this->error('修改失败');
                } 
 
            }



          


        } else {

            // 获取账号信息
            $info = D('User')->field('userid,username,account')->find($id);
            $cangku_num=D('store')->where(array('uid'=>$info['userid']))->getField('cangku_num');
            $fengmi_num=D('store')->where(array('uid'=>$info['userid']))->getField('fengmi_num');
            $tongzhegn=D('store')->where(array('uid'=>$info['userid']))->getField('tongzheng');
            $info['cangku_num']=$cangku_num;
            $info['fengmi_num']=$fengmi_num;
            $info['tongzheng']=$tongzhegn;

            $this->assign('info',$info);
            $this->display();
        }
    }

    //用户登录
    public function userlogin(){
        $userid=I('userid',0,'intval');
        $user=D('Home/User');
        $info=$user->find($userid);
        if(empty($info)){
            return false;
        }

        $login_id=$user->auto_login($info);
        if($login_id){
            session('in_time',time());
            session('login_from_admin','admin',10800);
            $this->redirect('Home/Index/index');
        }
    }

    //导出
    public function export($data_list){
        import("ORG.Yufan.Excel");
//                dump($data_list);die;
        foreach ($data_list as $key=>$value){
            unset($data_list[$key]['email']);
            unset($data_list[$key]['yinbi']);
            $num = M('user')->where(['pid'=>$value['userid']])->count(1);
            $data_list[$key]['reg_date'] = date('Y-m-d H:i:s',$value['reg_date']);
            $data_list[$key]['num'] = $num;
        }
//                        dump($data_list);die;
        $Header = array('UID','姓名','账号','手机','注册时间','状态','上级id','余额','积分','直推人数');
        $FileName = '用户会员(截止时间:'.date('YmdHis',time()).')';
        exportExcel($Header, $data_list, $FileName,  './', true);
//    	$xls = new \Excel_XML('UTF-8', false, 'Sheet1');
//    	$xls->addArray($row);
//    	$xls->generateXML("ceshi");

    }
}
