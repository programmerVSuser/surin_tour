class DriverHistoryModal {
  final String DriverID;
  final String License_driver ;
  final String Telephone;
  final String age;
  final String car_registration;
  final String driver_Email;
  final String driver_Surname;
  final String driver_name;
  final String driver_user;
  final String dwelling;
  final String gender;
  final String id_card;
  final String pass_driver;
  final String religion;
  final String time_driver;

  DriverHistoryModal({
  required this.DriverID,
  required this.License_driver,
  required this.Telephone,
  required this.age,
  required this.car_registration,
  required this.driver_Email,
  required this.driver_Surname,
  required this.driver_name,
  required this.driver_user,
  required this.dwelling,
  required this.gender,
  required this.id_card,
  required this.pass_driver,
  required this.religion,
  required this.time_driver,
  });

  DriverHistoryModal copyWith({
    String? DriverID,
    String?License_driver,
    String?Telephone,
    String?age,
    String?car_registration,
    String?driver_Email,
    String?driver_Surname,
    String?driver_name,
    String?driver_user,
    String?dwelling,
    String?gender,
    String?id_card,
    String?pass_driver,
    String?religion,
    String?time_driver,
  }) {
    return DriverHistoryModal(
      DriverID: DriverID ?? this.DriverID,
      License_driver: License_driver ?? this.License_driver,
      Telephone: Telephone ?? this.Telephone,
      age: age ?? this.age,
      car_registration: car_registration ?? this.car_registration,
      driver_Email: driver_Email ?? this.driver_Email,
      driver_Surname: driver_Surname ?? this.driver_Surname,
      driver_name: driver_name ?? this.driver_name,
      driver_user: driver_user ?? this.driver_user,
      dwelling: dwelling ?? this.dwelling,
      gender: gender ?? this.gender,
      id_card: id_card ?? this.id_card,
      pass_driver: pass_driver ?? this.pass_driver,
      religion: religion ?? this.religion,
      time_driver: time_driver ?? this.time_driver,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'DriverID': DriverID,
      'License_driver': License_driver,
      'Telephone': Telephone,
      'age': age,
      'car_registration': car_registration,
      'driver_Email': driver_Email,
      'driver_Surname': driver_Surname,
      'driver_name': driver_name,
      'driver_user': driver_user,
      'dwelling': dwelling,
      'gender': gender,
      'id_card': id_card,
      'pass_driver': pass_driver,
      'religion': religion,
      'time_driver': time_driver,
    };
  }

  factory DriverHistoryModal.fromMapAddmin(Map<String, dynamic> map) {
    return DriverHistoryModal(
    DriverID: map['DriverID'],
    License_driver: map['License_driver'],
      Telephone: map['Telephone'],
      age: map['age'],
      car_registration: map['car_registration'],
      driver_Email: map['driver_Email'],
      driver_Surname: map['driver_Surname'],
      driver_name: map['driver_name'],
      driver_user: map['driver_user'],
      dwelling: map['dwelling'],
      gender: map['gender'],
      id_card: map['id_card'],
      pass_driver: map['pass_driver'],
      religion: map['religion'],
      time_driver: map['time_driver'],
    );
  }
}
