<?php
/**
 * 本程序仅供娱乐开发学习，如有非法用途与本公司无关，一切法律责任自负！
 */
namespace Home\Controller;
use Think\Controller;
class CommonController extends Controller {
    //中文
    protected $userLevel = [
        1=> 'zyz',//志愿者
        2=> 'hbws',//环保卫士
        3=>'hbkw',//环保顾问
        4=>'hbdr',//环保达人
        5=>'hbds'//环保大使
    ];
    protected $moneyType = [
        1=>'mrhb',
        2=>'exchange',
        3=>'tochangeinto',
        4=>'rollOut',
        11=>'jymr',
        12=>'jymc',
        13=>'qxjyhk',
        21=>'mrbzjkc',
        22=>'mrbzjfh',
        23=>'mcbzjkc',
        24=>'mcbzjfh',
        31=>'scfk',
        32=>'scsk',
        41=>'xtbd',
        51=>'ztjl',
        52=>'qkjl',
        53=>'ltjl',
        71=>'thtz', //兑换通证
//        72=>'tzxx'  //通证信息
    ];

    protected $scoresType = [
        1=>'mrhb',
        2=>'jfdh',
        3=>'zrzs',
        4=>'zczs',
        5=>'tjzc',
        6=>'zc',
        7=>'手机注册',
        31=>'scfk',
        32=>'scsk',
        42=>'xtbd',
        51=>'ztjl',
        52=>'qkjl',
        53=>'ltjl',
        54=>'gjhyjf',
        55=>'djhyjf'
    ];
	public function _initialize(){
        //判断网站是否关闭
        $close=is_close_site();
        if($close['value']==0){
          success_alert($close['tip'],U('Login/logout'));
        }
        //验证用户登录
        $this->is_user();
    }


 protected function is_user(){
        $userid=user_login();
        $user=M('user');
        if(!$userid){
            $this->redirect('Login/login');
            exit();
        }

        //判断12小时后必须重新登录
        $in_time=session('in_time');
        $time_now=time();
        $between=$time_now-$in_time;
        if($between > 3600 * 24 * 5){
            $this->redirect('Login/logout');
        }

        $where['userid']=$userid;
        $u_info=$user->where($where)->field('status,session_id')->find();
        //判断用户是否锁定
        $login_from_admin=session('login_from_admin');//是否后台登录
        if($u_info['status']==0 && $login_from_admin!='admin'){
            if(IS_AJAX){
                ajaxReturn('你账号已锁定，请联系管理员',0);
            }else{
                success_alert('你账号已锁定，请联系管理员',U('Login/logout'));
                exit();
            }
        }

        //判断用户是否在他处已登录
        $session_id=session_id();
        if($session_id != $u_info['session_id'] && empty($login_from_admin)){

            if(IS_AJAX){
                ajaxReturn('您的账号在他处登录，您被迫下线',0);
            }else{
                success_alert('您的账号在他处登录，您被迫下线',U('Login/logout'));
                exit();
            }
        }
        //记录操作时间
        // session('in_time',time());
    }


}

