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
      backgroundColor: const Color.fromARGB(255, 253, 132, 105),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset('assets/images/login_rmbg.png'),
              const Text(
                'Login',
                style: TextStyle(fontSize: 30.0, color: Colors.white),
              ),
              const SizedBox(
                height: 75.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'abc@example.com',
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.white, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.white, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TextFormField(
                  style: const TextStyle(color: Colors.white),
                  obscureText: true,
                  controller: passwordTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'abc@example.com',
                    hintStyle: const TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.white, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.white, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: Colors.white,
                    ),
                    labelText: 'password',
                    labelStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              Container(
                height: 48.0,
                margin: const EdgeInsets.symmetric(horizontal: 30.0),
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
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'don\'t have an account?',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.off(SignUp_Screen());
                      },
                      child: const Text(
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
