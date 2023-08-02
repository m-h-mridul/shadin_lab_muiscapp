// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../models/searddatamodel.dart';

Rx<SearchDatamodel> _searchData = SearchDatamodel().obs;
SearchDatamodel get searchList => _searchData.value;

Future<dynamic> fetchData({String? value}) async {
  const String apiKey = 'c07dcdb58bmshcb98b73d0f5b861p18be85jsn414fb79b6d63';
  const String apiHost = 'deezerdevs-deezer.p.rapidapi.com';
  const String apiUrl = 'https://deezerdevs-deezer.p.rapidapi.com/search';
  try {
    final Dio dio = Dio();
    dio.options.headers = {
      'X-RapidAPI-Key': apiKey,
      'X-RapidAPI-Host': apiHost,
    };

    final Response response =
        await dio.get(apiUrl, queryParameters: {'q': value});
    if (response.statusCode == 200) {
      
      SearchDatamodel searchDatamodel = SearchDatamodel.fromJson(response.data);
      _searchData.value = searchDatamodel;
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (error) {
    print('Error occurred: $error');
  }
}
