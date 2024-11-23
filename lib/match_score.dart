class CricketMatchScore {
  final String matchId;
  final String teamOneName;
  final String teamTwoName;
  final int teamOneScore;
  final int teamTwoScore;
  final bool isMatchRunning;
  final String winnerTeam;

  CricketMatchScore(
      {required this.matchId,
      required this.teamOneName,
      required this.teamTwoName,
      required this.teamOneScore,
      required this.teamTwoScore,
      required this.isMatchRunning,
      required this.winnerTeam});

  factory CricketMatchScore.fromJson(String id, Map<String, dynamic> json) {
    return CricketMatchScore(
        matchId: id,
        teamOneName: json['teamOne'],
        teamTwoName: json['teamTwo'],
        teamOneScore: json['teamOneScore'],
        teamTwoScore: json['teamTwoScore'],
        isMatchRunning: json['isMatchRunning'],
        winnerTeam: json['winnerTeam']);
  }
}
