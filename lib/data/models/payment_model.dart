// To parse this JSON data, do
//
//     final paymentData = paymentDataFromJson(jsonString);

import 'dart:convert';

PaymentData paymentDataFromJson(String str) => PaymentData.fromJson(json.decode(str));

String paymentDataToJson(PaymentData data) => json.encode(data.toJson());

class PaymentData {
    bool status;
    String message;
    String authorizationUrl;
    String accessCode;
    String reference;

    PaymentData({
        required this.status,
        required this.message,
        required this.authorizationUrl,
        required this.accessCode,
        required this.reference,
    });

    factory PaymentData.fromJson(Map<String, dynamic> json) => PaymentData(
        status: json["status"],
        message: json["message"],
        authorizationUrl: json["authorizationUrl"],
        accessCode: json["accessCode"],
        reference: json["reference"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "authorizationUrl": authorizationUrl,
        "accessCode": accessCode,
        "reference": reference,
    };
}
