import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rider_app/features/authentication/login.dart';
import 'package:rider_app/features/transport/complaint.dart';
import 'package:rider_app/providers/authenticationProvider.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/size_config.dart';
import 'package:rider_app/values/styles.dart';
import 'package:rider_app/widgets/global_layout.dart';

class MenuComponent extends ConsumerStatefulWidget {
  const MenuComponent({super.key});

  @override
  ConsumerState<MenuComponent> createState() => _MenuComponentState();
}

class _MenuComponentState extends ConsumerState<MenuComponent> {
  List<MenuItem> menus = [
    MenuItem(
      title: 'History',
      icon: Icons.history_toggle_off_outlined,
      onTap: () {
        print('profile');
      },
    ),
    MenuItem(
      title: 'Complain',
      icon: Icons.compare_outlined,
      onTap: () {},
    ),
    MenuItem(
      title: 'Referral',
      icon: Icons.refresh,
      onTap: () {
        print('help');
      },
    ),
    MenuItem(
      title: 'About Us',
      icon: Icons.logout,
      onTap: () {},
    ),
    MenuItem(
      title: 'Settings',
      icon: Icons.logout,
      onTap: () {
        print('logout');
      },
    ),
    MenuItem(
      title: 'Help and Support',
      icon: Icons.logout,
      onTap: () {
        print('logout');
      },
    ),
    MenuItem(
      title: 'Logout',
      icon: Icons.logout,
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var authPro = ref.watch(authProvider);
    return Container(
      width: SizeConfig.screenW! * 0.6,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text('Back', style: Styles.paragraphLargeGray),
                    ],
                  ))),

          const SizedBox(height: 10),
          // profile avatar
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(
              'assets/icons/profile1.png',
            ),
          ),
          const SizedBox(height: 10),
          Text(authPro.name != null ? authPro.email.toString() : "",
              style: Styles.largeSecondary),
          Text(
              authPro.email != null
                  ? authPro.email.toString()
                  : 'teerenzo.co@gmail.com',
              style: Styles.smallSecondary),
          const SizedBox(height: 20),
          // menu items
          Column(
            children: menus.map((menu) {
              return MenuItem(
                title: menu.title,
                icon: menu.icon,
                onTap: menu.onTap,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends ConsumerWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const MenuItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: title == 'Logout'
          ? () {
              ref.read(authProvider.notifier).logout();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            }
          : title == 'Complain'
              ? () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ComplaintScreen()));
                }
              : onTap,
      child: Column(
        children: [
          const SizedBox(height: 5.0),
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/$title.svg',
              ),
              const SizedBox(width: 10),
              Text(title, style: Styles.smallSecondary),
            ],
          ),
          const SizedBox(height: 5.0),
          // last
          if (title != 'Logout') const Divider(),
        ],
      ),
    );
  }
}
