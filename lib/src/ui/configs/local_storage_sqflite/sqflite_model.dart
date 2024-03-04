class Data {
  Data({
    required this.key,
    required this.value,
  });
  final String key;
  final String value;

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'value': value,
    };
  }
}
