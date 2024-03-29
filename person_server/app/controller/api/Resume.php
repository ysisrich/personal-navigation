<?php
namespace app\controller\api;

use app\BaseController;
use think\Request;

use think\facade\Db;
use config\Filesystem;

class Resume extends BaseController
{
    
    // 获取附件
    public function getResumeAttachment()
    {
        $res = Db::table('resume') -> find();
        $response = $res ? response(1,'查询成功',$res) : response(0,'查询失败');
        return $response;
    }
    // 上传 多图
    public function uploadResumeImg()
    {
        // 获取表单上传文件 例如上传了001.jpg
        $file = request() -> file('file');
        
        $savename = \think\facade\Filesystem::disk('Note_image')->putFile( 'uploads/Note_images', $file);
        
        // $temp = explode(".", $_FILES["file"]["name"]);
        // $extension = end($temp);
    
    
        $response = $savename ? response(1,'上传成功',$savename) : response(0,'上传失败');
        return $response;
    }
    // 上传代码文件 单个
    public function uploadResumeFile()
    {
        // 获取表单上传文件 例如上传了001.jpg
        $file = request() -> file('file');
        
        $savename = \think\facade\Filesystem::disk('Resume_File')->putFile( 'uploads/Resume_File', $file);
        
        // $temp = explode(".", $_FILES["file"]["name"]);
        // $extension = end($temp);
    
    
        $response = $savename ? response(1,'上传成功',$savename) : response(0,'上传失败');
        return $response;
    }
    
    // 保存数据库
     public function createResume()
    {
        $data = request()->param();
        $res = Db::table('resume') ->insert($data['params']);
        $response = $res ? response(1,'创建成功') : response(0,'创建失败');
        return $response;
    }
    
    // 获取所有文件
     public function getResumeList()
    {
        $res = Db::table('resume') -> select();
        $response = $res ? response(1,'查询成功',$res) : response(0,'查询失败');
        return $response;
    }
    
    // 删除文件
     public function deleteFile()
    {
        $data = request()->param();
        //thinkphp使用unlink函数来删除文件，参数是文件的地址
        unlink($data["file_url"]);
        $res = Db::table('resume') -> where('id',$data['id']) ->delete();
        $response = $res ? response(1,'删除成功') : response(0,'删除失败');
        return $response;
        
        
    }
   
    
}
