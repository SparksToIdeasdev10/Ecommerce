import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class privacypolicy extends StatefulWidget {
  const privacypolicy({super.key});

  @override
  State<privacypolicy> createState() => _privacypolicyState();
}

class _privacypolicyState extends State<privacypolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){
          Get.back();
        },
            child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Color(0xFF004643),
        title: Text("Privacy Policy",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: SingleChildScrollView(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 30),
              child: Text("Security and Privacy policy",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF004643)),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 20),
              child:
              Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,"),
            ),SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Consent",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF004643)),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("What personal data we collect?",style: TextStyle(color: Color(0xFF004643),fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("How do we use your data?",style: TextStyle(color: Color(0xFF004643),fontWeight: FontWeight.bold),),
            ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Read More",style: TextStyle(color: Color(0xFF004643)),),
                SizedBox(width: 4),
                Icon(Icons.arrow_forward_ios_outlined, size: 12)
              ],
            ),
          ),
        )
        ]),
      ),
    );
  }
}
