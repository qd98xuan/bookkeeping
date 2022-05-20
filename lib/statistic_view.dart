import 'dart:ffi';

import 'package:bookkeeping/db/database_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

/**
 * 统计view
 */
class StatisticView extends StatefulWidget {
  const StatisticView({Key? key}) : super(key: key);

  @override
  State<StatisticView> createState() => _StatisticViewState();
}

class _StatisticViewState extends State<StatisticView> {
  DatabaseUtils _databaseUtils = DatabaseUtils();
  Map<String, double> _dataMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("记账统计"),
      ),
      body: Container(
        child: showData(),
      ),
    );
  }

  showData(){
    if(_dataMap.isNotEmpty){
      return PieChart(dataMap: _dataMap);
    }else{
      return Text(
        "暂无数据",
        style: TextStyle(color: Colors.grey),
        textAlign: TextAlign.center,
      );
    }
  }


  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    await _databaseUtils.openDatabse();
    List<Map> _datas = await _databaseUtils.selectPriceGroupByClass();
    _datas.forEach((element) {
      print(element['sum(price)']);
      setState(() {
        _dataMap.addAll({element['class_name']:double.parse(element['sum(price)'].toString())});
      });
    });
    print(_dataMap);
  }
}
