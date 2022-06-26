class amoungModal {
  final String amount;
  final String name;
  final String time;
  amoungModal({
    required this.amount,
    required this.name,
    required this.time,
  });

  amoungModal copyWith({
    String? amount,
    String? name,
    String? time,
  }) {
    return amoungModal(
      amount: amount ?? this.amount,
      name: name ?? this.name,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'name': name,
      'time': time,
    };
  }

  factory amoungModal.fromMapAddmin(Map<String, dynamic> map) {
    return amoungModal(
      amount: map['amount'],
      name: map['name'],
      time: map['time'],
    );
  }
}
