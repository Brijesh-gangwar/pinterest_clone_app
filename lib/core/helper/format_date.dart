import 'package:intl/intl.dart';


String formatDate(String? dateString) {
  if (dateString == null || dateString.trim().isEmpty) {
    return "Not available";
  }

  try {
    final cleanedDate = dateString.trim();
    DateTime parsedDate;
    try {
      parsedDate = DateFormat('dd/MM/yyyy').parseStrict(cleanedDate);
    } catch (_) {

      parsedDate = DateTime.parse(cleanedDate);
    }

    return DateFormat('dd-MM-yyyy').format(parsedDate);
  } catch (e) {
    return dateString;
  }
}
