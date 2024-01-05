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
    this.competitionNameId,
    this.competitionName,
  });

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
      id: json['id'] ?? 0,
      startDate: json['start_date'] ?? "",
      endDate: json['end_date'] ?? "",
      description: json['description'],
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
      status: json['status'] ?? "",
      competitionNameId: json['competition_name_id'] ?? 0,
  competitionName: json['competition_name'] != null
          ? CompetitionName.fromJson(json['competition_name'])
          : CompetitionName(id: 0, logo: "", name: "", createdAt: '', updatedAt: ''),
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
      id: json['id'] ?? 0,
      logo: json['logo'] ?? "",
      name: json['name'] ?? "",
      description: json['description'],
      createdAt: json['created_at'] ?? "",
      updatedAt: json['updated_at'] ?? "",
    );
  }
}
