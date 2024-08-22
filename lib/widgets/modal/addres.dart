import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/size_config.dart';
import 'package:rider_app/values/styles.dart';
import 'package:rider_app/widgets/input_field.dart';

List<Address> addresses = [
  Address(
      name: 'Home',
      address: '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
      km: '2.5'),
  Address(name: 'Work', address: 'Kigali, Rwanda', km: '5.5'),
  Address(name: 'School', address: 'Kigali, Rwanda', km: '3.5'),
  Address(name: 'Gym', address: 'Kigali, Rwanda', km: '1.5'),
  Address(name: 'Church', address: 'Kigali, Rwanda', km: '4.5'),
  Address(name: 'Market', address: 'Kigali, Rwanda', km: '2.5'),
  Address(name: 'Hospital', address: 'Kigali, Rwanda', km: '3.5'),
  Address(name: 'Cafe', address: 'Kigali, Rwanda', km: '1.5'),
  Address(name: 'Library', address: 'Kigali, Rwanda', km: '4.5'),
  Address(name: 'Park', address: 'Kigali, Rwanda', km: '2.5'),
  Address(name: 'Stadium', address: 'Kigali, Rwanda', km: '3.5'),
  Address(name: 'Hotel', address: 'Kigali, Rwanda', km: '1.5'),
  Address(name: 'Restaurant', address: 'Kigali, Rwanda', km: '4.5'),
];

class AddressModal extends StatelessWidget {
  const AddressModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: SizeConfig.screenH! * 0.7,
      // padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.close))
              ],
            ),
          ),
          const Text(
            'Select address',
            style: Styles.mediumSecondary,
          ),
          const SizedBox(height: 10),
          const Divider(),
          // const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                InputField(
                  onChanged: (value) {},
                  hintText: 'Form',
                  prefixIcon: Icon(Icons.my_location_sharp),
                ),
                const SizedBox(height: 10),
                InputField(
                  onChanged: (value) {},
                  hintText: 'To',
                  prefixIcon: Icon(Icons.location_on),
                ),
                const SizedBox(height: 10),
                const Divider(),
              ],
            ),
          ),

          // recent places

          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: SizeConfig.screenH! * 0.48,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent places',
                    style: Styles.mediumSecondary,
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    // scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        ...addresses
                            .map((address) => AddressItem(address: address))
                            .toList()
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Address {
  final String name;
  final String address;
  final String km;

  Address({required this.name, required this.address, required this.km});
}

class AddressItem extends StatelessWidget {
  final Address address;

  const AddressItem({required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: AppColors.secondary),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name,
                  style: Styles.mediumSecondary,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  address.address,
                  style: Styles.paragraphSmallGray,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const Spacer(),
            Text(
              '${address.km} km',
              style: Styles.mediumSecondary,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}


