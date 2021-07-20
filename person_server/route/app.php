<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\facade\Route;

// Person
Route::get('api/person/personInfo', 'api.person/getPersonInfo'); // 定义GET请求路由规则
Route::post('api/person/personInfo','api.person/createPersonInfo'); // 定义POST请求路由规则
Route::put('api/person/personInfo/:id','api.person/updatePersonInfo'); // 定义PUT请求路由规则
Route::delete('api/person/personInfo/:id','api.person/deletePersonInfo'); // 定义DELETE请求路由规则


// 上传
Route::post('api/person/uploadAvatar', 'api.person/uploadAvatar'); // 上传头像
Route::post('api/project/uploadProjectImg', 'api.project/uploadProjectImg'); // 上传项目图片
Route::post('api/note/uploadNoteFile', 'api.note/uploadNoteFile'); // 上传笔记代码文件
Route::post('api/note/uploadNoteImg', 'api.note/uploadNoteImg'); // 上传笔记图片
Route::post('api/resume/uploadResumeFile', 'api.resume/uploadResumeFile'); // 上传简历文件

// Project
Route::get('api/project/:id', 'api.project/getProjectOne'); // 根据id获取单个项目
Route::get('api/project', 'api.project/getProjectList'); // 获取所有项目
Route::post('api/project', 'api.project/createProject'); // 创建项目
Route::put('api/project/:id', 'api.project/updateProject'); // 更新项目
Route::get('api/projects', 'api.project/getConditionProject'); // 获取筛选分页项目

// Note
Route::get('api/note/:id', 'api.note/getNoteOne'); // 根据id获取单个笔记
Route::get('api/note', 'api.note/getNoteList'); // 获取所有笔记
Route::post('api/note', 'api.note/createNote'); // 创建笔记
Route::put('api/note/:id', 'api.note/updateNote'); // 更新笔记
Route::get('api/notes', 'api.note/getConditionNote'); // 获取筛选分页笔记
Route::delete('api/note/:id', 'api.note/deleteNote'); // 根据id删除单个笔记

