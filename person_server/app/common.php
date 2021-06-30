<?php
// 应用公共文件

// 响应
function response($status,$info,$data=null){
    // $aj['status']=$status;
    // $aj['info']=$info;
	return json([
		'status' => $status,
		'info' => $info,
		'data' => $data
	]);
}