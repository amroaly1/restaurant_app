import 'package:ecommerce_app/core/constant/on_boarding_list.dart';
import 'package:ecommerce_app/features/on_boarding/manager/on_bording_cubit/on_boarding_cubit.dart';
import 'package:ecommerce_app/features/on_boarding/presentation/widget/custom_card_of_on_baording.dart';
import 'package:flutter/material.dart';

class OnBaordingBody extends StatelessWidget {
  const OnBaordingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: OnBoardingCubit.get(context).pageController,
      itemBuilder: (context, index) {
        return CustomCardOfOnBoarding(
          onBoardingModel: kListOfOnBoarding[index],
          index: index,
          lenght: kListOfOnBoarding.length,
        );
      },
      itemCount: kListOfOnBoarding.length,
    );
  }
}
