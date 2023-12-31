import 'package:cahb/models/competition_model.dart';
import 'package:cahb/models/group_model.dart';
import 'package:cahb/models/team_model.dart';

class Game {
  final int id;
  final int? teamHomeId;
  final int? teamAwayId;
  final String? date;
  final int? goalsHome;
  final int? goalsAway;
  final int? competitionId;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? time;
  final int? groupId;
  final String? status;
  final Team? teamHome;
  final Team? teamAway;
  final Group? group;
  final Competition? competition;

  Game({
    required this.id,
     this.teamHomeId,
     this.teamAwayId,
     this.date,
     this.goalsHome,
     this.goalsAway,
     this.competitionId,
     this.createdAt,
     this.updatedAt,
    this.deletedAt,
    this.time,
     this.groupId,
     this.status,
     this.teamHome,
     this.teamAway,
     this.group,
     this.competition,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'],
      teamHomeId: json['team_home_id'],
      teamAwayId: json['team_away_id'],
      date: json['date'],
      goalsHome: json['goals_home'],
      goalsAway: json['goals_away'],
      competitionId: json['competition_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      time: json['time'],
      groupId: json['group_id'],
      status: json['status'],
      teamHome: Team.fromJson(json['team_home']),
      teamAway: Team.fromJson(json['team_away']),
      group: Group.fromJson(json['group']),
      competition: Competition.fromJson(json['competition']),
    );
  }
}