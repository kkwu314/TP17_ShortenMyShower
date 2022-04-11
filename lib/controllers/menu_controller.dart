// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'package:get/get.dart';
// import 'package:shorten_my_shower/constant.dart';
// import 'package:shorten_my_shower/routing/routes.dart';

// class MenuController extends GetxController {
//   static MenuController instance = Get.find();
//   var activeItem = HomePageRoute.obs;
//   var hoverItem = "".obs;

//   changeActiveItemTo(String itemName) {
//     activeItem.value = itemName;
//   }

//   onHover(String itemName) {
//     if (!isActive(itemName)) hoverItem.value = itemName;
//   }

//   isActive(String itemName) => activeItem.value == itemName;

//   isHovering(String itemName) => hoverItem.value == itemName;

// Widget _customIcon(IconData icon, String itemName) {
//   if (isActive(itemName)) return Icon(icon, size: 22, color: kTextcolor);

//   return Icon(icon,
//       color: isHovering(itemName) ? kTextcolor : kTextcolor.withOpacity(.5));
// }
// }
