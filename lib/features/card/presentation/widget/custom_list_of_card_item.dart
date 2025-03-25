import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/features/card/manager/card_cubit/card_cubit.dart';
import 'package:ecommerce_app/features/card/manager/card_cubit/card_state.dart';
import 'package:ecommerce_app/features/card/presentation/widget/custom_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListOfCardItem extends StatelessWidget {
  const CustomListOfCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardCubit, CardState>(
      builder: (context, state) {
        return SliverList.separated(
          itemBuilder: (context, index) {
            return CustomCardItem(
              card: CardCubit.get(context).getData()[index],
            );
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: HeightManager.h12),
              child: Divider(
                color: ColorManager.yellowColor,
              ),
            );
          },
          itemCount: CardCubit.get(context).getData().length,
        );
      },
    );
  }
}
