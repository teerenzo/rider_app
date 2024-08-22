import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/features/transport/confirm_ride.dart';
import 'package:rider_app/models/vehicle.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/size_config.dart';
import 'package:rider_app/values/styles.dart';
import 'package:rider_app/widgets/global_layout.dart';
import 'package:rider_app/widgets/location_info.dart';

import '../../models/payment_method.dart';
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
class RentCar extends StatefulWidget {
  VehicleModel vehicle;
  RentCar({super.key, required this.vehicle});

  @override
  State<RentCar> createState() => _RentCarState();
}

class _RentCarState extends State<RentCar> {
  int selectedIndex = 0;

  final List<PaymentMethod> paymentMethods = [
    PaymentMethod(
      type: 'Visa',
      details: '**** **** **** 8970',
      expiry: '12/26',
      icon: 'assets/icons/visa.png',
    ),
    PaymentMethod(
      type: 'MasterCard',
      details: '**** **** **** 8970',
      expiry: '12/26',
      icon: 'assets/icons/master.png',
    ),
    PaymentMethod(
      type: 'PayPal',
      details: 'mailaddress@mail.com',
      expiry: '12/26',
      icon: 'assets/icons/paypal.png',
    ),
    PaymentMethod(
      type: 'Cash',
      details: 'Cash',
      expiry: '12/26',
      icon: 'assets/icons/cash.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return GlobalLayout(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: SizeConfig.screenH! * 0.87445,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationInfo(),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColorLight.withOpacity(0.1),
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.vehicle.modelName,
                          style: Styles.largeSecondary.copyWith(
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star_outlined,
                                color: AppColors.warning),
                            const SizedBox(width: 5),
                            Text(
                              "4.9 (531 reviews)",
                              style: Styles.largeSecondary.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Image.asset(
                      widget.vehicle.image,
                      width: 93,
                      height: 54,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Charge",
                style: Styles.mediumSecondary,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mustang/per hours",
                    style: Styles.largeSecondary.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '\$200',
                    style: Styles.mediumSecondary.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vat (5%)",
                    style: Styles.largeSecondary.copyWith(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '\$20',
                    style: Styles.mediumSecondary.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Text(
                "Select payment method",
                style: Styles.mediumSecondary,
              ),
              const SizedBox(height: 10),
              ...List.generate(paymentMethods.length, (index) {
                var paymentMethod = paymentMethods[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.green
                            : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: selectedIndex == index
                          ? Colors.green.withOpacity(0.1)
                          : Colors.grey.withOpacity(0.2),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          paymentMethod.icon,
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              paymentMethod.details,
                              style: Styles.mediumSecondary.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Expires: ${paymentMethod.expiry}',
                              style: Styles.mediumSecondary.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
              PrimaryBtn(
                  customHeight: 54,
                  borderRadius: BorderRadius.circular(8.0),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ComfirmRide()));
                  },
                  btnText: "Ride Now",
                  color: AppColors.primaryColor,
                  textStyle: Styles.textSmallWhite)
            ],
          ),
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
