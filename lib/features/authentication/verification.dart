import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:rider_app/features/authentication/login.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/styles.dart';
import 'package:rider_app/widgets/primary_btn.dart';

import '../../widgets/global_layout.dart';

class VerificationScreen extends StatefulWidget {
  final bool showProgress;
  final int activeIndicator;
  final bool isReset;
  final Function(BuildContext)? callBack;

  const VerificationScreen({
    super.key,
    this.showProgress = false,
    this.activeIndicator = 0,
    this.isReset = false,
    this.callBack,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  OtpFieldController otpController = OtpFieldController();
  String message = "";
  String code = "";
  bool isLoading = false;

  Future<void> handleSubmit() async {
    setState(() {
      isLoading = true;
    });
  }

  Future<void> handleReset() async {}

  @override
  Widget build(BuildContext context) {
    return GlobalLayout(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                RichText(
                  text: const TextSpan(
                    text: 'Phone verification',
                    style: Styles.headingExtraLargeTitleBlack,
                  ),
                ),
                const Text(
                  'Enter your OTP code',
                  style: Styles.paragraphMediumBlack,
                ),
                const SizedBox(height: 40),
                OTPTextField(
                  controller: otpController,
                  otpFieldStyle: OtpFieldStyle(
                    borderColor: AppColors.primaryColor,
                    focusBorderColor: AppColors.primaryColor,
                  ),
                  length: 5,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: MediaQuery.of(context).size.width / 6 - 13,
                  style: const TextStyle(fontSize: 17),
                  textFieldAlignment: MainAxisAlignment.spaceBetween,
                  fieldStyle: FieldStyle.box,
                  onChanged: (pin) async {
                    setState(() {
                      code = pin;
                    });
                  },
                ),
              ],
            ),
          ),
          PrimaryBtn(
            onTap: () async {
              widget.isReset ? await handleReset() : await handleSubmit();
            },
            color: AppColors.primaryColor,
            textStyle: TextStyle(
              color: AppColors.white,
            ),
            btnText: ' Verify',
            loading: isLoading,
            loadingText: 'Verifying',
            disabled: isLoading,
          ),
        ],
      ),
    );
  }
}
