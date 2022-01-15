import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/variables/string_constants.dart';

class EditNotesScreen extends StatelessWidget {
  final String titleText;
  const EditNotesScreen({
    Key? key,
    required this.titleText,
  }) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    // initState
    FocusNode myFocusNode = FocusNode();
    myFocusNode.requestFocus();
    // initState
     bool descTextFocus = false;
    Size _size = MediaQuery.of(context).size;
    final TextEditingController titleController =
        TextEditingController(text: titleText);
    titleController.selection = TextSelection.fromPosition(
        TextPosition(offset: titleController.text.length));
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: const Text("Update Notes"),
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
                    child: TextFormField(
                      controller: titleController,
                      style: CommonTextStyle.contentStyle,
                      decoration: const InputDecoration(
                        hintText: "Title:",
                        border: OutlineInputBorder(),
                        fillColor: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
              },
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white70, width: 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: const EdgeInsets.all(20),
                child: SizedBox(
                  height: _size.height * .5,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            focusNode: myFocusNode,
                            autofocus: descTextFocus,
                            style: CommonTextStyle.contentStyle,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
                      "Update",
                      style: CommonTextStyle.buttonText,
                    )))
          ],
        ),
      ),
    );
  }
}
