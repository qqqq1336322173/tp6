<?php
  namespace app\controller;

  use think\captcha\facade\Captcha;

  class Index
  {
      public function verify()
      {
          return Captcha::create();
      }
  }
