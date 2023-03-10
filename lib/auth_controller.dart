import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_dbestech/login_page.dart';
import 'package:firebase_auth_dbestech/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  // should navigate user to respective pages based on interactions
  // should be accessible from any of the pages

  // create a static instance of AuthController that will be accessible via all the pages
  // to access do AuthController.instance...
  static AuthController instance = Get.find();
  // we need our firebase user model to be initialized here

  late Rx<User?>
      _user; //from firebase and will include info like email, password, name ..

  // create a variable for our firebase authentication module
  FirebaseAuth auth =
      FirebaseAuth.instance; // allows you to access properties from firebase

  // defining the user we declare using rx
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser); //casting to rx user
    _user.bindStream(auth
        .userChanges()); //bind user to stream, thus tracks user during login or log out

    ever(_user,
        _initialScreen); //whenever anything changes with the user (login or logout), the function initialScreen will be notified. the user is passed to the function as well
  }

  // function to take user to welcome page after log in
  _initialScreen(User? user) {
    // user could be null hence the ?
    if (user == null) {
      // no one is logged in thus take to log in
      print("log in page");
      Get.offAll(() => LoginPage());
    } else {
      // user is logged in
      Get.offAll(() => WelcomePage());
    }
  }

  Future<void> register(String email, String password) async {
    //will be called from our signup view

    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // once user is registered, the ever function in bindStream will detect, and call initialScreen, and the user will be sent to welcomepage
    } catch (e) {
      // send message to user
      Get.snackbar("About User", "User Message",
          backgroundColor: Colors.red[300],
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account creation failed",
            style: TextStyle(color: Colors.white),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.white),
          ));
    }
  }

     void login(String email, password)async{
     try{
       await  auth.signInWithEmailAndPassword(email: email, password: password);
     }catch(e){
       Get.snackbar("About Login", "Login message",
           backgroundColor: Colors.redAccent,
           snackPosition: SnackPosition.BOTTOM,
           titleText: Text(
             "Login failed",
             style: TextStyle(
                 color: Colors.white
             ),
           ),
           messageText: Text(
               e.toString(),
               style: TextStyle(
                   color: Colors.white
               )
           )
       );
     }
   }
   void logOut()async{
     await auth.signOut();
   }

}
