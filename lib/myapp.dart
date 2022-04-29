import 'package:bookkeeping/db/class_data.dart';
import 'package:bookkeeping/db/database_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'expenses_item.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DatabaseUtils databaseUtils = DatabaseUtils();
  List<Map> _datas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("快来记账吧"),
      ),
      body: Container(
        child: RefreshIndicator(
          onRefresh: () async {
            _loadData();
            return Future.value();
          },
          child: showList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          //点击新增一个记录

          await databaseUtils.openDatabse();
          await databaseUtils.insertExpenses(
              "apple", "hi", "12", "001",classDatas['001']!.name);
          _loadData();
        },
      ),
    );
  }

  showList(){
    if(_datas.isEmpty){
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(5),
        child: Text("暂无数据",style: TextStyle(color: Colors.grey),textAlign: TextAlign.center,),
      );
    }else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child:ExpensesItem(_datas[index]['input_time'],_datas[index]['class_name'],_datas[index]['name'],_datas[index]['price'].toString(),classDatas[_datas[index]['class_id'].toString()]!.icon),
          );
        },
        itemCount: _datas.length,
      );
    }
  }


  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    await databaseUtils.openDatabse();
    List<Map> datas = await databaseUtils.selectAllExpenses();
    setState(() {
      _datas = datas;
    });
  }
}
