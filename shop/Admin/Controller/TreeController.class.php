<?php
namespace Admin\Controller;
use Think\Controller;
use Think\Page;
/**
 * 用户控制器
 * 陶
 */
class TreeController extends AdminController
{


    /**
     * 用户列表
     * @author jry <416148489@qq.com>
     */
    public function index()
    {   
         // 搜索
        $pid        =   I('keyword', '0', 'string');
        $sex=0;
        $user           =   M('user');
        if($pid!='0')
        {
            $k_where['userid|username|account'] = array(
                $pid,
                $pid,
                $pid,
                '_multi' => true,
            );
            $query=$user->where($k_where)->Field('userid,pid')->find();
            $pid=$query['pid'];
        }
       
        $tree           =   $this->getTree($pid);
        $this->assign('tree',$tree);
        $this->display();
    }

    public function ajaxUserId()
    {
        if(!empty($_POST['userId'])){
            $uid = $_POST['userId'];
            $listArr =  $this->getTree($uid);
            $listArr = json_encode($listArr,JSON_UNESCAPED_UNICODE);
            $this->ajaxReturn($listArr);
            //echo $uid;
        }
    }
    public  function getTree($pid='0')
    {
        $user=M('user');
      //  $sex=0;
        $wherea=array(  
        "pid"=>$pid,
        //"sex"=>$sex
         );
        //$list=$t->where(array('pid'=>$pid,'sex'==0))->order('userid asc')->select();
        $list=$user->where($wherea)->order('userid asc')->select();
        foreach ($list as $key=>$val){
            $map['pid']=$val['userid'];
            $list[$key]['counts']=$user->where($map)->count(1);
        }
        return $list;
        //判断$list是不是数组 若是 则往下走
      /*  if(is_array($list)){
            $html = '';
                $i++;
                foreach($list as $k => $v)
                {
                    $map['pid']=$v['userid'];
                    $count=$user->where($map)->count(1);
                    $class=$count==0 ? 'fa-user':'fa-sitemap';

                   if($v['pid'] == $pid)
                   {   
                        //父亲找到儿子
                        $html .= '<li style="display:none" >';
                        $html .= '<span><i class="icon-plus-sign '.$class.' blue "></i>';
                        $html .= $v['username'];
                        $html .= '</span> <a href="'.U('User/edit',array('id'=>$v['userid'])).'">';
                        $html .= $v['account'];
                        $html .= '</a>';
                        $html .= $this->getTree($v['userid']);
                        $html = $html."</li>";
                   }
                }
            return $html ? '<ul>'.$html.'</ul>' : $html ;*/
       // }
    }
    
    
}
