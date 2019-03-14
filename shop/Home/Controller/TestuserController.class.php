<?php
/**
 * Created by PhpStorm.
 * User: pc-2
 * Date: 2018/12/15
 * Time: 14:10
 */

namespace Home\Controller;


use Think\Controller;

class TestuserController extends Controller
{
    //检查3个月为登录用户
    public function checkTime(){
        //天数
        $day = 60*60*24;
        $startTime = time()-$day*60;
//        dump($startTime);
        $data = M('user')->field('userid')->where(['lastlogin_time'=>array('lt',$startTime),'status'=>1])->select();
//        dump($data);exit;
        foreach ($data as $key=>$value){
            M('user')->where(['userid'=>$value['userid']])->setField(['status'=>0]);
        }
        dump('运行');
    }
}