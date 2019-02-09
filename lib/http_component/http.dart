import 'package:http/http.dart' as http;
import 'dart:async';

class Http{
//get请求
  static Future<String> get(String url,{Map<String,String>params})async{
    if(params != null && params.isNotEmpty){
      StringBuffer stringBuffer = new StringBuffer("?");
      params.forEach((key,value){
        stringBuffer.write("$key" + "=$value" + "&");
      });
      String paramStr = stringBuffer.toString();
      paramStr = paramStr.substring(0, paramStr.length -1);
      url += paramStr;
    }
    http.Response res = await http.get(url);
    if(res.statusCode == 200){
      return res.body;
    }else{
      return null;
    }
  }

  //post请求
  static Future<String> post(String url,{Map<String,String>params})async{
    http.Response res = await http.post(url, body: params);
    return res.body;
  }
}
