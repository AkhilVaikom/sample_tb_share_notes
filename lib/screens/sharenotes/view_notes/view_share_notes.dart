import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/my_material_color.dart';
import 'package:tb_share_notes/constants/style_constants.dart';
import 'package:tb_share_notes/screens/sharenotes/edit_notes/edit_share_notes.dart';

class ViewNotesScreen extends StatelessWidget {
  final String title;
  const ViewNotesScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("View Notes"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 24,color: myTeal),
              ),
            ),
            
            
            Card(
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                height: _size.height * .62,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        TextField(
                          style: contentStyle,
                          decoration: InputDecoration(border: InputBorder.none),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.of(context).push( MaterialPageRoute(
              builder: (context) =>  EditNotesScreen(titleText: title,),
            ),),
       // onPressed: () =>Navigator.of(context).pushNamed(AppRouter.editNote),
        child: const Icon(Icons.edit),
      ),
    );
  }
}
