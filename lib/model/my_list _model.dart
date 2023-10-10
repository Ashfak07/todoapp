import 'package:hive_flutter/hive_flutter.dart';
part 'my_list _model.g.dart';

@HiveType(typeId: 1)
class MyListModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String descr;
  @HiveField(2)
  final String containerColor;
  @HiveField(3)
  final String time;

  MyListModel(
      {required this.title,
      required this.descr,
      required this.containerColor,
      required this.time});
}
