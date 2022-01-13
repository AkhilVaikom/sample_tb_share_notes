
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tb_share_notes/constants/route/route.dart';
import 'package:tb_share_notes/constants/string_constants.dart';
import 'package:tb_share_notes/screens/home/utility/drawer_menu.dart';
import 'package:tb_share_notes/screens/sharenotes/view_notes/view_share_notes.dart';

class HomeScreen extends StatefulWidget {
  final String user;
  const HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
@override
  void initState() {
    super.initState();
  }

   
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as Map;
    // String user= args['userName'];
    // print(widget.user);
    return Scaffold(
      drawer:  Drawer(child: DrawerWidget(name: widget.user,),),
      appBar: AppBar(title: Text(appName),centerTitle: true,actions: [IconButton(onPressed: (){
      logout(context);
      }, icon: const Icon(Icons.power_settings_new))],),
     

      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            onTap: ()=> Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>  ViewNotesScreen(title: "Title ${index + 1}",),
            ),
          ),
            title: Text("Title ${index + 1}"),
            leading: CircleAvatar(
              child: Text("${index + 1}"),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(thickness: 1);
        },
        itemCount: 20,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addNote');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

 logout(BuildContext context)async {
   final sharedPref= await SharedPreferences.getInstance();
   await sharedPref.clear();
   Navigator.of(context).pushNamedAndRemoveUntil(AppRouter.login, (route) => false);
   //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
 }

 
}
