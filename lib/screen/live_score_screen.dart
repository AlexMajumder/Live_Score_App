import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live_score_app/match_score.dart';

class LiveScoreScreen extends StatefulWidget { // 1hr 5min
  const LiveScoreScreen({super.key});

  @override
  State<LiveScoreScreen> createState() => _LiveScoreScreenState();
}

class _LiveScoreScreenState extends State<LiveScoreScreen> {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<CricketMatchScore> _cricketMatchList = [];

  bool _inProgress = false;

  Future<void> _getScoreData() async {
    _inProgress = true;
    setState(() {});

    _cricketMatchList.clear();
    final QuerySnapshot snapshot =
        await _firebaseFirestore.collection('cricket').get();

    for (DocumentSnapshot doc in snapshot.docs) {
      _cricketMatchList.add(CricketMatchScore.fromJson(
          doc.id, doc.data() as Map<String, dynamic>));

      _inProgress = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _getScoreData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: StreamBuilder(
          stream: _firebaseFirestore.collection('cricket').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: _cricketMatchList.length,
                itemBuilder: (context, index) {
                  CricketMatchScore cricketMatchScore =
                      _cricketMatchList[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor:
                          _indicatorColor(cricketMatchScore.isMatchRunning),
                      radius: 8,
                    ),
                    title: Text(cricketMatchScore.matchId),
                    subtitle: Text(
                        'Team 1: ${cricketMatchScore.teamOneName}\nTeam 2 ${cricketMatchScore.teamTwoName}'),
                    trailing: Text(
                        '${cricketMatchScore.teamOneScore}/${cricketMatchScore.teamTwoScore}'),
                  );
                },
              );
            }
            return const Center(
              child: Text('No data Found'),
            );
          }),
    );
  }

  Color _indicatorColor(bool isMatchRunning) {
    return isMatchRunning ? Colors.green : Colors.grey;
  }
}
