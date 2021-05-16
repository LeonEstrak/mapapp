import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String email,
      firstName,
      lastName,
      password,
      confirmedPassword,
      drivingLicenseNumber,
      mobileNumber,
      address;

  InputDecoration myInputDecoration(String labelText) {
    return InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.grey),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 35, 0.0, 0.0),
              child: Text(
                'Registration',
                style: TextStyle(
                    fontSize: 65.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan[900]),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(height: 15),
            TextFormField(
              validator: (firstName) =>
                  firstName.isEmpty ? "Enter your First Name" : null,
              decoration: myInputDecoration("First Name"),
              onChanged: (String firstName) {
                this.firstName = firstName;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              validator: (lastName) =>
                  lastName.isEmpty ? "Enter your Last Name" : null,
              decoration: myInputDecoration("Last Name"),
              onChanged: (String lastName) {
                this.lastName = lastName;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              validator: (mobileNumber) =>
                  mobileNumber.length != 10 ? "Invalid mobile number" : null,
              decoration: myInputDecoration("Mobile"),
              keyboardType: TextInputType.phone,
              onChanged: (String number) {
                this.mobileNumber = number;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              validator: (address) =>
                  address.isEmpty ? "Enter your Address" : null,
              decoration: myInputDecoration("Address"),
              onChanged: (String address) {
                this.address = address;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              //TODO:instead of isEmpty, check for validity of email [use Regular Exp.] [email.contains(new RegExp(r'...'))]
              validator: (email) => email.isEmpty ? "Enter your e-mail" : null,
              decoration: myInputDecoration("E-Mail"),
              onChanged: (String email) {
                this.email = email;
                //print("email: $email");
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
                validator: (password) =>
                    password.length <= 4 ? "Password too small" : null,
                obscureText: true,
                decoration: myInputDecoration("Password"),
                onChanged: (String password) {
                  this.password = password;
                  //print("Password: $password");
                }),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (confirmedPassword) => confirmedPassword != password
                  ? "Passwords do not match"
                  : null,
              obscureText: true,
              decoration: myInputDecoration("Confirm Password"),
              onChanged: (String confirmedPass) {
                this.confirmedPassword = confirmedPass;
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 7.0,
                    primary: Colors.cyan[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, "/"),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 7.0,
                    primary: Colors.cyan[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                  child: Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, "/login"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
