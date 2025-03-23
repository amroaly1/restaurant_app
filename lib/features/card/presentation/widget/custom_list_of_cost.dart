import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerce_app/core/constant/constant.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class CustomListOfCost extends StatelessWidget {
  const CustomListOfCost({
    super.key,
    required this.price,
  });
  final List<double> price;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: listOfCost.length + 1,
      itemBuilder: (context, index) {
        if (index == listOfCost.length - 1) {
          return DottedLine(
            dashColor: ColorManager.yellowColor,
          );
        } else if (index == listOfCost.length) {
          index--;
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              listOfCost[index].title,
              style: TextStyleManager.meduim(
                size: TextSizeManager.s20,
              ),
            ),
            Text(
              "\$${price[index]}",
              style: TextStyleManager.meduim(
                size: TextSizeManager.s20,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: HeightManager.h19,
        );
      },
    );
  }
}
