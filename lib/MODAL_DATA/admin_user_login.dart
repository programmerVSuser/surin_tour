class AddminModal {
  final String email;
  final String pass;
  AddminModal({
    required this.email,
    required this.pass,
  });

  AddminModal copyWith({String? email, String? pass,}) {
    return AddminModal(
      email: email ?? this.email,
      pass: pass ?? this.pass,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'pass': pass,
    };
  }

  factory AddminModal.fromMapAddmin(Map<String, dynamic> map) {
    return AddminModal(
      email: map['email'],
      pass: map['pass'],
    );
  }
}