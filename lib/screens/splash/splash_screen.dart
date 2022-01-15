import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tb_share_notes/constants/variables/string_constants.dart';
import 'package:tb_share_notes/logic/cubit/splash_cubit.dart';
import 'package:tb_share_notes/screens/splash/widgets/image_widgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Expanded(
            flex: 2,
            child: SplashImageWidgets(
              image: ImageName.splashImage,
            ),
          ),
          Expanded(
            flex: 1,
            child: BlocBuilder<SplashCubit, SplashState>(
              builder: (context, state) {
              if(state is SplashLoaded){
                return const SplashImageWidgets(image: ImageName.tbLogo);
              }
              else{
                return const SizedBox();
              }
               },
            ),
          ),
        ],
      ),
    );
  }
}


