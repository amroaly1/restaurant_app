import 'package:ecommerce_app/core/localization/language_globale_var.dart';
import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/core/utils/asset_image_manager.dart';
import 'package:ecommerce_app/features/on_boarding/data/model/on_bording_model.dart';
import 'package:get/get.dart';

List<OnBordingModel> kListOfOnBoarding = [
  OnBordingModel(
    title: LanguageGlobaleVar.onboardingtitle1.tr,
    description: LanguageGlobaleVar.onboardingdesc1.tr,
    image: AssetImageManager.kOnBoardingImage1,
    icon: AssetIconManager.onBoardingIcon1,
  ),
  OnBordingModel(
    title: LanguageGlobaleVar.onboardingtitle2.tr,
    description: LanguageGlobaleVar.onboardingdesc2.tr,
    image: AssetImageManager.kOnBoardingImage2,
    icon: AssetIconManager.onBoardingIcon2,
  ),
  OnBordingModel(
    title: LanguageGlobaleVar.onboardingtitle3.tr,
    description: LanguageGlobaleVar.onboardingdesc3.tr,
    image: AssetImageManager.kOnBoardingImage3,
    icon: AssetIconManager.onBoardingIcon3,
  ),
];
