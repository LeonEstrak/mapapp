import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
              child: Center(
                child: Text('Parking',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan[900])),
              )),
          SizedBox(height: 75),
          TextFormField(
            validator: (email) => email.isEmpty ? "Enter your e-mail" : null,
            decoration: InputDecoration(
                labelText: 'EMAIL',
                labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan[900]))),
            onChanged: (String email) {
              this.email = email;
              //print("email: $email");
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
              validator: (password) =>
                  password.isEmpty ? "Please enter your password" : null,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'PASSWORD',
                  labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan[900]))),
              onChanged: (String password) {
                this.password = password;
                //print("Password: $password");
              }),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                //LOGIN BUTTON
                style: ElevatedButton.styleFrom(
                  elevation: 7.0,
                  primary: Colors.cyan[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                onPressed: () => Navigator.pushNamed(context, "/"),
              ),
              ElevatedButton(
                //REGISTRATION BUTTON
                style: ElevatedButton.styleFrom(
                  elevation: 7.0,
                  primary: Colors.cyan[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
                child: Text(
                  "Registration",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                onPressed: () => Navigator.pushNamed(context, "/registration"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
