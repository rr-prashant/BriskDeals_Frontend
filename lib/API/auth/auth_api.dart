import 'dart:convert';

import 'package:brisk_deals/Packages/Packages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

Future<dynamic> userAuth(String email, String password) async {
  Map body = {"email": email, "password": password};
  var url = Uri.parse("$baseUrl/accounts/auth/login/");
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
  var url = Uri.parse("$baseUrl/accounts/auth/user/");
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

  var url = Uri.parse("$baseUrl/accounts/registration/customer/");
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

//adding location to user information
Future<dynamic> addLocation(String key, String address) async {
  Map body = {"location": address};
  var url = Uri.parse("$baseUrl/accounts/auth/user/");
  var res = await http.put(url,
      headers: {'Authorization': 'Token ${key}'}, body: body);

  print(res.body);
  print(res.statusCode);
}

//LOGOUT API
Future<void> logOutUser(String token) async {
  var url = Uri.parse("$baseUrl/accounts/auth/logout/");
  var res = await http.post(url, headers: {
    'Authorization': 'Token ${token}',
  });
}

//Vendor details send to admin for registration process
Future<dynamic> VendorRequestRegister(
  String business_name,
  String email,
  String phone,
  String location,
  String about,
  String opening_days,
  String opening_time,
) async {
  Map<String, dynamic> data = {
    "vendor_email": email,
    "vendor_BusinessName": business_name,
    "vendor_phoneNumber": phone,
    "vendor_Location": location,
    "vendor_about": about,
    "vendor_opening_days": opening_days,
    "vendor_opening_time": opening_time,
  };
  var url = Uri.parse("$baseUrl/accounts/unverifiedVendor/");
  var res = await http.post(url, body: data);
  print(res.body);
}

//get a specific vendor detail from database
Future<VendorBusiness> getVendor(int pk) async {
  const String api = '$baseUrl/accounts/VendorBusinessDetails/';
  String PK = pk.toString();
  var res = await http.get(Uri.parse(api + PK));
  print(res.statusCode);

  if (res.statusCode == 200 || res.statusCode == 201) {
    var json = jsonDecode(res.body);
    VendorBusiness Vendor = VendorBusiness.fromJson(json);
    return Vendor;
  } else {
    throw Exception("Error");
  }
}

// post the vendor details to briskdeals

Future<dynamic> postVendorBusinessDetails(
  int pk,
  String BusinessName,
  String Email,
  String PhoneNumber,
  String Token,
  String Location,
  String about,
  String opening_days,
  String opening_time,
) async {
  var url = Uri.parse("$baseUrl/accounts/VendorBusinessDetails/");
  var res = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "vendor_id": pk,
        "vendor_BusinessName": BusinessName,
        "vendor_email": Email,
        "vendor_Location": Location,
        "vendor_phoneNumber": PhoneNumber,
        "vendor_token": Token,
        "vendor_about": about,
        "vendor_opening_days": opening_days,
        "vendor_opening_time": opening_time,
      }));
  if (res.statusCode == 200 || res.statusCode == 201) {
    return "done";
  }
}

// get all vendor details from database
Future<List<VendorBusiness>> VendorData() async {
  List<VendorBusiness> myTodos = [];
  const String api = '$baseUrl/accounts/VendorBusinessDetails/';
  var res = await http.get(Uri.parse(api));
  print(res.statusCode);

  if (res.statusCode == 200 || res.statusCode == 201) {
    var data = jsonDecode(res.body);
    data.forEach((todo) {
      VendorBusiness t = VendorBusiness(
        VendorBusiness_Name: todo['vendor_BusinessName'],
        VendorBusiness_Email: todo['vendor_email'],
        VendorBusiness_Id: todo['vendor_id'],
        VendorBusiness_Location: todo['vendor_Location'],
        VendorBusiness_Phonenumber: todo['vendor_phoneNumber'],
        VendorBusiness_Token: todo['vendor_token'],
        VendorBusiness_Image: todo['vendor_image'],
        VendorBusiness_about: todo['vendor_about'],
        VendorBusiness_opening_days: todo['vendor_opening_days'],
        VendorBusiness_opening_time: todo['vendor_opening_time'],
      );
      myTodos.add(t);
    });
    return myTodos;
  } else {
    throw Exception("Error");
  }
}

// get data of all the deals posted by vendor
Future<List<Deals>> DealsData() async {
  List<Deals> dealData = [];
  const String api = '$baseUrl/accounts/deals/';
  var res = await http.get(Uri.parse(api));
  print(res.statusCode);

  if (res.statusCode == 200 || res.statusCode == 201) {
    var data = jsonDecode(res.body);
    data.forEach((todo) {
      Deals t = Deals(
        Business_name: todo["BusinessName"],
        Business_location: todo["BusinessLocation"],
        // Business_photo: todo["VendorBusiness_ProfileImage"],
        Business_Phone: todo["Business_Phone"],
        Deals_Id: todo["id"],
        Deals_title: todo["deal_title"],
        // Deals_photo: todo["deal_photo"],
        Deals_price: todo["deal_price"],
        Deals_category: todo["deal_category"],
        Deals_desc: todo["deal_desc"],
        Deals_condition: todo["deal_condition"],
        Deals_discount: todo["deal_discount"],
        Deals_applicable_time: todo["deal_applicable_time"],
        Deals_applicable_day: todo["deal_applicable_day"],
        Deals_expiry_date: todo["deal_expiry_date"],
        Deals_user: todo["user"],
      );
      dealData.add(t);
    });
    return dealData;
  } else {
    throw Exception("Error");
  }
}

//Get only the deals posted by some specific vendor
Future<List<Deals?>> SpecificDealsData(int key) async {
  List<Deals> dealData = [];
  String Key = key.toString();
  const String api = '$baseUrl/accounts/deals/';
  var res = await http.get(Uri.parse(api + Key));
  print(res.statusCode);

  if (res.statusCode == 200 || res.statusCode == 201) {
    var data = jsonDecode(res.body);
    data.forEach((todo) {
      Deals t = Deals(
        Deals_Id: todo["id"],
        Deals_title: todo["deal_title"],
        // Deals_photo: todo["deal_photo"],
        Deals_price: todo["deal_price"],
        Deals_category: todo["deal_category"],
        Deals_desc: todo["deal_desc"],
        Deals_discount: todo["deal_discount"],
        Deals_applicable_time: todo["deal_applicable_time"],
        Deals_applicable_day: todo["deal_applicable_day"],
        Deals_expiry_date: todo["deal_applicable_day"],
        Deals_user: todo["user"],
      );
      dealData.add(t);
    });
    return dealData;
  } else {
    throw Exception("Error");
  }
}

// Search integration by deals title
class FetchUser {
  var data = [];
  List<Deals> results = [];
  String api = '$baseUrl/accounts/deals/';
  Future<List<Deals>> getUserList({String? query}) async {
    var url = Uri.parse(api);
    var res = await http.get(url);
    try {
      if (res.statusCode == 200) {
        data = json.decode(res.body);
        results = data.map((e) => Deals.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) => element.Deals_title!
                  .toLowerCase()
                  .contains(query.toLowerCase()))
              .toList();
        }
      } else {
        print('api error');
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}

// sends data of the deal to cart
Future<dynamic> postCart(
  String BusinessName,
  // String BusinessPhoto,
  String BusinessLocation,
  String deal_Title,
  int deal_price,
  String deal_category,
  String deal_desc,
  String deal_condition,
  int deal_discount,
  String deal_applicable_time,
  String deal_applicable_day,
  String deal_expiry_date,
  int Customer_User,
  int Vendor_User,
  // String Deal_photo,
  String Vendor_Phone,
) async {
  var url = Uri.parse("$baseUrl/accounts/Cart/");
  var res = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "deal_title": deal_Title,
        "deal_price": deal_price,
        // "deal_photo": null,
        "deal_category": deal_category,
        "deal_desc": deal_desc,
        "deal_condition": deal_condition,
        "deal_discount": deal_discount,
        "deal_applicable_time": deal_applicable_time,
        "deal_applicable_day": deal_applicable_day,
        "deal_expiry_date": deal_expiry_date,
        "VendorBusiness_Name": BusinessName,
        "VendorBusiness_Location": BusinessLocation,
        // "VendorBusiness_ProfileImage": BusinessPhoto,
        "Customer_User": Customer_User,
        "Vendor_User": Vendor_User,
        "Vendor_Phone": Vendor_Phone,
      }));
  print(res.body);
  print(res.statusCode);

  if (res.statusCode == 200 || res.statusCode == 201) {
    return Fluttertoast.showToast(
        msg: "Item has been added to your Cart",
        fontSize: 18,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  } else {
    return Fluttertoast.showToast(
        msg: "Sorry! Something went wrong",
        fontSize: 18,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}

// get details of deals from cart model
Future<List<Cart?>> GetCart(int id) async {
  List<Cart> myTodos = [];
  String FK = id.toString();
  const String api = '$baseUrl/accounts/Cart/';
  var res = await http.get(Uri.parse(api + FK));

  if (res.statusCode == 200 || res.statusCode == 201) {
    var data = jsonDecode(res.body);
    data.forEach((todo) {
      Cart t = Cart(
          Deals_Id: todo["id"],
          Deals_title: todo["deal_title"],
          Deals_price: todo["deal_price"],
          // Deals_photo: todo["deal_photo"],
          Deals_category: todo["deal_category"],
          Deals_desc: todo["deal_desc"],
          Deals_condition: todo["deal_condition"],
          Deals_discount: todo["deal_discount"],
          Deals_applicable_time: todo["deal_applicable_time"],
          Deals_applicable_day: todo["deal_applicable_day"],
          Deals_expiry_date: todo["deal_expiry_date"],
          Business_name: todo["VendorBusiness_Name"],
          Business_location: todo["VendorBusiness_Location"],
          // Business_photo: todo["VendorBusiness_ProfileImage"],
          Customer_User: todo["Customer_User"],
          Vendor_User: todo["Vendor_User"],
          Vendor_Phone: todo["Vendor_Phone"]);
      myTodos.add(t);
    });

    return myTodos;
  } else {
    throw Exception("Error");
  }
}

Future<void> deleteCart(int id, int UserID) async {
  try {
    String FK = id.toString();
    const String api = '$baseUrl/CartDelete/';
    //var res = await http.delete(Uri.parse(api + FK));
    final http.Response response = await http.delete(
      Uri.parse(api + FK),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    //GetCart(UserID);
  } catch (e) {
    print(e);
  }
}

// Coupon Price = Price * (1 - Discount %) * Coupon Rate %

Future<Charges?> ChargesData() async {
  String PK = "1";
  const String api = '$baseUrl/accounts/Charges/';
  var res = await http.get(Uri.parse(api + PK));
  print(res.statusCode);
  print(res.body);

  if (res.statusCode == 200 || res.statusCode == 201) {
    var json = jsonDecode(res.body);
    Charges charges = Charges.fromJson(json);
    return charges;
  } else {
    throw Exception("Error");
  }
}

Future<dynamic> sendPurchaseEmail(String message, String email) async {
  Map<String, dynamic> data = {
    "notification_email": email,
    "notification_message": message,
  };
  var api = Uri.parse('$baseUrl/accounts/send-email-notification/');
  var res = await http.post(api, body: data);
  if (res.statusCode == 200 || res.statusCode == 201) {
    return 1;
  } else {
    return Fluttertoast.showToast(
        msg: "Sorry! Something went wrong while sending you email ",
        fontSize: 18,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}

Future<dynamic> postCouponDetails(
  String deal_title,
  // String deal_photo,
  int deal_discount,
  String deal_applicable_time,
  String deal_applicable_day,
  String deal_expiry_date,
  int Customer_user,
  int Vendor_user,
  String VendorBusiness_Name,
  String VendorBusiness_Location,
  String Vendor_Phone,
  int Total_Coupon_Price,
  String Customer_Name,
  String Customer_Address,
  String Customer_Phonenumber,
  String Customer_Email,
  bool Payment_Complete,
) async {
  var url = Uri.parse("$baseUrl/accounts/Coupon/");
  String coupon_Status = "Active";
  var res = await http.post(url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "deal_title": deal_title,
        // "deal_photo": deal_photo,
        "deal_discount": deal_discount,
        "deal_applicable_time": deal_applicable_time,
        "deal_applicable_day": deal_applicable_day,
        "deal_expiry_date": deal_expiry_date,
        "Customer_User": Customer_user,
        "Vendor_User": Vendor_user,
        "VendorBusiness_Name": VendorBusiness_Name,
        "VendorBusiness_Location": VendorBusiness_Location,
        "Vendor_Phone": Vendor_Phone,
        "Total_Coupon_Price": Total_Coupon_Price,
        "Customer_Name": Customer_Name,
        "Customer_Address": Customer_Address,
        "Customer_Phonenumber": Customer_Phonenumber,
        "Customer_Email": Customer_Email,
        "coupon_Status": coupon_Status,
        "Payment_Complete": Payment_Complete,
      }));
  print(res.body);
  print(res.statusCode);

  if (res.statusCode == 200 || res.statusCode == 201) {
    Fluttertoast.showToast(
        msg: "You have purchased this coupon",
        fontSize: 18,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  } else {
    Fluttertoast.showToast(
        msg: "Sorry! Something went wrong",
        fontSize: 18,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white);
    print("Sorry");
  }
}

// get details of deals from cart model
Future<List<CouponActive?>> GetCouponDetails(int id) async {
  List<CouponActive> myTodos = [];
  String FK = id.toString();
  const String api = '$baseUrl/accounts/UserCoupon/';
  var res = await http.get(Uri.parse(api + FK));

  if (res.statusCode == 200 || res.statusCode == 201) {
    var data = jsonDecode(res.body);
    data.forEach((todo) {
      CouponActive t = CouponActive(
        couponID: todo["id"],
        deal_title: todo["deal_title"],
        // deal_photo: todo["deal_photo"],
        deal_discount: todo["deal_discount"],
        deal_applicable_time: todo["deal_applicable_time"],
        deal_applicable_day: todo["deal_applicable_day"],
        deal_expiry_date: todo["deal_expiry_date"],
        Customer_user: todo["Customer_User"],
        Vendor_user: todo["Vendor_User"],
        VendorBusiness_Name: todo["VendorBusiness_Name"],
        VendorBusiness_Location: todo["VendorBusiness_Location"],
        Vendor_Phone: todo["Vendor_Phone"],
        Total_Coupon_Price: todo["Total_Coupon_Price"],
        Customer_Name: todo["Customer_Name"],
        Customer_Address: todo["Customer_Address"],
        Customer_Phonenumber: todo["Customer_Phonenumber"],
        Customer_Email: todo["Customer_Email"],
        coupon_Status: todo["coupon_Status"],
        Payment_Complete: todo["Payment_Complete"],
      );
      myTodos.add(t);
    });

    return myTodos;
  } else {
    throw Exception("Error");
  }
}

// get details of deals from cart model
Future<List<CouponActive?>> GetVendorCouponDetails(int id) async {
  List<CouponActive> myTodos = [];
  String FK = id.toString();
  const String api = '$baseUrl/accounts/VendorCoupon/';

  var res = await http.get(Uri.parse(api + FK));

  if (res.statusCode == 200 || res.statusCode == 201) {
    var data = jsonDecode(res.body);
    data.forEach((todo) {
      CouponActive t = CouponActive(
        couponID: todo["id"],
        deal_title: todo["deal_title"],
        // deal_photo: todo["deal_photo"],
        deal_discount: todo["deal_discount"],
        deal_applicable_time: todo["deal_applicable_time"],
        deal_applicable_day: todo["deal_applicable_day"],
        deal_expiry_date: todo["deal_expiry_date"],
        Customer_user: todo["Customer_User"],
        Vendor_user: todo["Vendor_User"],
        VendorBusiness_Name: todo["VendorBusiness_Name"],
        VendorBusiness_Location: todo["VendorBusiness_Location"],
        Vendor_Phone: todo["Vendor_Phone"],
        Total_Coupon_Price: todo["Total_Coupon_Price"],
        Customer_Name: todo["Customer_Name"],
        Customer_Address: todo["Customer_Address"],
        Customer_Phonenumber: todo["Customer_Phonenumber"],
        Customer_Email: todo["Customer_Email"],
        coupon_Status: todo["coupon_Status"],
        Payment_Complete: todo["Payment_Complete"],
      );
      myTodos.add(t);
    });

    return myTodos;
  } else {
    throw Exception("Error");
  }
}

// Search integration by coupon id
class FetchCustomerCoupon {
  var data = [];
  List<CouponActive> results = [];
  String api = '$baseUrl/accounts/UserCoupon/';
  Future<List<CouponActive>> getUserCouponList(
      {required String query, required int pk}) async {
    String PK = pk.toString();
    var url = Uri.parse(api + PK);
    var res = await http.get(url);
    try {
      if (res.statusCode == 200) {
        data = json.decode(res.body);
        results = data.map((e) => CouponActive.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) => element.couponID.toString().contains(query))
              .toList();
        }
      } else {
        print('api error');
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}

class FetchVendorCoupon {
  var data = [];
  List<CouponActive> results = [];
  String api = '$baseUrl/accounts/VendorCoupon/';
  Future<List<CouponActive>> getVendorCouponList(
      {required String query, required int pk}) async {
    String PK = pk.toString();
    var url = Uri.parse(api + PK);
    var res = await http.get(url);
    try {
      if (res.statusCode == 200) {
        data = json.decode(res.body);
        results = data.map((e) => CouponActive.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) => element.couponID.toString().contains(query))
              .toList();
        }
      } else {
        print('api error');
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}

class FetchLocationDeals {
  var data = [];
  List<Deals> results = [];
  String api = '$baseUrl/accounts/deals/';
  Future<List<Deals>> getLocationDeals({String? query}) async {
    var url = Uri.parse(api);
    var res = await http.get(url);
    try {
      if (res.statusCode == 200) {
        data = json.decode(res.body);
        results = data.map((e) => Deals.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) => element.Business_location!
                  .toLowerCase()
                  .contains(query.toLowerCase()))
              .toList();
        }
      } else {
        print('api error');
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}

Future<dynamic> sendFeedback(int userMain, int id, String message, String email,
    String customerName) async {
  String ID = id.toString();
  String userMAIN = userMain.toString();
  Map<String, dynamic> data = {
    "customer_id": ID,
    "Customer_Name": customerName,
    "Customer_Email": email,
    "Feedbacks": message,
    "Customer_user": userMAIN,
  };
  var api = Uri.parse('$baseUrl/accounts/Feedback/');
  var res = await http.post(api, body: data);
  if (res.statusCode == 200 || res.statusCode == 201) {
    return 1;
  } else {
    return Fluttertoast.showToast(
        msg: "Sorry! Something went wrong while sending you email ",
        fontSize: 18,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }
}
