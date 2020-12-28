<?php
namespace app\admin\controller;

//模型
use app\admin\model\Admin;
//引入控制器
use app\BaseController;
//引入session
use think\facade\Session;
//引入视图
use think\facade\View;
//引入验证控制器
use \app\admin\controller\AdminValidate as AdminValidate;
//引入request
use think\Request;
//引入验证码
use think\captcha\facade\Captcha;

class Index extends BaseController
{
    public function index()
    {
        //如果没有登录就跳转到登录页面
        // Session::delete('aname');
        $admin_name = Session::get('aname', '');
        if (!$admin_name) {
            return View::fetch('login', ['aname' => 'thinkphp']);
        } else {
            return View::fetch('index');
        }
    }

    public function hello($name = 'ThinkPHP6')
    {
        return 'admin,' . $name;
    }
    /**
     * 登录的接口
    */
    public function login()
    {
        //先验证数据
        //接收参数
        $aname = request()->param('aname');
        $pwd = request()->param('pwd');
        if (!$pwd) {
            $data = array('msg'=>'密码不能为空','status'=>100);
            return json($data);
        }
        // var_dump($aname, $pwd);
        $adminValidate = new AdminValidate();
        $data = [
          'aname'=>$aname,
          'pwd'=>intval($pwd)
        ];
        $result = $adminValidate->check($data);
        // var_dump(preg_match($reg, intval($pwd)), $result);
        if (!$result) {
            $msg = $adminValidate->getError();
            $data = array('msg'=>$msg,'status'=>100);
            return json($data);
        }
        //验证验证码是否正确
        $code = request()->param('code');
        $result = $this->verify($code);
        if (!$result) {
            $data = array('msg'=>'验证码不正确','status'=>100);
            return json($data);
        }
        $user = Admin::where('aname', $aname)->where('pwd', md5(md5($pwd)))->find(1);
        //var_dump($user);
        if ($user) {
            //登录成功 存session
            Session::set('aname', 'admin');
            $data = array('msg'=>'登录成功','status'=>200);
            return json($data);
        } else {
            //登录失败
            $data = array('msg'=>'用户名或者密码不正确，登录失败','status'=>100);
            return json($data);
        }
    }
    /**
     * 验证验证码是否正确
     */
    public function verify($value)
    {
        // $captcha = new Captcha();
        $flag = true;
        if (!captcha_check($value)) {
            $flag = false;
        }
        return $flag;
    }
}
