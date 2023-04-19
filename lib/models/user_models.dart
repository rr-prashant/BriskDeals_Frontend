class User {
  User(
      {this.id,
      this.token,
      this.email,
      this.name,
      this.location,
      this.phonenumber,
      this.is_user,
      this.VendorBusiness_about,
      this.VendorBusiness_opening_time,
      this.VendorBusiness_opening_days});

  factory User.fromJson(json) {
    return User(
        email: json["email"],
        name: json["full_name"],
        id: json["pk"],
        location: json["location"],
        is_user: json["user_type"],
        phonenumber: json["phonenumber"],
        VendorBusiness_about: json["vendor_about"],
        VendorBusiness_opening_days: json["vendor_opening_days"],
        VendorBusiness_opening_time: json["vendor_opening_time"]);
  }

  String? email;
  int? id;
  int? is_user;
  String? location;
  String? name;
  String? phonenumber;
  String? token;
  String? VendorBusiness_about;
  String? VendorBusiness_opening_time;
  String? VendorBusiness_opening_days;
}

//Model for vendor information for registration process
class VendorBusiness {
  VendorBusiness({
    this.VendorBusiness_Id,
    this.VendorBusiness_Token,
    this.VendorBusiness_Email,
    this.VendorBusiness_Phonenumber,
    this.VendorBusiness_Name,
    this.VendorBusiness_Location,
    this.VendorBusiness_Image,
    this.VendorBusiness_about,
    this.VendorBusiness_opening_time,
    this.VendorBusiness_opening_days,
  });

  factory VendorBusiness.fromJson(Map<String, dynamic> json) {
    return VendorBusiness(
      VendorBusiness_Id: json["id"],
      VendorBusiness_Token: json["vendor_token"],
      VendorBusiness_Email: json["vendor_email"],
      VendorBusiness_Name: json["vendor_BusinessName"],
      VendorBusiness_Location: json["vendor_Location"],
      VendorBusiness_Phonenumber: json["vendor_phoneNumber"],
      VendorBusiness_Image: json["vendor_image"],
      VendorBusiness_about: json["vendor_about"],
      VendorBusiness_opening_time: json["vendor_opening_time"],
      VendorBusiness_opening_days: json["vendor_opening_days"],
    );
  }

  String? VendorBusiness_Email;
  int? VendorBusiness_Id;
  String? VendorBusiness_Image;
  String? VendorBusiness_Location;
  String? VendorBusiness_Name;
  String? VendorBusiness_Phonenumber;
  String? VendorBusiness_Token;
  String? VendorBusiness_about;
  String? VendorBusiness_opening_time;
  String? VendorBusiness_opening_days;
}

//models for deals detail
class Deals {
  Deals({
    this.Business_name,
    this.Business_location,
    this.Business_photo,
    this.Business_Phone,
    this.Deals_Id,
    this.Deals_title,
    this.Deals_photo,
    this.Deals_category,
    this.Deals_desc,
    this.Deals_condition,
    this.Deals_discount,
    this.Deals_applicable_time,
    this.Deals_applicable_day,
    this.Deals_expiry_date,
    this.Deals_price,
    required this.Deals_user,
  });

  factory Deals.fromJson(Map<String, dynamic> json) {
    return Deals(
        Business_name: json["BusinessName"],
        Business_location: json["BusinessLocation"],
        Business_photo: json["Business_ProfileImage"],
        Business_Phone: json["Business_Phone"],
        Deals_Id: json["id"],
        Deals_title: json["deal_title"],
        Deals_price: json["deal_price"],
        Deals_photo: json["deal_photo"],
        Deals_category: json["deal_category"],
        Deals_desc: json["deal_desc"],
        Deals_condition: json["deal_condition"],
        Deals_discount: json["deal_discount"],
        Deals_applicable_time: json["deal_applicable_time"],
        Deals_applicable_day: json["deal_applicable_day"],
        Deals_expiry_date: json["deal_expiry_date"],
        Deals_user: json["user"]);
  }

  String? Business_name;
  String? Business_location;
  String? Business_photo;
  String? Business_Phone;
  int? Deals_Id;
  String? Deals_applicable_day;
  String? Deals_applicable_time;
  String? Deals_category;
  int? Deals_price;
  String? Deals_condition;
  String? Deals_desc;
  int? Deals_discount;
  String? Deals_expiry_date;
  String? Deals_photo;
  String? Deals_title;
  int Deals_user;
}

class Cart {
  String? Business_name;
  String? Business_location;
  String? Business_photo;
  int? Deals_Id;
  String? Deals_applicable_day;
  String? Deals_applicable_time;
  String? Deals_category;
  int? Deals_price;
  String? Deals_condition;
  String? Deals_desc;
  int? Deals_discount;
  String? Deals_expiry_date;
  String? Deals_photo;
  String? Deals_title;
  int? Customer_User;
  int? Vendor_User;
  String? Vendor_Phone;

  Cart({
    this.Business_name,
    this.Business_location,
    this.Business_photo,
    this.Deals_Id,
    this.Deals_applicable_day,
    this.Deals_applicable_time,
    this.Deals_category,
    this.Deals_price,
    this.Deals_condition,
    this.Deals_desc,
    this.Deals_discount,
    this.Deals_expiry_date,
    this.Deals_photo,
    this.Deals_title,
    this.Customer_User,
    this.Vendor_User,
    this.Vendor_Phone,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      Business_name: json["VendorBusiness_Name"],
      Business_location: json["VendorBusiness_Location"],
      Business_photo: json["VendorBusiness_ProfileImage"],
      Deals_Id: json["id"],
      Deals_applicable_day: json["deal_applicable_day"],
      Deals_applicable_time: json["deal_applicable_time"],
      Deals_category: json["deal_category"],
      Deals_price: json["deal_price"],
      Deals_condition: json["deal_condition"],
      Deals_desc: json["deal_desc"],
      Deals_discount: json["deal_discount"],
      Deals_expiry_date: json["deal_expiry_date"],
      Deals_photo: json["deal_photo"],
      Deals_title: json["deal_title"],
      Customer_User: json["Customer_User"],
      Vendor_User: json["Vendor_User"],
      Vendor_Phone: json["Vendor_Phone"],
    );
  }
}

class Charges {
  int coupon_rate;

  Charges({
    required this.coupon_rate,
  });

  factory Charges.fromJson(Map<String, dynamic> json) {
    return Charges(
      coupon_rate: json["coupon_rate"],
    );
  }
}

class CouponActive {
  int? couponID;
  String? deal_title;
  String? deal_photo;
  int? deal_discount;
  String? deal_applicable_time;
  String? deal_applicable_day;
  String? deal_expiry_date;
  int? Customer_user;
  int? Vendor_user;
  String? VendorBusiness_Name;
  String? VendorBusiness_Location;
  String? Vendor_Phone;
  int? Total_Coupon_Price;
  String? Customer_Name;
  String? Customer_Address;
  String? Customer_Phonenumber;
  String? Customer_Email;
  String? coupon_Status;
  bool? Payment_Complete;

  CouponActive({
    this.couponID,
    this.deal_title,
    this.deal_photo,
    this.deal_discount,
    this.deal_applicable_time,
    this.deal_applicable_day,
    this.deal_expiry_date,
    this.Customer_user,
    this.Vendor_user,
    this.VendorBusiness_Name,
    this.VendorBusiness_Location,
    this.Vendor_Phone,
    this.Total_Coupon_Price,
    this.Customer_Name,
    this.Customer_Address,
    this.Customer_Phonenumber,
    this.Customer_Email,
    this.coupon_Status,
    this.Payment_Complete,
  });
  factory CouponActive.fromJson(Map<String, dynamic> json) {
    return CouponActive(
      couponID: json["id"],
      deal_title: json["deal_title"],
      deal_photo: json["deal_photo"],
      deal_discount: json["deal_discount"],
      deal_applicable_time: json["deal_applicable_time"],
      deal_applicable_day: json["deal_applicable_day"],
      deal_expiry_date: json["deal_expiry_date"],
      Customer_user: json["Customer_User"],
      Vendor_user: json["Vendor_User"],
      VendorBusiness_Name: json["VendorBusiness_Name"],
      VendorBusiness_Location: json["VendorBusiness_Location"],
      Vendor_Phone: json["Vendor_Phone"],
      Total_Coupon_Price: json["Total_Coupon_Price"],
      Customer_Name: json["Customer_Name"],
      Customer_Address: json["Customer_Address"],
      Customer_Phonenumber: json["Customer_Phonenumber"],
      Customer_Email: json["Customer_Email"],
      coupon_Status: json["coupon_Status"],
      Payment_Complete: json["Payment_Complete"],
    );
  }
}
