<?php
namespace app\controller\api;

use app\BaseController;
use think\Request;

use think\facade\Db;
use config\Filesystem;

class LoveTree extends BaseController
{
    
    // 获取
    public function getLovePath()
    {
        $data = request()->param();
        $res = Db::table('love_tree') -> where('id_key',$data['id_key'])->find();
        $response = $res ? response(1,'查询成功',$res) : response(0,'查询失败');
        return $response;
    }
    
    // 创建
    public function createLovePath()
    {
        $data = request()->param();
        $max_id = Db::query("select max(id) from love_tree")[0]["max(id)"];
        $max_id = empty($max_id) ? 1 : $max_id+1;
        $data['id_key'] = $data['key'].$max_id;
        unset($data['key']);
        $res = Db::table('love_tree') ->insert($data);
        $response = $res ? response(1,'创建成功',$data['id_key']) : response(0,'创建失败');
        return $response;
       
    }
    
    
}
