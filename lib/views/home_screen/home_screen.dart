import 'package:flutter/material.dart';
import 'package:todoapp/controller/home_screen_controller.dart';
import 'package:todoapp/model/my_list%20_model.dart';

import 'widgets/my_card.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    loadDbData();
    super.initState();
  }

  loadDbData() async {
    await homeScreenController.loadDb();
    setState(() {});
  }

  int contIncrement = 0;
  TextEditingController titleContoller = TextEditingController();
  TextEditingController description = TextEditingController();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  void _showTimePicker(context) {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  HomeScreenController homeScreenController = HomeScreenController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            //title field
                            TextField(
                              controller: titleContoller,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            ),
                            // description field
                            Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(style: BorderStyle.solid)),
                              child: TextField(
                                controller: description,
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              ),
                            ),
                            //select time field
                            InkWell(
                              onTap: () {
                                _showTimePicker(context);
                                setState(() {});
                              },
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(style: BorderStyle.solid)),
                                child: Center(
                                  child: Text(
                                    _timeOfDay.format(context).toString(),
                                  ),
                                ),
                              ),
                            ),
                            //save button
                            ElevatedButton(
                                onPressed: () {
                                  homeScreenController.Addtodo(MyListModel(
                                      containerColor: '',
                                      time:
                                          _timeOfDay.format(context).toString(),
                                      title: titleContoller.text.toString(),
                                      descr: description.text.toString()));
                                  setState(() {});
                                },
                                child: Text('SAVE'))
                          ],
                        ),
                      ),
                    );
                  });
              setState(() {});
            },
            backgroundColor: const Color.fromARGB(255, 40, 12, 45),
            child: Icon(
              Icons.add,
              color: Colors.white,
            )),
        body: ListView.builder(
            itemCount: homeScreenController.myList.length,
            itemBuilder: ((context, index) {
              return MyCard(
                time: homeScreenController.myList[index].time,
                title: homeScreenController.myList[index].title,
                description: homeScreenController.myList[index].descr,
                onPressed: () {
                  homeScreenController.Deletename(index);
                  setState(() {});
                },
              );
            })));
  }
}
