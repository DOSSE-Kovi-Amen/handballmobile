class Group {
  final int id;
  final String name;
  final int competitionId;

  Group({
    required this.id,
    required this.name,
    required this.competitionId,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      name: json['name'],
      competitionId: json['competition_id'],
    );
  }
}