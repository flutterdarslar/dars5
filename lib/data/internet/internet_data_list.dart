import 'package:dars5/data/model/model_list.dart';
import 'package:dio/dio.dart';

class InternetListData {
  var _dio = Dio();

  List<ModelListData> list = [];

  Future<List<ModelListData>> getDataList() async {
    Response response =
        await _dio.get("https://jsonplaceholder.typicode.com/posts1234");
    for (var element in response.data) {
      list.add(ModelListData.fromJson(element));
    }
    return list;
  }

  Future<ModelListData> getDataObject({required int id}) async {
    Response response =
        await _dio.get("https://jsonplaceholder.typicode.com/posts/$id");
    return ModelListData.fromJson(response.data);
  }
}
