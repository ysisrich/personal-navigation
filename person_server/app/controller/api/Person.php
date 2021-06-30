<?php
namespace app\controller\api;

use app\BaseController;
use think\Request;

use think\facade\Db;
use config\Filesystem;

class Person extends BaseController
{
    // 获取个人信息
    public function getPersonInfo()
    {
        $data = Db::table('user') -> find(1);
        $response = $data ? response(1,'查询成功',$data) : response(0,'查询失败');
        return $response;
    }
    /*
	*
	* 上传头像文件
	*
	*
	*/
	public function uploadAvatar(){
        // 获取表单上传文件 例如上传了001.jpg
        $file = request() -> file('file');

    
        // $temp = explode(".", $_FILES["file"]["name"]);
        // $extension = end($temp);
    
        // if(!in_array($extension, array("jpeg","jpg","png"))){
        // 	return $this -> show(
        //     	config("status.failed"),
        //         config("message.failed"),
        //         '上传图片不合法'
        //     );
       	// }
        $savename = \think\facade\Filesystem::disk('image')->putFile( 'uploads/images', $file);
        $data = Db::name('user') -> update(['avatar' => $savename,'id' => 1]);
        $response = $data ? response(1,'上传成功',$savename) : response(0,'上传失败');
        return $response;
    }
    
    public function createPersonInfo()
    {
        $data = Db::table('user') -> find(1);
        $response = $data ? response(1,'查询成功',$data) : response(0,'查询失败');
        return $response;
    }
    
    public function updatePersonInfo()
    {
        $data = request()->param();
        unset($data['params']['birthday']);
        unset($data['params']['graduation_data']);
        $res = Db::table('user') -> where('id',$data['id']) ->update($data['params']);
        $response = $res ? response(1,'更新成功',$data) : response(0,'暂无更改');
        return $response;
    }
    
    public function deletePersonInfo()
    {
        $data = Db::table('user') -> find(1);
        $response = $data ? response(1,'查询成功',$data) : response(0,'查询失败');
        return $response;
    }
    
}
