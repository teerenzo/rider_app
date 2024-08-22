import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Color? bgColor;
  final String? title;
  final bool isShowBackButton;
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry contentPadding;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color drawerScrimColor;
  final bool useSafeArea;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget? trailing;
  final VoidCallback? onBackButtonTap;
  final Widget? bottomNavigationBar;
  const CustomScaffold({
    Key? key,
    this.scaffoldKey,
    required this.body,
    this.bgColor = Colors.white,
    this.isShowBackButton = true,
    this.contentPadding = const EdgeInsets.all(24.0),
    this.title,
    this.appBar,
    this.drawer,
    this.endDrawer,
    this.drawerScrimColor = Colors.transparent,
    this.floatingActionButtonLocation = FloatingActionButtonLocation.endFloat,
    this.floatingActionButton,
    this.useSafeArea = true,
    this.trailing,
    this.onBackButtonTap,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: contentPadding,
      child: Column(
        children: [
          Row(
            children: [
              if (title != null)
                Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              const Spacer(),
              if (trailing != null) trailing!,
            ],
          ),
          Expanded(child: body)
        ],
      ),
    );
    return SafeArea(
      child: Scaffold(
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        key: scaffoldKey,
        appBar: appBar,
        backgroundColor: bgColor,
        drawerScrimColor: drawerScrimColor,
        drawer: drawer,
        endDrawer: endDrawer,
        bottomNavigationBar: bottomNavigationBar,
        body: content,
      ),
    );
  }
}
