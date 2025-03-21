import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:flutter/material.dart';

class CustomCircleProgressIndicator extends StatelessWidget {
  const CustomCircleProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: ColorManager.blueColor,
    );
  }
}
