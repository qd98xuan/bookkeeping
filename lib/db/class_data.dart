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


Map<String,ClassDataEntity> classDatas = {
  "001":ClassDataEntity("餐饮", Icons.local_restaurant),
  "002":ClassDataEntity("购物", Icons.shopping_cart),
  "003":ClassDataEntity( "日用", Icons.coronavirus),
  "004":ClassDataEntity( "交通", Icons.add_card),
  "005":ClassDataEntity( "蔬菜", Icons.park),
  "006":ClassDataEntity("水果", Icons.apple),
  "007":ClassDataEntity("零食", Icons.rice_bowl),
  "008":ClassDataEntity("运动", Icons.directions_bike),
  "009":ClassDataEntity("娱乐", Icons.sports_esports),
};