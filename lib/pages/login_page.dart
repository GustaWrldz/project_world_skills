// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LocalAuthentication localAuthentication = LocalAuthentication();
  
  
  setBoolean() async {
    await SharedPreferencesAsync().setBool("isAuthenticated", false);
  }

   login() async {
    final apiUrl = Uri.parse("http://localhost:3000/login");
    final email = emailController.text; 
    final senha = passwordController.text;


    try {
      final response =  await http.post(apiUrl, headers: ({
        'Content-Type': 'application/json'
      }) ,body: jsonEncode({'email': email, 'senha': senha}));

      if (response.statusCode == 200) {
        Navigator.pushReplacementNamed(context, "/materias");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  // Future<void> getPreferences() async {
  //   _preferences ??= await SharedPreferences.getInstance();
  // }

  @override
  void initState() {
    super.initState();
    login();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              child: Image.asset("./assets/Logo.png"),
            ),
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Campo obrigatório";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                            label: Text("Email")),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Campo obrigatório";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                            label: Text("Senha")),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      SizedBox(
                        height: mediaQuery.size.height * 0.05,
                        width: mediaQuery.size.height * 0.65,
                        child: FloatingActionButton(
                            backgroundColor: Colors.blue,
                            child: const Text("Login"),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await login();
                              }
                            }),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
