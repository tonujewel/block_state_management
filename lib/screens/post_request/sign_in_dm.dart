// To parse this JSON data, do
//
//     final signInDm = signInDmFromJson(jsonString);

import 'dart:convert';

SignInDm signInDmFromJson(String? str) => SignInDm.fromJson(json.decode(str!));

String? signInDmToJson(SignInDm data) => json.encode(data.toJson());

class SignInDm {
  SignInDm({
    this.success,
    this.data,
  });

  bool? success;
  Data? data;

  factory SignInDm.fromJson(Map<String?, dynamic> json) => SignInDm(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String?, dynamic> toJson() => {
        "success": success,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.otp,
    this.lat,
    this.lang,
    this.image,
    this.firstName,
    this.phoneCode,
    this.isOnline,
    this.lastName,
    this.isVerified,
    this.emailId,
    this.password,
    this.contact,
    this.fullAddress,
    this.vehicleType,
    this.vehicleNumber,
    this.licenceNumber,
    this.nationalIdentity,
    this.licenceDoc,
    this.deliveryZoneId,
    this.status,
    this.notification,
    this.deviceToken,
    this.vendorId,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.deliveryzone,
  });

  int? id;
  int? otp;
  String? lat;
  String? lang;
  String? image;
  String? firstName;
  String? phoneCode;
  int? isOnline;
  String? lastName;
  int? isVerified;
  String? emailId;
  String? password;
  String? contact;
  dynamic fullAddress;
  String? vehicleType;
  String? vehicleNumber;
  String? licenceNumber;
  String? nationalIdentity;
  String? licenceDoc;
  int? deliveryZoneId;
  int? status;
  dynamic notification;
  String? deviceToken;
  dynamic vendorId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? token;
  String? deliveryzone;

  factory Data.fromJson(Map<String?, dynamic> json) => Data(
        id: json["id"],
        otp: json["otp"],
        lat: json["lat"] ,
        lang: json["lang"] ,
        image: json["image"] ,
        firstName: json["first_name"],
        phoneCode: json["phone_code"],
        isOnline: json["is_online"],
        lastName: json["last_name"],
        isVerified: json["is_verified"],
        emailId: json["email_id"],
        password: json["password"],
        contact: json["contact"],
        fullAddress: json["full_address"],
        vehicleType: json["vehicle_type"],
        vehicleNumber:
            json["vehicle_number"],
        licenceNumber:
            json["licence_number"],
        nationalIdentity: json["national_identity"],
        licenceDoc: json["licence_doc"],
        deliveryZoneId:
            json["delivery_zone_id"],
        status: json["status"],
        notification: json["notification"],
        deviceToken: json["device_token"],
        vendorId: json["vendor_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        token: json["token"],
        deliveryzone:
            json["deliveryzone"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "otp": otp,
        "lat": lat,
        "lang": lang,
        "image": image,
        "first_name": firstName,
        "phone_code": phoneCode,
        "is_online": isOnline,
        "last_name": lastName,
        "is_verified": isVerified,
        "email_id": emailId,
        "password": password,
        "contact": contact,
        "full_address": fullAddress,
        "vehicle_type": vehicleType,
        "vehicle_number": vehicleNumber,
        "licence_number": licenceNumber,
        "national_identity": nationalIdentity,
        "licence_doc": licenceDoc,
        "delivery_zone_id": deliveryZoneId,
        "status": status,
        "notification": notification,
        "device_token": deviceToken,
        "vendor_id": vendorId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "token": token,
        "deliveryzone": deliveryzone,
      };
}
