import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rider_app/features/onboarding/onboarding_contents.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List colors = const [
    Color(0xffDAD3C8),
    Color(0xffFFE5DE),
    Color(0xffDCF6E6),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  contents.length - 1 != _currentPage
                      ? TextButton(
                          onPressed: () async {
                            // await LocalStorage.setVisit().then((value) {
                            //   visit = true;
                            //   Navigator.of(context).pushReplacement(
                            //     MaterialPageRoute(
                            //       builder: (context) => const WelcomeScreen(),
                            //     ),
                            //   );
                            // });
                          },
                          style: TextButton.styleFrom(
                            elevation: 0,
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: (width <= 550) ? 13 : 17,
                            ),
                          ),
                          child: const Text(
                            "SKIP",
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        SizedBox(
                            width: 373,
                            height: 208,
                            child: SvgPicture.asset(contents[i].image)),
                        const SizedBox(height: 30),
                        Text(
                          contents[i].title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              fontSize: 24,
                              color: AppColors.secondary),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          contents[i].desc,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w300,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _currentPage == 0
                        ? Image.asset(
                            "assets/icons/stepper1.png",
                            height: 86,
                            width: 86,
                          )
                        : _currentPage == 1
                            ? Image.asset(
                                "assets/icons/stepper2.png",
                                height: 86,
                                width: 86,
                              )
                            : SvgPicture.asset(
                                "assets/icons/stepper3.svg",
                                height: 86,
                                width: 86,
                              ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
