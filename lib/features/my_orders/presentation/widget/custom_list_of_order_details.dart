import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:ecommerce_app/core/utils/text_size_manager.dart';
import 'package:ecommerce_app/core/utils/text_style_manager.dart';
import 'package:ecommerce_app/features/my_orders/data/model/item_model.dart';
import 'package:flutter/material.dart';

class CustomListOfOrderDetails extends StatelessWidget {
  const CustomListOfOrderDetails({super.key, required this.items});
  final List<ItemModel> items;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: HeightManager.h12),
          child: Divider(
            color: ColorManager.yellowColor,
          ),
        );
      },
      itemBuilder: (context, index) {
        return SizedBox(
          height: DeviceWidthHeight.perentageOfHeight(HeightManager.h108),
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: DeviceWidthHeight.perentageOfHeight(HeightManager.h108),
                width: DeviceWidthHeight.perentageOfWidth(WidthManager.w72),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    RaduisManager.r20,
                  ),
                ),
                child: Image.network(
                  items[index].imagePath,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: WidthManager.w12,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            items[index].name,
                            style: TextStyleManager.meduim(
                              size: TextSizeManager.s15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            items[index].description,
                            style: TextStyleManager.meduim(
                              size: TextSizeManager.s13,
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$${items[index].price}",
                          style: TextStyleManager.light(
                            size: TextSizeManager.s14,
                          ),
                        ),
                        Center(
                          child: Row(
                            spacing: WidthManager.w7,
                            children: [
                              Icon(
                                Icons.remove,
                                color: ColorManager.secondaryColor,
                                size: HeightManager.h10,
                              ),
                              Text(
                                "${items[index].quantity}",
                                style: TextStyleManager.regular(
                                  size: TextSizeManager.s13,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: ColorManager.secondaryColor,
                                size: HeightManager.h10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: items.length,
    );
  }
}
