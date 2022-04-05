// import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:shorten_my_shower/components/default_button.dart';
// import 'package:shorten_my_shower/constant.dart';
// import 'package:shorten_my_shower/controllers/controller.dart';
// import 'package:shorten_my_shower/controllers/menu_controller.dart';
// import 'package:shorten_my_shower/components/menu_item.dart';

// class CustomAppBar extends StatefulWidget {
//   const CustomAppBar({Key? key}) : super(key: key);

//   @override
//   _BarWidgetState createState() => _BarWidgetState();
// }

// class _BarWidgetState extends State<CustomAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(20),
//       padding: EdgeInsets.all(20),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(46),
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(0, -2),
//               blurRadius: 30,
//               color: Colors.black.withOpacity(0.16),
//             )
//           ]),
// child: Row(children: <Widget>[
//   Image.asset(
//     "assets/images/logo.png",
//     height: 30,
//     alignment: Alignment.topCenter,
//   ),
//   SizedBox(width: 5),
//   Text(
//     "Shorten My Shower".toUpperCase(),
//     style: TextStyle(
//       fontSize: 22,
//       fontWeight: FontWeight.bold,
//       //color: kPrimaryColor,
//     ),
//   ),
//         Spacer(),
//         MenuItem(
//             title: "Home",
//             press: () {
//               if (!menuController.isActive("Home")) {
//                 menuController.changeActiveItemTo("Home");
//                 navigationController.navigateTo("Home");
//                 // Navigator.pushNamed(context, "/");
//               }
//             }),
//         // MenuItem(title: "About", press: () {}),
//         MenuItem(
//             title: "Timer",
//             press: () {
//               if (!menuController.isActive("Timer")) {
//                 menuController.changeActiveItemTo("Timer");
//                 navigationController.navigateTo("Timer");
//                 // Navigator.pushNamed(context, "/Timer");
//               }
//             }),
//         MenuItem(
//             title: "Calculator",
//             press: () {
//               if (!menuController.isActive("Calculator")) {
//                 menuController.changeActiveItemTo("Calculator");
//                 navigationController.navigateTo("Reflection");
//                 // Navigator.pushNamed(context, "/Calculator");
//               }
//             }),
//         MenuItem(
//             title: "Reflection",
//             press: () {
//               if (!menuController.isActive("Reflection")) {
//                 menuController.changeActiveItemTo("Reflection");
//                 navigationController.navigateTo("Reflection");
//               }
//             }),
//         // MenuItem(title: "Contact", press: () {}),
//         DefaultButton(
//             text: "Login",
//             press: () {
//               if (!menuController.isActive("Login")) {
//                 menuController.changeActiveItemTo("Login");
//                 navigationController.navigateTo("Login");
//               }
//             }),
//       ]),
//     );
//   }

//   MenuItem({required String title, required Null Function() press}) {
//     return InkWell(
//       onTap: press,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 15),
//         child: Text(title.toUpperCase(),
//             style: TextStyle(
//                 color: MenuController.instance.isActive(title)
//                     ? kTextcolor
//                     : kTextcolor.withOpacity(0.5),
//                 fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }
