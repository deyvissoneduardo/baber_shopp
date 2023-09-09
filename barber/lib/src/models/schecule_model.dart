// ignore_for_file: public_member_api_docs, sort_constructors_first
class ScheculeModel {
  final int id;
  final int barbershoId;
  final int userId;
  final String clientName;
  final DateTime date;
  final int hour;

  ScheculeModel({
    required this.id,
    required this.barbershoId,
    required this.userId,
    required this.clientName,
    required this.date,
    required this.hour,
  });

  factory ScheculeModel.fromMap(Map<String, dynamic> map) {
    switch (map) {
      case {
          'id': int id,
          'user_id': int userId,
          'barbershop_id': int barbershoId,
          'client_name': String clientName,
          'date': String scheduleDate,
          'time': int hour,
        }:
        return ScheculeModel(
          id: id,
          barbershoId: barbershoId,
          userId: userId,
          clientName: clientName,
          date: DateTime.parse(scheduleDate),
          hour: hour,
        );
      case _:
        throw ArgumentError('Invalid JSON');
    }
  }
}
