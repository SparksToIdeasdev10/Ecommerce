import 'package:ecommerce/screens/edit_Profile/edit_profile_apiservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfileController extends GetxController {

  var isLoading = false.obs;
  var profileData = {}.obs;

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController photoController = TextEditingController();




  // Get token from SharedPreferences
  Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print("🔑 Retrieved token for edit profile: $token");
      return token;
    } catch (e) {
      print("❌ Error getting token: $e");
      return null;
    }
  }

  // Fetch current profile data
// In your controller
  Future<void> fetchUserProfile() async {

    String? token = await getToken();

    print("Token  ${token}");

    try {
      isLoading.value = true;

      // Call the API service
      final profileResponse = await apiservices().fetchprofile(token ?? "");

      if (profileResponse.status) {
        final user = profileResponse.data;
        String fullname =user.firstName+user.lastName;
        print("${fullname}");
        // Print user data for debugging
        print("✅ User Data Loaded:");
        print("   ID: ${user.id}");
        print("   Name: ${user.fullName}");
        print("   Email: ${user.email}");
        print("   Phone: ${user.phone}");
        print("   Email Verified: ${user.isEmailVerified}");

        fullnameController.text = user.fullName;
        mobileController.text = user.phone;
        emailController.text = user.email;

        Get.snackbar("Success", "Profile loaded successfully!");
      } else {
        Get.snackbar("Error", "Failed to load profile");
      }
    } catch (e) {
      // Get.snackbar("Error", "Failed to fetch profile: $e");
    } finally {
      isLoading.value = false;
    }

  }
  // Update profile
  // Future<void> updateProfile({
  //   required String firstName,
  //   required String lastName,
  //   required String phone,
  //   required String email,
  // })
  // async {
  //   try {
  //     isLoading.value = true;
  //
  //     String? token = await getToken();
  //
  //     if (token == null) {
  //       Get.snackbar("Error", "Please login again");
  //       return;
  //     }
  //
  //     final response = await _apiService.editProfile(
  //       token: token,
  //       firstName: firstName,
  //       lastName: lastName,
  //       phone: phone,
  //       email: email,
  //     );
  //
  //     if (response['status'] == true) {
  //       Get.snackbar("Success", "Profile updated successfully");
  //       Get.back(); // Go back to previous screen
  //     } else {
  //       Get.snackbar("Error", response['message'] ?? "Failed to update profile");
  //     }
  //   } catch (e) {
  //     print("Update Profile Error: $e");
  //     Get.snackbar("Error", "Failed to update profile");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
//update profile

// In your EditProfileController - ADD this method
  Future<void> updateUserProfile() async {
    try {
      isLoading.value = true;

      String? token = await getToken();

      if (token == null || token.isEmpty) {
        Get.snackbar("Error", "Please login again");
        return;
      }

      // Split full name into first and last name
      List<String> nameParts = fullnameController.text.trim().split(' ');
      String firstName = nameParts.first;
      String lastName = nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '';

      print("🔄 Updating profile with:");
      print("   First Name: $firstName");
      print("   Last Name: $lastName");
      print("   Email: ${emailController.text}");
      print("   Phone: ${mobileController.text}");

      // Call the UPDATE API
      final updateResponse = await apiservices().updateprofile(
        token: token,
        first_name: firstName,
        last_name: lastName,
        email: emailController.text,
        phone: mobileController.text,
        password: "", // Add if you have password field
        photo: "", // Add if you have photo upload
      );

      if (updateResponse.status) {
        // SUCCESS - Profile updated
        Get.snackbar(
          "Success",
          updateResponse.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        print("✅ Profile updated successfully!");
        print("   New Name: ${updateResponse.data.fullName}");
        print("   New Email: ${updateResponse.data.email}");
        print("   New Phone: ${updateResponse.data.phone}");

        // Update the form fields with the response data
        fullnameController.text = updateResponse.data.fullName;
        emailController.text = updateResponse.data.email;
        mobileController.text = updateResponse.data.phone;

      } else {
        Get.snackbar("Error", updateResponse.message);
      }
    } catch (e) {
      print("❌ Error updating profile: $e");
      Get.snackbar(
        "Error",
        "Failed to update profile: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}




//
// // edit_profile_controller.dart
// import 'package:ecommerce/screens/dashboard/home_categories/home_categories_apiservice.dart';
// import 'package:ecommerce/screens/edit_Profile/edit_profile_apiservice.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'edit_profile_model.dart';
//
//
// class EditProfileController extends GetxController {
//   // TextEditingControllers for form fields
//   TextEditingController fullnameController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//
//   // Observable variables
//   var isLoading = false.obs;
//   var userProfile = UserProfileResponse(
//     status: false,
//     message: '',
//     data: User(
//       id: 0,
//       firstName: '',
//       lastName: '',
//       phone: '',
//       email: '',
//       createdAt: '',
//       updatedAt: '',
//       emailVerify: 0,
//     ),
//   ).obs;
//
//   // Get token from SharedPreferences
//   Future<String?> getToken() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('token');
//       print("🔑 Retrieved token for profile: $token");
//       return token;
//     } catch (e) {
//       print("❌ Error getting token: $e");
//       return null;
//     }
//   }
//
//   // Fetch user profile
//   Future<void> fetchUserProfile() async {
//     try {
//       isLoading.value = true;
//       print("🔄 Starting to fetch user profile...");
//
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         throw "No token found. Please login again.";
//       }
//
//       final response = await apiservices().fetchprofile(token);
//
//       if (response.status) {
//         userProfile.value = response;
//         // Fill the form with user data
//         _fillFormWithUserData(response.data); // Changed from response.user to response.data
//         print("✅ Profile data loaded successfully");
//         print("👤 User: ${response.data.fullName}");
//         print("📞 Phone: ${response.data.phone}");
//         print("📧 Email: ${response.data.email}");
//       } else {
//         throw "Failed to load profile data: ${response.message}";
//       }
//     } catch (e) {
//       print("❌ Error fetching profile: $e");
//       Get.snackbar(
//         "Error",
//         "Failed to load profile: $e",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Fill form with user data
//   void _fillFormWithUserData(User user) {
//     fullnameController.text = user.fullName;
//     mobileController.text = user.phone;
//     emailController.text = user.email;
//
//     print("📝 Form filled with data:");
//     print("Full Name: ${user.fullName}");
//     print("Phone: ${user.phone}");
//     print("Email: ${user.email}");
//   }
//
//   // Update profile method
//   Future<void> updateProfile() async {
//     try {
//       isLoading.value = true;
//       // Implement your update API call here
//       print("🔄 Updating profile...");
//
//       // Example update logic:
//       // final updatedUser = User(
//       //   id: userProfile.value.data.id,
//       //   firstName: fullnameController.text.split(' ').first,
//       //   lastName: fullnameController.text.split(' ').last,
//       //   phone: mobileController.text,
//       //   email: emailController.text,
//       //   // ... other fields
//       // );
//
//       Get.snackbar(
//         "Success",
//         "Profile updated successfully",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } catch (e) {
//       Get.snackbar(
//         "Error",
//         "Failed to update profile: $e",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   @override
//   void onClose() {
//     fullnameController.dispose();
//     mobileController.dispose();
//     emailController.dispose();
//     super.onClose();
//   }
// }
