import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_task/utils/utils.dart';

import '../constant/strings.dart';
import '../utils/routes_name.dart';

class Savetask extends StatefulWidget {
  const Savetask({Key? key}) : super(key: key);

  @override
  State<Savetask> createState() => _SavetaskState();
}

class _SavetaskState extends State<Savetask> {
  final TextEditingController _controltask = TextEditingController();
  final TextEditingController _discripController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('yyyy-MM-dd HH:mm');
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        margin: const EdgeInsets.only(left: 40, top: 40),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.05,
              child: TextField(
                controller: _controltask,
                decoration: const InputDecoration(
                    hintText: "Tittle",
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.05,
              child: TextField(
                controller: _discripController,
                decoration: const InputDecoration(
                    hintText: "Discription",
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.only(top: 100, left: 100),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                      child: DateTimeField(
                    initialValue: DateTime.now(),
                    format: format,
                    onShowPicker: (BuildContext context, newDate) async {
                      final date = await showDatePicker(
                          context: context,
                          initialDate: mydate,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(
                                newDate ?? DateTime.now()));
                        setState(() {
                          millisecondtime = DateTimeField.combine(date, time)
                              .millisecondsSinceEpoch
                              .toString();
                        });
                        return DateTimeField.combine(date, time);
                      } else {
                        return mydate;
                      }
                    },
                  )),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                if (mydate.millisecondsSinceEpoch <=
                    int.parse(millisecondtime)) {
                  setState(() {
                    state = true;
                  });
                } else {
                  setState(() {
                    state = false;
                  });
                }
                if (_controltask.text != '') {
                  homeviewstate.pushData(
                      _controltask.text,
                      _discripController.text,
                      millisecondtime.toString(),
                      state);
                  Navigator.popAndPushNamed(context, Pathname.home);
                } else {
                  Utils.flushBarErrorMessage("Please enter tittle", context);
                }
              },
              child: Container(
                height: 50,
                width: 150,
                margin: const EdgeInsets.only(top: 100),
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Center(
                  child: Text(
                    "Save",
                    style: TextStyle(color: Colors.black, fontSize: 30),
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
