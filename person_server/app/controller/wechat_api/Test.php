<?php
namespace app\controller\wechat_api;

use app\BaseController;
use think\Request;

use think\facade\Db;
use config\Filesystem;

// 这里定义你在 接口配置信息中 要填写的token
define('WECHAT_VERIFY_TOKEN', 'YAngSOngWeChat');


class Test 
{
    
    
     public function wx()
    {
        function checkSignature()
        {
            $token = 'YAngSOngWeChat';
            //先获取到这三个参数
            $signature = input('signature');
            $nonce = input('nonce');
            $timestamp = input('timestamp');

            // 把这三个参数存到一个数组里面
            $tmpArr = array($timestamp, $nonce, $token);
            // 进行字典排序
            sort($tmpArr);

            // 把数组中的元素合并成字符串，impode()函数是用来将一个数组合并成字符串的
            $tmpStr = implode($tmpArr);

            // sha1加密，调用sha1函数
            $tmpStr = sha1($tmpStr);
            // 判断加密后的字符串是否和signature相等
            if ($tmpStr == $signature) {

                return true;
            }
            return false;
        }

        // 如果相等，验证成功就返回echostr
        if (checkSignature()) {
            // 返回echostr
            $echostr = input('echostr');
            if ($echostr) {
                echo $echostr;
                exit;
            }
        }
    }
    
    
    public function index()
    {
        return '12';
    }
    
    // public function wx()
    // {
    //     $signature = input["signature"];
    //     $timestamp = input["timestamp"];
    //     $nonce = input["nonce"];
    // 	$echostr = input["echostr"];
    	
    //     $token = 'saND4sfh4';
    //     $tmpArr = array( $timestamp, $nonce,$token);
    //     sort($tmpArr);
    //     $tmpStr = implode( $tmpArr );
    //     $tmpStr = sha1( $tmpStr );
        
    //     if( $tmpStr == $signature ){
    //         return $echostr;
    //     }else{
    //         return false;
    //     }
    // }
    
    
    /**
     * 自定义方法，用于微信访问验证开发者身份
     *
     * @param Request $request
     * @return array|null|string
     */
    // public function connectWechat(Request $request)
    // {
    //     $signature = $_GET["signature"];
    //     $timestamp = $_GET["timestamp"];
    //     $nonce = $_GET["nonce"];
    //     $echoStr = $_GET["echostr"];
    //     if ($this->checkSignature($signature, $timestamp, $nonce)) {
    //         return $echoStr;
    //     } else {
    //         return false;
    //     }
    // }

    /**
     * 微信官方提供的验签方法
     *
     * @param $signature
     * @param $timestamp
     * @param $nonce
     * @return bool
     */
    // private function checkSignature($signature, $timestamp, $nonce)
    // {
    //     $token = WECHAT_VERIFY_TOKEN;
    //     $tmpArr = array($token, $timestamp, $nonce);
    //     sort($tmpArr, SORT_STRING);
    //     $tmpStr = implode($tmpArr);
    //     $tmpStr = sha1($tmpStr);

    //     if ($tmpStr == $signature) {
    //         return true;
    //     } else {
    //         return false;
    //     }
    // }
   
    
}
