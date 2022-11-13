import 'package:flutter/material.dart';
import 'package:mvvm_task/constant/strings.dart';

import '../utils/routes_name.dart';

class Question extends StatefulWidget {
  const Question({
    Key? key,
    required this.index,
    required this.status,
  }) : super(key: key);
  final String index;
  final bool status;

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              margin: const EdgeInsets.only(left: 60, top: 300),
              child: Text(
                widget.status ? "Task completed ?" : "Task is not conpleted ?",
                style: const TextStyle(fontSize: 30),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    homeviewstate.iscomplete(widget.status, widget.index);

                    Navigator.popAndPushNamed(context, Pathname.home);
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    margin: const EdgeInsets.only(left: 100),
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Center(
                      child: Text(
                        "Yes",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45,
                    width: 100,
                    margin: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Center(
                      child: Text(
                        "No",
                        style: TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
