import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tester/first_page.dart';
import 'constant.dart';

class SecondPage extends StatelessWidget {
  String? fname;
  String? email;
  String? num;
  String? desg;
  String? gender;
  var image;
  SecondPage(
      {this.email, this.fname, this.gender, this.desg, this.num, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 35, top: 17),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Name : ",
                      style: TextStyle(fontSize: 18, color: Colors.greenAccent),
                    ),
                    Text(
                      fname != null ? fname! : "Please Enter Name",
                      style: TextStyle(
                          fontSize: 20,
                          color: kPink,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Email : ",
                      style: TextStyle(fontSize: 18, color: Colors.greenAccent),
                    ),
                    Text(
                      email != null ? email! : "Please Enter Email",
                      style: TextStyle(
                          fontSize: 20,
                          color: kPink,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Phone Number : ",
                      style: TextStyle(fontSize: 18, color: Colors.greenAccent),
                    ),
                    Text(
                      num != null
                          ? num!
                          : "Please Enter Mobile Number",
                      style: TextStyle(
                          fontSize: 20,
                          color: kPink,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Designation : ",
                      style: TextStyle(fontSize: 18, color: Colors.greenAccent),
                    ),
                    Text(
                      desg != "Designation" ? desg! : "Please Enter Designation",
                      style: TextStyle(
                          fontSize: 20,
                          color: kPink,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Gender : ",
                      style: TextStyle(fontSize: 18, color: Colors.greenAccent),
                    ),
                    Text(
                      gender != null ? gender! : "Please Enter Gender",
                      style: TextStyle(
                          fontSize: 20,
                          color: kPink,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              height: 200,
              width: 200,
              child: image != null
                  ? Image(image: FileImage(image))
                  : Image.network(
                      "https://us.123rf.com/450wm/urfandadashov/urfandadashov1806/urfandadashov180601827/urfandadashov180601827.jpg?ver=6"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: kPink),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Welcome To The First Page',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: kPink,
                    duration: Duration(seconds: 2),
                  ),
                );
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => FirstPage()));
              },
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  "Edit",
                  style: TextStyle(color: Colors.greenAccent, fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
