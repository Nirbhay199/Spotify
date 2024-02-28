

import 'dart:io';

import 'package:get/get_connect/connect.dart';

import '../../../../../../handle_exception.dart';
import '../../../../../constant/api_constant.dart';

class AccountService extends GetConnect {
  final HandleException handleException = HandleException();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  createAccount(body) async {
    print("$appBaseUrl$createAccountUrl");
    try{
      var response =await post("$appBaseUrl$createAccountUrl",body);
      print(response.bodyString);
      return handleException.returnResponse(response: response);
    }catch(_){
      return HttpException("Something Went Wrong");
    }

  }

  fetchArtists({String? name}) async{
    // print("Api ----Hit---$name");
    var query=name!=null?"?name=$name":"";
    try{
      var response=await get("$appBaseUrl$fetchArtistsUrl$query");
      return handleException.returnResponse(response: response);
    }catch(_){
      return HttpException("Nirbhay Error Artist");
    }
  }

}