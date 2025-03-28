import 'package:ecommerce_app/core/route/route_manager.dart';
import 'package:ecommerce_app/core/storage/cache_helper.dart';
import 'package:ecommerce_app/core/storage/storage_key.dart';
import 'package:ecommerce_app/core/utils/color_manager.dart';
import 'package:ecommerce_app/core/utils/height_and_width_manager.dart';
import 'package:ecommerce_app/core/utils/padding_manager.dart';
import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/features/profile/data/repo/profile_repo.dart';
import 'package:ecommerce_app/features/profile/presentation/widget/custom_profile_app_bard.dart';
import 'package:ecommerce_app/features/profile/presentation/widget/custom_setting_card.dart';
import 'package:ecommerce_app/features/welcome/presentation/welcome_view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CustomProfileAppBard(),
          Expanded(
            child: CustomWhiteBackground(
              child: Padding(
                padding: PaddingManager.paddingHorizontalBody,
                child: Column(
                  children: [
                    SizedBox(
                      height: HeightManager.h34,
                    ),
                    Column(
                      spacing: HeightManager.h27,
                      children: List.generate(
                        ProfileRepo.settingCardsData().length - 1,
                        (index) => CustomSettingCard(
                          onTap: () {
                            // make list to go to screens
                            RouteManager.navigateTo(ProfileRepo.screens[index]);
                          },
                          model: ProfileRepo.settingCardsData()[index],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: HeightManager.h27,
                      ),
                      child: Divider(
                        color: ColorManager.primaryColor,
                      ),
                    ),
                    CustomSettingCard(
                      isEnd: false,
                      model: ProfileRepo.settingCardsData()[
                          ProfileRepo.settingCardsData().length - 1],
                      onTap: () async {
                        CacheHelper cacheHelper = CacheHelper();
                        await cacheHelper.saveData(
                          key: StorageKey.isLogin,
                          value: false,
                        );
                        await cacheHelper.removeData(
                          key: StorageKey.accesstoken,
                        );
                        await cacheHelper.removeData(
                          key: StorageKey.refreshtoken,
                        );
                        await cacheHelper.removeData(
                          key: StorageKey.imagepath,
                        );
                        await cacheHelper.removeData(
                          key: StorageKey.email,
                        );
                        await cacheHelper.removeData(
                          key: StorageKey.phone,
                        );
                        RouteManager.navigateToAndRemoveAllScreenFromStack(
                          WelcomeView(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
