class DriverModal {
  final String driver_user;
  final String pass_driver;
  final String DriverID;
  DriverModal({
    required this.driver_user,
    required this.pass_driver,
    required this.DriverID,
  });

  DriverModal copyWith(
      {String? driver_user, String? pass_driver, String? DriverID}) {
    return DriverModal(
      driver_user: driver_user ?? this.driver_user,
      pass_driver: pass_driver ?? this.pass_driver,
      DriverID: DriverID ?? this.DriverID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'driver_user': driver_user,
      'pass_driver': pass_driver,
      'DriverID': DriverID,
    };
  }

  factory DriverModal.fromMapAddmin(Map<String, dynamic> map) {
    return DriverModal(
        driver_user: map['driver_user'],
        pass_driver: map['pass_driver'],
        DriverID: map['DriverID']);
  }
}
