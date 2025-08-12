import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:autoyard/CommonController/CommonController.dart';
import 'package:autoyard/Models/Car_Brand_Model.dart';
import 'package:autoyard/View/Auth/Email_Verification.dart';
import 'package:autoyard/View/Auth/Forget_password.dart';
import 'package:autoyard/View/Auth/Login_Screen.dart';
import 'package:autoyard/View/HomeScreen/Car_Details.dart';
import 'package:autoyard/View/HomeScreen/HomeScreen.dart';
import 'package:autoyard/View/HomeScreen/Profile_Display.dart';
import 'package:autoyard/View/HomeScreen/Saved_Successfully.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http_parser/http_parser.dart'; // <-- Add this line

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../pdf.dart';
class Api_Interface {

  CommonContoller commonContoller = Get.find<CommonContoller>();
  static const baseurl = 'https://app.autoyard.com.au/api/v1/';
  Future authenticateUser(String email, String password) async {
    // API URL
    final String apiUrl = "${baseurl}auth/authenticate";

    // Request body
    Map<String, String> requestBody = {
      'email': email,
      'password': password,
    };

    // Making the POST request
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json', // Specify the content type
        },
        body: jsonEncode(requestBody), // Encode the body as JSON
      );

      // Check if the request was successful
      if (response.statusCode == 200) {

        var responseData = jsonDecode(response.body);
        commonContoller.bearertoken.value = responseData['data']['authorisation']['token'];
        commonContoller.user_email.value=responseData['data']['user']['email'];
        log(commonContoller.bearertoken.value);
        print(responseData['data']['user']['verified']);
        if(responseData['data']['user']['verified']==true){
          final box=await Hive.openBox('Credentials');
          box.put('uid', '${responseData['data']['authorisation']['token']}');
          Get.to(HomeScreen());
        }else if(responseData['data']['user']['verified']==false){
          print('true');
          Get.to(Email_Verification());
        }
        // You can handle the response data here
      } else {
        var responseData = jsonDecode(response.body);

        // The server returned an error
        log("Failed to authenticate: ${response.statusCode}");
        log("Error: ${response.body}");
        Get.snackbar('', '${responseData['message']}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }
  Future Update_Car_Status(String id, String status) async {
    // API URL
    final String apiUrl = "https://app.autoyard.com.au/api/v1/assign_vehicle/status/${id}";

    // Request body
    Map<String, String> requestBody = {
      'status': status,
    };

    // Making the POST request
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${commonContoller.bearertoken.value}',

          // Specify the content type
        },
        body: jsonEncode(requestBody), // Encode the body as JSON
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        log(responseData['message']);
        Get.snackbar('', '${responseData['message']}',
            colorText: Colors.black);
        // You can handle the response data here
      } else {
        // The server returned an error
        log("${response.statusCode}");
        log("Error: ${response.body}");

        Get.snackbar('', '${response.body}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }
  Future ForgetPassword(String email,) async {
    // API URL
    final String apiUrl = "https://app.autoyard.com.au/api/v1/auth/forgot-password";

    // Request body
    Map<String, String> requestBody = {
      'email': email,
    };

    // Making the POST request
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          // Specify the content type
        },
        body: jsonEncode(requestBody), // Encode the body as JSON
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        log(responseData['message']);
        Get.snackbar('', '${responseData['message']}',
            colorText: Colors.black);
        // You can handle the response data here
      } else {
        // The server returned an error
        log("${response.statusCode}");
        log("Error: ${response.body}");
        var responseData = jsonDecode(response.body);

        Get.snackbar('', '${responseData['message']}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }
  Future EmailVerification() async {
    // API URL
    final String apiUrl = "https://app.autoyard.com.au/api/v1/auth/resend-verification-email";

    // Request body

    // Making the POST request
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${commonContoller.bearertoken.value}',

          // Specify the content type
        },
        // Encode the body as JSON
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        log(responseData['message']);
        Get.snackbar('', '${responseData['message']}',
            colorText: Colors.black);
        // You can handle the response data here
      } else {
        // The server returned an error
        log("${response.statusCode}");
        log("Error: ${response.body}");
        var responseData = jsonDecode(response.body);

        Get.snackbar('', '${responseData['message']}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }
  Future Car_Details_Email(String user_email) async {
    final String apiUrl = "https://app.autoyard.com.au/api/v1/vehicle/send_purchase_receipt/${commonContoller.Add_a_Car_id}?email=${user_email}";

    // Request body

    // Making the POST request
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${commonContoller.bearertoken.value}',

          // Specify the content type
        },
        // Encode the body as JSON
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        log(responseData['message']);
        Get.snackbar('', '${responseData['message']}',
            colorText: Colors.black);
        // You can handle the response data here
      } else {
        // The server returned an error
        log("${response.statusCode}");
        log("Error: ${response.body}");
        var responseData = jsonDecode(response.body);

        Get.snackbar('', '${responseData['data']['email']}');
      }
    } catch (e) {
      Get.snackbar('', '${e}');

      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }

  Future Sign_up(String first_name, String last_name,String phone_number, String email, String password, String password_confirmation, String activation_key) async {
    // API URL
    final String apiUrl = "https://app.autoyard.com.au/api/v1/auth/signup_driver";

    // Request body
    Map<String, String> requestBody = {
      'first_name': first_name,
      'last_name': last_name,
      'phone_number': phone_number,
      'email': email,
      'password': password,
      'send_details_to':'email',
      'password_confirmation': password_confirmation,
      'activation_key': activation_key,
    };

    // Making the POST request
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',


          // Specify the content type
        },
        body: jsonEncode(requestBody), // Encode the body as JSON
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        Get.to(Login_Screen());
        commonContoller.bearertoken.value = responseData['data']['authorisation']['token'];
        print(commonContoller.bearertoken.value);
        final box=await Hive.openBox('Credentials');
        box.put('uid', '${responseData['data']['authorisation']['token']}');
        log(responseData['message']);
        Get.snackbar('', '${responseData['message']}',
            colorText: Colors.black);
        // You can handle the response data here
      } else {
        var responseData = jsonDecode(response.body);

        // The server returned an error
        log("${response.statusCode}");
        log("Error: ${response.body}");

        Get.snackbar('', '${responseData['data']}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }

  Future Get_All_Pickups() async {
    // API URL
    final String apiUrl = "${baseurl}assign_vehicle?orderby=id&order=DESC";

    // Making the GET request
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          // Specify the content type
          'Authorization': 'Bearer ${commonContoller.bearertoken.value}',
          // Include the Bearer token
        },
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // log("Data retrieval successful: $responseData");
        commonContoller.length_of_assign_car.value=responseData['data'].length;
        return responseData;
        // You can handle the response data here
      } else {
        // The server returned an error
        log("Failed to retrieve data: ${response.statusCode}");
        log("Error: ${response.body}");
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }
  Future Get_View_Car_Details() async {
    // API URL
    final String apiUrl = "https://app.autoyard.com.au/api/v1/vehicle/${commonContoller.Add_a_Car_id}";

    // Making the GET request
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          // Specify the content type
          'Authorization': 'Bearer ${commonContoller.bearertoken.value}',
          // Include the Bearer token
        },
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        // log("Data retrieval successful: $responseData");
        return responseData['data'];
        // You can handle the response data here
      } else {
        // The server returned an error
        log("Failed to retrieve data: ${response.statusCode}");
        log("Error: ${response.body}");
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }


  Future<void> Get_Purchase_recepit_pdf(BuildContext context) async {
    final String apiUrl = "https://app.autoyard.com.au/api/v1/vehicle/purchase_receipt/${commonContoller.Add_a_Car_id}";

    try {
      log("Fetching receipt with Bearer Token: ${commonContoller.bearertoken.value}");
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${commonContoller.bearertoken.value}', // Use dynamic token
        },
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        var receiptUrl = responseData['data']['receipt_url'];


        if (receiptUrl != null && receiptUrl.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PDFScreen(pdfUrl: receiptUrl),
            ),
          );
        } else {
          log("No receipt URL found in the response data.");
        }
      } else {
        log("Failed to retrieve data: ${response.statusCode}");
        log("Error: ${response.body}");
      }
    } catch (e) {
      log("An error occurred: $e");
    }
  }

  Future Get_history_by_date(String datetime, String status) async {
    // API URL
    final String apiUrl = "https://app.autoyard.com.au/api/v1/assign_vehicle?orderby=id&status=${status}&date=${datetime}";

    // Making the GET request
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          // Specify the content type
          'Authorization': 'Bearer ${commonContoller.bearertoken.value}',
          // Include the Bearer token
        },
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        log("Data retrieval successful: $responseData");
        return responseData['data'];
        // You can handle the response data here
      } else {
        // The server returned an error
        log("Failed to retrieve data: ${response.statusCode}");
        log("Error: ${response.body}");
        Get.snackbar('', '${response.body}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }
  Future Get_Registration_by_no(String Registration_no, String Registration_state) async {
    // API URL
    final String apiUrl = "https://app.autoyard.com.au/api/v1/vehicle/search-vehicle-details?registration_state=${Registration_state}&registration_number=${Registration_no}";


    // Making the GET request
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${commonContoller.bearertoken.value}',
        },
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        commonContoller.selectedCarMake.value=responseData['data']['brand']['name'];
        commonContoller.selectedCarModel.value=responseData['data']['model']['name'];
        commonContoller.Car_Body_type_Controller.text=responseData['data']['body_type'];
        commonContoller.Car_Engine_Controller.text=responseData['data']['engine_number'];
        commonContoller.Car_Vin_Controller.text=responseData['data']['vin_number'];
        commonContoller.Car_Variant_Series_Controller.text=responseData['data']['variant'];
        commonContoller.selected_transmission.value=responseData['data']['transmission'];
        commonContoller.Car_Engine_Size_Controller.text=responseData['data']['engine_size'];
        // commonContoller.Car_Built_Controller=responseData['data']['year'] as RxString;
        commonContoller.Selected_Car_Make_id.value=responseData['data']['brand']['id'];
        commonContoller.Selected_Car_Model_id.value=responseData['data']['model']['id'];
        commonContoller.Car_RegistrationNo_Controller.text=responseData['data']['registration_number'];
        print('car make ${commonContoller.selectedCarMake.value}');
        Get.to(Car_Details(origin: 'Automatic'));
        print(responseData['data']); // Convert Map to String using jsonEncode
        return responseData['data'];
      } else {
        // The server returned an error
        log("Failed to retrieve data: ${response.statusCode}");
        log("Error: ${response.body}");
        Get.snackbar('', '${response.body}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      print("An error occurred: $e");
    }
  }
  Future Get_Car_Brand() async {
    // API URL
    final String apiUrl = "https://app.autoyard.com.au/api/v1/brand?status=active";

    // Making the GET request
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          // Specify the content type
          'Authorization': 'Bearer ${commonContoller.bearertoken.value}',
          // Include the Bearer token
        },
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        log('data ${responseData['data']}');

        return responseData['data'];
        // You can handle the response data here
      } else {
        // The server returned an error
        log("Failed to retrieve data: ${response.statusCode}");
        log("Error: ${response.body}");
        Get.snackbar('', '${response.body}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }
  Future Get_Car_Model(String id) async {
    // API URL
    final String apiUrl = "https://app.autoyard.com.au/api/v1/model?status=active&brand=$id";

    // Making the GET request
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          // Specify the content type
          'Authorization': 'Bearer ${commonContoller.bearertoken.value}',
          // Include the Bearer token
        },
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        commonContoller.carVariantlList.clear();
        commonContoller.carVariant_id_List.clear();
        for(int i=0; i<responseData['data'].length; i++){

          commonContoller.carVariant_id_List.add(CarBrand(id: responseData['data'][i]['id'], name: responseData['data'][i]['name']));
          commonContoller.carVariantlList.add(responseData['data'][i]['name']);
        }
        log('data ${commonContoller.carModelList}');
        return responseData['data'];
        // You can handle the response data here
      } else {
        // The server returned an error
        log("Failed to retrieve data: ${response.statusCode}");
        log("Error: ${response.body}");
        Get.snackbar('', '${response.body}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }

  Future Get_User_Details() async {
    // API URL
    final String apiUrl = "${baseurl}auth/get-user";

    // Making the GET request
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          // Specify the content type
          'Authorization': 'Bearer ${commonContoller.bearertoken.value}',
          // Include the Bearer token
        },
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);

        commonContoller.user_First_name.value = responseData['data']['user']['first_name'] ?? '';
        commonContoller.user_Last_name.value = responseData['data']['user']['last_name'] ?? '';
        commonContoller.user_Phone_No.value = responseData['data']['user']['phone_number'] ?? '';

        // Check if profile_image_url is null and assign a default image or an empty string
        commonContoller.user_Image.value = responseData['data']['user']['profile_image_url'] ?? '';

        commonContoller.user_email.value = responseData['data']['user']['email'] ?? '';
        log('Profile Image ${commonContoller.user_Image.value}');
        return responseData;
      } else {
        log("Failed to retrieve data: ${response.statusCode}");
        log("Error: ${response.body}");
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }
  Future Get_all_Notifications() async {
    // API URL
    final String apiUrl = "https://app.autoyard.com.au/api/v1/notification?orderby=created_at&order=DESC&perpage=10&page=1";

    // Making the GET request
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          // Specify the content type
          'Authorization': 'Bearer ${commonContoller.bearertoken.value}',
          // Include the Bearer token
        },
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);

        log("Data retrieval successful: ${responseData}");

        return responseData['data'];
        // You can handle the response data here
      } else {

        log("Failed to retrieve data: ${response.statusCode}");
        log("Error: ${response.body}");
        Get.snackbar('', '${response.body}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }

  Future Get_detail_Single_Pickup(String id) async {
    // API URL
    final String apiUrl = "${baseurl}assign_vehicle/${id}";

    // Making the GET request
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          // Specify the content type
          'Authorization': 'Bearer ${commonContoller.bearertoken.value}',
          // Include the Bearer token
        },
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        log("Data retrieval successful: $responseData");
        return responseData;
        // You can handle the response data here
      } else {
        // The server returned an error
        log("Failed to retrieve data: ${response.statusCode}");
        log("Error: ${response.body}");
        Get.snackbar('', '${response.body}');
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }
  Future<void> Profile_Edit(String firstname, String lastname, String phone_no, File profileImage) async {
    // API URL
    final String apiUrl = "https://app.autoyard.com.au/api/v1/auth/account-settings";

    try {
      // Create a multipart request
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));

      // Add headers
      request.headers.addAll({
        'Authorization': 'Bearer ${commonContoller.bearertoken.value}',
      });

      // Add text fields
      request.fields['first_name'] = firstname;
      request.fields['last_name'] = lastname;
      request.fields['phone_number'] = phone_no;
      request.fields['send_details_to'] = 'email';

      // Add the profile image if it exists
      if (profileImage != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'profile_image', // This is the key name for the image
            profileImage.path,
            contentType: MediaType('image', 'jpeg'), // Change this based on your image type
          ),
        );
      }

      // Send the request
      var response = await request.send();

      // Check if the request was successful
      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        Get.snackbar('Success', 'Profile updated successfully');
        log("Data uploaded successfully");
        Get_User_Details().then((value)  {
          Get.to(ProfileDisplay());
        });
      } else {
        // The server returned an error
        log("Failed to upload data: ${response.statusCode}");
        var responseData = await response.stream.bytesToString();
        log("Error: $responseData");
      }
    } catch (e) {
      // Handle any exceptions that occurred during the request
      log("An error occurred: $e");
    }
  }
  Future<void> Add_a_car(Map body) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${baseurl}vehicle/create'),
    );

    // Add authorization header
    request.headers['Authorization'] =
    'Bearer ${commonContoller.bearertoken.value}'; // Replace with your actual token

    // Add the signature image file under different keys
    request.files.add(
      http.MultipartFile.fromBytes(
        'owner_signature',
        commonContoller.Seller_Signature_Image.value!,
        filename: 'signature1.png',
        contentType: MediaType('image', 'png'),
      ),
    );

    request.files.add(
      http.MultipartFile.fromBytes(
        'buyer_signature',
        commonContoller.Buyer_Signature_Image.value!,
        filename: 'signature2.png',
        contentType: MediaType('image', 'png'),
      ),
    );
    request.fields['terms'] = '${commonContoller.terms_condition.value}';
    request.fields['step'] = '3';
    request.fields['brand'] = '${commonContoller.Selected_Car_Make_id.value}';
    request.fields['model'] = '${commonContoller.Selected_Car_Model_id.value}';
    request.fields['built'] = '${commonContoller.Car_Built_Controller.value}';
    request.fields['vin_number'] = '${commonContoller.Car_Vin_Controller.value.text}';
    request.fields['transmission'] = '${commonContoller.selected_transmission.value}';
    request.fields['first_name'] = '${commonContoller.First_Name_Controller.value.text}';
    request.fields['last_name'] = '${commonContoller.Last_Name_Controller.value.text}';
    request.fields['license_number'] = '${commonContoller.License_Controller.value.text}';
    request.fields['pickup_address'] = '${commonContoller.Pickup_Address_Controller.value.text}';
    request.fields['pickup_date'] = '${commonContoller.Pickup_Date_Controller.value}';
    request.fields['registration_number'] = '${commonContoller.Car_RegistrationNo_Controller.value.text}';
    request.fields['pickup_address'] = '${commonContoller.Pickup_Address_Controller.value.text}';
    request.fields['residential_address'] = '${commonContoller.Pickup_residential_Address_Controller.value.text}';
    request.fields['registration_date'] = '${commonContoller.Car_RegistrationDue_Controller.value}';
    request.fields['engine_size'] = '${commonContoller.Car_Engine_Size_Controller.value.text}';
    request.fields['engine_number'] = '${commonContoller.Car_Engine_Controller.value.text}';
    request.fields['transmission'] = '${commonContoller.selected_transmission.value}';
    request.fields['body_type'] = '${commonContoller.Car_Body_type_Controller.value.text}';
    request.fields['variant'] = '${commonContoller.Car_Variant_Series_Controller.value.text}';
    request.fields['built'] = '${commonContoller.Car_Built_Controller.value}';
    request.fields['odometer'] = '${commonContoller.Car_Odameter_Controller.value.text}';
    request.fields['note'] = '${commonContoller.Add_Note_Controller.value.text}';
    request.fields['date_of_birth'] = '${commonContoller.Date_of_birth_Controller.value}';
    request.fields['phone_number'] = '${commonContoller.Phone_No_Controller.value.text}';
    request.fields['same_pickup_address'] = '0';
    request.fields['vehicle_condition'] = '{"drivable": "${commonContoller.Car_Driverable}", "accidental": "${commonContoller.Car_Accidental}", "wovi": "${commonContoller.Car_Wovi}", "under_finance": "${commonContoller.Car_Finance}"}';
    request.fields['price'] = '${commonContoller.Purchase_Price_Controller.value.text}';
    request.fields['payment_method'] = '${commonContoller.Payment_Method.value}';
    request.fields['residential_address'] = '${commonContoller.Pickup_residential_Address_Controller.value.text}';

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        Get.to(SavedSuccessfully());
        // commonContoller.Clear_Add_A_Car_Details();
        final responseeee= jsonDecode(await response.stream.bytesToString());
        commonContoller.Add_a_Car_id=responseeee['data']['id'];
        print(commonContoller.Add_a_Car_id);
        Get.snackbar('Successfully', '${responseeee['message']}');
        log("Upload successful");
      } else {
        log("Upload failed with status: ${response.statusCode}");
        // log the response body for more details
        final responseData = await response.stream.bytesToString();
        final responsee=jsonDecode(responseData);
        Get.snackbar('Error', '${responsee['data']}');
        log("Response data: $responseData");
      }
    }catch (e){
      Get.snackbar('', '$e');
      log('error $e');
    }
  }
}