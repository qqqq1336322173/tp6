<?php
use think\facade\Route;
// 注册路由到News控制器的read操作
Route::rule('hello/:name','index/hello');
Route::rule('getAdmin/:name','index/getAdmin');