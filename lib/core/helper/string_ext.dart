extension TextExt on String {
  String get capitalize => isEmpty ? "" : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  String get inCaps => '${this[0].toUpperCase()}${substring(1)}';

  String get capitalizeFirstOfEach => split(" ").map((str) => str.capitalize).join(" ");
}

extension ConvertExt on String {
  double toDoubleIncludingInt() {
    return (double.tryParse(this) ?? int.tryParse(this)?.toDouble() ?? 0);
  }
}

extension FileNameExt on String {
  String get fileNameWithoutType {
    final text = split(".");
    text.removeLast();
    return text.join('.');
  }

  String get fileNameFromPath => substring(lastIndexOf('/') + 1);

  String get fileNameFromPathWithoutType => fileNameFromPath.fileNameWithoutType;
}

extension AuthTextExt on String {
  bool get isEmailShort => length < 1;

  bool get isPasswordShort => length < 1;
}
