import 'package:desafio_front_end/Controllers/ApiController.dart';
import 'package:desafio_front_end/Utils/ColCard.dart';
import 'package:desafio_front_end/Utils/TextWidget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:desafio_front_end/Model/GitUser.dart';

import '../Utils/RowCard.dart';
import '../Utils/SearchBar.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool hasNotification = true;
  ApiController apiController;

  Future<List<GitUser>> futureGitUserList;

  @override
  void initState() {
    apiController = ApiController();
    futureGitUserList = apiController.getGitHubUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(5, 62, 95, 1),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Row(children: [
          Flexible(child: Container()),
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications_none_rounded),
                onPressed: () {},
              ),
              if (hasNotification)
                Positioned(
                  top: 10,
                  right: 12,
                  child: CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 4,
                  ),
                ),
            ],
          ),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                // color: Colors.amber,
                image: DecorationImage(
                  image: NetworkImage(
                      'https://pbs.twimg.com/profile_images/911530983333253120/wNUcTdD2_400x400.jpg'),
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            // child: FittedBox(
            //   fit: BoxFit.fill,
            //   // child: Image(
            //   //     ),
            // ),
          )
        ]),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,

        // title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromRGBO(246, 247, 247, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, top: 24, bottom: 4, right: 4),
                    child: TextWidget("Hi, Marília", fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, top: 4, bottom: 8, right: 8),
                    child: TextWidget(
                      "Welcome Back",
                      fontSize: 30,
                      bold: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 24, top: 8, bottom: 8, right: 24),
                    child: MySearchBar(),
                  ),
                  _getTopic('Schedule'),
                  Container(
                    height: 136,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          RowCard(
                            icon: Icons.house_sharp,
                            title: 'At Home',
                            description: '17 Doctors',
                          ),
                          RowCard(
                            icon: Icons.medical_services,
                            title: 'At His House',
                            description: '31 Doctors',
                          ),
                          RowCard(
                            icon: Icons.wifi,
                            title: 'Online',
                            description: '34 Doctors',
                          ),
                          RowCard(
                            icon: Icons.coffee,
                            title: 'At a Cafe',
                            description: '8 Doctors',
                          ),
                        ],
                      ),
                    ),
                  ),
                  _getTopic('Top Rate'),

                  // Lazy loading é melhor, mas como a aplicação é pequena optei por esse aqui mesmo...
                  FutureBuilder<List<GitUser>>(
                    future: futureGitUserList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          List<GitUser> gitUsersList = snapshot.data;
                          return Column(
                            children: [
                              // Mapeia os usuários do Git recebidos para os cards adequados
                              ...gitUsersList.map((user) => ColCard(user)).toList()
                            ],
                          );
                        }
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      return const CircularProgressIndicator();
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _getTopic(String topic) {
  return Padding(
    padding: const EdgeInsets.only(left: 24.0, right: 24, top: 8, bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          topic,
          fontSize: 20,
          bold: true,
        ),
        TextButton(
            onPressed: () {},
            child: Text(
              'See All',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ))
      ],
    ),
  );
}
