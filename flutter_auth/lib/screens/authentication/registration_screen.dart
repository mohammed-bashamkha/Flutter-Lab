import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/authentication/Policies.dart';
import 'package:flutter_auth/screens/authentication/login_screen.dart';
import 'package:flutter_auth/screens/services/auth.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  bool agreed = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 400,
              width: width,
              child: Stack(
                children: <Widget>[
                  // Background image 1
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeInUp(
                      duration: Duration(seconds: 1),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Background image 2
                  Positioned(
                    height: 400,
                    width: width + 20,
                    child: FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/background-2.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Sign up text header..........................................
                  FadeInUp(
                    duration: Duration(milliseconds: 1500),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Color.fromRGBO(49, 39, 79, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Sign up form.................................................
                  FadeInUp(
                    duration: Duration(milliseconds: 1700),
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // first name.......................................
                              TextFormField(
                                controller: _fullNameController,
                                validator: (v) => v == null || v.isEmpty
                                    ? 'Please enter your full name'
                                    : null,
                                decoration: InputDecoration(
                                  label: Text("Full Name"),
                                  hintText: "enter your Full name",
                                  hintStyle: TextStyle(color: Colors.black26),
                                  prefixIcon: Icon(Bootstrap.person),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // Email .......................................
                              TextFormField(
                                controller: _emailController,
                                validator: (v) =>
                                    v!.isEmpty ? 'please enter email' : null,
                                decoration: InputDecoration(
                                  label: Text("Email"),
                                  hintText: "Enter Email",
                                  hintStyle: TextStyle(color: Colors.black26),
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              // password.......................................
                              TextFormField(
                                controller: _passwordController,
                                validator: (v) =>
                                    v!.isEmpty ? 'please enter password' : null,
                                obscureText: true,
                                decoration: InputDecoration(
                                  label: Text("Password"),
                                  hintText: "Enter Password",
                                  hintStyle: TextStyle(color: Colors.black26),
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Terms and conditions.................................
                  FadeInUp(
                    duration: Duration(milliseconds: 1700),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: agreed,
                              activeColor: Color.fromRGBO(49, 39, 79, 1),
                              onChanged: (value) {
                                setState(() {
                                  agreed = value!;
                                });
                              },
                            ),
                            Text(
                              "I agree to terms & conditions of",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black26,
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Policy()),
                            );
                          },
                          child: Text(
                            " Policy",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(196, 135, 198, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  // Sign up button.................................
                  FadeInUp(
                    duration: Duration(milliseconds: 1900),
                    child: MaterialButton(
                      onPressed: () {
                        Map creds = {
                          "name": _fullNameController.text,
                          "email": _emailController.text,
                          "password": _passwordController.text,
                          "device_name": "Mobile",
                        };
                        if (_formKey.currentState!.validate() && agreed) {
                          Provider.of<Auth>(
                            context,
                            listen: false,
                          ).signup(creds: creds);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Account created successfully'),
                            ),
                          );
                        }
                        // if (_formKey.currentState!.validate() && agreed) {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(
                        //       content: Text('Account created successfully'),
                        //     ),
                        //   );
                        //   setState(() {
                        //     _formKey.currentState!.reset();
                        //   });
                        // }
                      },
                      color: Color.fromRGBO(49, 39, 79, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 50,
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // sign up with...............................
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(thickness: 1, color: Colors.black12),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Sign up with",
                          style: TextStyle(color: Colors.black26),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 1, color: Colors.black12),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // social media icons........................
                  FadeInUp(
                    duration: Duration(milliseconds: 2000),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Bootstrap.google),
                        Icon(Bootstrap.facebook),
                        Icon(Bootstrap.github),
                        Icon(Bootstrap.apple),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // already have an account........................
                  FadeInUp(
                    duration: Duration(milliseconds: 2000),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "already have an account? ",
                                style: TextStyle(
                                  color: Color.fromRGBO(49, 39, 79, .6),
                                ),
                              ),
                              TextSpan(
                                text: "Login",
                                style: TextStyle(
                                  color: Color.fromRGBO(49, 39, 79, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
