import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/variables/string_constants.dart';
import 'package:tb_share_notes/widgets/widgets.dart';

class AddNotesScreen extends StatelessWidget {
 const AddNotesScreen({Key? key}) : super(key: key);

 
 
  @override
  Widget build(BuildContext context) {
  FocusNode myFocusNode = FocusNode();;
  bool descTextFocus = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("Add Notes"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.white,
                    child:commonTextField(controller: titleController)),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
              },
              child: commonCardWidgets(size: _size, myFocusNode: myFocusNode, descTextFocus: descTextFocus)),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: buttonShape,
                    ),
                    onPressed: () {},
                    child: const Text(
                      "Add",
                      style: CommonTextStyle.buttonText,
                    )))
          ],
        ),
      ),
    );
  }
}
