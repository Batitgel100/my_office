import 'package:http/http.dart' as http;

class UserRepository {
  static const String apiUrl = 'https://ub-office.mn/mobile/profile/edit/{9}';
  Future updatePage(
    String firstName,
  ) async {
    try {
      final response = await http.put(Uri.parse(apiUrl), body: {
        'firstname': firstName,
      });
      if (response.statusCode == 200) {
        print('*** Амжилттай солигдлоо ***');
        return true;
      } else {
        print(
          response.statusCode,
        );
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
