import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/features/transport/available_cars.dart';
import 'package:rider_app/models/car_type.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/styles.dart';
import 'package:rider_app/widgets/global_layout.dart';

List<CarType> types = [
  CarType(name: "Car", image: "assets/icons/Car.png"),
  CarType(name: "Bike", image: "assets/icons/Bike.png"),
  CarType(name: "Cycle", image: "assets/icons/Cycle.png"),
  CarType(name: "Tax", image: "assets/icons/Taxi.png"),
];

class SelectType extends StatelessWidget {
  const SelectType({super.key});

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
            GridView.builder(
              shrinkWrap: true,
              itemCount: types.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (context) => const AvailableCars(),
                          ),
                        ),
                    child: TypeItem(type: types[index]));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TypeItem extends StatelessWidget {
  final CarType type;

  const TypeItem({required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          // color: AppColors.black,
          // F7F7F7
          color: Color(0xFFF7F7F7),
          border: Border.all(color: AppColors.secondary),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              type.image,
              height: 86,
              width: 86,
            ),
            Text(
              type.name,
              style: Styles.mediumSecondary,
            ),
          ],
        ));
  }
}
