import 'package:dental_app/common/navigator.dart';
import 'package:dental_app/common/routing.dart';
import 'package:dental_app/screens/login/view_models/register_auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../components/constants.dart';
import '../../../theme/color.dart';

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterAuthViewModel>(builder: (context, authVm, _) {
      _nameController.text = authVm.name;
      _phoneController.text = authVm.phone;

      return SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Name",
                  style: TextStyle(color: greyText, fontSize: 15.0),
                ),
                TextFormField(
                  controller: _nameController,
                  style: const TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.5,
                  ),
                  onChanged: (value) => authVm.setName(value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  cursorColor: textColor,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    label: Text(
                      "Anakin Skywalker",
                      style: TextStyle(color: Color(0xffD9D9D9)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "Mobile No.",
                  style: TextStyle(color: greyText, fontSize: 15.0),
                ),
                TextFormField(
                  controller: _phoneController,
                  style: const TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.5,
                  ),
                  onChanged: (value) => authVm.setphone(value),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an phone number";
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  cursorColor: textColor,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    label: Text(
                      "+91 1234567890",
                      style: TextStyle(color: Color(0xffD9D9D9)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(
                              NavigationService.navigatorKey.currentContext!,
                              rootNavigator: true)
                          .push(Routes.otp());
                      // await authVm.signUpApi(context);
                    }
                  },
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                    backgroundColor: MaterialStateProperty.all(textColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Sign-Up",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
