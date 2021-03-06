import 'package:flutter/material.dart';
import 'package:study_space/Home/view/side_menu.dart';
import 'package:study_space/CommonComponents/components.dart';

const divider = SizedBox(height: 32.0);

class HomeScreen extends StatelessWidget {
  @override
  final userName = "Gwen";
  final progress = 75;

  Widget build(BuildContext context) {
    var TopSummary = Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MenuButton(),
          CircleAvatar(
            radius: 90.0,
            backgroundImage: AssetImage('assets/img/portrait.png'),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {},
            child: Icon(Icons.refresh, color: Colors.black, size: 24.0),
          )
        ],
      ),
      SizedBox(height: 22),
      Text(
        userName,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
      Text(
        "$progress% study goal completed",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontWeight: FontWeight.normal, fontSize: 16, color: Colors.black38),
      )
    ]);

    return Scaffold(
      drawer: SideMenu(),
      body: SafeArea(
          child: ListView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(vertical: 12),
              children: [TopSummary, divider, HomeSchedule()])),
    );
  }
}

class HomeSchedule extends StatelessWidget {
  @override
  var subjects = [
    "Calculus",
    "Physics",
    "Computer Graphics",
    "Introduction to AI"
  ];
  var startTimes = ["11:00", "12:00", "9:00", "14:00"];
  var endTimes = ["11:45", "12:45", "9:00", "14:00"];
  final colors = [Colors.red, Colors.blue, Colors.green, Colors.orange];
  var eta = 15;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.all(22),
            color: Colors.black,
            width: double.infinity,
            child: Text(
              "Your next study session is ${subjects[0]}, starting in $eta minutes",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white),
            )),
        Container(
            padding: EdgeInsets.all(26),
            color: Color.fromRGBO(0, 0, 0, 0.06),
            width: double.infinity,
            child: Column(
                children: [
              for (var i = 0; i < subjects.length; i++)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Container(
                            width: 4.0,
                            height: 4.0,
                            decoration: BoxDecoration(
                                color: colors[i],
                                shape: BoxShape.circle),
                          ),
                          Text(
                            "  ${subjects[i]}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ]),
                        Text(
                          "${startTimes[i]} : ${endTimes[i]}",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                              color: Colors.black),
                        )
                      ]),
                ),
              SizedBox(height: 26),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {
                    },
                    child:   Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(
                        "Show my schedule  ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 22.0,
                      ),
                    ]),
                  )
            ])),
      ],
    );
  }
}
