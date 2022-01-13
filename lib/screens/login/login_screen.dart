import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/string_constants.dart';
import 'package:tb_share_notes/constants/style_constants.dart';
import 'package:tb_share_notes/screens/login/utility/functions.dart';
import 'package:tb_share_notes/utility/validator.dart';
import 'package:tb_share_notes/widgets/app_bar_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  bool hidePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var smallGap = const SizedBox(height: 20);

    return Scaffold(
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
                    height: size.height * 0.68,
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
                            height: 50,
                          ),
                          const Center(
                            child: Text(
                              "Login",
                              style: headStyle,
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            child: SingleChildScrollView(
                              child: Wrap(
                                spacing: 1,
                                children: [
                                  emailTextField(
                                      emailController: emailController),
                                  smallGap,
                                  passwordTextField(
                                      passwordController: passwordController),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forget Password?",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 18),
                              ),
                            ),
                          ),
                          smallGap,
                          SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    login(
                                        context: context,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        loading: _isLoading);

                                    setState(() {
                                      _isLoading = true;
                                    });
                                  }
                                },
                                child: const Text(
                                  "Login",
                                  style: buttonText,
                                ),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                  text: 'I\'m a new user?',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Sign Up',
                                        style: const TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 18),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(
                                                context, '/signup');
                                          })
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Password Text Field

  TextFormField passwordTextField(
      {required TextEditingController passwordController}) {
    return TextFormField(
      validator: validatePassword,
      style: contentStyle,
      controller: passwordController,
      keyboardType: TextInputType.text,
      obscureText: hidePassword,
      decoration: InputDecoration(
        focusedBorder: textBorderDecoration,
        enabledBorder: textBorderDecoration,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            icon: Icon(
                hidePassword ? passwordVisibilityOff : passwordVisibility)),
        hintText: "Pssword",
        prefixIcon: const Icon(Icons.lock_outlined),
      ),
    );
  }
}
