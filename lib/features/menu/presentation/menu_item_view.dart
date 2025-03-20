import 'package:ecommerce_app/core/widget/custom_white_background.dart';
import 'package:ecommerce_app/features/menu/presentation/widget/custom_item_data_view_app_bar.dart';
import 'package:flutter/material.dart';

class MenuItemView extends StatelessWidget {
  const MenuItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomItemDataViewAppBar(),
          Expanded(
            child: CustomWhiteBackground(
              child: Column(
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
