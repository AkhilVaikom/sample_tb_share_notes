import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_share_notes/constants/color/my_material_color.dart';
import 'package:tb_share_notes/constants/route/route.dart';
import 'package:tb_share_notes/logic/cubit/splash_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(
         create: (context) => SplashCubit(),
       )
      ],
      
      child: ScreenUtilInit(
        builder: () => MaterialApp(
          initialRoute: AppRouter.splash,
          onGenerateRoute: AppRouter.onGenerateRoute,
          theme: ThemeData(primarySwatch: myTeal),
          debugShowCheckedModeBanner: false,
          // home: const SplashScreen(),
        ),
        designSize: const Size(360, 640),
      ),
    );
  }
}
