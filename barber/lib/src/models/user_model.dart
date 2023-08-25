// ignore_for_file: public_member_api_docs, sort_constructors_first
sealed class UserModel {
  final int id;
  final String name;
  final String email;
  final String? avatar;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return switch (map['profile']) {
      'ADM' => UserModelADM.fromMap(map),
      'EMPLOYEE' => UserModelEmployee.fromMap(map),
      _ => throw ArgumentError('User profile not found')
    };
  }
}

class UserModelADM extends UserModel {
  final List<String>? workDays;
  final List<int>? workHours;

  UserModelADM({
    required super.id,
    required super.email,
    required super.name,
    super.avatar,
    this.workDays,
    this.workHours,
  });

  factory UserModelADM.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final int id,
        'name': final String name,
        'email': final String email,
      } =>
        UserModelADM(
          id: id,
          email: email,
          name: name,
          avatar: json['avatar'],
          workDays: json['work_days']?.cast<String>(),
          workHours: json['work_hours']?.cast<int>(),
        ),
      _ => throw ArgumentError('Invalid Json')
    };
  }
}

class UserModelEmployee extends UserModel {
  final List<String> workDays;
  final List<int> workHours;
  final int barbershopId;

  UserModelEmployee({
    required super.id,
    required super.email,
    required super.name,
    required this.workDays,
    required this.workHours,
    required this.barbershopId,
    super.avatar,
  });

  factory UserModelEmployee.fromMap(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final int id,
        'name': final String name,
        'email': final String email,
        'barbershop_id': final int barbershopId,
        'work_days': final List workDays,
        'work_hours': final List workHours,
      } =>
        UserModelEmployee(
          id: id,
          email: email,
          name: name,
          avatar: json['avatar'],
          barbershopId: barbershopId,
          workDays: workDays.cast<String>(),
          workHours: workHours.cast<int>(),
        ),
      _ => throw ArgumentError('Invalid Json')
    };
  }
}
