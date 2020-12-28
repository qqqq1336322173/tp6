<?php
namespace app\admin\controller;

use think\Validate;

class AdminValidate extends Validate
{
    protected $rule = [
        'aname'  =>  'require',
        'pwd' =>  'checkPwd',
    ];
    
    protected $message = [
        'name'  =>  '用户名必须',
        'pwd' =>  '密码格式不正确',
    ];
    
    // 自定义验证规则
    protected function checkPwd($value, $rule, $data=[])
    {
        // echo 1;
        $reg = '/^[0-9]{6}$/';
        return  preg_match($reg, $value) ? true : false;
        // return $rule == $value ? true : '名称错误';
    }
}
