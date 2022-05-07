import 'package:bookkeeping/db/class_data.dart';
import 'package:bookkeeping/db/database_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

/**
 * 新增账单功能
 */
class AddView extends StatefulWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  TextEditingController _price = TextEditingController();
  TextEditingController _remark = TextEditingController();
  TextEditingController _name = TextEditingController();
  DatabaseUtils _databaseUtils = DatabaseUtils();
  int _classId = 0;
  String _className = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("请选择分类"),
      ),
      body: Builder(
        builder: (homeContext) {
          return Container(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          _classId = index;
                          _className = classDatas[index].name;
                          SmartDialog.show(builder: (context) {
                            return Container(
                              height: 310,
                              width: 300,
                              decoration: BoxDecoration(color: Colors.white),
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      "名称",
                                    ),
                                  ),
                                  TextField(
                                    controller: _name,
                                    keyboardType: TextInputType.text,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      "金额",
                                    ),
                                  ),
                                  TextField(
                                    controller: _price,
                                    keyboardType: TextInputType.number,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text("备注"),
                                  ),
                                  TextField(
                                    controller: _remark,
                                    keyboardType: TextInputType.text,
                                  ),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: MaterialButton(
                                      onPressed: () async {
                                        await _databaseUtils.openDatabse();
                                        await _databaseUtils.insertExpenses(
                                            "${_name.text}", "${_remark.text}", "${_price.text}", "${_classId}","${_className}");
                                        Navigator.pop(homeContext,true);
                                      },
                                      child: Container(
                                        child: Text("确定",style: TextStyle(color: Colors.white),),
                                        decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.all(Radius.circular(5))),
                                        width: 60,
                                        height: 30,
                                        alignment: Alignment.center,
                                      ),
                                      padding: EdgeInsets.all(10),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                        },
                        icon: Icon(
                          classDatas[index]!.icon,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        "${classDatas[index]!.name}",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                );
              },
              itemCount: classDatas.length,
            ),
          );
        },
      ),
    );
  }
}
