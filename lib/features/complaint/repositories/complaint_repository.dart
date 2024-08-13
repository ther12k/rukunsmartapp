import 'package:rukunsmart/features/complaint/models/complaint_model.dart';

class ComplaintRepository {
  Future<Complaint> postComplaint(String description) async {
    // TODO: Implement the API call to post a complaint
    // For now, we'll return a mock complaint
    return Complaint(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      description: description,
      userId: 'user123', // You'd get this from your auth system
      date: DateTime.now(),
      status: 'Pending',
    );
  }

  Future<List<Complaint>> fetchComplaints() async {
    // TODO: Implement the API call to fetch complaints
    // For now, we'll return a list of mock complaints
    return [
      Complaint(
        id: '1',
        description: 'Test complaint 1',
        userId: 'user123',
        date: DateTime.now().subtract(Duration(days: 1)),
        status: 'Pending',
      ),
      Complaint(
        id: '2',
        description: 'Test complaint 2',
        userId: 'user123',
        date: DateTime.now().subtract(Duration(days: 2)),
        status: 'Resolved',
      ),
    ];
  }
}
