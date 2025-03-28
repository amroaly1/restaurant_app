import 'package:ecommerce_app/features/on_boarding/manager/on_bording_cubit/on_boarding_cubit.dart';
import 'package:ecommerce_app/features/on_boarding/presentation/widget/on_bording_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        body: OnBaordingBody(),
      ),
    );
  }
}
