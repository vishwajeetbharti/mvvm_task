import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_task/utils/utils.dart';

import '../constant/strings.dart';
import '../utils/routes_name.dart';

class SaveTask extends StatefulWidget {
  const SaveTask({Key? key}) : super(key: key);

  @override
  State<SaveTask> createState() => _SaveTaskState();
}

class _SaveTaskState extends State<SaveTask> {
  final TextEditingController _controlTask = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('yyyy-MM-dd HH:mm');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/save_page_image.png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.05,
              margin: const EdgeInsets.only(top: 60),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: TextField(
                controller: _controlTask,
                decoration: const InputDecoration(
                    hintText: "Tittle",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.4,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: TextField(
                controller: _controllerDescription,
                decoration: const InputDecoration(
                    hintText: "Description",
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.only(top: 100, left: 90),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.black)),
                  child: Center(
                      child: DateTimeField(
                    initialValue: DateTime.now(),
                    format: format,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    onShowPicker: (BuildContext context, newDate) async {
                      final date = await showDatePicker(
                          context: context,
                          initialDate: myDate,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(
                                newDate ?? DateTime.now()));
                        setState(() {
                          milliSecondTime = DateTimeField.combine(date, time)
                              .millisecondsSinceEpoch
                              .toString();
                        });
                        return DateTimeField.combine(date, time);
                      } else {
                        return myDate;
                      }
                    },
                  )),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                if (myDate.millisecondsSinceEpoch <=
                    int.parse(milliSecondTime)) {
                  setState(() {
                    state = true;
                  });
                } else {
                  setState(() {
                    state = false;
                  });
                }
                if (_controlTask.text != '') {
                  homeViewState.pushData(
                      _controlTask.text,
                      _controllerDescription.text,
                      milliSecondTime.toString(),
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
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black),
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
