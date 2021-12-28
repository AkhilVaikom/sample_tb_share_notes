import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/style_constants.dart';

class ViewNotesScreen extends StatelessWidget {
  final String title;
  const ViewNotesScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController=TextEditingController(text: title);
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("View Notes"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Title",
                style: subHeadStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextFormField(
                      controller: titleController,
                      style: contentStyle,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Descrption",
                style: subHeadStyle,
              ),
            ),
            Card(
              margin: const EdgeInsets.all(20),
              child: SizedBox(
                height: _size.height * .5,
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
    );
  }
}
