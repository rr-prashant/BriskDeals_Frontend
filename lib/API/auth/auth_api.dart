import 'dart:convert';

import 'package:brisk_deals/Packages/Packages.dart';
import 'package:http/http.dart' as http;

Future<dynamic> userAuth(String email, String password) async {
  Map body = {"email": email, "password": password};
  var url = Uri.parse("$baseUrl/useraccounts/auth/login/");
  var res = await http.post(
    url,
    body: body,
  );

  try {
    if (res.statusCode == 200) {
      Map json = jsonDecode(res.body);
      String token = json['key'];
      var box = await Hive.openBox(tokenBox);
      box.put('token', token);
      User? user = await getUser(token);
      return user;
    } else {
      Map json = jsonDecode(res.body);
      if (json.containsKey("email")) {
        return json["email"][0];
      }
      if (json.containsKey("password")) {
        return json["password"][0];
      }
      if (json.containsKey("non_field_errors")) {
        return json["non_field_errors"][0];
      }
    }
  } catch (error) {
    return error;
  }
}

//User details
Future<User?> getUser(String token) async {
  var url = Uri.parse("$baseUrl/useraccounts/auth/user/");
  var res = await http.get(url, headers: {
    'Authorization': 'Token ${token}',
  });

  if (res.statusCode == 200 || res.statusCode == 201) {
    var json = jsonDecode(res.body);
    User user = User.fromJson(json);
    user.token = token;
    return user;
  } else {
    return null;
  }
}

//REGISTER API
Future<dynamic> registerUser(
  String full_name,
  String email,
  String password,
  String confirm_password,
) async {
  Map<String, dynamic> data = {
    "full_name": full_name,
    "email": email,
    "password1": password,
    "password2": confirm_password,
  };

  var url = Uri.parse("$baseUrl/useraccounts/auth/registration/customer/");
  var res = await http.post(
    url,
    body: data,
  );

  if (res.statusCode == 200 || res.statusCode == 201) {
    Map json = jsonDecode(res.body);

    if (json.containsKey("key")) {
      String token = json["key"];
      var box = await Hive.openBox(tokenBox);
      box.put("token", token);
      var a = await getUser(token);
      if (a != null) {
        User user = a;
        return user;
      } else {
        return null;
      }
    }
  } else if (res.statusCode == 400) {
    Map json = jsonDecode(res.body);
    if (json.containsKey("email")) {
      return json["email"][0];
    } else if (json.containsKey("password")) {
      return json["password"][0];
    } else if (json.containsKey("non_field_errors")) {
      return json["non_field_errors"][0];
    }
  } else {
    return null;
  }
}

Future<dynamic> addLocation(String key, String address) async {
  Map body = {"location": address};
  var url = Uri.parse("$baseUrl/useraccounts/auth/user/");
  var res = await http.put(url,
      headers: {'Authorization': 'Token ${key}'}, body: body);

  print(res.body);
  print(res.statusCode);
}

//LOGOUT API
Future<void> logOutUser(String token) async {
  var url = Uri.parse("$baseUrl/useraccounts/auth/logout/");
  var res = await http.post(url, headers: {
    'Authorization': 'Token ${token}',
  });
}

Future<dynamic> VendorRequestRegister(
    String business_name, String email, String phone, String location) async {
  Map<String, dynamic> data = {
    "email": email,
    "BusinessName": business_name,
    "phoneNumber": phone,
    "Location": location
  };
  var url = Uri.parse("$baseUrl/useraccounts/unverifiedVendor/");
  var res = await http.post(url, body: data);
}

// // Confirm email
// Future<dynamic> ConfirmMail(String key) async {
//   Map body = {"key": key};
//   var url = Uri.parse("$baseUrl/useraccounts/auth/confirm-email/");
//   var res = await http.post(
//     url,
//     body: body,
//   );

//   if (res.statusCode == 200 || res.statusCode == 201) {
//     return "ok";
//   } else {
//     return 1;
//   }
// }
