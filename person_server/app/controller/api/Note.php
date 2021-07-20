<?php
namespace app\controller\api;

use app\BaseController;
use think\Request;

use think\facade\Db;
use config\Filesystem;

class Note extends BaseController
{
    
    // 获取所有项目列表
    public function getNoteList()
    {
        $res = Db::table('note') -> select();
        $response = $res ? response(1,'查询成功',$res) : response(0,'查询失败');
        return $response;
    }
    // 上传 多图
    public function uploadNoteImg()
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
    public function uploadNoteFile()
    {
        // 获取表单上传文件 例如上传了001.jpg
        $file = request() -> file('file');
        
        $savename = \think\facade\Filesystem::disk('Note_codeFile')->putFile( 'uploads/Note_codeFile', $file);
        
        // $temp = explode(".", $_FILES["file"]["name"]);
        // $extension = end($temp);
    
    
        $response = $savename ? response(1,'上传成功',$savename) : response(0,'上传失败');
        return $response;
    }
    // 根据id获取项目
    public function getNoteOne()
    {
        $data = request()->param();
        $res = Db::table('note') -> where('id',$data['id'])->find();
        $response = $res ? response(1,'查询成功',$res) : response(0,'查询失败');
        return $response;
    }
    // 根据id更新项目
    public function updateNote()
    {
        $data = request()->param();
        $res = Db::table('note') -> where('id',$data['id']) ->update($data['params']);
        $response = $res ? response(1,'更新成功') : response(0,'暂无更改');
        return $response;
    }
    
    // 根据id删除笔记
    public function deleteNote()
    {
        $data = request()->param();
        $res = Db::table('note') -> where('id',$data['id']) ->delete();
        $response = $res ? response(1,'删除成功') : response(0,'暂无更改');
        return $response;
    }
    
    // 创建笔记
    public function createNote()
    {
        $data = request()->param();
        $res = Db::table('note') ->insert($data['params']);
        $response = $res ? response(1,'创建成功') : response(0,'创建失败');
        return $response;
    }
    
    // 根据筛选 分页 条件获取项目数据
    public function getConditionNote()
    {
        $data = request()->param();
        $search = $data['search'];
        $page_size = $data['page_size'];
        $page_current = $data['page_current'];
        
        $res = Db::table('note')
                ->where('name','like','%'.$search.'%')
                ->paginate([
                    'list_rows'=> $page_size,
                    'page' => $page_current,
                ]);
        $response = $res ? response(1,'获取成功',$res) : response(0,'获取失败');
        return $response;
    }
    
}
