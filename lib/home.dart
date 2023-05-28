import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triva_number/second_sceen.dart';
import 'package:triva_number/service.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getRequest);

    return Scaffold(
      body: Center(
          child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter number";
                }
                return null;
              },
              controller: controller,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    int number = int.parse(controller.text);
                    ref.read(numbersApi.notifier).state = number;
                    print("text == ${controller.text}");
                    controller.clear();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SecondPage(),
                        ));
                  }
                },
                child: Text("Send")),
          ],
        ),
      )),
    );
  }
}
// void _validateInputs() {
//   if (_formKey.currentState.validate()) {
// //    If all data are correct then save data to out variables
//     _formKey.currentState.save();
//   } else {
// //    If all data are not valid then start auto validation.
//     setState(() {
//       _autoValidate = true;
//     });
//   }
// }