<?php
/**
 * Created by PhpStorm.
 * User: ZZR
 * Date: 2018/10/22
 * Time: 17:41
 */

namespace Think;


class Imgcodeverify
{
    public function entry_add($id = '') {

        $this->length='3';

        // 图片宽(px)

        $this->imageW || $this->imageW = $this->length*$this->fontSize*1.5 + $this->length*$this->fontSize/2;

        // 图片高(px)

        $this->imageH || $this->imageH = $this->fontSize * 2.5;

        // 建立一幅 $this->imageW x $this->imageH 的图像

        $this->_image = imagecreate($this->imageW, $this->imageH);

        // 设置背景

        imagecolorallocate($this->_image, $this->bg[0], $this->bg[1], $this->bg[2]);



        // 验证码字体随机颜色

        $this->_color = imagecolorallocate($this->_image, mt_rand(1,150), mt_rand(1,150), mt_rand(1,150));

        // 验证码使用随机字体

        $ttfPath = dirname(__FILE__) . '/Verify/' . ($this->useZh ? 'zhttfs' : 'ttfs') . '/';



        if(empty($this->fontttf)){

            $dir = dir($ttfPath);

            $ttfs = array();

            while (false !== ($file = $dir->read())) {

                if($file[0] != '.' && substr($file, -4) == '.ttf') {

                    $ttfs[] = $file;

                }

            }

            $dir->close();

            $this->fontttf = $ttfs[array_rand($ttfs)];

        }

        $this->fontttf = $ttfPath . $this->fontttf;



        if($this->useImgBg) {

            $this->_background();

        }



        if ($this->useNoise) {

            // 绘杂点

            $this->_writeNoise();

        }

        if ($this->useCurve) {

            // 绘干扰线

            $this->_writeCurve();

        }



        // 绘验证码

        $code = array(); // 验证码

        $symbol=array('+','-');

        $codeNX = 0; // 验证码第N个字符的左边距

        $now_symbol=$symbol[rand(0,1)];

        for ($i = 0; $i<$this->length; $i++) {

            if($i==1){

                $code[$i] = $now_symbol;

                $codeNX += mt_rand($this->fontSize*1.2, $this->fontSize*1.6);

                imagettftext($this->_image, $this->fontSize,0, $codeNX, $this->fontSize*1.6, $this->_color, $ttfPath.'2.ttf', $code[$i]);

            }

            else{

                $code[$i] = $this->codeSet[mt_rand(0, strlen($this->codeSet)-1)];

                $codeNX += mt_rand($this->fontSize*1.2, $this->fontSize*1.6);

                imagettftext($this->_image, $this->fontSize, mt_rand(-40, 40), $codeNX, $this->fontSize*1.6, $this->_color, $this->fontttf, $code[$i]);

            }

        }



        // 保存验证码

        $key    =  $this->authcode($this->seKey);

        $str=implode('', $code);

        eval("\$re=$str;");

        $code    =  $this->authcode($re);

        $secode   =  array();

        $secode['verify_code'] = $code; // 把校验码保存到session

        $secode['verify_time'] = NOW_TIME; // 验证码创建时间

        session($key.$id, $secode);



        header('Cache-Control: private, max-age=0, no-store, no-cache, must-revalidate');

        header('Cache-Control: post-check=0, pre-check=0', false);

        header('Pragma: no-cache');

        header("content-type: image/png");



        // 输出图像

        imagepng($this->_image);

        imagedestroy($this->_image);

    }

    public function check_add($code, $id = '') {

        $key = $this->authcode($this->seKey).$id;

        // 验证码不能为空

        $secode = session($key);

        if($code===false || empty($secode)) {

            return false;

        }

        //验证码是否是数字

        if(!is_numeric($code)) {

            return false;

        }

        // session 过期

        if(NOW_TIME - $secode['verify_time'] > $this->expire) {

            session($key, null);

            return false;

        }

        if($this->authcode($code) == $secode['verify_code']) {

            $this->reset && session($key, null);

            return true;

        }

        return false;

    }

    Public function verify(){

        import('ORG.Util.Verify');

        $Verify = new Verify();

        $Verify->useNoise = true;

        $Verify->codeSet = '0123456789';

        $Verify->useCurve = false;

        $Verify->entry_add();

    }
}