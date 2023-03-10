import 'package:firebase_auth_dbestech/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    List images = ["g.png", 't.png', 'f.png'];

    // Email and password
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // container for the image: it will take a third of the screen
            Container(
              width: screen_width,
              height: screen_height * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/signup.png'),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  SizedBox(
                    height: screen_height * 0.14,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 30,
                    backgroundImage: AssetImage("assets/img/profile1.png"),
                  )
                ],
              ),
            ),
            Container(
              width: screen_width,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30, //to create some space
                  ),
                  // textbox1
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: "Enter your email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.deepOrangeAccent,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // textbox2
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 7,
                              offset: Offset(1, 1),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.deepOrangeAccent,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)),
                        )),
                  ),

                  // Row(
                  //   children: [
                  //     Expanded(child: Container()),
                  //     Text(
                  //       "Forgot your password?",
                  //       style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: (() {
                AuthController.instance.register(emailController.text.trim(),
                    passwordController.text.trim());
              }),
              child: Container(
                width: screen_width * 0.5,
                height: screen_width * 0.15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage('assets/img/loginbtn.png'),
                        fit: BoxFit.cover)),
                child: Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Have an Account?",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ))),
            SizedBox(
              height: screen_width * 0.08,
            ),

            // mixed text at the bottom
            RichText(
                text: TextSpan(
              text: "Sign up using one of the following methods",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16,
              ),
            )),
            // horizontal layout
            Wrap(
              children: List<Widget>.generate(3, (index) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[300],
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          AssetImage("assets/img/" + images[index]),
                    ),
                  ),
                );
              }),
            ),
          ],
        ));
  }
}
