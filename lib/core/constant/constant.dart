import 'package:ecommerce_app/core/utils/asset_icon_manager.dart';
import 'package:ecommerce_app/features/card/data/model/cost_model.dart';

const String yum = "YUM";
const String quick = "QUICK";
const String passwordHint = "*********";
const String phoneHint = "01002964834";

const List<String> botttomNavigationBarIcons = [
  AssetIconManager.homeIcon,
  AssetIconManager.menuIcon,
  AssetIconManager.profileIcon,
];

const String ar = "AR";
const String en = "EN";
const String errorMessage = "Oops ! There is error ): ";

List<CostModel> listOfCost = [
  CostModel(title: "Subtotal", price: 32.00),
  CostModel(title: "Tax and Fees", price: 5.00),
  CostModel(title: "Delivery", price: 3.00),
  CostModel(title: "Total", price: 40.00),
];
