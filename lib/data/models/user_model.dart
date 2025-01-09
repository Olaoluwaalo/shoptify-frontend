import 'dart:convert';

User userFromJson(String str) {
    final jsonData = json.decode(str);
    return User.fromJson(jsonData);
}

String userToJson(User data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class User {
    final String? id;
    final String? name;
    final String? email;
    final String? password;
    final bool? isAdmin;
    final int? v;

    User({
        this.id,
        this.name,
        this.email,
        this.password,
        this.isAdmin,
        this.v,
    });

    factory User.fromJson(Map<String, dynamic> json) =>  User(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        isAdmin: json["isAdmin"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "isAdmin": isAdmin,
        "__v": v,
    };
}
