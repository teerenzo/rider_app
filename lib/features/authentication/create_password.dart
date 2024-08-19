import 'package:flutter/material.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/styles.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:rider_app/widgets/global_layout.dart';
import 'package:rider_app/widgets/primary_btn.dart';

import '../../widgets/input_field.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
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
                  isLast: true,
                  onChanged: (value) => value,
                  obscureText: true,
                  controller: passwordController,
                  readOnly: isLoading,
                  hasError: false,
                  hintText: 'Enter Your New Password',
                  passwordVisible: _passwordVisible,
                  changePasswordVisibility: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
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
                  hintText: 'Confirm Password',
                  passwordVisible: _passwordVisible,
                  changePasswordVisibility: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                //forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Atleast 1 number or a special character',
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
                    btnText: 'Save',
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              RichText(
                text: const TextSpan(
                  text: 'Set New password',
                  style: Styles.headingExtraLargeTitleBlack,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Set your new password',
                style: Styles.paragraphMediumBlack,
              ),
              const SizedBox(height: 40),
              buildEmailFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
