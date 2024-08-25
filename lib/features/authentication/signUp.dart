import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rider_app/features/authentication/create_password.dart';
import 'package:rider_app/features/authentication/login.dart';
import 'package:rider_app/features/authentication/verification.dart';
import 'package:rider_app/providers/authenticationProvider.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/size_config.dart';
import 'package:rider_app/values/styles.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:rider_app/widgets/global_layout.dart';
import 'package:rider_app/widgets/primary_btn.dart';

import '../../widgets/input_field.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final String initialCountry = 'RW';

  var gender;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              RichText(
                text: TextSpan(
                  text: 'Sign in with your email or phone number',
                  style: Styles.headingExtraLargeTitleBlack,
                ),
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
                            isFirst: true,
                            controller: nameController,
                            readOnly: isLoading,
                            hasError: false,
                            onChanged: (value) {},
                            hintText: 'Name',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InputField(
                            isFirst: true,
                            controller: emailController,
                            readOnly: isLoading,
                            hasError: false,
                            onChanged: (value) {},
                            hintText: 'Email',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          IntlPhoneField(
                            initialCountryCode: 'RW',
                            controller: phoneController,
                            validator: (value) {
                              if (value == null || value.number.isEmpty) {
                                return 'Please enter valid phone number';
                              }

                              return null;
                            },
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp('[0-9]'),
                              ),
                            ],
                            dropdownIconPosition: IconPosition.trailing,
                            flagsButtonPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            focusNode: focusNode,
                            disableAutoFillHints: true,
                            disableLengthCheck: true,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: AppColors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.lightGray,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelStyle: TextStyle(color: Colors.black12),
                              hintText: 'Your mobile number',
                              hintStyle: TextStyle(color: AppColors.gray),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              alignLabelWithHint: true,
                            ),
                            onChanged: (phone) {
                              if (phone.number.isEmpty) {}

                              return;
                            },
                            onCountryChanged: (country) {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DropdownButton<String>(
                            borderRadius: BorderRadius.circular(8),
                            hint: gender == null
                                ? const Text('Select..')
                                : Text(
                                    gender.toString(),
                                    style:
                                        const TextStyle(color: AppColors.black),
                                  ),
                            isExpanded: true,
                            iconSize: 30,
                            style: const TextStyle(color: Colors.black),
                            dropdownColor: AppColors.white,
                            items: <String>['Male', 'Female', 'Other']
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                gender = val;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // accept terms and conditions
                          Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                splashRadius: 20,
                                side: BorderSide(
                                  color: AppColors.primaryColor,
                                ),
                                value: true,
                                onChanged: (value) {},
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: SizeConfig.screenW! * 0.8,
                                    child: RichText(
                                        overflow: TextOverflow.clip,
                                        text: const TextSpan(
                                          text: 'I agree to the ',
                                          style: TextStyle(
                                            color: AppColors.gray,
                                            fontSize: 14,
                                          ),
                                          children: [
                                            TextSpan(
                                              text: 'Terms and Conditions',
                                              style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 14,
                                              ),
                                            ),
                                            TextSpan(text: ' and '),
                                            TextSpan(
                                              text: 'Privacy Policy',
                                              style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        )),
                                  )
                                ],
                              ),
                            ],
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
                                if (emailController.text.isEmpty ||
                                    nameController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please fill all fields'),
                                    ),
                                  );
                                  return;
                                }

                                await authProviderNotifier.register(
                                    emailController.text,
                                    phoneController.text,
                                    gender,
                                    nameController.text);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Account created successfully'),
                                  ),
                                );

                                await Future.delayed(
                                    const Duration(seconds: 2));

                                Navigator.of(context).push(
                                  MaterialPageRoute<dynamic>(
                                    builder: (context) =>
                                        const CreatePasswordScreen(),
                                  ),
                                );
                              },
                              btnText: 'Sign Up',
                              borderRadius: BorderRadius.circular(8.0),
                              color: AppColors.primaryColor,
                              textStyle: Styles.textMediumWhite,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
                      text: "Already have an account?",
                      style: Styles.paragraphSmallBlack,
                    ),
                  ),
                  TextButton(
                    onPressed: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute<dynamic>(
                          builder: (context) => const LoginScreen(),
                        ),
                      ),
                    },
                    child: const Text(
                      'Sign in',
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
