import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/features/transport/rent.dart';
import 'package:rider_app/models/vehicle.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/styles.dart';
import 'package:rider_app/widgets/global_layout.dart';

import '../../widgets/primary_btn.dart';

List<SpecificationModel> specifications = [
  SpecificationModel(
    title: "Max. power",
    value: "2500hp",
    image: "assets/icons/power.svg",
  ),
  SpecificationModel(
    title: "Fuel",
    value: "10km per litre",
    image: "assets/icons/Fual.png",
  ),
  SpecificationModel(
    title: "Max. speed",
    value: "230kph",
    image: "assets/icons/Speed.png",
  ),
  SpecificationModel(
    title: "0-60mph",
    value: "2.5sec",
    image: "assets/icons/mph.svg",
  ),
];

// ignore: must_be_immutable
class CarDetails extends StatelessWidget {
  VehicleModel vehicle;
  CarDetails({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return GlobalLayout(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vehicle.modelName,
              style: Styles.largeSecondary.copyWith(
                fontSize: 24,
              ),
              textAlign: TextAlign.start,
            ),
            Row(
              children: [
                const Icon(Icons.star_outlined, color: AppColors.warning),
                const SizedBox(width: 5),
                Text(
                  "4.9 (531 reviews)",
                  style: Styles.largeSecondary.copyWith(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // casousel slider
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_rounded)),
                Expanded(
                  child: Container(
                    // padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      vehicle.image,
                      height: 156,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios_rounded)),
              ],
            ),

            const SizedBox(height: 20),
            Text(
              "Specifications",
              style: Styles.largeSecondary.copyWith(
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var item in specifications) SpecificationItem(model: item),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "Car features",
              style: Styles.largeSecondary.copyWith(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 10),
            // car features
            Container(
              height: 44,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryColorLight.withOpacity(0.1),
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Model",
                    style: Styles.mediumSecondary.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    vehicle.modelName,
                    style: Styles.mediumSecondary.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 44,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryColorLight.withOpacity(0.1),
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Capacity",
                    style: Styles.mediumSecondary.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    vehicle.capacity.toString(),
                    style: Styles.mediumSecondary.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Container(
              height: 44,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryColorLight.withOpacity(0.1),
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Color",
                    style: Styles.mediumSecondary.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    vehicle.color,
                    style: Styles.mediumSecondary.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Container(
              height: 44,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryColorLight.withOpacity(0.1),
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fuel type",
                    style: Styles.mediumSecondary.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    vehicle.fuelType,
                    style: Styles.mediumSecondary.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Container(
              height: 44,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primaryColorLight.withOpacity(0.1),
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gear type",
                    style: Styles.mediumSecondary.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    vehicle.gearType,
                    style: Styles.mediumSecondary.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryBtn(
                  customWidth: 171,
                  customHeight: 54,
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () {},
                  btnText: "Book later",
                  color: AppColors.white,
                  textStyle: Styles.smallPrimary,
                ),
                PrimaryBtn(
                    customWidth: 171,
                    customHeight: 54,
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => RentCar(
                            vehicle: vehicle,
                          ),
                        ),
                      );
                    },
                    btnText: "Ride Now",
                    color: AppColors.primaryColor,
                    textStyle: Styles.textSmallWhite),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SpecificationModel {
  final String image;
  final String title;
  final String value;

  SpecificationModel(
      {required this.title, required this.value, required this.image});
}

class SpecificationItem extends StatelessWidget {
  final SpecificationModel model;

  const SpecificationItem({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      // height: 77,
      // width: 77,
      decoration: BoxDecoration(
        color: AppColors.primaryColorLight.withOpacity(0.1),
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (model.image.contains(".png"))
                Image.asset(
                  model.image,
                  width: 20,
                  height: 20,
                )
              else
                SvgPicture.asset(
                  model.image,
                  width: 20,
                  height: 20,
                ),
              Text(
                model.title,
                style: TextStyle(
                  color: AppColors.secondary,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                model.value,
                style: Styles.mediumSecondary.copyWith(
                  color: AppColors.secondary,
                  fontSize: 8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
