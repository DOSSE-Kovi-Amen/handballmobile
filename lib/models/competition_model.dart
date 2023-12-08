class Competition {
  final int id;
  final String name;
  final String logo;
  final String startDate;
  final String endDate;
  final String description;
  final String status;

  Competition({
    required this.id,
    required this.name,
    required this.logo,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.status,
  });

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      description: json['description'],
      status: json['status'],
    );
  }
}
