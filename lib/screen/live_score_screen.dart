import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:live_score_app/match_score.dart';

import '../card.dart';

class LiveScoreScreen extends StatefulWidget {
  // 1hr 5min
  const LiveScoreScreen({super.key});

  @override
  State<LiveScoreScreen> createState() => _LiveScoreScreenState();
}

class _LiveScoreScreenState extends State<LiveScoreScreen> {
  final List<CricketMatchScore> _cricketMatchList = [];

  void _extractData(QuerySnapshot<Map<String, dynamic>>? snapshot) async {
    _cricketMatchList.clear();

    for (DocumentSnapshot doc in snapshot?.docs ?? []) {
      _cricketMatchList.add(CricketMatchScore.fromJson(
          doc.id, doc.data() as Map<String, dynamic>));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Live',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('cricket').snapshots(),
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
              _extractData(snapshot.data);

              return ListView.builder(
                itemCount: _cricketMatchList.length,
                itemBuilder: (context, index) {
                  CricketMatchScore cricketMatchScore =
                      _cricketMatchList[index];
                  return const display_card();
                },
              );
            }
            return const Center(
              child: Text('No data Found'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

}


// ListTile(
// leading: CircleAvatar(
// backgroundColor:
// _indicatorColor(cricketMatchScore.isMatchRunning),
// radius: 8,
// ),
// title: Text(cricketMatchScore.matchId),
// subtitle: Text('Team 1: ${cricketMatchScore.teamOneName}\n'
// 'Team 2 ${cricketMatchScore.teamTwoName}\n'
// 'Winner: ${cricketMatchScore.winnerTeam == '' ? 'Pending' : cricketMatchScore.winnerTeam}'),
// trailing: Text(
// '${cricketMatchScore.teamOneScore}/${cricketMatchScore.teamTwoScore}'),
// );
