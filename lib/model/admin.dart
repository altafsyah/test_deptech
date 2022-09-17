final String tableAdmin = 'table_admin';

class AdminField {
  static const id = '_id';
  static const firstName = 'first_name';
  static const lastName = 'last_name';
  static const email = 'email_admin';
  static const password = 'password_admin';
}

class Admin {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  Admin({this.id, this.firstName, this.lastName, this.email, this.password});

  Admin copy(
          {int? id,
          String? firstName,
          String? lastName,
          String? email,
          String? password}) =>
      Admin(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  Map<String, Object?> toJson() => {
        AdminField.id: id,
        AdminField.firstName: firstName,
        AdminField.lastName: lastName,
        AdminField.email: email,
        AdminField.password: password
      };

  static Admin fromJson(Map<String, Object?> json) => Admin(
      id: json[AdminField.id] as int,
      firstName: json[AdminField.firstName] as String,
      lastName: json[AdminField.lastName] as String,
      email: json[AdminField.email] as String,
      password: json[AdminField.password] as String);
}
