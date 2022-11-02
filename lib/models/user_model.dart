// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.id,
    this.createdAt,
    this.updatedAt,
    this.username,
    this.email,
    this.firstname,
    this.lastname,
    this.gender,
    this.location,
    this.pictures
    // this.customAttributes,
  });

  int id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? username;
  String? email;
  String? firstname;
  String? lastname;
  int? gender;
  String? location;
  List<dynamic>? pictures;
  // ExtensionAttributes? extensionAttributes;
  // List<CustomAttribute>? customAttributes;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        email: json["email"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        gender: json["gender"],
        location: json["location"],
        pictures: List<dynamic>.from(json["pictures"].map((x) => x)),
        // customAttributes: List<CustomAttribute>.from(
        //     json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "username": username,
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "gender": gender,
        "location": location,
        "pictures": List<dynamic>.from(pictures!.map((x) => x)),
        // "custom_attributes":
        //     List<dynamic>.from(customAttributes!.map((x) => x.toJson())),
      };
}

// class CustomAttribute {
//   CustomAttribute({
//     this.attributeCode,
//     this.value,
//   });

//   String? attributeCode;
//   String? value;

//   factory CustomAttribute.fromJson(Map<String, dynamic> json) =>
//       CustomAttribute(
//         attributeCode: json["attribute_code"],
//         value: json["value"],
//       );

//   Map<String, dynamic> toJson() => {
//         "attribute_code": attributeCode,
//         "value": value,
//       };
// }









// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';

// import '../utils/firestore_constans.dart';

// class ChatUser extends Equatable {
//   final String id;
//   final String photoUrl;
//   final String displayName;
//   final String phoneNumber;
//   final String aboutMe;

//   const ChatUser(
//       {required this.id,
//       required this.photoUrl,
//       required this.displayName,
//       required this.phoneNumber,
//       required this.aboutMe});

//   ChatUser copyWith({
//     String? id,
//     String? photoUrl,
//     String? nickname,
//     String? phoneNumber,
//     String? email,
//   }) =>
//       ChatUser(
//           id: id ?? this.id,
//           photoUrl: photoUrl ?? this.photoUrl,
//           displayName: nickname ?? displayName,
//           phoneNumber: phoneNumber ?? this.phoneNumber,
//           aboutMe: email ?? aboutMe);

//   Map<String, dynamic> toJson() => {
//         FirestoreConstants.displayName: displayName,
//         FirestoreConstants.photoUrl: photoUrl,
//         FirestoreConstants.phoneNumber: phoneNumber,
//         FirestoreConstants.aboutMe: aboutMe,
//       };
//   factory ChatUser.fromDocument(DocumentSnapshot snapshot) {
//     String photoUrl = "";
//     String nickname = "";
//     String phoneNumber = "";
//     String aboutMe = "";

//     try {
//       photoUrl = snapshot.get(FirestoreConstants.photoUrl);
//       nickname = snapshot.get(FirestoreConstants.displayName);
//       phoneNumber = snapshot.get(FirestoreConstants.phoneNumber);
//       aboutMe = snapshot.get(FirestoreConstants.aboutMe);
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     return ChatUser(
//         id: snapshot.id,
//         photoUrl: photoUrl,
//         displayName: nickname,
//         phoneNumber: phoneNumber,
//         aboutMe: aboutMe);
//   }
//   @override
//   // TODO: implement props
//   List<Object?> get props => [id, photoUrl, displayName, phoneNumber, aboutMe];
// }