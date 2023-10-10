import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  MyCard({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    this.onPressed,
  });

  final String title;
  final String description;
  final String time;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 40, 12, 45)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        Icons.delete_outline,
                      ),
                      style: ButtonStyle(
                          iconColor: MaterialStatePropertyAll(
                        Colors.white,
                      )),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
