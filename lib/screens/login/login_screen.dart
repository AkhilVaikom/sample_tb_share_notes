import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/string_constants.dart';
import 'package:tb_share_notes/constants/style_constants.dart';
import 'package:tb_share_notes/screens/home/home_screen.dart';
import 'package:tb_share_notes/screens/signup/signup_screen.dart';
import 'package:tb_share_notes/widgets/app_bar_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePassword = true;
  String? _username;
  String? _password;
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    var smallGap = const SizedBox(height: 20);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                                  emailTextField(emailController),
                                  smallGap,
                                  passwordTextField(passwordController),
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
                                _username = emailController.text;
                                _password = passwordController.text;
                                if (_username!.isEmpty || _password!.isEmpty) {
                                  print("Please Enter Field");
                                } else {
                                  print(_username);
                                  print(_password);
                                }
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeScreen()),
                                );
                              },
                              child: const Text(
                                "Login",
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
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const SignUpScreen()),
                                            );
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

  TextFormField passwordTextField(TextEditingController passwordController) {
    return TextFormField(
      
      style: contentStyle,
      controller: passwordController,
      keyboardType: TextInputType.text,
      obscureText: hidePassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                hidePassword = !hidePassword;
              });
            },
            icon: Icon(
                hidePassword ? passwordVisibility : passwordVisibilityOff)),
        hintText: "Pssword",
        prefixIcon: const Icon(Icons.lock_outlined),
      ),
    );
  }

  TextFormField emailTextField(TextEditingController emailController) {
    return TextFormField(
      style: contentStyle,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.email),
        hintText: "Email",
      ),
    );
  }
}
