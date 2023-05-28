import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triva_number/service.dart';

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getRequest);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: data.when(
          data: (data) {
            return Text(
              data,
              style: TextStyle(color: Colors.blue, fontSize: 25),
            );
          },
          error: (error, stackTrace) {
            return Text(
              error.toString(),
              style: TextStyle(color: Colors.blue, fontSize: 25),
            );
          },
          loading: () {
            return CircularProgressIndicator();
          },
        )));
  }
}

//  Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               value.isEmpty ? "there is no value" : "the value is : ",
//               style: TextStyle(color: Colors.red),
//             ),
//             Text(
//               value,
//               style: TextStyle(color: Colors.blue, fontSize: 25),
//             ),
//           ],
//         ),
//       ),