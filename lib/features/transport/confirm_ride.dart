import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rider_app/features/transport/driver_info.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/size_config.dart';
import 'package:rider_app/values/styles.dart';
import 'package:rider_app/widgets/global_layout.dart';
import 'package:rider_app/widgets/primary_btn.dart';

class ComfirmRide extends StatelessWidget {
  const ComfirmRide({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLayout(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: PrimaryBtn(
          customHeight: 54,
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DriverInfoScreen()));
          },
          borderRadius: BorderRadius.circular(8.0),
          btnText: 'Confirm Ride',
          color: AppColors.primaryColor,
        ),
      ),
      child: Container(
        height: SizeConfig.screenH! * 0.6,
        padding: const EdgeInsets.symmetric(horizontal: 70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            SvgPicture.asset(
              'assets/icons/success_sec.svg',
            ),
            const SizedBox(height: 20.0),
            const Text("Thank you", style: Styles.largeSecondary),
            const SizedBox(height: 10.0),
            const Text(
              "Your booking has been placed sent to Md. Sharif Ahmed",
              style: Styles.smallSecondary,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
