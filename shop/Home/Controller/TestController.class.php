<?php
/**
 * Created by PhpStorm.
 * User: pc-2
 * Date: 2018/10/17
 * Time: 16:18
 */

namespace Home\Controller;


use Think\Controller;
use Think\Think;

class TestController extends Controller
{

    //达到 100台赠送   30000  积分（根据注册量）
    //b、达到 200台赠送   27000  积分
    //c、达到 300台增送    24000  积分
    //d、达到 400台增送   21000  积分。
    public function test1(){
        
    }
//    //注册送积分
//    public function awardPoint(){
//        //查询指纹注册用户数量
//        $nums = M('user')->where(['account'=>array('like','m%')])->count();
//        //获取配置
//        $config = M('config')->where(['group'=>15,'status'=>1])->select();
//        $configData = [];
//        foreach ($config as $key=>$value){
//            $numConfig = explode('~',$value['value']);
//            if($nums == $numConfig[1]){
//                $result = $this -> setInPoint($numConfig[0],$numConfig[1],$value['tip']);
//            }
//        }
//        $result[] = date('Y-m-d');
//        file_put_contents('./givePoint.txt',$result);
//        return $result;
//    }
//    public function setInPoint($start_num,$end_num,$awardPoint){
//        $arr = M('user')
//            ->field('userid')
//            ->where(['account'=>array('like','m%')])
//            ->limit($start_num,$end_num)
//            ->order('userid')
//            ->select();
//        foreach ($arr as $key=>$value){
//            //判断用户是否有仓库
//            $have = M('store')->where(['uid'=>$value['userid']])->find();
//            if($have === null){
//                M('store')->add(['uid'=>$value['userid']]);
//            }
//            $result = M('store')->where(['uid'=>$value['userid']])->setInc('fengmi_num',$awardPoint);
//            if($result == 0){
//                $result1[$key] = '用户id:'.$value['userid'].",".'返回状态:'.$result.' ';
//            }
//
//        }
//        return $result1;
//    }

}