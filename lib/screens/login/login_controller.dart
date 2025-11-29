import 'package:ecommerce/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:ecommerce/screens/dashboard/dashboard_screen.dart';
import 'package:ecommerce/screens/login/login_apiservices.dart';
import 'package:ecommerce/screens/login/register_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_model.dart';

class Authcontroller extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isloginloading = false.obs;
  var loginresponse = login().obs;

  // Method to save ONLY token to SharedPreferences
  Future<void> _saveToken(String token) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      print("💾 Token saved to SharedPreferences: $token");
    } catch (e) {
      print("❌ Error saving token: $e");
    }
  }

  // Method to get token from SharedPreferences
  Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print("🔑 Retrieved token: $token");
      return token;
    } catch (e) {
      print("❌ Error getting token: $e");
      return null;
    }
  }

  Future<void>loginpage()async{
    try{
      isloginloading.value = true;
      final respo = await apiservices().loginpage(emailController.text, passwordController.text);

      if(respo.status == true){
        loginresponse = respo.obs;
        // Save ONLY the token to SharedPreferences
        if (respo.token != null && respo.token!.isNotEmpty) {
          await _saveToken(respo.token!);
        }
        Get.snackbar("Success", "${respo.message}",snackPosition: SnackPosition.TOP);
        Get.to(BottomNavScreen());
        print("Login Successfull Token: ${respo.token}");
      }
      else{
        loginresponse = respo.obs;
        Get.snackbar("Error", "${loginresponse.value.message}");
      }
    }
    catch(e){
      isloginloading(false);
      print("Login Error $e");
    }
    finally{
      isloginloading(false);
    }
  }

  //Register controller
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();


  var isregloading = false.obs;
  var regresponse = register().obs;


  Future<void>registers()async{
    try{
      isregloading.value = true;
      final respo = await apiservices().registers(firstnameController.text,
          lastnameController.text,EmailController.text,phoneController.text,
          PasswordController.text);

      if(respo.status == true){
        regresponse = respo.obs;
        Get.snackbar("Sucess", "${respo.message}",snackPosition: SnackPosition.TOP);
        print("Login Sucessful");
        Get.to(HomeScreen());
      }
      else{
        regresponse = respo.obs;
        Get.snackbar("Error", "${regresponse.value.message}");
      }
    }
    catch(e){
      isregloading(false);
      print("Login Error $e");
    }
    finally{
      isregloading(false);
    }
  }


}