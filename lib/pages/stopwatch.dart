// Code Licensed under the Apache License, Version 2.0 - visit : https://github.com/akshatapp/flutter-gist/blob/master/LICENSE
// Flutter Stopwatch App - To learn more visit : https://github.com/akshatapp/flutter-gist

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rafa_app/pages/home.dart';
import 'package:get/get.dart';

class StopWatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STOPWATCH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StopwatchPage(title: 'STOPWATCH'),
    );
  }
}

class StopwatchPage extends StatefulWidget {
  StopwatchPage({Key? key, required this.title}) : super(key: key);
  final String title;

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;
  Duration previousTime = Duration();
  List<Widget> rounds = [];

  final TextStyle kTitleTextStyle = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  void initState() {
    super.initState();

    _timer =
        Timer.periodic(Duration(milliseconds: (1000 / 60).round()), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String formatTime(Duration elapedDuration) {
    List time = elapedDuration.toString().split(':');

    String seconds = time[2].toString().split('.')[0];
    String minutes = time[1];
    String hours = time[0].toString().padLeft(2, '0');
    return " $hours : $minutes : $seconds ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Wrap(
              spacing: 9.0,
              children: [
                Icon(Icons.timer, color: Colors.black),
                Text(widget.title, style: kTitleTextStyle)
              ],
            ),
          ),
          actions: [
            IconButton(
                padding: EdgeInsets.only(right: 8),
                onPressed: () => Get.to(() => HomePage()),
                icon: Icon(
                  CupertinoIcons.info,
                  size: 27,
                  color: Colors.black,
                )),
          ],
        ),
        body: buildStopwatch());
  }

  Widget buildRounds(Duration eTime, Duration pTime) {
    return ListTile(
      trailing: Icon(
        Icons.flag_sharp,
        color: Colors.redAccent[700],
      ),
      leading: Text(
        (rounds.length + 1).toString(),
        style: kTitleTextStyle,
      ),
      subtitle: Text(
        "+ " + (eTime - pTime).toString(),
        style: kTitleTextStyle.copyWith(color: Colors.redAccent[700]),
      ),
      title: Text(
        eTime.toString(),
        style: kTitleTextStyle,
      ),
    );
  }

  Widget buildStopwatch() {
    return ListView(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                formatTime(_stopwatch.elapsed),
                style: kTitleTextStyle.copyWith(fontSize: 50.0),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                (_stopwatch.elapsed).toString(),
                style: kTitleTextStyle,
              ),
              SizedBox(
                height: 90.0,
              ),
              Wrap(
                spacing: 20,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent[700]),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(18.0)),
                          shape: MaterialStateProperty.all(CircleBorder())),
                      onPressed: () {
                        setState(() {
                          if (_stopwatch.isRunning) {
                            rounds.add(
                                buildRounds(_stopwatch.elapsed, previousTime));
                            previousTime = rounds.isEmpty
                                ? Duration()
                                : _stopwatch.elapsed;
                          } else {
                            _stopwatch.reset();
                            previousTime = Duration();
                            rounds.clear();
                          }
                        });
                      },
                      child: _stopwatch.isRunning
                          ? Icon(
                              Icons.flag_rounded,
                              size: 25.0,
                            )
                          : Icon(
                              Icons.stop_rounded,
                              size: 25.0,
                            )),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF2962FF)),
                        padding:
                            MaterialStateProperty.all(EdgeInsets.all(18.0)),
                        shape: MaterialStateProperty.all(CircleBorder())),
                    onPressed: () {
                      setState(() {
                        if (_stopwatch.isRunning) {
                          _stopwatch.stop();
                        } else {
                          _stopwatch.start();
                        }
                      });
                    },
                    child: _stopwatch.isRunning
                        ? Icon(
                            Icons.pause_rounded,
                            size: 25.0,
                          )
                        : Icon(
                            Icons.play_arrow_rounded,
                            size: 25.0,
                          ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              LinearProgressIndicator(
                value: ((((_stopwatch.elapsedMilliseconds) / 1000) % 60) / 60),
              ),
              ...rounds.reversed
            ],
          ),
        ),
      ],
    );
  }
}
