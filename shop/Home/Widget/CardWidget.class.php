<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/10/22
 * Time: 14:35
 */
namespace Home\Widget;
use Think\Controller;

class CardWidget extends Controller
{
    /**
     * 获取用户绑定的imtoken信息 alipay信息 weichat信息
     * return imtoken.html / alipay.html /weichat.html
     */
    public function menu($name)
    {
        layout(false); // 临时关闭当前模板的布局功能
        $seek = D($name);
        $uid = $_SESSION['userid'];
        $arr = $seek->where("userid=$uid")->order($name."_default desc")->select();
        $this->assign('arr',$arr);
        return $this->display("Widget:$name");
    }
    public function banklist($name){
        layout(false);
        return $this -> display("Widget:$name");

    }

}