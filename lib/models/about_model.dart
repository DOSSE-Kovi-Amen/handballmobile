class About {
  final String description;

  About({required this.description});

  factory About.fromJson(Map<String, dynamic> json) {
    return About(description: json['description']);
  }
}
