import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rebuy/models/user_model.dart';
import 'package:rebuy/services/user_service.dart';


class UserController  extends GetxController{
 UserService userService=UserService();
 List<UserModel> userDataList=[];
 
 login(String email,String password){
  var loginUserResponse= userService.loginUser(email,password);
  // userDataList=loginUserResponse;
  return userDataList;
    
 }






 getData() async{
  var usersData=await userService.getUsersData();
  debugPrint("controller:$usersData");
  userDataList=usersData;
  update();
 }
 
}