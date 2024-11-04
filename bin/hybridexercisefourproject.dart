import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  const url = 'https://random-data-api.com/api/users/random_user?size=10';

  try {
    // Make the HTTP GET request
    final response = await http.get(Uri.parse(url));

    // Check if the response is successful (status code 200)
    if (response.statusCode == 200) {
      // Parse the JSON data
      List<dynamic> data = jsonDecode(response.body);

      // Loop through the list and output the uid, first_name, and last_name
      for (var user in data) {
        print('${user['uid']} - ${user['first_name']} ${user['last_name']}');
      }
    } else {
      // If the response was not successful, print the error status
      print('Failed to load users: ${response.statusCode}');
    }
  } catch (e) {
    // Handle any errors that occur during the request
    print('Error: $e');
  }
}
