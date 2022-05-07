//记录列表item
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  String time;
  String className;
  String name;
  String price;
  IconData icon;

  ExpensesItem(this.time, this.className, this.name, this.price,this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "消费时间：${time}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.left,
                ),
                flex: 1,
              ),
              Expanded(
                child: Text(
                  "消费分类：${className}",
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                  textAlign: TextAlign.right,
                ),
                flex: 1,
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(3),
          ),
          Row(
            children: [
              Expanded(child: Icon(icon,color: Colors.blue,),flex: 1,),
              Expanded(
                child: Text(
                  "${name}",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                flex: 1,
              ),
              Expanded(
                child: Text(
                  "支出: ${price} 元",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                  textAlign: TextAlign.right,
                ),
                flex: 3,
              )
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Container(
              color: Colors.grey,
              height: 1,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
