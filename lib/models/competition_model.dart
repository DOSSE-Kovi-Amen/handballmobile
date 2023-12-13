class Competition {
  final int id;
  final String startDate;
  final String endDate;
  final String? description;
  final String createdAt;
  final String updatedAt;
  final String status;
  final int? competitionNameId;
  final CompetitionName? competitionName;

  Competition({
    required this.id,
    required this.startDate,
    required this.endDate,
     this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.competitionNameId,
    required this.competitionName,
  });

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
      id: json['id'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      status: json['status'],
      competitionNameId: json['competition_name_id'],
      competitionName: CompetitionName.fromJson(json['competition_name']),
    );
  }
}

class CompetitionName {
  final int id;
  final String logo;
  final String name;
  final String? description;
  final String createdAt;
  final String updatedAt;

  CompetitionName({
    required this.id,
    required this.logo,
    required this.name,
     this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CompetitionName.fromJson(Map<String, dynamic> json) {
    return CompetitionName(
      id: json['id'],
      logo: json['logo'],
      name: json['name'],
      description: json['description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
