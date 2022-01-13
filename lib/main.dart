import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tb_share_notes/constants/my_material_color.dart';
import 'package:tb_share_notes/constants/route/route.dart';

void  main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      builder: ()=>MaterialApp(
        initialRoute: AppRouter.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
        theme: ThemeData(primarySwatch: myTeal),
        debugShowCheckedModeBanner: false,
       // home: const SplashScreen(),
      ),
      designSize: const Size(360, 640),
    );
  }
}