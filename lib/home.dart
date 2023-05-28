import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:triva_number/second_sceen.dart';
import 'package:triva_number/service.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: const [ThemeButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
            child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: "add number",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(16)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(16)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter number";
                  }
                  return null;
                },
                controller: controller,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.12,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16)))),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        int number = int.parse(controller.text);
                        ref.read(numbersApi.notifier).state = number;
                        print("text == ${controller.text}");
                        controller.clear();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SecondPage(),
                            ));
                      }
                    },
                    child: Text(
                      "Send",
                      style: Theme.of(context).textTheme.bodyLarge,
                    )),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

final changeThemeProvider = StateProvider<bool>((ref) {
  return false;
});

class ThemeButton extends ConsumerWidget {
  const ThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {
          if (ref.read(changeThemeProvider.notifier).state == true) {
            ref.read(changeThemeProvider.notifier).state = false;
          } else {
            ref.read(changeThemeProvider.notifier).state = true;
          }
        },
        icon: Icon(CupertinoIcons.moon_stars_fill));
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