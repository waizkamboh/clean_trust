
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../app_exception/app_exception.dart';
import 'base_api_services.dart';


class NetworkApiServices extends BaseApiServices{

  @override
  Future<dynamic> getApi(String url, {Map<String, String>? headers} ) async{
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url),
        headers: headers

      );
      responseJson = returnResponse(response);



    }on SocketException{
      throw InternetException();

    }on RequestTimeOut{
      throw RequestTimeOut();
    }
    return responseJson;



  }

  Future<dynamic> getByIdApi(String url, {Map<String, String>? headers} ) async{
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try{
      final response = await http.get(Uri.parse(url),
          headers: headers

      );
      responseJson = returnResponse(response);



    }on SocketException{
      throw InternetException();

    }on RequestTimeOut{
      throw RequestTimeOut();
    }
    return responseJson;



  }

  @override
  Future<dynamic> postApi(var data, String url,{Map<String, String>? headers} )async{

    if(kDebugMode){
      print(url);
      print(data);
    }
    dynamic responseJson;
      print(responseJson);
    try{
      final response = await http.post(Uri.parse(url),
        body: jsonEncode(data),
        headers: headers


      );
      responseJson = returnResponse(response);

    }on SocketException{
      throw InternetException('');

    }on RequestTimeOut{
      throw RequestTimeOut();
    }

    return responseJson;


  }

  @override
  Future<dynamic> deleteApi(String url, {Map<String, String>? headers}) async {
    if (kDebugMode) {
      print(url);
    }
    dynamic responseJson;
    try {
      final response = await http.delete(
        Uri.parse(url),
        headers: headers,
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    }
    return responseJson;
  }

  @override
  Future<dynamic> updateApi(var data, String url, {Map<String, String>? headers}) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic responseJson;
    try {
      final response = await http.patch(Uri.parse(url),
          body: jsonEncode(data),
          headers: headers
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException();
    } on RequestTimeOut {
      throw RequestTimeOut();
    }

    return responseJson;
  }


  dynamic returnResponse(http.Response response){
     print(response.body.toString());
    if (kDebugMode) {
      print(response.statusCode);
    }
    switch(response.statusCode){

      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      // case 500:
      // // Parse error message from response body
      //   final errorMessage = jsonDecode(response.body);
      //   throw FetchDataException('Server Error: $errorMessage');

      default:
        throw FetchDataException(response.body.toString()+response.statusCode.toString());

        

    }
  }

}