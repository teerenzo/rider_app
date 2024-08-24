import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rider_app/providers/placeProvider.dart';
import 'package:rider_app/services/placeService.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/size_config.dart';
import 'package:rider_app/values/styles.dart';
import 'package:rider_app/widgets/input_field.dart';
import 'package:rider_app/widgets/location_info.dart';

class AddressModal extends ConsumerStatefulWidget {
  const AddressModal({super.key});

  @override
  ConsumerState<AddressModal> createState() => _AddressModalState();
}

class _AddressModalState extends ConsumerState<AddressModal> {
  // from
  TextEditingController fromController = TextEditingController();
  // to
  TextEditingController toController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var addressProvider = ref.read(addressesProvider);

    var addressNotifier = ref.read(addressItemProvider.notifier);

    var itemAddressProvider = ref.read(addressItemProvider);

    return Container(
      height: itemAddressProvider.fromAddress != null &&
              itemAddressProvider.toAddress != null
          ? SizeConfig.screenH! * 0.3
          : SizeConfig.screenH! * 0.7,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: itemAddressProvider.fromAddress != null &&
              itemAddressProvider.toAddress != null
          ? LocationInfo()
          : SingleChildScrollView(
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
                          controller: fromController,
                          onTap: () {
                            // showModalOf places
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  height: SizeConfig.screenH! * 0.4,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Select address',
                                          style: Styles.mediumSecondary,
                                        ),
                                        const SizedBox(height: 10),
                                        const Divider(),
                                        const SizedBox(height: 10),
                                        SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Address(
                                                  name: 'Current location',
                                                  address: 'Current location',
                                                  km: '0.0'),
                                              ...addressProvider
                                            ]
                                                .map((address) =>
                                                    GestureDetector(
                                                        onTap: () {
                                                          addressNotifier
                                                              .setFromAddress(
                                                                  address);
                                                          // update the fromController
                                                          fromController.text =
                                                              address.name;
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: AddressItem(
                                                            address: address)))
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          onChanged: (value) {
                            print(value);
                          },
                          hintText: 'Form',
                          prefixIcon: Icon(Icons.my_location_sharp),
                        ),
                        const SizedBox(height: 10),
                        InputField(
                          controller: toController,
                          onChanged: (value) {},
                          hintText: 'To',
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  padding: const EdgeInsets.all(10),
                                  height: SizeConfig.screenH! * 0.4,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const Text(
                                          'Select address',
                                          style: Styles.mediumSecondary,
                                        ),
                                        const SizedBox(height: 10),
                                        const Divider(),
                                        const SizedBox(height: 10),
                                        SingleChildScrollView(
                                          child: Column(
                                            children: addressProvider
                                                .map((address) =>
                                                    GestureDetector(
                                                        onTap: () {
                                                          addressNotifier
                                                              .setToAddress(
                                                                  address);
                                                          // update the toController
                                                          toController.text =
                                                              address.name;
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: AddressItem(
                                                            address: address)))
                                                .toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
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
                                children: addressProvider
                                    .map((address) =>
                                        AddressItem(address: address))
                                    .toList()),
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
                  style: Styles.smallSecondary,
                  overflow: TextOverflow.clip,
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
