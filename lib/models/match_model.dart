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
      id: json['id'] ?? 0,
      teamHomeId: json['team_home_id'],
      teamAwayId: json['team_away_id'],
      date: json['date']??"",
      goalsHome: json['goals_home'],
      goalsAway: json['goals_away'],
      competitionId: json['competition_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      time: json['time'],
      groupId: json['group_id'],
      status: json['status'],
      teamHome: json['team_home'] != null ? Team.fromJson(json['team_home']) : null,
      teamAway: json['team_away'] != null ? Team.fromJson(json['team_away']) : null,
      group: json['group'] != null ? Group.fromJson(json['group']) : null,
      competition: json['competition'] != null ? Competition.fromJson(json['competition']) : null,
    );
  }
}
