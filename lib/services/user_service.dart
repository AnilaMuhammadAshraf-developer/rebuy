
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rebuy/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService{

   String baseUrl='https://server1.appsstaging.com/3672/where-my-chef/public/api/login';

   

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
  Map<String, dynamic> responseData = {};

  try {
    var url = Uri.parse(baseUrl); 

     debugPrint("Yh email hai :$email");
    Map<String, dynamic> requestBody = {
      'email': email,
      'password': password,
      'user_type':'User'
    };

    // Send POST request to the login API
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestBody),
    );

    debugPrint("Response Status: ${response.statusCode}");
    debugPrint("Response: $response.body");
    // Check if the response is successful (statusCode 200)
    if (response.statusCode == 200) {
      // Decode the JSON response
      responseData = jsonDecode(response.body);

      debugPrint("Login Success: $responseData");

      // You can process the response here if needed (e.g., storing the token, user info)
    } else {
      // Handle failed login attempt (non-200 status code)
      debugPrint("Failed to login. Status code: ${response.statusCode}");
      responseData['error'] = 'Login failed, please check your credentials.';
    }
  } catch (e) {
    // Handle any exceptions that may occur
    debugPrint("Error occurred: $e");
    responseData['error'] = 'An error occurred, please try again later.';
  }

  return responseData; // Return the response data, which can include user details or error message
}











   Future getUsersData() async {
    List<UserModel> userList=[];
    
    var url=Uri.parse(baseUrl);
    var response=await http.get(url);
    debugPrint("this is stats ${response.statusCode}");
    var users=jsonDecode(response.body);
    debugPrint("users:$users");

    for(var userData in users){
        userList.add(UserModel.fromJson(userData));
    }
     return userList;
   }

}