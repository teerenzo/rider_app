import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rider_app/features/home/home.dart';
import 'package:rider_app/features/home/map_container.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/size_config.dart';
import 'package:rider_app/values/styles.dart';
import 'package:rider_app/widgets/custom_scaffold.dart';
import 'package:rider_app/widgets/primary_btn.dart';

class DriverInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useSafeArea: true,
      contentPadding: EdgeInsets.zero,
      isShowBackButton: false,
      body: Stack(
        children: [
          MapContainer(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // _openDrawer();
                    },
                    child: Container(
                      width: 34,
                      height: 34,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColorLight,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Icon(Icons.menu_rounded),
                    ),
                  ),
                  Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Icon(
                        Icons.notifications_none,
                        color: AppColors.secondary,
                      )),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: SizeConfig.screenH! * 0.45,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, -2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(Icons.close_rounded,
                                    color: AppColors.secondary, size: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text("Your driver is coming in 3:35",
                        style: Styles.mediumSecondary),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/profile.png',
                          width: 80,
                          height: 50,
                        ),
                        SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sergio Ramasis",
                              style: Styles.largeSecondary,
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 16),
                                SizedBox(width: 4.0),
                                Text(
                                  "800m (5mins away)",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber, size: 16),
                                SizedBox(width: 4.0),
                                Text("4.9 (531 reviews)",
                                    style: TextStyle(fontSize: 14)),
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/icons/CarSm.png',
                          width: 80,
                          height: 50,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Payment method", style: Styles.mediumSecondary),
                        Text("\$220.00",
                            style: Styles.headingExtraLargeTitleBlack),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/visa.png',
                            width: 40,
                          ),
                          const SizedBox(width: 16.0),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("**** **** **** 8970",
                                  style: TextStyle(fontSize: 16)),
                              Text("Expires: 12/26",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Center(
                      child: PrimaryBtn(
                        onTap: () {
                          showPaymentSuccessDialog(context);
                        },
                        btnText: 'Pay',
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

void showPaymentSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            SvgPicture.asset(
              'assets/icons/success.svg',
            ),
            const SizedBox(height: 20.0),
            const Text("Payment Success", style: Styles.largeSecondary),
            const SizedBox(height: 15.0),
            const Text(
              "Your money has been successfully sent to Sergio Ramasis",
              style: Styles.smallSecondary,
              textAlign: TextAlign.center,
            ),
            const Divider(),
            const SizedBox(height: 15.0),
            const Text("How is your trip?", style: Styles.mediumSecondary),
            const SizedBox(height: 10.0),
            const Text(
                "Youe feedback will help us to improve your driving experience better",
                textAlign: TextAlign.center,
                style: Styles.smallSecondary),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryBtn(
                customHeight: 54,
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                borderRadius: BorderRadius.circular(8.0),
                btnText: 'Please Feedback',
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      );
    },
  );
}
