class Complaint {
  final String id;
  final String description;
  final String userId;
  final DateTime date;
  final String status; // e.g., "Pending", "In Progress", "Resolved"
  final String? category; // Optional category field
  final String? response; // Optional response from admin/management

  Complaint({
    required this.id,
    required this.description,
    required this.userId,
    required this.date,
    required this.status,
    this.category,
    this.response,
  });

  // Factory constructor to create a Complaint from a JSON map
  factory Complaint.fromJson(Map<String, dynamic> json) {
    return Complaint(
      id: json['id'],
      description: json['description'],
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      category: json['category'],
      response: json['response'],
    );
  }

  // Method to convert a Complaint to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'userId': userId,
      'date': date.toIso8601String(),
      'status': status,
      'category': category,
      'response': response,
    };
  }

  // Create a copy of the Complaint with optional parameter updates
  Complaint copyWith({
    String? id,
    String? description,
    String? userId,
    DateTime? date,
    String? status,
    String? category,
    String? response,
  }) {
    return Complaint(
      id: id ?? this.id,
      description: description ?? this.description,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      status: status ?? this.status,
      category: category ?? this.category,
      response: response ?? this.response,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Complaint &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          description == other.description &&
          userId == other.userId &&
          date == other.date &&
          status == other.status &&
          category == other.category &&
          response == other.response;

  @override
  int get hashCode =>
      Object.hash(id, description, userId, date, status, category, response);

  @override
  String toString() {
    return 'Complaint{id: $id, description: $description, userId: $userId, date: $date, status: $status, category: $category, response: $response}';
  }
}
