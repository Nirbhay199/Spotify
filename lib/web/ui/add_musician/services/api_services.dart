import 'dart:io';

import 'package:firebase/constant/api_constant.dart';
import 'package:firebase/handle_exception.dart';
import 'package:get/get.dart';

class AddMusicianServices extends GetConnect{
  HandleException handleException=HandleException();


  dynamic submit(body)async{
    try{
      var response=await post("$appBaseUrl$addArtistUrl", body);
      return handleException.returnResponse(response: response);
    }catch(_){
      return   HttpException("Nirbhay Error  $_");
    }
  }



}