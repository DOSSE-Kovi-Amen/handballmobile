import 'package:hanballmobile/models/competition_model.dart';
import 'package:hanballmobile/models/group_model.dart';
import 'package:hanballmobile/models/team_model.dart';

class Game {
  final int id;
  final int teamHomeId;
  final int teamAwayId;
  final String date;
  final int goalsHome;
  final int goalsAway;
  final int competitionId;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String? time;
  final int groupId;
  final String status;
  final Team teamHome;
  final Team teamAway;
  final Group group;
  final Competition competition;

  Game({
    required this.id,
    required this.teamHomeId,
    required this.teamAwayId,
    required this.date,
    required this.goalsHome,
    required this.goalsAway,
    required this.competitionId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.time,
    required this.groupId,
    required this.status,
    required this.teamHome,
    required this.teamAway,
    required this.group,
    required this.competition,
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