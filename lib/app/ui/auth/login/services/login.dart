import 'dart:io';

import 'package:firebase/handle_exception.dart';
import 'package:get/get.dart';

import '../../../../../constant/api_constant.dart';

class LoginService extends GetConnect{
  HandleException handleException =HandleException();

  login(body)async{
    try{
      var response = await post("$appBaseUrl$loginUrl", body);
      return handleException.returnResponse(response: response);
    }catch(_){
      return const HttpException("Something Went Wrong");
    }
  }

}