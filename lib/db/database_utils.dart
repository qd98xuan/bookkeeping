import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUtils{
  Database? db=null;
  //打开数据库
  openDatabse() async {
    db ??= await openDatabase('bookkeeping.db', version: 1,
          onCreate: (db, version) async {
            await db.execute(
                'CREATE TABLE Expenses (id	TEXT,name	TEXT,remark	TEXT,input_time	TEXT,price	TEXT,class_id	TEXT,class_name	TEXT)');
            await db.execute(
                'CREATE TABLE class (id	TEXT,class_name	TEXT,input_time	TEXT,remark	TEXT)');
          });
    return db;
  }
  //关闭数据库
  closeDatabase() async {
    if(db!=null){
      await db?.close();
    }
  }
  //插入一条数据
  insertExpenses(name,remark,price,class_id,class_name)async{
    var id = getUUid();
    var input_time = DateTime.now().year.toString()+"-"+DateTime.now().month.toString()+"-"+DateTime.now().day.toString()+" "+DateTime.now().hour.toString()+":"+DateTime.now().minute.toString()+":"+DateTime.now().second.toString();
    String sql = "INSERT INTO Expenses (id,name,remark,input_time,price,class_id,class_name) VALUES ('${id}','${name}','${remark}','${input_time}',${price},'${class_id}','${class_name}')";
    print(sql);
    await db?.transaction((txn) async{
      var count = txn.rawInsert(sql);
      print("插入行数:${count}");
    });
  }
  
  //查询当前所有的数据
  selectAllExpenses()async{
    if(db!=null) {
      List<Map> datas = await db!.rawQuery(
          'SELECT name,price,input_time,class_name,class_id FROM Expenses');
      print(datas);
      return datas;
    }
    return List.empty();
  }

  getUUid() {
    String randomstr = Random().nextInt(10).toString();
    for (var i = 0; i < 3; i++) {
      var str = Random().nextInt(10);
      randomstr = "$randomstr" + "$str";
    }
    var timenumber = DateTime.now().millisecondsSinceEpoch;//时间
    var uuid = "$randomstr" + "$timenumber";
    print(uuid);
    return uuid;
  }

}