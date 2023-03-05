import "package:flutter/material.dart";

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    List images = ["g.png", 't.png', 'f.png'];
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
                    radius: 60,
                    backgroundImage: AssetImage("assets/img/profile1.png"),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 70,
            ),
            Container(
              width: screen_width,
              margin: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome 🎉!",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  // showing the users ID
                  Text(
                    "ednahakoth@gmail.com",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Container(
              width: screen_width * 0.5,
              height: screen_width * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage('assets/img/loginbtn.png'),
                      fit: BoxFit.cover)),
              child: Center(
                child: Text(
                  "Logout",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ), // horizontal layout
          ],
        ));
  }
}
