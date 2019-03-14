<?php
namespace Admin\Controller;

use Think\Page;
use Admin\Model\AwardsModel;
use Admin\Model\UserModel;
/**
 * 用户控制器
 *
 */
class AwardController extends AdminController
{

    public function index()
    {

        // 搜索
        $keyword    = I('keyword', '', 'string');
        $querytype  = I('querytype','','string');
        $date_start=I('date_start');
        $date_end=I('date_end');
//        $status     = I('status');
        if($keyword){
            $map[$querytype] = $keyword;
        }


//        时间拼接，搜索时间
        if($date_start && $date_end){
            $date_start = $date_start.' 00:00:00';
            $date_end = $date_end.' 23:59:59';
            $map['s.get_time']  = array('between',array($date_start,$date_end));
        }else{
            if($date_start){
                $map['s.get_time']  = array('egt',$date_start.' 00:00:00');
            }
            if($date_end){
                $map['s.get_time']  = array('elt',$date_end.' 23:59:59');
            }
        }

        //将数据库时间转成时间戳
//        $date["create_time"][1][0] = date("Y-m-d H:i:s",$date["create_time"][1][0]);
//        $date["create_time"][1][1] = date("Y-m-d H:i:s",$date["create_time"][1][1]);

//        if($date){
//            $where=$date;
//            if(isset($map)){
//                $map=array_merge($map,$where);
//            }else{
//                $map=$where;
//            }
//
//        }
//        $one

        $map['s.get_type']=array(1,51,52,53,54,55,'or');
//        $map['m.get_type']=array(1,51,52,53,54,55,'or');
//        $map=$map['s.get_type']+$map['m.get_type'];
//        $map=array_merge($map['m.get_type'], $map['s.get_type']);
//        dump($map);die;

//        dump($map);die;
        // 获取所有用户
        $user   = M('userscores_record s');
        if(!isset($map)){
            $map=true;
        }

        //========排序=========
        $order_str='s.get_time desc';
//        $order_str='m.get_time desc';
        //========排序=========

        //分页
        $table=$user
            ->join('ysk_usermoney_record m on s.get_time = m.get_time and s.get_type = m.get_type','inner');
        $isLead = I('isLead');
//        设置开关
        if($isLead!=1){
            $p=getpage($table,$map,10);
            $page=$p->show();
        }
        //查询数据
        $data_list = $table
            ->field('s.id as sid,s.master_id as smaster_id,s.get_nums as sget_nums,s.get_type as sget_type,s.now_nums as snow_nums,s.get_time as sget_time,m.id as mid,m.master_id as mmaster_id,m.get_nums as mget_nums,m.get_type as mget_type,m.now_nums as mnow_nums,m.get_time as mget_time')
            ->where($map)
            ->order($order_str)
            ->select();
//        dump($data_list);exit;


        foreach($data_list as $key => $value){
            if($value['sget_type'] == 1 && $value['mget_type'] == 1){
                $data_list[$key]['explain'] = '每日释放';//语言转换
                $data_list[$key]['changeInfo'] = '积分减少'.$value['sget_nums'].'<br/>'.'余额增加'.$value['mget_nums'];
                $data_list[$key]['remark'] = '积分释放';
            }elseif($value['sget_type'] == 51 && $value['mget_type'] == 51){
                $data_list[$key]['explain'] = '直推奖励';//语言转换
                $data_list[$key]['changeInfo'] = '积分减少'.$value['sget_nums'].'<br/>'.'余额增加'.$value['mget_nums'];
                $data_list[$key]['remark'] = '积分加速释放';
            }elseif($value['sget_type'] == 52 && $value['mget_type'] == 52){
                $data_list[$key]['explain'] = '区块奖励';//语言转换
                $data_list[$key]['changeInfo'] = '积分减少'.$value['sget_nums'].'<br/>'.'余额增加'.$value['mget_nums'];
                $data_list[$key]['remark'] = '积分加速释放';
            }elseif($value['sget_type'] == 53 && $value['mget_type'] == 53){
                $data_list[$key]['explain'] = '流通奖励';//语言转换
                $data_list[$key]['changeInfo'] = '积分减少'.$value['sget_nums'].'<br/>'.'余额增加'.$value['mget_nums'];
                $data_list[$key]['remark'] = '积分加速释放';
            }elseif($value['sget_type'] == 54 && $value['mget_type'] == 54){
                $data_list[$key]['explain'] = '4级VIP流通加分';//语言转换
                $data_list[$key]['changeInfo'] = '积分增加'.$value['sget_nums'];
                $data_list[$key]['remark'] = '积分增加';
            }elseif($value['sget_type'] == 55 && $value['mget_type'] == 55){
                $data_list[$key]['explain'] = '5级VIP流通加分';//语言转换
                $data_list[$key]['changeInfo'] = '积分增加'.$value['sget_nums'];
                $data_list[$key]['remark'] = '积分增加';
            }
            $data_list[$key]['treasure'] = '余额:'.$value['mnow_nums'].'<br/>'.'积分:'.$value['snow_nums'];
            $data_list[$key]['time'] = $value['sget_time'];
            $data_list[$key]['id'] = $value['smaster_id'];
            $data_list[$key]['idid'] = $value['sid'];
        }

//        dump($map);die;

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
            $row[$i]['idid'] = $v['idid'];
            $row[$i]['id'] = $v['id'];
            $row[$i]['time'] = $v['time'];
            $row[$i]['explain'] = $v['explain'];
            $row[$i]['treasure'] = $v['treasure'];
            $row[$i]['changeInfo'] = $v['changeInfo'];
            $row[$i]['remark'] = $v['remark'];
            $i++;
        }
//                dump($data_list);die;
        $Header = array('ID','用户ID','奖励发放时间','奖励类型','财富','变动信息','备注');
        $FileName = '奖励详情表(截止时间:'.date('YmdHis',time()).')';
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

        $obj->getActiveSheet(0)->setTitle('奖励记录详情表');   //设置sheet名称
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
