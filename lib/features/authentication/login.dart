import 'package:flutter/material.dart';
import 'package:rider_app/features/home/home.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/styles.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:rider_app/widgets/global_layout.dart';
import 'package:rider_app/widgets/primary_btn.dart';

import '../../widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String initialCountry = 'RW';

  var _phoneNumber = '';

  var _email = '';

  var _password = '';

  PhoneNumber number = PhoneNumber(isoCode: 'RW');

  String currentSelectedButton = 'Phone';

  final GlobalKey<FormState> _formKey = GlobalKey();

  bool isLoading = false;

  bool _passwordVisible = false;

  void setCheckedButton(String buttonTxt) {
    setState(() {
      currentSelectedButton = buttonTxt;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  FocusNode focusNode = FocusNode();

  Widget buildEmailFormField() {
    return SizedBox(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputField(
                  isFirst: true,
                  controller: emailController,
                  readOnly: isLoading,
                  hasError: false,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  hintText: 'Email or Phone Number',
                ),
                const SizedBox(
                  height: 10,
                ),
                InputField(
                  isLast: true,
                  onChanged: (value) => value,
                  obscureText: true,
                  controller: passwordController,
                  readOnly: isLoading,
                  hasError: false,
                  hintText: 'Enter Your Password',
                  passwordVisible: _passwordVisible,
                  changePasswordVisibility: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                //forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: AppColors.error,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),

                if (false)
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: CircularProgressIndicator(),
                  )
                else
                  PrimaryBtn(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<dynamic>(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                      if (emailController.text.isEmpty ||
                          passwordController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all fields'),
                          ),
                        );
                        return;
                      }

                      emailController.clear();
                      passwordController.clear();
                    },
                    btnText: 'Log in',
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColors.primaryColor,
                    textStyle: const TextStyle(
                      color: AppColors.white,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
    // return an email form field
  }

  @override
  Widget build(BuildContext context) {
    return GlobalLayout(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              RichText(
                text: const TextSpan(
                  text: 'Sign in with your email or phone number',
                  style: Styles.headingExtraLargeTitleBlack,
                ),
              ),
              const SizedBox(height: 40),
              buildEmailFormField(),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.secondary,
                      thickness: 1,
                      endIndent: 10,
                    ),
                  ),
                  Text(
                    'or',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.secondary,
                      thickness: 1,
                      indent: 10,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: "Don't have an account?",
                      style: Styles.paragraphSmallBlack,
                    ),
                  ),
                  TextButton(
                    onPressed: () => {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute<dynamic>(
                      //     builder: (context) => const RegisterScreen(),
                      //   ),
                      // ),
                    },
                    child: const Text(
                      'Sign Up',
                      style: Styles.paragraphMediumPrimary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
