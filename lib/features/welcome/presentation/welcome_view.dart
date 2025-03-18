import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/features/welcome/presentation/widget/welcome_body.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.secondaryColor,
      body: const WelcomeBody(),
    );
  }
}
