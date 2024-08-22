import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/features/transport/car_details.dart';
import 'package:rider_app/models/vehicle.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/size_config.dart';
import 'package:rider_app/values/styles.dart';
import 'package:rider_app/widgets/global_layout.dart';
import 'package:rider_app/widgets/primary_btn.dart';

List<VehicleModel> types = [
  VehicleModel(
    capacity: 4,
    name: "Car",
    image: "assets/icons/Car.png",
    modelName: 'BMW',
    manufacturer: 'BMW',
    year: 0,
    color: 'black',
    price: 0,
    engineType: 'automatic',
    fuelType: 'petrol',
    gearType: 'automatic',
  ),
  VehicleModel(
    capacity: 1,
    name: "Bike",
    image: "assets/icons/Bike.png",
    modelName: 'BMW',
    manufacturer: 'BMW',
    year: 0,
    color: 'black',
    price: 0,
    engineType: 'automatic',
    fuelType: 'petrol',
    gearType: 'automatic',
  ),
  VehicleModel(
    capacity: 1,
    name: "Cycle",
    image: "assets/icons/Cycle.png",
    modelName: 'BMW',
    manufacturer: 'BMW',
    year: 0,
    color: 'black',
    price: 0,
    engineType: 'automatic',
    fuelType: 'petrol',
    gearType: 'automatic',
  ),
  VehicleModel(
    capacity: 4,
    name: "Taxi",
    image: "assets/icons/Taxi.png",
    modelName: 'BMW',
    manufacturer: 'BMW',
    year: 0,
    color: 'black',
    price: 0,
    engineType: 'automatic',
    fuelType: 'petrol',
    gearType: 'automatic',
  ),
];

class AvailableCars extends StatelessWidget {
  const AvailableCars({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLayout(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Select your transport",
              style: Styles.largeSecondary.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Container(
              height: SizeConfig.screenH! * 0.7,
              child: ListView.builder(
                  itemCount: types.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: VehicleCard(vehicleModel: types[index]),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  final VehicleModel vehicleModel;

  const VehicleCard({required this.vehicleModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicleModel.modelName,
                      style: Styles.largeSecondary,
                    ),
                    Row(
                      children: [
                        Text(
                          vehicleModel.gearType,
                          style: Styles.mediumSecondary,
                        ),
                        // vertical line
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 1,
                          height: 10,
                          color: AppColors.secondary,
                        ),
                        Text(
                          '${vehicleModel.capacity} seats',
                          style: Styles.mediumSecondary,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          width: 1,
                          height: 10,
                          color: AppColors.secondary,
                        ),
                        Text(
                          vehicleModel.fuelType,
                          style: Styles.mediumSecondary,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: AppColors.secondary),
                        const SizedBox(width: 10),
                        Text(
                          "800m (5mins away)",
                          style: Styles.mediumSecondary,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Image.asset(vehicleModel.image, width: 100, height: 100),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryBtn(
                  customWidth: 171,
                  onTap: () {},
                  btnText: "Book later",
                  color: AppColors.white,
                  textStyle: Styles.smallPrimary,
                ),
                PrimaryBtn(
                    customWidth: 171,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CarDetails(
                            vehicle: vehicleModel,
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
        ));
  }
}
