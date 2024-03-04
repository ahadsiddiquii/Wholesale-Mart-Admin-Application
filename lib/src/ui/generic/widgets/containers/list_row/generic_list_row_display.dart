// import 'package:flutter/material.dart';

// import '../../../../features/home/home_view/home_widgets/category_single_button.dart';
// import '../../../exports/constants_exports.dart';

// class GenericListRowDisplay extends StatelessWidget {
//   const GenericListRowDisplay({
//     super.key,
//     required this.listToRender,
//     this.isListCategory = false,
//   });
//   final List<dynamic> listToRender;
  

//   @override
//   Widget build(BuildContext context) {
//     return Row(children: listToRender,)
    
//     ListView.builder(
//       itemCount: listToRender.length,
//       itemBuilder: (context, index) {
//         if (isListCategory) {
//           return const CategorySingleButton();
//         }
//         return const SizedBox();
//       },
//     );
//   }
// }
