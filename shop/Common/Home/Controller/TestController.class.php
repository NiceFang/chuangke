<?php
/**
 * Created by PhpStorm.
 * User: pc-2
 * Date: 2018/10/17
 * Time: 16:18
 */

namespace Home\Controller;


class TestController
{
    public function sendEmail(){
        //phpinfo();

       //session(array('test1'=>'123456','expire'=>3600));
       echo session('test1');
    }
}