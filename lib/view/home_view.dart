import 'package:flutter/material.dart';
import 'package:mvvm_task/utils/routes_name.dart';
import 'package:mvvm_task/view/que_view.dart';
import 'package:mvvm_task/view_model/home_view_model.dart';
import 'package:provider/provider.dart';

import '../constant/strings.dart';
import '../view_model/shared_pref_model.dart';
import 'login_view.dart';

class Todohome extends StatefulWidget {
  const Todohome({Key? key}) : super(key: key);

  @override
  State<Todohome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<Todohome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController controlTime = TextEditingController();

  @override
  void initState() {
    homeViewState.pullData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/drawer_image.png'),
                  fit: BoxFit.fill)),
          child: ListView(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
                child: const Icon(Icons.photo, size: 130),
              ),
              SizedBox(
                height: 75,
                child: Center(
                    child: Text(
                  number,
                  style: const TextStyle(fontSize: 20),
                )),
              )
            ],
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/home_view_image.png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 20, bottom: 20),
                        child: const Icon(Icons.menu)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 140, bottom: 20),
                    child: const Text(
                      "Todo",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      UserView().remove();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                          (Route<dynamic> route) => false);
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 140, bottom: 20),
                        child: const Icon(Icons.logout)),
                  ),
                ],
              ),
            ),
            ChangeNotifierProvider<Homeview>.value(
              value: homeViewState,
              child: Consumer<Homeview>(
                builder: (context, value, _) {
                  return Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.taskList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        bool checkComplete = value.taskList[index].complete;
                        String indexVal = value.taskList[index].taskId;
                        return Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              bottom:
                                  MediaQuery.of(context).size.height * 0.005),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: value.taskList[index].state
                                      ? Colors.green
                                      : Colors.red),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    margin: const EdgeInsets.only(
                                        left: 30, right: 70),
                                    child: Text(
                                      value.taskList[index].tittle,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Checkbox(
                                    value: checkComplete,
                                    onChanged: (value) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Question(
                                                    index: indexVal,
                                                    status: value as bool,
                                                  )));
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.035,
                                    width: MediaQuery.of(context).size.width *
                                        0.43,
                                    child: Text(
                                      value.taskList[index].description,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10),
                                    ),
                                  ),
                                  Text(
                                    value
                                        .millioDate(value.taskList[index].time),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Pathname.save);
        },
        backgroundColor: Colors.green,
        highlightElevation: 10.0,
        elevation: 20,
        child: const Icon(Icons.add),
      ),
    );
  }
}
