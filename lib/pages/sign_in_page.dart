import 'package:flutter/material.dart';
import 'package:learn_hive/custom/custom_button.dart';
import 'package:learn_hive/custom/custom_text.dart';
import 'package:learn_hive/custom/custom_text_field.dart';
import 'package:learn_hive/pages/sign_up_page.dart';
import 'package:learn_hive/service/hive_service.dart';

import '../model/user_model.dart';

class SignInPage extends StatefulWidget {
  static const String id = "/sign_in_page";

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _loadSavedUser() async {
    User? user = HiveService.loadUser();
    if (user != null) {
      _emailController.text = user.email!;
      _passwordController.text = user.password!;
    }
  }

  @override
  void initState() {
    _loadSavedUser();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color.fromRGBO(8, 114, 110, 1.0),
          child: Column(
            children: [
              // Heading
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 40, top: 60),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/account.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(height: 20),
                      customText('Sign In'),
                    ],
                  ),
                ),
              ),
              // Body
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(top: 60, left: 40, right: 40),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(252, 252, 252, 1.0),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        customTextField(
                          'Email',
                          'Enter Email',
                          TextInputType.emailAddress,
                          false,
                          _emailController,
                        ),
                        const SizedBox(height: 40),
                        customTextField(
                          'Password',
                          'Enter Password',
                          TextInputType.visiblePassword,
                          true,
                          _passwordController,
                        ),
                        SizedBox(height: 30),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget Password ?',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        // Button
                        customButton('Sign In', () {}),
                        SizedBox(height: 20),
                        // Divider
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Divider(
                                    color: Colors.grey.shade400, thickness: 2)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey.shade400,
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            customIcon(Icons.facebook_outlined, () {}),
                            customIcon(Icons.facebook_outlined, () {}),
                            customIcon(Icons.facebook_outlined, () {}),
                          ],
                        ),
                        SizedBox(height: 20),
                        customTextButton("Don't have an account ?", "SignUp",
                            () {
                          Navigator.pushNamed(context, SignUpPage.id);
                        }),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
