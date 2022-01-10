import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/string_constants.dart';
import 'package:tb_share_notes/constants/style_constants.dart';
import 'package:tb_share_notes/screens/signup/utility/functions.dart';
import 'package:tb_share_notes/utility/validator.dart';
import 'package:tb_share_notes/widgets/app_bar_container.dart';
import 'package:tb_share_notes/screens/login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  // String? _userName, _password, _eMail, _confirmPassord;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  AppBarContainer(
                    height: size.height,
                    width: size.width,
                    image: appBarImage,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: size.height * 0.7,
                      width: size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Center(
                              child: Text(
                                "Sign Up",
                                style: headStyle,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              child: SingleChildScrollView(
                                child: Wrap(
                                  spacing: 1,
                                  children: [
                                    userNameTextField(userNameController),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    emailTextField(emailController),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    //passwordField(),
                                    passwordTextField(
                                        obscureText.password,
                                        passwordController,
                                        hidePassword,
                                        "Password"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    passwordTextField(
                                        obscureText.confirmPassword,
                                        confirmPasswordController,
                                        hideConfirmPassword,
                                        "Confirm Password"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    checkSignUp(
                                        context,
                                        userNameController.text,
                                        emailController.text,
                                        passwordController.text,
                                        confirmPasswordController.text);
                                  }
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: buttonText,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: RichText(
                                text: TextSpan(
                                    text: 'I\'m already a member?',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' Login',
                                          style: const TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 18),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginScreen()),
                                              );
                                            })
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  //Pasword Text Field
  TextFormField passwordTextField(Enum visibilePasswordText,
      TextEditingController controller, bool obText, String textName) {
    return TextFormField(
      validator: validatePassword,
      style: contentStyle,
      controller: controller,
      keyboardType: TextInputType.text,
      obscureText: obText,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obText = !obText;
                visibilePasswordText == obscureText.password
                    ? hidePassword = obText
                    : hideConfirmPassword = obText;
              });
            },
            icon: Icon(obText ? passwordVisibilityOff : passwordVisibility)),
        hintText: textName,
        prefixIcon: const Icon(Icons.lock_outlined),
      ),
    );
  }
}
