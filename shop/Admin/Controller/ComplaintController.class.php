<?php
namespace Admin\Controller;

use Think\Page;

/**
 * 回收控制器
 * 
 */
class ComplaintController extends AdminController
{

    public function index()
    {
        // 搜索
        $keyword                                  = I('keyword', '', 'string');
        if($keyword!=''){
            $condition                                = array('like', '%' . $keyword . '%');
            $map['username|account'] = array(
                $condition,
                $condition,
                '_multi' => true,
            );
        }


        $map['status'] = array('eq', '0');
        $type=I('type');
        if($type=='over'){
           $map['status'] = array('eq', '1');
        }elseif($type=='reply'){
            $map['status'] = array('eq', '2');
        }
        $table   = D('complaint');
        //分页
        $p=getpage($table,$map,10);
        $page=$p->show();
        $data_list     = $table
            ->where($map)
            ->order('id desc')
            ->select();
        if(!empty($data_list)){
            foreach ($data_list as $k=>$v){
                $userInfo = M('user')->where('userid = '.$v['user_id'])->find();
                $data_list[$k]['mobile'] = $userInfo['mobile'];
                $data_list[$k]['username'] = $userInfo['username'];
            }
        }
        $this->assign('list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();
    }


     /*
      * 投诉详情
      */
    public function edit(){
        $id=I('get.id');
        $letter=M('complaint');
        $where['id']=$id;
        if($letter->where($where)->getField('status')==0){
            $letter->where($where)->setField('status',1);
        }
        $value=$letter->where($where)->find();
        if(!empty($value)){
            $userInfo = M('user')->where('userid = '.$value['user_id'])->find();
            $value['username'] = $userInfo['username'];
            $value['mobile'] = $userInfo['mobile'];
        }
        $this->assign('info',$value);

        $this->display();
    }
    /**
     * 投诉回复
     */
    public function reply(){
        if($_GET['id'] && is_numeric( $_GET['id']) ){
            $id=I('get.id');
            $letter=M('complaint');
            $where['id']=$id;
            if($letter->where($where)->getField('status')==0){
                $letter->where($where)->setField('status',1);
            }
            $value=$letter->where($where)->find();
            if(!empty($value)){
                $userInfo = M('user')->where('userid = '.$value['user_id'])->find();
                $value['username'] = $userInfo['username'];
                $value['mobile'] = $userInfo['mobile'];
            }
            $this->assign('info',$value);
            $this->display();
        }else{
            $this->error('服务器错误或参数错误，请联系管理员','/admin/Index/index');
        }

    }
    public function ajaxReply(){
        if($_POST){
            $id = $_POST['id'];//回复id
            $reply_prefix = $_POST['reply_prefix'];//回复前缀
            $reply = $_POST['reply'];//回复内容
            $reply_custom_time =strtotime($_POST['reply_custom_time'].":00");//设置的回复时间
            $reply_time=time();//回复当前时间
            if(empty($_POST['reply_prefix'])){
                $reply_prefix='';
            }else if(empty("reply_custom_time")){
                $reply_custom_time= 00;
            }else if(empty($_POST['reply'])){
                $this->error('回复内容不能为空','/admin/Complaint/index/type/over');
            }
            $usid = $_SESSION['user_auth']['uid'];
            $letter=M('complaint');
            $where['id']=$id;
            $save =[
                'status'=>2,
                'reply_prefix'=>$reply_prefix,
                'reply'=>$reply,
                'reply_custom_time'=>$reply_custom_time,
                'reply_time'=>$reply_time,
                'reply_id'=>$usid
            ];
            $update = $letter->where($where)->save($save);
            if($update){
                ajaxReturn('回复成功',1);
            }else{
                ajaxReturn('回复失败',0);
            }
        }

    }

    /*
     * 删除投诉
     */
     public function delete(){
        $letter=M('complaint');
        $id=I('get.id');
        $bool=$letter->delete($id);
        if($bool){
            $this->success('删除成功');
        }else{
           $this->error('删除失败');
        }

    }
}
