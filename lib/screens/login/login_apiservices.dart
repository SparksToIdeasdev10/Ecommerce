import 'package:dio/dio.dart';
import 'package:ecommerce/Baseurl/baseurl.dart';
import 'package:ecommerce/screens/login/login_model.dart';
import 'package:ecommerce/screens/login/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class apiservices{
  Dio dio = Dio();

  String baseurl = BaseUrl().baseurl;

  Future<login>loginpage(String email,String password)async{
    final user_form = FormData();

    user_form.fields.add(MapEntry("email", email));
    user_form.fields.add(MapEntry("password", password));
    print("${email}");
    print("${password}");
    print("${baseurl}");

    final value_user = await dio.post("${baseurl}auth/login",data: user_form);


    if(value_user.statusCode ==200){
      final result_user = login.fromJson(value_user.data);
      return result_user;
    }
    else{
      throw "Something went wrong";
    }
  }


  //Register apiservices
  Future<register>registers(name,email,phone,password,password_confirmation)async{
    final user_form = FormData();

    user_form.fields.add(MapEntry("name", name));
    user_form.fields.add(MapEntry("email", email));
    user_form.fields.add(MapEntry("phone", phone));
    user_form.fields.add(MapEntry("password", password));
    user_form.fields.add(MapEntry("password_confirmation", password_confirmation));
    print("${name}");
    print("${email}");
    print("${phone}");
    print("${password}");
    print("${password_confirmation}");


    final value_user = await dio.post("${baseurl}auth/register",data: user_form);

    if(value_user.statusCode ==200){
      final result_user = register.fromJson(value_user.data);
      return result_user;
    }
    else{
      throw "Something went wrong";
    }
  }

}
