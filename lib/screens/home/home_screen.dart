import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/string_constants.dart';
import 'package:tb_share_notes/screens/sharenotes/add_notes/add_share_notes.dart';
import 'package:tb_share_notes/screens/sharenotes/view_notes/view_share_notes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(appName),centerTitle: true,),
      // body: CustomScrollView(
      //   slivers: <Widget>[
      //     SliverAppBar(
      //       title: Text(appName),
      //       centerTitle: true,
      //       //expandedHeight: 200,
      //       //flexibleSpace: FlexibleSpaceBar(background: Image.asset(appBarImage),),
      //       floating: true,
      //     ),

      //   ],
      // ),

      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
          //   onTap: ()=> Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) =>  ViewNotesScreen(title: "Title ${index + 1}",),
          //   ),
          // ),
          onTap: () => Navigator.pushNamed(context, '/viewNote', arguments: {'title':'${index+1}'}),
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
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const AddNotesScreen(),
          //   ),
          // );
          Navigator.pushNamed(context, '/addNote');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
