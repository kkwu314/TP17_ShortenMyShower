// // import "package:flutter/material.dart";
// // import 'package:shorten_my_shower/constant.dart';

// // import '../controllers/menu_controller.dart';

// class MenuItem extends StatefulWidget {
//   final String title;
//   final Function() press;
//   const MenuItem({
//     Key? key,
//     required this.title,
//     required this.press,
//   }) : super(key: key);

//   @override
//   _MenuItemWidgetState createState() => _MenuItemWidgetState();
// }

// class _MenuItemWidgetState extends State<MenuItem> {
//   @override
//   Widget build(BuildContext context) {
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
