import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class notificationscreen extends StatefulWidget {
  const notificationscreen({super.key});

  @override
  State<notificationscreen> createState() => _notificationscreenState();
}

class _notificationscreenState extends State<notificationscreen> {
  final Color themeColor = const Color(0xFF16423C);
  final List<Map<String, dynamic>> popular = [
    {
      'title': 'assets/images/systemlogo.png',
      'searches': 'System',
      'price':'Your Order has been success....',

    },
    {
      'title': 'assets/images/img_2.png',
      'searches': ' Promotion',
      'price':'Invite friends - Get 3 coupon each!',


    },
    {
      'title': 'assets/images/img_2.png',
      'searches': 'Promotion',
      'price':'Invite friends - Get 3 coupon each!',

    },
    {
      'title': 'assets/images/img_3.png',
      'searches': 'System',
      'price':'Your Order has been Cancelled',

    },{
      'title': 'assets/images/img_4.png',
      'searches': 'Promotion',
      'price':'Invite friends - Get 3 coupon each!',

    },{
      'title': 'assets/images/img_2.png',
      'searches': 'Promotion',
      'price':'Invite friends - Get 3 coupon each!',

    },{
      'title': 'assets/images/img_5.png',
      'searches': 'System',
      'price':'TYour Order has been success....',

    },{
      'title': 'assets/images/img_3.png',
      'searches': 'System',
      'price':'Your Order has been Cancelled',

    },


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){
          Get.back();
        },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Color(0xFF16423C),
        title: Text("Notification",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,
        fontSize: Get.width * 0.045),),
      ),

      body: Padding(
        //padding: const EdgeInsets.all(8.0),
        padding: EdgeInsets.all(Get.width * 0.03),
        child: Column(
          children: popular.asMap().entries.map((entry) {
            final index = entry.key;
            final search = entry.value;

            return Column(
              children: [
                Padding(
                  //padding: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(Get.width * 0.02),
                  child: Container(
                    decoration: BoxDecoration(
                      // Your background color
                      borderRadius: BorderRadius.circular(0), // Remove border radius for clean lines
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFF16423C),
                          child: Padding(
                            //padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            padding: EdgeInsets.all(Get.width * 0.02),
                            child: Image.asset(search['title'])
                          ),
                        ),
                        //SizedBox(width: 20,),
                        SizedBox(width: Get.width * 0.04),

                        // Product Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //const SizedBox(height: 4),
                              SizedBox(height: Get.height * 0.005),
                              Text(
                                search['searches'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  //fontSize: 18,
                                  fontSize: Get.width * 0.04,
                                ),
                              ),
                              //const SizedBox(height: 8),
                              SizedBox(height: Get.height * 0.008),
                              Text(
                                search['price'],
                                style: TextStyle(
                                  color: Colors.grey,
                                  //fontSize: 16,
                                  fontSize: Get.width * 0.035,
                                ),
                              ),
                            ],
                          ),
                        ),







                      ],



                    ),
                  ),
                ),
                // Add divider line between items (except after the last one)
                if (index < popular.length - 1)
                Padding(
                  //padding: const EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(Get.width * 0.02),
                  child: Container(
                    height: 1,
                    color: Colors.black, // Line color
                    //margin: const EdgeInsets.symmetric(horizontal: 16), // Optional: add horizontal margin to line
                    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.04), // Optional: add horizontal margin to line
                  ),
                ),

              ],
            );
          }).toList(),
        ),
      ),


    );
  }
}
