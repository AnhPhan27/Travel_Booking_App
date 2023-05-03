import 'package:dio/dio.dart';

import 'package:practice_simple_travel_app/models/data_models.dart';

class DataServices {
  static final BaseOptions _options = BaseOptions(
      baseUrl: 'https://api.pub.dev',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
      contentType: 'application/json');
  final Dio _dio = Dio(_options);
  Future<List<DataModel>?> getInfo() async {
    List<DataModel>? listData;
    try {
      final Response response =
          await _dio.get('http://mark.bslmeiyu.com/api/getplaces');
      if (response.statusCode == 200) {
        final data = response.data;
        // print(data);
        listData = List<DataModel>.from(
          (data as List).map((e) {
            return DataModel.fromJson(e);
          }).toList(),
        );
        // print(data);
      }
    } on Exception catch (e) {
      print(e);
    }
    return listData;
  }

  Future<DataModel?> getSingleInfo() async {
    DataModel? singleData;
    try {
      final Response response =
          await _dio.get('http://mark.bslmeiyu.com/api/getplaces');
      if (response.statusCode == 200) {
        final data = response.data;
        // print(data);
        singleData = DataModel.fromJson(data);

        // print(data);
      }
    } on Exception catch (e) {
      print(e);
    }
    return singleData;
  }
}


// }
