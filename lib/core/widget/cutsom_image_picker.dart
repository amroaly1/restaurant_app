import 'dart:io';

import 'package:ecommerce_app/core/helper/device_width_height.dart';
import 'package:ecommerce_app/core/manager/image_picker_cubit/image_picker_cubit.dart';
import 'package:ecommerce_app/core/manager/image_picker_cubit/image_picker_state.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/raduis_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class CutsomImagePicker extends StatelessWidget {
  const CutsomImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePickerCubit(),
      child: Builder(builder: (context) {
        return SizedBox(
          height: DeviceWidthHeight.perentageOfHeight(HeightManager.h127),
          width: DeviceWidthHeight.perentageOfWidth(WidthManager.w127),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(RaduisManager.r20),
                    color: ColorManager.primaryColor,
                  ),
                  child: BlocConsumer<ImagePickerCubit, ImagePickerState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is ImagePickerSelectImage) {
                        return Image.file(
                          File(state.image.path),
                          fit: BoxFit.cover,
                        );
                      } else if (state is ImagePickerGetFromStorage) {
                        return SizedBox();
                      }
                      return SvgPicture.asset(
                        AssetIconManager.myProfile,
                      );
                    },
                  ),
                ),
              ),
              PositionedDirectional(
                bottom: -5,
                end: -5,
                child: InkWell(
                  onTap: ImagePickerCubit.get(context).selectImage,
                  child: Container(
                    height: HeightManager.h26,
                    width: WidthManager.w26,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        RaduisManager.r10,
                      ),
                      color: ColorManager.secondaryColor,
                    ),
                    child: SvgPicture.asset(
                      AssetIconManager.camera,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
