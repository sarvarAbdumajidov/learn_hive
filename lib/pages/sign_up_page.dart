import 'package:flutter/material.dart';
import 'package:learn_hive/custom/custom_button.dart';
import 'package:learn_hive/custom/custom_text.dart';
import 'package:learn_hive/custom/custom_text_field.dart';
import 'package:learn_hive/model/user_model.dart';
import 'package:learn_hive/pages/sign_in_page.dart';
import 'package:learn_hive/service/hive_service.dart';
import 'package:learn_hive/service/log_service.dart';

class SignUpPage extends StatefulWidget {
  static const String id = "/sign_up_page";

  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _clearController() {
    _emailController.clear();
    _numberController.clear();
    _addressController.clear();
    _passwordController.clear();
  }

  bool _isValidEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(email);
  }

  bool _isValidPassword(String password) {
    return password.length >= 6;
  }

  Future<void> _fetchData() async {
    String email = _emailController.text.trim();
    String number = _numberController.text.trim();
    String address = _addressController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty ||
        number.isEmpty ||
        address.isEmpty ||
        password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Iltimos, barcha maydonlarni to\'ldiring.')),
      );
      return;
    }

    if (!_isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Email formati noto\'g\'ri.')),
      );
      return;
    }

    if (!_isValidPassword(password)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text('Parol kamida 6 ta belgidan iborat bo\'lishi kerak.')),
      );
      return;
    }

    var user = User(
        email: email, number: number, address: address, password: password);
    HiveService.storeUser(user);

    var userFromData = HiveService.loadUser();
    if (userFromData != null) {
      LogService.i(userFromData.toJson().toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: Duration(seconds: 1),
            content: Text('Foydalanuvchi muvaffaqiyatli saqlandi.')),
      );
      setState(() {
        _clearController();
      });
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, SignInPage.id);
      });
    } else {
      LogService.w('Foydalanuvchi ma\'lumotlarini saqlashda xato yuz berdi.');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: Duration(seconds: 1),
            content: Text('Foydalanuvchi ma\'lumotlarini saqlashda xato.')),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _numberController.dispose();
    _addressController.dispose();
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
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 40),
                  alignment: Alignment.centerLeft,
                  child: customText('Sign Up'),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(top: 60, left: 40, right: 40),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(252, 252, 252, 1.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        customTextField(
                            'Email',
                            'Enter email',
                            TextInputType.emailAddress,
                            false,
                            _emailController),
                        const SizedBox(height: 30),
                        customTextField('Number', 'Enter number',
                            TextInputType.number, false, _numberController),
                        const SizedBox(height: 30),
                        customTextField(
                            'Address',
                            'Enter address',
                            TextInputType.streetAddress,
                            false,
                            _addressController),
                        const SizedBox(height: 30),
                        customTextField(
                            'Password',
                            'Enter password',
                            TextInputType.visiblePassword,
                            true,
                            _passwordController),
                        const SizedBox(height: 50),
                        customButton('Sign Up', _fetchData),
                        const SizedBox(height: 30),
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
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            customIcon(Icons.facebook_outlined, () {}),
                            customIcon(Icons.facebook_outlined, () {}),
                            customIcon(Icons.facebook_outlined, () {}),
                          ],
                        ),
                        SizedBox(height: 20),
                        customTextButton("Already have an account ?", "SignIn",
                            () {
                          Navigator.pushNamed(context, SignInPage.id);
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
