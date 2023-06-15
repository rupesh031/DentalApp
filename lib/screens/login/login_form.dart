import 'package:dental_app/common/navigator.dart';
import 'package:dental_app/components/gradient.dart';
import 'package:dental_app/screens/login/view_models/login_auth_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/constants.dart';

import '../../../theme/color.dart';
import '../../../common/routing.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginAuthViewModel>(builder: (context, authVm, _) {
      _phoneController.text = authVm.email;
      _passwordController.text = authVm.password;

      return Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Mobile No.",
                  style: TextStyle(color: greyText, fontSize: 18.0),
                ),
                TextFormField(
                  style: const TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.5,
                  ),
                  controller: _phoneController,
                  onChanged: (value) {
                    authVm.setEmail(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter an Mobile Number";
                    } else if (authVm.email.toString().length < 10) {
                      return "Not a valid Mobile Number";
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
                  height: 60.0,
                ),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      gradient: buttonGrad,
                      borderRadius: BorderRadius.all(Radius.circular(28))),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await authVm.loginApi(context);
                      }
                    },
                    style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.of(
                            NavigationService.navigatorKey.currentContext!,
                            rootNavigator: true)
                        .pushReplacement(Routes.home()),
                    child: Text(
                      'Skip for Now',
                      style: TextStyle(
                        color: Color.fromARGB(202, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
