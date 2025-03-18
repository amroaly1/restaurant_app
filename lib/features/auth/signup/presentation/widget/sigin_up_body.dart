import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:flutter/material.dart';

class SiginUpBody extends StatelessWidget {
  const SiginUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomWhiteBackground(
      height: DeviceWidthHeight.perentageOfHeight(
        HeightManager.h689,
      ),
    );
  }
}
