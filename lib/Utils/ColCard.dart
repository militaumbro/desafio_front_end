import 'package:desafio_front_end/Model/GitUser.dart';
import 'package:flutter/material.dart';

class ColCard extends StatelessWidget {
  ColCard(this.user);
  GitUser user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(4, 3),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    // color: Colors.amber,
                    image: DecorationImage(
                      image: NetworkImage(user.avatarUrl),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(user.login),
                Text(user.type),
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.star,
                color: Color.fromRGBO(255, 214, 1, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 24.0,
              ),
              child: Text("Id: " + user.id.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
