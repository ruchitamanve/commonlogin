// import '/core/app_theme/theme_generator.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class BottomBar extends StatelessWidget {
//   const BottomBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ProviderforMenuList>(builder: (ctx, data, child) {
//       debugPrint('bottom bar date: ${data.syncDate}');
//       return Container(
//         color: ThemeGenerator().subHeaderColorDark,
//         padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Row(
//               children: [
//                 Text(
//                   'Powered by ARMS',
//                   style: TextStyle(
//                       color: ThemeGenerator().iconColor, fontSize: 12),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 10.0),
//                   child: Text(
//                     "Ⓡ",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: ThemeGenerator().iconColor,
//                         fontSize: 7),
//                   ),
//                 ),
//               ],
//             ),
//             Text(
//               // 'Last Sync: ${getIt<ProviderforMenuList>().syncDate?.toString()}',
//               'Last Sync: ${Provider.of<ProviderforMenuList>(ctx, listen: false).syncDate?.toString()}',
//               style: TextStyle(color: ThemeGenerator().iconColor, fontSize: 12),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
