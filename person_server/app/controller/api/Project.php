<?php
namespace app\controller\api;

use app\BaseController;
use think\Request;

use think\facade\Db;
use config\Filesystem;

class Project extends BaseController
{
    
    // 获取所有项目列表
    public function getProjectList()
    {
        $res = Db::table('project') -> select();
        $response = $res ? response(1,'查询成功',$res) : response(0,'查询失败');
        return $response;
    }
    // 上传项目 多图
    public function uploadProjectImg()
    {
        // 获取表单上传文件 例如上传了001.jpg
        $file = request() -> file('file');
        
        $savename = \think\facade\Filesystem::disk('project_image')->putFile( 'uploads/project_images', $file);
        
        // $temp = explode(".", $_FILES["file"]["name"]);
        // $extension = end($temp);
    
    
        $response = $savename ? response(1,'上传成功',$savename) : response(0,'上传失败');
        return $response;
    }
    // 根据id获取项目
    public function getProjectOne()
    {
        $data = request()->param();
        $res = Db::table('project') -> where('id',$data['id'])->find();
        $response = $res ? response(1,'查询成功',$res) : response(0,'查询失败');
        return $response;
    }
    // 根据id更新项目
    public function updateProject()
    {
        $data = request()->param();
        $res = Db::table('project') -> where('id',$data['id']) ->update($data['params']);
        $response = $res ? response(1,'更新成功') : response(0,'暂无更改');
        return $response;
    }
    
    // 创建项目
    public function createProject()
    {
        $data = request()->param();
        $res = Db::table('project') ->insert($data['params']);
        $response = $res ? response(1,'创建成功') : response(0,'创建失败');
        return $response;
    }
    
    // 根据筛选 分页 条件获取项目数据
    public function getConditionProject()
    {
        $data = request()->param();
        $search = $data['search'];
        $page_size = $data['page_size'];
        $page_current = $data['page_current'];
        
        $res = Db::table('project')
                ->where('name','like','%'.$search.'%')
                ->paginate([
                    'list_rows'=> $page_size,
                    'page' => $page_current,
                ]);
        $response = $res ? response(1,'获取成功',$res) : response(0,'获取失败');
        return $response;
    }
    
    public function deletePersonInfo()
    {
        $data = Db::table('user') -> find(1);
        $response = $data ? response(1,'查询成功',$data) : response(0,'查询失败');
        return $response;
    }
    
}
