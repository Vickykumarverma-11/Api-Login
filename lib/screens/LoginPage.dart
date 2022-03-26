import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:test_application_4/providers/LoginProvider.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController uNameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userNameField(),
                passwordField(),
                loginButtonWidget(context, provider),
                if (provider.isLoading)
                  Center(child: CircularProgressIndicator())
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget passwordField() {
    return TextField(
      controller: pwdController,
      onChanged: (value) {},
      onSubmitted: (value) {},
      maxLength: 250,
      obscureText: true,
      decoration: InputDecoration(
          filled: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Theme.of(context).primaryColorDark, width: 1)),
          labelText: "Password",
          counterText: "",
          errorText: ""),
    );
  }

  Widget userNameField() {
    return TextField(
      controller: uNameController,
      onChanged: (value) {},
      onSubmitted: (value) {},
      maxLength: 250,
      obscureText: false,
      decoration: InputDecoration(
          filled: false,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Theme.of(context).primaryColorDark, width: 1)),
          labelText: "Email",
          counterText: "",
          errorText: ""),
    );
  }

  Widget loginButtonWidget(BuildContext loginContext, LoginProvider provider) {
    return TextButton(
      onPressed: () {
        provider.loginUser(
            loginContext, uNameController.text, pwdController.text);
      },
      child: Text("Login"),
      style: TextButton.styleFrom(
          minimumSize: Size(double.infinity, 30),
          padding: const EdgeInsets.all(16.0),
          primary: Colors.white,
          textStyle: const TextStyle(fontSize: 20),
          backgroundColor: Colors.blueAccent),
    );
  }
}
