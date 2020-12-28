<?php
  namespace app\home\controller;

  use app\BaseController;
  //模型
  use app\home\model\Address as Address;
  //引入渲染模板
  use think\facade\View;

class TaobaoAddress extends BaseController
{
    /**
     * 获取所有的地址
     */
    public function index()
    {
        $address_list = Address::select()->toArray();
        // var_dump($address_list);
        $address_list = $this->getAddress($address_list);
        return View::fetch('address', ['address_list'=>$address_list]);
        //无限极分类
        /*
        [
           'id'=>1,
           'address_name'=>'北京',
           'parent_id'=>0,
           'children'=>[
             [
               'id'=>3,
               'address_name'=>'北京市',
               'parent_id'=>1,
               'children'=>[
                 [
                   'id'=>4,
                   'address_name'=>'东城区',
                   'parent_id'=>3
                 ],
                  [
                   'id'=>5,
                   'address_name'=>'西城市',
                   'parent_id'=>3
                 ]
               ]
             ]
           ]
        ]*/
    }
    public function getAddress($arr, $pid = 0)
    {
        $tree = [];
        /**
         * 1.假如这个是第一级，把它的所有儿子和孙子都找出来
         * 2.当它的儿子为空的时候，把它删除掉
         */
        foreach ($arr as $k=>$v) {
            if ($v['parent_id'] === $pid) {
                //把它的所有儿子都找出来
                $v['children'] = $this->getAddress($arr, $v['id']);
                //当它的儿子为空的时候，把它删除掉
                if ($v['children'] == null) {
                    unset($v['children']);
                }
                //把数据追加到数组内部
                $tree[] = $v;
            }
        }
        return $tree;
    }
    /**
     * 获取它所有的城市
     */
    public function getCityChildren()
    {
        $address_city_list = $this->getCityChildrenList();
        return json(['status'=>200,'msg'=>'查询成功','address_city_list'=>$address_city_list]);
    }
    public function getCityChildrenList()
    {
        $address_list = Address::select()->toArray();
        // var_dump($address_list);
        $address_list = $this->getAddress($address_list);
        $id = request()->param('id');
        // exit($id);
        $address_city_list = [];
        foreach ($address_list as $k=>$v) {
            if ($v["id"] == $id) {
                $address_city_list = $v['children'];
                break;
            }
        }
        return $address_city_list;
    }
    /**
     * 获取所有的地区
     */
    public function getAreaChildren()
    {
        $address_city_list = $this->getCityChildrenList();
        $city_id = request()->param('city_id');
        $address_area_list = [];
        foreach ($address_city_list as $k=>$v) {
          if($v['id'] == $city_id){
            $address_area_list = $v['children'];
            break;
          }
        }
        return json(['status'=>200,'msg'=>'查询成功','address_area_list'=>$address_area_list]);
    }
}
