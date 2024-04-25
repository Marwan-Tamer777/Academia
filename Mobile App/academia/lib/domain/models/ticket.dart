class Ticket {
  String courseId;
  String submittedBy;
  List<String> details;
  String status;
  List<String> adminResponses;
  List<String> attachments;
  String assignedTo;
  String priority;
  Date submittedOn;
  Date editedOn;

  Ticket({
      required this.courseId,
      required this.submittedBy,
      required this.details,
      required this.status,
      required this.adminResponses,
      required this.attachments,
      required this.assignedTo,
      required this.priority,
      required this.submittedOn,
      required this.editedOn
      });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      courseId: json['courseId'],
      submittedBy: json['submittedBy'],
      details: json['details'],
      status: json['status'],
      adminResponses: json['adminResponses'],
      attachments: json['attachments'],
      assignedTo: json['assignedTo'],
      priority: json['priority'],
      submittedOn: json['SubmittedOn'],
      editedOn: json['editedOn'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId,
      'submittedBy': submittedBy,
      'details': details,
      'status': status,
      'adminResponses': adminResponses,
      'attachments': attachments,
      'assignedTo': assignedTo,
      'priority': priority,
      'SubmittedOn': submittedOn,
      'editedOn': editedOn,
    };
  }
}

class Date {
  Date({required this.date, required this.timeZone});

  String date;
  String timeZone;

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      date: json['date'],
      timeZone: json['timeZone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'timeZone': timeZone,
    };
  }
}
