<?php
namespace Home\Controller;

use Common\Controller\BaseController;
header("content-type:text/html;charset=utf-8");

class LoginTrueController extends BaseController
{
	
	
    public function __construct()
    {
        parent::__construct();
		
		$this->xitonginfo();
	   
        $this->checkAdminSession();
        $system = M("system");
        $rs_system = $system->field("sLoginTimeout")
            ->where("sId=1")
            ->find();
        $_SESSION['nvip_user_expiretime'] = time() + (($rs_system["sLoginTimeout"]) * 60);
		
		
    }

    public function CheckAdminSession()
    {
        // 设置超时为几分钟
        $system = M("system");
        $rs_system = $system->field("sLoginTimeout")
            ->where("sId=1")
            ->find();
			
      /*  if (isset($_SESSION['nvip_user_expiretime'])) {
            if ($_SESSION['nvip_user_expiretime'] < time()) {
                unset($_SESSION['nvip_user_expiretime']);
                session(null);
                $this->error("登陆超时，请重新登陆！", U('login/index'));
                exit();
            } else {
                $_SESSION['nvip_user_expiretime'] = time() + (($rs_system["sLoginTimeout"]) * 60); // 刷新时间戳
            }
        }*/
    }

    public function ExitLogin()
    {
         session(null);
         $this->success("成功退出", U("login/index"));
    }

    public function LoginTrue()
    {
		
        if (! session("nvip_nvip_member_User")) {
            ?>
<script type="text/javascript">
			window.location.href="<?php echo __ROOT__;?>/login/";
            </script>
	<?php
	exit;
            // $this->error("Sorry ！你还没有登录，请登陆后访问！",U('/login/index/'));
            // exit;
        }
    }


    public function LoginTrueTemp()
    {
        if (! session("nvip_membertemp_User_temp")) {
            ?>
            <script type="text/javascript">
                window.location.href="<?php echo __ROOT__;?>/login/";
            </script>
            <?php
            exit;
            // $this->error("Sorry ！你还没有登录，请登陆后访问！",U('/login/index/'));
            // exit;
        }
    }
    /**
     * 临时会员不能购买订单和注册会员等功能
     */
//    public function check_linshi(){
//        $linshi=M('users')->field('states')->where("loginname='$_SESSION[nvip_nvip_member_User]'")->find();
//        if (!$linshi['states']){
////            $this->success('您是临时会员,请先激活');exit();
//            $this->success('您是临时会员,请先激活！',U("Index"));
//        }
//    }
}
