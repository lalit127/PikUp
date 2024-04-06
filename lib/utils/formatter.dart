import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:mime/mime.dart' as mime;

class Formatter {
  static String wonFormat(int number) => NumberFormat('#,###원').format(number);

  static String wonFormatDouble(double number) =>
      NumberFormat('#,###원').format(number);

  static String unitFormat(String unit, int number) =>
      NumberFormat('#,###$unit').format(number);

  static String dateFormat(String date) => date.isNotEmpty
      ? DateFormat('yy-MM-dd').format(DateTime.parse(date))
      : "";

  static DateTime stringToDate(String date) => DateTime.parse(date);

  static String dateDisplayFormat(String? selDate) {
    var date = "";
    if (selDate != null) {
      date = DateFormat('yy-MM-dd (EE)', 'ko').format(DateTime.parse(selDate));
    }
    return date;
  }

  static String findFileExtension(
    Uint8List data, [
    String unknown = 'application/octet-stream',
  ]) {
    String mimeType = mime.lookupMimeType('', headerBytes: data) ?? unknown;
    String ext = mime.extensionFromMime(mimeType);
    switch (ext) {
      case 'jpe':
      case 'jpeg':
        ext = 'jpg';
        break;
    }
    if (ext == mimeType) {
      ext = 'unknown';
    }
    return ext;
  }

  static String createBase64Timestamp() {
    int timestamp = DateTime.now().microsecondsSinceEpoch;
    String encoded = base64.encode(utf8.encode(timestamp.toString()));
    return encoded;
  }
}
