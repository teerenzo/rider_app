import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rider_app/features/authentication/login.dart';
import 'package:rider_app/providers/authenticationProvider.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/styles.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:rider_app/widgets/global_layout.dart';
import 'package:rider_app/widgets/primary_btn.dart';

import '../../widgets/input_field.dart';

class CreatePasswordScreen extends ConsumerStatefulWidget {
  const CreatePasswordScreen({super.key});

  @override
  ConsumerState<CreatePasswordScreen> createState() =>
      _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends ConsumerState<CreatePasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController cpasswordController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    var authProv = ref.watch(authProvider);
    var authProviderNotifier = ref.read(authProvider.notifier);
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
              SizedBox(
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Password is required';
                              } else if (value.length < 8) {
                                return 'Password must be at least 8 characters';
                              } else if (!RegExp(
                                      r'^(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(value)) {
                                return 'Password must contain at least 1 number or a special character';
                              }
                              return null; // Return null if the input is valid
                            },
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
                            controller: cpasswordController,
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
                          const SizedBox(
                            height: 20,
                          ),
                          if (authProv.isLoading == true)
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: CircularProgressIndicator(),
                            )
                          else
                            PrimaryBtn(
                              onTap: () async {
                                if (passwordController.text.isNotEmpty &&
                                    cpasswordController.text.isNotEmpty) {
                                  if (passwordController.text !=
                                      cpasswordController.text) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Passwords do not match'),
                                      ),
                                    );
                                    return;
                                  }
                                  await authProviderNotifier
                                      .createPassword(passwordController.text);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text('Password created successfully'),
                                    ),
                                  );
                                  await Future.delayed(Duration(seconds: 4));
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please fill all fields'),
                                    ),
                                  );
                                }
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
