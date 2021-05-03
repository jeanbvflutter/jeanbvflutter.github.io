import 'package:flutter/material.dart';
import 'textfield_ui.dart';

class ActionWidget extends StatelessWidget {
  String status;
  ActionWidget({this.status});



  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Container action(futureInstallationInfo) {
//   return Container(
//     child: Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(top: 10),
//           child: Center(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [

//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }
