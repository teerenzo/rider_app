import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rider_app/features/home/map_container.dart';
import 'package:rider_app/features/transport/select_type.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/size_config.dart';
import 'package:rider_app/widgets/custom_scaffold.dart';
import 'package:rider_app/widgets/input_field.dart';
import 'package:rider_app/widgets/menu_component.dart';
import 'package:rider_app/widgets/modal/addres.dart';
import 'package:rider_app/widgets/primary_btn.dart';

import '../../values/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isMenuOpen = false;

  // drawer  state
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  void _closeMenu() {
    if (_isMenuOpen) {
      setState(() {
        _isMenuOpen = false;
      });
    }
  }

  bool isTransportSelected = true;

  void toggleSwitch() {
    setState(() {
      isTransportSelected = !isTransportSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _closeMenu,
      child: Stack(
        children: [
          CustomScaffold(
            useSafeArea: true,
            contentPadding: EdgeInsets.zero,
            isShowBackButton: false,
            scaffoldKey: _scaffoldKey,
            bottomNavigationBar: Stack(
              children: [
                BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favourite',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Wallet',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.local_offer),
                      label: 'Offer',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                  // currentIndex: _selectedIndex,
                  selectedItemColor: Colors.green,
                  // onTap: _onItemTapped,
                ),
                // Custom middle floating button
                Positioned(
                  top: -30, // Adjust this value to control the height
                  left: MediaQuery.of(context).size.width / 2 - 30,
                  child: FloatingActionButton(
                    backgroundColor: Colors.green,
                    onPressed: () {
                      // _onItemTapped(2); // Set to the middle index
                    },
                    child:
                        Icon(Icons.account_balance_wallet, color: Colors.white),
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
            drawer: AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: _isMenuOpen ? 0 : -250,
              top: 0,
              bottom: 0,
              child: Container(
                width: SizeConfig.screenW! * 0.6,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
                child: const MenuComponent(),
              ),
            ),
            body: Stack(
              children: [
                if (_isMenuOpen)
                  GestureDetector(
                    onTap: _closeMenu,
                    child: Container(
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                MapContainer(),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _openDrawer();
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
                    bottom: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      width: SizeConfig.screenW,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              PrimaryBtn(
                                onTap: () {},
                                btnText: 'Rental',
                                customWidth: 150,
                                color: AppColors.primaryColor,
                                textStyle:
                                    const TextStyle(color: AppColors.white),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: const Icon(
                                  Icons.location_searching_outlined,
                                  color: AppColors.secondary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 141,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            decoration: BoxDecoration(
                              color:
                                  AppColors.primaryColorLight.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // bottomSheet(context);

                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        constraints: BoxConstraints(
                                          maxHeight: SizeConfig.screenH! * 0.8,
                                          minHeight: SizeConfig.screenH! * 0.3,
                                        ),
                                        builder: (context) {
                                          return AddressModal();
                                        });
                                  },
                                  child: Container(
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: AppColors.white.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.search_rounded,
                                              color: AppColors.secondary,
                                            ),
                                            SizedBox(width: 5),
                                            Text('Where would you go?',
                                                style: Styles.smallSecondary),
                                          ],
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            Icons.favorite_border_rounded,
                                            color: AppColors.fieldGray,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColorLight
                                        .withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      PrimaryBtn(
                                        onTap: () {
                                          if (!isTransportSelected)
                                            toggleSwitch();

                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SelectType()));
                                        },
                                        btnText: 'Transport',
                                        customWidth:
                                            SizeConfig.screenW! * 0.424,
                                        color: isTransportSelected
                                            ? AppColors.primaryColor
                                            : AppColors.white.withOpacity(0.7),
                                        textStyle: TextStyle(
                                          color: isTransportSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        border: !isTransportSelected
                                            ? Border.fromBorderSide(
                                                BorderSide.none)
                                            : null,
                                        borderRadius: !isTransportSelected
                                            ? BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                bottomLeft:
                                                    Radius.circular(10.0),
                                              )
                                            : null,
                                      ),
                                      PrimaryBtn(
                                          onTap: () {
                                            if (isTransportSelected)
                                              toggleSwitch();
                                          },
                                          btnText: 'Delivery',
                                          customWidth:
                                              SizeConfig.screenW! * 0.424,
                                          color: isTransportSelected
                                              ? AppColors.white.withOpacity(0.7)
                                              : AppColors.primaryColor,
                                          textStyle: TextStyle(
                                            color: isTransportSelected
                                                ? Colors.black
                                                : Colors.white,
                                          ),
                                          border: isTransportSelected
                                              ? Border.fromBorderSide(
                                                  BorderSide.none)
                                              : null,
                                          borderRadius: isTransportSelected
                                              ? BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(10.0),
                                                  bottomRight:
                                                      Radius.circular(10.0),
                                                )
                                              : null),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
