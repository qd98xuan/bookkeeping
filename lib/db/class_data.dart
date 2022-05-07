import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * 数据类
 */
class ClassDataEntity{
  String name;
  IconData icon;
  ClassDataEntity(this.name,this.icon);
}


List classDatas = [
  ClassDataEntity("餐饮", Icons.local_restaurant),
  ClassDataEntity("购物", Icons.shopping_cart),
  ClassDataEntity( "日用", Icons.coronavirus),
  ClassDataEntity( "交通", Icons.add_card),
  ClassDataEntity( "蔬菜", Icons.park),
  ClassDataEntity("水果", Icons.apple),
  ClassDataEntity("零食", Icons.rice_bowl),
  ClassDataEntity("运动", Icons.directions_bike),
  ClassDataEntity("娱乐", Icons.sports_esports),
];