import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsburst/Views/auth/signup_screen.dart';
import 'package:newsburst/controller/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 132, 105),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset('assets/images/login_rmbg.png'),
              Text(
                'Login',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              SizedBox(
                height: 75.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'abc@example.com',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  controller: passwordTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'abc@example.com',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: Colors.white,
                    ),
                    labelText: 'password',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 55,
              ),
              Container(
                height: 48.0,
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0))),
                    onPressed: () {
                      Auth.instance.login(emailTextEditingController.text,
                          passwordTextEditingController.text);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'don\'t have an account?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(SignUp_Screen());
                      },
                      child: Text(
                        'Create Here',
                        style: TextStyle(fontSize: 18.0),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
