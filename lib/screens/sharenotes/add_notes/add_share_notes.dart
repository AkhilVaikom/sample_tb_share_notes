import 'package:flutter/material.dart';
import 'package:tb_share_notes/constants/style_constants.dart';

class AddNotesScreen extends StatefulWidget {
 const AddNotesScreen({Key? key}) : super(key: key);

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  late FocusNode myFocusNode;
  bool descTextFocus = false;

  @override
  void initState() {
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: TextFormField(
                      style: contentStyle,
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
                setState(() {
                  print("onfocus");
                  myFocusNode.requestFocus();
                });
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
                            style: contentStyle,
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
                      "Add",
                      style: buttonText,
                    )))
          ],
        ),
      ),
    );
  }
}
