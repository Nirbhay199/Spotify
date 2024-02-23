import 'dart:io';

import 'package:firebase/constant/api_constant.dart';
import 'package:firebase/handle_exception.dart';
import 'package:get/get.dart';

class ApiServices extends GetConnect{

HandleException handleException=HandleException();
  fetchSongs()async{
    try{
      var response=await get("$appBaseUrl$fetchSongsUrl");
      return handleException.returnResponse(response: response);
    }catch(_){
      return HttpException("Nirbhay error");
    }

  }

}