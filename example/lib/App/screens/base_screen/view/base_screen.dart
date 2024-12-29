import 'package:example/App/core/constants/color_constants.dart';
import 'package:example/App/core/utils/common.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({
    super.key,
    this.appBar,
    this.drawer,
    this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.padding,
  });
  final PreferredSizeWidget? appBar;
  final Drawer? drawer;
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: GestureDetector(
        onTap: removeFocus,
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 18),
          child: body,
        ),
      ),
      backgroundColor: backgroundColor ?? AppColors.backgroundColor,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}