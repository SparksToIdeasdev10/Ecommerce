import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../customs/buttonscreen.dart';
import '../../customs/textfields.dart';
import '../My_order/my_order_screen.dart';

class addnewcard extends StatelessWidget {


 addnewcard({super.key});
  final themeColor = const Color(0xFF004643);
  final TextEditingController cardController = TextEditingController();
  final TextEditingController cardholderController = TextEditingController();
  final TextEditingController expiryontroller = TextEditingController();
  final TextEditingController CVVController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){
          Get.back();
        },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Color(0xFF16423C),
        title: Text("Add New Card",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50,left: 10),
              child: Text("Card Number",style: TextStyle(color: Color(0xFF16423C),
              fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomTextField(
               controller: cardController,
                hintText: 'Card Number',
                obscureText: false,
                borderColor: Colors.grey[300]!,
                focusedBorderColor: themeColor,
                isRequired: true,
                borderRadius: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Card Holder Name",style: TextStyle(color: Color(0xFF16423C),
                  fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomTextField(
                controller: cardholderController,
                hintText: 'Card Holder Name',
                obscureText: false,
                borderColor: Colors.grey[300]!,
                focusedBorderColor: themeColor,
                isRequired: true,
                borderRadius: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Expiry Date",style: TextStyle(color: Color(0xFF16423C),
                  fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomTextField(
                controller: expiryontroller,
                hintText: 'Expiry Date',
                obscureText: false,
                borderColor: Colors.grey[300]!,
                focusedBorderColor: themeColor,
                isRequired: true,
                borderRadius: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("CVV",style: TextStyle(color: Color(0xFF16423C),
                  fontWeight: FontWeight.bold,fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CustomTextField(
                controller: CVVController,
                hintText: 'CVV',
                obscureText: false,
                borderColor: Colors.grey[300]!,
                focusedBorderColor: themeColor,
                isRequired: true,
                borderRadius: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 78.0), // Match left padding
              child: CustomButton(
                text: "Add Card",
                onPressed: () {
                  Get.to(MyOrderScreen());
                  // Add your button action here
                  print("Get Started button pressed!");
                  // You can add navigation or other logic here
                },
              ),
            ),
          ],
        ),

      ),
    );
  }
}
