import 'package:ecommerce_app/core/manager/image_picker_cubit/image_picker_state.dart';
import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/storage/cache_helper.dart';
import 'package:ecommerce_app/core/storage/storage_key.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCubit extends Cubit<ImagePickerState> {
  ImagePickerCubit() : super(ImagePickerInit()) {
    getImageFromSharedPreference();
  }
  static ImagePickerCubit get(context) => BlocProvider.of(context);
  XFile? image;

  void getImageFromSharedPreference() {
    CacheHelper cacheHelper = CacheHelper();
    String? image = cacheHelper.getDataString(key: StorageKey.imagepath);
    if (image != null) {
      emit(ImagePickerGetFromStorage(imageUrl: image));
    }
  }

  void changeStateOfSelectImage() {
    if (image != null) {
      RouteManager.backFrom();
      emit(ImagePickerSelectImage(image: image!));
    }
  }

  void selectImage() {
    ImagePicker picker = ImagePicker();
    Get.dialog(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: WidthManager.w20,
        children: [
          IconButton(
            onPressed: () async {
              image = await picker.pickImage(source: ImageSource.camera);
              changeStateOfSelectImage();
            },
            icon: Icon(
              Icons.camera,
              size: HeightManager.h37,
            ),
          ),
          IconButton(
            onPressed: () async {
              image = await picker.pickImage(source: ImageSource.gallery);
              changeStateOfSelectImage();
            },
            icon: Icon(
              Icons.photo_library,
              size: HeightManager.h37,
            ),
          ),
        ],
      ),
    );
  }
}
