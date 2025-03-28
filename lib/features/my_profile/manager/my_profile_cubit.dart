import 'dart:io';

import 'package:ecommerce_app/core/storage/cache_helper.dart';
import 'package:ecommerce_app/core/storage/storage_key.dart';
import 'package:ecommerce_app/features/my_profile/data/repo/my_profile_repo.dart';
import 'package:ecommerce_app/features/my_profile/manager/my_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileCubit extends Cubit<MyProfileState> {
  MyProfileCubit() : super(MyProfileInitial()) {
    CacheHelper cacheHelper = CacheHelper();
    fullNameController = TextEditingController(
        text: cacheHelper.getDataString(key: StorageKey.name));
    mobileNumberController = TextEditingController(
        text: cacheHelper.getDataString(key: StorageKey.phone));
  }

  static MyProfileCubit get(context) => BlocProvider.of(context);

  // controller
  late TextEditingController fullNameController;
  late TextEditingController mobileNumberController;

  // Xfile image

  XFile? image;

  void updateImage(XFile image) {
    this.image = image;
  }

  // form fild add

  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  // repo

  MyProfileRepo repo = MyProfileRepo();

  void onTap() async {
    emit(MyProfileLoading());
    if (globalKey.currentState!.validate()) {
      var response = await repo.updateData(
        name: fullNameController.text,
        mobile: mobileNumberController.text,
        image: image == null ? null : File(image!.path),
      );
      response.fold(
        (error) => emit(MyProfileFailing(errMessage: error)),
        (success) => emit(MyProfileSuccess(message: success)),
      );
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(MyProfileTextNotValidate());
    }
  }
}
