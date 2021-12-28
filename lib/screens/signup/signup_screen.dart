import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/string_constants.dart';
import 'package:tb_share_notes/constants/style_constants.dart';
import 'package:tb_share_notes/widgets/app_bar_container.dart';
import 'package:tb_share_notes/screens/login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.person),
                                        hintText: "Username",
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.email),
                                        hintText: "Email",
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: const OutlineInputBorder(),
                                          prefixIcon: IconButton(
                                            onPressed: () {
                                                  
                                            },
                                            icon: const Icon(Icons.lock_outlined),
                                          ),
                                          hintText: "Pssword",
                                          suffixIcon: const Icon(
                                            Icons.visibility,
                                            color: Colors.indigoAccent,
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          prefixIcon: Icon(Icons.lock_outlined),
                                          hintText: "Confirm Password",
                                          suffixIcon: Icon(
                                            Icons.visibility,
                                            color: Colors.indigoAccent,
                                          )),
                                    ),
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
                                onPressed: () {},
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
}
