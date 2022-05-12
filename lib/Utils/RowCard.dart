import 'package:flutter/material.dart';

class RowCard extends StatelessWidget {
  RowCard({this.icon, this.title, this.description});

  String title;
  String description;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        width: MediaQuery.of(context).size.width / 4,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(4, 3),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(17, 112, 99, 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 45,
                width: 45,
                child: Icon(
                  icon,
                  size: 45,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: 24,
                width: 78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(255, 255, 255, 0.1),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      description,
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
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
