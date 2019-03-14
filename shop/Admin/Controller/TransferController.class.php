<?php
namespace Admin\Controller;

use Think\Page;
use Admin\Model\TransferModel;
use Admin\Model\UserModel;
/**
 * 用户控制器
 *
 */
class TransferController extends AdminController
{

    public function index()
    {
        // 搜索
        $keyword    = I('keyword', '', 'string');
        $querytype  = I('querytype','','string');
        $date_start=I('date_start');
        $date_end=I('date_end');
        $isLead = I('isLead');
//        $status     = I('status');querytype=master_id&keyword=8872
        if(!empty($keyword)){
            if($querytype=='username'){
                $keyword=trim($keyword);
                $user =  M('user')->where('username="'.$keyword.'"')->field('userid')->select();
                foreach($user as $val){
                    $newUser[]= (int)$val['userid'];
                }
                $map['payin_id'] = ['in',$newUser];
            }else{
                $map[$querytype] = $keyword;
            }
        }
//        时间拼接，搜索时间
        if(!empty($date_start) && !empty($date_end)){ //若开始时间和结束时间都不为空的话
            $date_start = strtotime($date_start.' 00:00:00');
            $date_end = strtotime($date_end.' 23:59:59');
            //条件在开始时间和结束时间之间
            $map['pay_time']  = array('between',array($date_start,$date_end));
        }else{
            if($date_start){//只有开始时间 则大于等于开始时间
                $map['pay_time']  = array('egt',strtotime($date_start.' 00:00:00'));
            }
            if($date_end){//只有结束时间 则小于等于结束时间
                $map['pay_time']  = array('elt',strtotime($date_end.' 23:59:59'));

            }
        }



        // 获取所有用户

        if(!isset($map)) {
            $map = true;
        };


//      添加取消订单情况  ysk_store
        $table=M('trans');
        //分页
        if(empty($isLead)){
            $p=getpage($table,$map,10);
            $page=$p->show();
        }
        //查询数据
        $arr = M()->table('ysk_user as a')->join('ysk_store as b')
            ->where('a.userid = b.uid ')->field('a.userid,a.username,b.cangku_num,b.fengmi_num')
            ->select();
        $data_list =$table->where($map)->select();
        foreach($data_list as $key=> $val ){
            foreach ($arr as $keys=>$value){
                $arr[$key]['cangku_num']=substr(sprintf("%.3f",$arr[$key]['cangku_num']),0,-1);
                $arr[$key]['fengmi_num']=substr(sprintf("%.3f",$arr[$key]['fengmi_num']),0,-1);
                if($value['userid'] == $val['payout_id']){
                    $data_list[$key]['payout_name'] = $value['username'];
                  //  $data_list[$key]['payout_money'] = substr(sprintf("%.3f",$value['cangku_num']),0,-1) ;
                 //   $data_list[$key]['payout_crystal'] =substr(sprintf("%.3f",$value['fengmi_num']),0,-1) ;
                }
                if($value['userid'] == $val['payin_id']){
                    $data_list[$key]['payin_name'] =  $value['username'];
                //    $data_list[$key]['payin_money'] =substr(sprintf("%.3f",$value['cangku_num']),0,-1) ;
                   // $data_list[$key]['payin_crystal'] = substr(sprintf("%.3f",$value['fengmi_num']),0,-1) ;
                }
                if($val['trans_type']==0){
                    $data_list[$key]['types'] = "买入";
                }else{
                    $data_list[$key]['types'] = "卖出";
                }
                if($val['pay_state']==0){
                    $data_list[$key]['pay_state'] = "默认上架";
                }else if($val['pay_state']==1){
                    $data_list[$key]['pay_state'] = "有人买入";
                }else if($val['pay_state']==2){
                    $data_list[$key]['pay_state'] = "已经打款";
                }else if($val['pay_state']==3){
                    $data_list[$key]['pay_state'] = "已完成";
                }
            }
            $data_list[$key]['pay_time'] = date("Y-m-d H:i:s",$data_list[$key]['pay_time']);
        }
//        dump($table->getLastSql());exit;

        //导出Excel表格
        if($isLead==1){
            $this->export($data_list);
        }
        $this->assign('data_list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();

    }


    //导出
    public function export($data_list){
        import("ORG.Yufan.Excel");
        $row=array();
        $i=0;
        foreach($data_list as $v){
            // $row[$i]['i'] = $i;
               $row[$i]['id'] = $v['id'];
            if($v['trans_type']==0){
                $row[$i]['client_id'] = $v['payin_id'];
                $row[$i]['client_name'] = $v['payin_name'];
                $row[$i]['seller_id'] = $v['payout_id'];
                $row[$i]['seller_name'] = $v['payout_name'];
            }else{
                $row[$i]['client_id'] = $v['payout_id'];
                $row[$i]['client_name'] = $v['payout_name'];
                $row[$i]['seller_id'] = $v['payin_id'];
                $row[$i]['seller_name'] = $v['payin_name'];
            }
            $row[$i]['time'] = $v['pay_time'];
            $row[$i]['type'] = $v['types'];
            $row[$i]['treasure'] = $v['pay_nums'];
            $row[$i]['remark'] = $v['pay_state'];
            $i++;
        }
//                dump($data_list);die;
//

        $Header = array('ID','买家ID','卖家名称','卖家方ID','卖家名称','支付时间','交易类型','订单面额','交易信息');
        $FileName = '交易中心流水记录(截止时间:'.date('YmdHis',time()).')';

        $this ->exportExcel($Header, $row, $FileName,  './', true);
//    	$xls = new \Excel_XML('UTF-8', false, 'Sheet1');
//    	$xls->addArray($row);
//    	$xls->generateXML("ceshi");

    }
    /**
     * 数据导出方法
     * @param array $title   标题行名称
     * @param array $data   导出数据
     * @param string $fileName 文件名
     * @param string $savePath 保存路径
     * @param $type   是否下载  false--保存   true--下载
     * @return string   返回文件全路径
     * @throws PHPExcel_Exception
     * @throws PHPExcel_Reader_Exception
     */
    function exportExcel($title=array(), $data=array(), $fileName='', $savePath='./', $isDown=true){
//        $path = dirname(__FILE__);
        Vendor("PHPExcel.PHPExcel");
        $obj = new \PHPExcel();

        //横向单元格标识
        $cellName = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI', 'AJ', 'AK', 'AL', 'AM', 'AN', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'AY', 'AZ');

        $obj->getActiveSheet(0)->setTitle('交易中心流水记录');   //设置sheet名称
//        $obj->getColumnDimension('D')->setWidth(30);
        $_row = 1;   //设置纵向单元格标识
        if($title){
            $i = 0;
            foreach($title AS $v){   //设置列标题
                $obj->setActiveSheetIndex(0)->setCellValue($cellName[$i].$_row, $v);
                $i++;
            }
            $_row++;
        }

        //填写数据
        if($data){
            $i = 0;
            foreach($data AS $_v){
                $j = 0;
                foreach($_v AS $_cell){
                    $obj->getActiveSheet(0)->setCellValue($cellName[$j] . ($i+$_row), $_cell);
                    $j++;
                }
                $i++;
            }
        }

        //文件名处理
        if(!$fileName){
            $fileName = uniqid(time(),true);
        }
        $objWrite = \PHPExcel_IOFactory::createWriter($obj, 'Excel2007');

        if($isDown){   //网页下载
            header('pragma:public');
            header("Content-Disposition:attachment;filename=$fileName.xls");
            $objWrite->save('php://output');exit;
        }
        $_fileName = iconv("utf-8", "gb2312", $fileName);   //转码
        header('pragma:public');
        header("Content-Disposition:attachment;filename=$_fileName.xlsx");
        $objWrite->save('php://output');exit;

        return $savePath.$fileName.'.xlsx';
    }

}
