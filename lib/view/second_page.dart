import 'package:dars5/data/internet/internet_data_list.dart';
import 'package:dars5/data/model/model_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  int indexId;

  SecondPage({Key? key, required this.indexId}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late ModelListData modelListData;
  InternetListData internetListData = InternetListData();

  bool boolGetData = false;

  getDataObject() async {
    boolGetData = false;

    modelListData = await internetListData.getDataObject(id: widget.indexId);

    setState(() {
      boolGetData = true;
    });
  }

  late int index;

  @override
  initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    getDataObject();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.red),
      ),
      body: Center(
        child: boolGetData
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(modelListData.id.toString()),
                  SizedBox(height: 20),
                  Text(modelListData.title.toString()),
                  SizedBox(height: 20),
                  Text(modelListData.body.toString()),
                  SizedBox(height: 20),
                  Text(modelListData.userId.toString()),
                ],
              )
            : CupertinoActivityIndicator(
            color: Colors.red,
            animating: true),
      ),
    );
  }
}
