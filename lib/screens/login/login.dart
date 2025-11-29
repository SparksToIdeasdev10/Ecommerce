import 'package:ecommerce/customs/buttonscreen.dart';
import 'package:ecommerce/customs/textfields.dart';
import 'package:ecommerce/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:ecommerce/screens/dashboard/dashboard_screen.dart';
import 'package:ecommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/screens/login/login_controller.dart';
import 'package:ecommerce/screens/login/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  final int initialTabIndex; // Add this parameter

   LoginScreen({super.key, this.initialTabIndex = 0});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  Authcontroller logins = Get.put(Authcontroller());
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: widget.initialTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    final themeColor = const Color(0xFF004643);
    final unselectedColor = Colors.white;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Logo
              Image.asset(
                "assets/images/Logo.png",
                height: 120,
              ),
              const SizedBox(height: 20),

              // Tab Bar
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF2E8CF), // Changed: background is now theme color
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: themeColor, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: themeColor, // Changed: selected tab is now white
                    ),
                    labelColor: Color(0xFFF2E8CF), // Changed: selected tab text is theme color
                    unselectedLabelColor: themeColor, // Changed: unselected text is white
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                    tabs: const [
                      Tab(text: 'Login'),
                      Tab(text: 'Register'),
                    ],
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Tab Bar View
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Login Tab
                    _buildLoginTab(themeColor),

                    // Register Tab
                    _buildRegisterTab(themeColor),
                  ],
                ),
              ),

              // Bottom Text for Login Tab
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Container(
                  alignment: Alignment.center,
                  child: _buildBottomText(themeColor),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomText(Color themeColor) {
    return AnimatedBuilder(
      animation: _tabController,
      builder: (context, child) {
        return _tabController.index == 0
            ? _buildBottomLoginText(themeColor)
            : _buildBottomRegisterText(themeColor);
      },
    );
  }

  Widget _buildBottomLoginText(Color themeColor) {
    return GestureDetector(
      onTap: () {
        _tabController.animateTo(1); // Switch to Register tab
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Don't have an account? ",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.normal,
          ),
          children: [
            TextSpan(
              text: "Register",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomRegisterText(Color themeColor) {
    return GestureDetector(
      onTap: () {
        _tabController.animateTo(0); // Switch to Login tab
      },
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Already have an account? ",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.normal,
          ),
          children: [
            TextSpan(
              text: "Login",
              style: TextStyle(
                color: themeColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginTab(Color themeColor) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Mobile Number Field
          _buildLabel("Email", themeColor),
          const SizedBox(height: 8),
          CustomTextField(
            controller: logins.emailController,
            hintText: 'Enter your Email',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
          ),
          const SizedBox(height: 16),

          // Password Field
          _buildLabel("Password", themeColor),
          const SizedBox(height: 8),
          CustomTextField(
            controller: logins.passwordController,
            hintText: 'Enter your password',
            obscureText: true,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
          ),
          const SizedBox(height: 8),

          // Forgot Password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Get.to(ForgotPasswodScreen());
                // Add forgot password logic
                print("Forgot password pressed!");
              },
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: themeColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Login Button
          Obx(()=>logins.isloginloading.value
            ?Center(child: CircularProgressIndicator(),)
          :CustomButton(
                text: "Login",
               // onPressed: _login,
                onPressed: (){
                  if(logins.emailController.text.isNotEmpty&&logins.passwordController.text.isNotEmpty){
                    logins.loginpage();

                  }
                  else{
                    Get.snackbar("Error", "Please enter username and password");
                  }

                },
              ),),

          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildRegisterTab(Color themeColor) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Full Name Field
          _buildLabel("Full Name", themeColor),
          const SizedBox(height: 8),
          CustomTextField(
            controller: logins.firstnameController,
            hintText: 'Enter your full name',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
          ),
          const SizedBox(height: 16),

          // Mobile Number Field
          _buildLabel("Mobile Number", themeColor),
          const SizedBox(height: 8),
          CustomTextField(
            controller: logins.lastnameController,
            hintText: 'Enter your Number',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
          ),
          const SizedBox(height: 16),

          // Email Field
          _buildLabel("Email", themeColor),
          const SizedBox(height: 8),
          CustomTextField(
            controller: logins.EmailController,
            hintText: 'Enter your email',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
          ),
          const SizedBox(height: 16),

          // Password Field
          _buildLabel("Password", themeColor),
          const SizedBox(height: 8),
          CustomTextField(
            controller: logins.phoneController,
            hintText: 'Enter your password',
            obscureText: true,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
          ),
          const SizedBox(height: 16),

          // Confirm Password Field
          _buildLabel("Confirm Password", themeColor),
          const SizedBox(height: 8),
          CustomTextField(
            controller: logins.PasswordController,
            hintText: 'Confirm your password',
            obscureText: true,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
          ),
          const SizedBox(height: 20),

          // Register Button
          Obx(()=> logins.isregloading.value
            ?Center(child: CircularProgressIndicator(),)
              :CustomButton(
            text: "Register",
            onPressed: (){
              if(logins.firstnameController.text.isNotEmpty&&logins.lastnameController.text.isNotEmpty&&
                  logins.EmailController.text.isNotEmpty&&logins.PasswordController.text.isNotEmpty){
                logins.registers();
              }

              else{
                Get.snackbar("Error", "Please enter all fields");

              }

            },
          ),
          ),

          const SizedBox(height: 20),
          
        ],
      ),
    );
  }

  Widget _buildLabel(String text, Color color) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}