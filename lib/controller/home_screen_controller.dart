// class SelectedData {
//   final String title;
//   final String description;
//   final String time;

//   SelectedData(this.title, this.description, this.time);
// }

import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/model/my_list%20_model.dart';

class HomeScreenController {
  List<MyListModel> myList = [];
  final db = Hive.box('localDb');

  void Addtodo(MyListModel data) {
    myList.add(data);
    updateDb();
  }

  void Deletename(int index) {
    myList.removeAt(index);
    updateDb();
  }

  loadDb() async {
    final List dbData = db.get('NoteList');
    myList = dbData
        .map((e) => MyListModel(
            title: e.title,
            descr: e.descr,
            containerColor: e.containerColor,
            time: e.time))
        .toList();
  }

  void updateDb() {
    db.put('NoteList', myList);
  }
}
