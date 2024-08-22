import 'package:flutter/material.dart';
import 'package:rider_app/values/colors.dart';

class GlobalLayout extends StatelessWidget {
  final Widget child;
  final bool showBack;
  final EdgeInsets padding;
  final Widget? bottomNavigationBar;
  const GlobalLayout(
      {Key? key,
      required this.child,
      this.showBack = true,
      this.padding = const EdgeInsets.all(20),
      this.bottomNavigationBar})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            children: [
              if (showBack)
                Container(
                  padding: padding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              child: const Row(
                                children: [
                                  Icon(Icons.arrow_back_ios_rounded,
                                      color: AppColors.secondary, size: 20),
                                  SizedBox(width: 5),
                                  Text('Back',
                                      style: TextStyle(
                                          color: AppColors.secondary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ))),
                    ],
                  ),
                ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
