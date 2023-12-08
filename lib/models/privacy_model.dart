class Privacy {
  final String description;

  Privacy({required this.description});
  factory Privacy.fromJson(Map<String, dynamic> json) {
    return Privacy(description: json['description']);
  }
}
