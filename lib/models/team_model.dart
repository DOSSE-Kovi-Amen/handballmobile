class Team {
  final int id;
  final String name;
  final String logo;
  final String? description;

  Team({
    required this.id,
    required this.name,
    required this.logo,
    this.description,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      description: json['description'],
    );
  }
}