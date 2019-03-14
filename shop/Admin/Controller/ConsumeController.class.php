<?php
namespace Admin\Controller;

use Think\Page;
use Admin\Model\ConsumesModel;
use Admin\Model\UserModel;
/**
 * 用户控制器
 *
 */
class ConsumeController extends AdminController
{

    public function index()
    {

        // 搜索
        $keyword    = I('keyword', '', 'string');
        $querytype  = I('querytype','userid','string');
        $date_start = I('date_start');
        $date_end = I('date_end');
        $educe = I('educe');
//        $status     = I('status');

        //搜索业务类型判断
        if($querytype == "get_type" && $keyword == "每日红包"){
            $keyword ='1';
        }elseif($querytype == "get_type" && $keyword == "积分兑换"){
            $keyword ='2';
        }elseif($querytype == "get_type" && $keyword == "收"){
            $keyword ='3';
        }elseif($querytype == "get_type" && $keyword == "转出"){
            $keyword ='4';
        }elseif($querytype == "get_type" && $keyword == "交易（买入）"){
            $keyword ='11';
        }elseif($querytype == "get_type" && $keyword == "交易（卖出）"){
            $keyword ='12';
        }elseif($querytype == "get_type" && $keyword == "取消交易（汇款）"){
            $keyword ='13';
        }elseif($querytype == "get_type" && $keyword == "买入保证金（扣除）"){
            $keyword ='21';
        }elseif($querytype == "get_type" && $keyword == "买入保证金（返还）"){
            $keyword ='22';
        }elseif($querytype == "get_type" && $keyword == "卖出保证金（扣除）"){
            $keyword ='23';
        }elseif($querytype == "get_type" && $keyword == "卖出保证金（返还）"){
            $keyword ='24';
        }elseif($querytype == "get_type" && $keyword == "商城（付款）"){
            $keyword ='31';
        }elseif($querytype == "get_type" && $keyword == "商城（收款）"){
            $keyword ='32';
        }elseif($querytype == "get_type" && $keyword == "商城(取消订单)"){
            $keyword ='33';
        }elseif($querytype == "get_type" && $keyword == "系统变动"){
            $keyword ='41';
        }elseif($querytype == "get_type" && $keyword == "交易释放"){
            $keyword ='51';
        }elseif($querytype == "get_type" && $keyword == "兑换释放"){
            $keyword ='52';
        }elseif($querytype == "get_type" && $keyword == "消费释放"){
            $keyword ='53';
        }

        if($keyword){
            $map[$querytype] = $keyword;
        }




//        时间拼接，搜索时间
        if($date_start && $date_end){
            $date_start = $date_start.' 00:00:00';
            $date_end = $date_end.' 23:59:59';
            $map['get_time']  = array('between',array($date_start,$date_end));
        }else{
            if($date_start){
                $map['get_time']  = array('egt',$date_start.' 00:00:00');
            }
            if($date_end){
                $map['get_time']  = array('elt',$date_end.' 23:59:59');
            }
        }

        //将数据库时间转成时间戳
//        $date["create_time"][1][0] = date("Y-m-d H:i:s",$date["create_time"][1][0]);
//        $date["create_time"][1][1] = date("Y-m-d H:i:s",$date["create_time"][1][1]);

        //按日期搜索
//        $date=date_query('get_time');
//        if($date){
//            $where=$date;
//            if(isset($map))
//                $map=array_merge($map,$where);
//            else
//                $map=$where;
//        }

//        $map['get_type']=array(1,51,52,53,54,55,'or');
        // 获取所有用户
        $user   = M('trans a');
        if(!isset($map)){
            $map=true;
        }

        //分页
//        添加取消订单情况
//        $table=$user
//            ->join('ysk_ubanks b on a.payout_id=b.user_id')
//            ->join('ysk_user c on a.payout_id=c.userid')
//            ->join('ysk_trans_quxiao d on c.userid=d.payout_id');


        //查寻记录
        $table = M('usermoney_record a')->join('ysk_user b on a.master_id=b.userid');

        $isLead = I('isLead');
//        设置开关
        if($isLead!=1){
            $p=getpage($table,$map,100);
            $page=$p->show();
        }else{
            $p=getpage($table,$map,$educe);
            $page=$p->show();
        }

        //查询数据
        $data_list = $table
//            ->field('a.id,a.pay_nums,a.pay_state,a.pay_time,a.trans_type,c.userid,c.username,b.hold_name,b.card_number,b.open_card,d.pay_state as b')
            ->field('a.get_nums,a.get_type,a.now_nums,a.deputy_id,a.master_id,a.get_time,b.username,b.mobile')
            ->where($map)
            ->order('get_time desc')
            ->select();

        $getMoneyType = $this->moneyType;
        foreach ($data_list as $key => $val){
            if($val['get_type'] == 3 || $val['get_type'] == 4){
                $data_list[$key]['type_name'] = L($getMoneyType[$val['get_type']]).'('.$val['deputy_id'].')';
            }else{
                $data_list[$key]['type_name'] = L($getMoneyType[$val['get_type']]);
            }
            if($val['get_nums']>0){
                $data_list[$key]['get_nums'] = '+'.$val['get_nums'];
            }
        }
        //dump($data_list);exit;
        //导出Excel表格
        if($isLead==1){
            $this->export($data_list);
        }

        $this->assign('data_list',$data_list);
        $this->assign('table_data_page',$page);
        $this->display();


    }

//    public function index()
//    {
//
//        // 搜索
//        $keyword    = I('keyword', '', 'string');
//        $querytype  = I('querytype','userid','string');
//        $date_start = I('date_start');
//        $date_end = I('date_end');
////      $status     = I('status');
//
//        //搜索业务类型判断
//        if($querytype == "get_type" && $keyword == "每日红包"){
//            $keyword ='1';
//        }elseif($querytype == "get_type" && $keyword == "积分兑换"){
//            $keyword ='2';
//        }elseif($querytype == "get_type" && $keyword == "收"){
//            $keyword ='3';
//        }elseif($querytype == "get_type" && $keyword == "转出"){
//            $keyword ='4';
//        }elseif($querytype == "get_type" && $keyword == "交易（买入）"){
//            $keyword ='11';
//        }elseif($querytype == "get_type" && $keyword == "交易（卖出）"){
//            $keyword ='12';
//        }elseif($querytype == "get_type" && $keyword == "取消交易（汇款）"){
//            $keyword ='13';
//        }elseif($querytype == "get_type" && $keyword == "买入保证金（扣除）"){
//            $keyword ='21';
//        }elseif($querytype == "get_type" && $keyword == "买入保证金（返还）"){
//            $keyword ='22';
//        }elseif($querytype == "get_type" && $keyword == "卖出保证金（扣除）"){
//            $keyword ='23';
//        }elseif($querytype == "get_type" && $keyword == "卖出保证金（返还）"){
//            $keyword ='24';
//        }elseif($querytype == "get_type" && $keyword == "商城（付款）"){
//            $keyword ='31';
//        }elseif($querytype == "get_type" && $keyword == "商城（收款）"){
//            $keyword ='32';
//        }elseif($querytype == "get_type" && $keyword == "商城(取消订单)"){
//            $keyword ='33';
//        }elseif($querytype == "get_type" && $keyword == "系统变动"){
//            $keyword ='41';
//        }elseif($querytype == "get_type" && $keyword == "交易释放"){
//            $keyword ='51';
//        }elseif($querytype == "get_type" && $keyword == "兑换释放"){
//            $keyword ='52';
//        }elseif($querytype == "get_type" && $keyword == "消费释放"){
//            $keyword ='53';
//        }
//
//        if($keyword){
//            $map[$querytype] = $keyword;
//        }
//
//
////        时间拼接，搜索时间
//        if($date_start && $date_end){
//            $date_start = $date_start.'00:00:00';
//            $date_end = $date_end.'23:59:59';
//            $map['get_time']  = array('between',array($date_start,$date_end));
//        }else{
//            if($date_start){
//                $map['get_time']  = array('egt',$date_start.'00:00:00');
//            }
//            if($date_end){
//                $map['get_time']  = array('elt',$date_end.'23:59:59');
//            }
//        }
//
//        //将数据库时间转成时间戳
////        $date["create_time"][1][0] = date("Y-m-d H:i:s",$date["create_time"][1][0]);
////        $date["create_time"][1][1] = date("Y-m-d H:i:s",$date["create_time"][1][1]);
//
//        //按日期搜索
////        $date=date_query('get_time');
////        if($date){
////            $where=$date;
////            if(isset($map))
////                $map=array_merge($map,$where);
////            else
////                $map=$where;
////        }
//
////        $map['get_type']=array(1,51,52,53,54,55,'or');
//        // 获取所有用户
//        $user   = M('trans a');
//        if(!isset($map)){
//            $map=true;
//        }
//
//        //分页
////        添加取消订单情况
////        $table=$user
////            ->join('ysk_ubanks b on a.payout_id=b.user_id')
////            ->join('ysk_user c on a.payout_id=c.userid')
////            ->join('ysk_trans_quxiao d on c.userid=d.payout_id');
//
//
//        //查寻记录
//        $table = M('usermoney_record a')->join('ysk_user b on a.master_id=b.userid');
//
//        $isLead = I('isLead');
////        设置开关
//        if($isLead!=1){
//            $p=getpage($table,$map,10);
//            $page=$p->show();
//        }
//
//
//        //查询数据
//        $data_list = $table
////            ->field('a.id,a.pay_nums,a.pay_state,a.pay_time,a.trans_type,c.userid,c.username,b.hold_name,b.card_number,b.open_card,d.pay_state as b')
//            ->field('a.get_nums,a.get_type,a.now_nums,a.deputy_id,a.master_id,a.get_time,b.username,b.mobile')
//            ->where($map)
//            ->order('get_time desc')
//            ->select();
//
//        //dump($data_list);exit;
//       //dump($table->getLastSql());exit;
////        0->买入,1->卖出
////        订单状态:0->默认上架,1->有人买入,2->已打款,3->确认到款(已完成)
////
////        foreach ($data_list as $key => $value) {
//////            订单状态
////            if($value['pay_state'] == 0){
////                $data_list[$key]['state'] = '默认上架';//语言转换
////            }elseif($value['pay_state'] == 1){
////                $data_list[$key]['state'] = '有人买入';//语言转换
////            }elseif($value['pay_state'] == 2){
////                $data_list[$key]['state'] = '已打款';
////            }elseif($value['pay_state'] == 3){
////                $data_list[$key]['state'] = '确认到款(已完成)';
////            }elseif($value['b'] == 4){
////                $data_list[$key]['state'] = '取消';
////            }
//////            交易类型
////            if($value['trans_type'] == 0){
////                $data_list[$key]['ttype'] = '买入';//语言转换
////            }elseif($value['trans_type'] == 1){
////                $data_list[$key]['ttype'] = '卖出';//语言转换
////            }
////
////            $data_list[$key]['pay_time'] =date("Y-m-d H:i:s",$data_list[$key]['pay_time']);
////
////
////        }
////        dump($map);die;
//        $getMoneyType = $this->moneyType;
//        foreach ($data_list as $key => $val){
//            if($val['get_type'] == 3 || $val['get_type'] == 4){
//                $data_list[$key]['type_name'] = L($getMoneyType[$val['get_type']]).'('.$val['deputy_id'].')';
//            }else{
//                $data_list[$key]['type_name'] = L($getMoneyType[$val['get_type']]);
//            }
//            if($val['get_nums']>0){
//                $data_list[$key]['get_nums'] = '+'.$val['get_nums'];
//            }
//        }
//        //dump($data_list);exit;
//        //导出Excel表格
//        if($isLead==1){
//            $this->export($data_list);
//        }
//
//        $this->assign('data_list',$data_list);
//        $this->assign('table_data_page',$page);
//        $this->display();
//
//
//    }

    //消费记录（积分）
    public function Integral(){
        // 搜索
        $keyword    = I('keyword', '', 'string');
        $querytype  = I('querytype','userid','string');
        $date_start = I('date_start');
        $date_end = I('date_end');
        $rduce = I('educe');

        //搜索业务类型判断
        if($querytype == "get_type" && $keyword == "每日红包"){
            $keyword ='1';
        }elseif($querytype == "get_type" && $keyword == "积分兑换"){
            $keyword ='2';
        }elseif($querytype == "get_type" && $keyword == "转入赠送"){
            $keyword ='3';
        }elseif($querytype == "get_type" && $keyword == "转出赠送"){
            $keyword ='4';
        }elseif($querytype == "get_type" && $keyword == "推荐注册"){
            $keyword ='5';
        }elseif($querytype == "get_type" && $keyword == "注册"){
            $keyword ='6';
        }elseif($querytype == "get_type" && $keyword == "商城（付款）"){
            $keyword ='31';
        }elseif($querytype == "get_type" && $keyword == "商城（收款）"){
            $keyword ='32';
        }elseif($querytype == "get_type" && $keyword == "商城(取消订单)"){
            $keyword ='33';
        }elseif($querytype == "get_type" && $keyword == "系统变动"){
            $keyword ='42';
        }elseif($querytype == "get_type" && $keyword == "交易释放"){
            $keyword ='51';
        }elseif($querytype == "get_type" && $keyword == "兑换释放"){
            $keyword ='52';
        }elseif($querytype == "get_type" && $keyword == "消费释放"){
            $keyword ='53';
        }elseif($querytype == "get_type" && $keyword == "消费奖励"){
            $keyword ='54' and '55';
        }

        if($keyword){
            $map[$querytype] = $keyword;
        }

        //        时间拼接，搜索时间
        if($date_start && $date_end){
            $date_start = $date_start.' 00:00:00';
            $date_end = $date_end.' 23:59:59';
            $map['get_time']  = array('between',array($date_start,$date_end));
        }else{
            if($date_start){
                $map['get_time']  = array('egt',$date_start.' 00:00:00');
            }
            if($date_end){
                $map['get_time']  = array('elt',$date_end.' 23:59:59');
            }
        }
//        //按日期搜索
//        $date=date_query('pay_time');
//        if($date){
//            $where=$date;
//            if(isset($map))
//                $map=array_merge($map,$where);
//            else
//                $map=$where;
//        }
        // 获取所有用户
        if(!isset($map)){
            $map=true;
        }
        //查询记录
        $table = M('userscores_record a')->join('ysk_user b on a.master_id=b.userid');
        $isLead = I('isLead');
//        设置开关
        if($isLead!=1){
        $p=getpage($table,$map,100);
        $page=$p->show();
        }else{
            $p=getpage($table,$map,$rduce);
            $page=$p->show();
        }



        //查询数据
        $data_list = $table
//            ->field('a.id,a.pay_nums,a.pay_state,a.pay_time,a.trans_type,c.userid,c.username,b.hold_name,b.card_number,b.open_card,d.pay_state as b')
            ->field('a.get_nums,a.get_type,a.now_nums,a.deputy_id,a.master_id,a.get_time,b.username,b.mobile')
            ->where($map)
            ->order('a.get_time desc')
            ->select();
        //dump($data_list);exit;
        $getScoresType = $this->scoresType;
        foreach ($data_list as $key => $val){
            if($val['get_type'] != 3 && $val['get_type'] != 4){
                $data_list[$key]['type_name'] = L($getScoresType[$val['get_type']]);
            }else{
                $data_list[$key]['type_name'] = L($getScoresType[$val['get_type']]).'('.$val['deputy_id'].')';
            }
        }
        //dump($data_list);exit;
        //导出Excel表格
        if($isLead==1){
            $this->export($data_list);
        }
        //dump($data_list);exit;
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
            $row[$i]['master_id'] = $v['master_id'];
            $row[$i]['username'] = $v['username'];
            $row[$i]['now_nums'] = $v['now_nums'];
            $row[$i]['get_nums'] = $v['get_nums'];
            $row[$i]['type_name'] = $v['type_name'];
            $row[$i]['get_time'] = $v['get_time'];
            $i++;
        }
//                dump($data_list);die;

        $Header = array('用户ID','用户昵称','用户总金额','数量','业务类型','时间');
        $FileName = '消费详情表(截止时间:'.date('YmdHis',time()).')';
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

        $obj->getActiveSheet(0)->setTitle('消费记录详情表');   //设置sheet名称
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
