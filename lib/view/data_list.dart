import 'dart:developer';

import 'package:dars5/data/internet/internet_data_list.dart';
import 'package:dars5/data/model/model_list.dart';
import 'package:dars5/view/second_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataList extends StatefulWidget {
  const DataList({Key? key}) : super(key: key);

  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  @override
  void initState() {
    getDataFromServer();
    super.initState();
  }

  InternetListData internetListData = InternetListData();
  List<ModelListData> listData = [];
  late int errorCode = 0;
  getDataFromServer() async {
    try {
      listData = await internetListData.getDataList();
    } on DioException catch (e) {
      log(e.response!.statusCode.toString());
      errorCode = e.response!.statusCode!;
    }
    setState(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      errorCode == 0?
      ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              log(index.toString());

              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        SecondPage(indexId: listData[index].id),
                  ));
            },
            leading: Container(
                padding: EdgeInsets.all(15),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                child: Text(listData[index].id.toString())),
            title: Text(listData[index].title),
          );
        },
      )
      :Center(child: Text(errorCode.toString()))
      ,
    );
  }
}
