final String tableKaryawan = 'table_karyawan';

class KaryawanField {
  static const id = '_id';
  static const firstName = 'first_name';
  static const lastName = 'last_name';
  static const email = 'email_karyawan';
  static const noHp = 'no_hp';
  static const alamat = 'alamat';
  static const jenisKelamin = 'jenis_kelamin';
}

class Karyawan {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? noHp;
  String? alamat;
  String? jenisKelamin;

  Karyawan(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.noHp,
      this.alamat,
      this.jenisKelamin});

  Karyawan copy(
          {int? id,
          String? firstName,
          String? lastName,
          String? email,
          String? noHp,
          String? alamat,
          String? jenisKelamin}) =>
      Karyawan(
          id: id ?? this.id,
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          email: email ?? this.email,
          noHp: noHp ?? this.noHp,
          alamat: alamat ?? this.alamat,
          jenisKelamin: jenisKelamin ?? this.jenisKelamin);

  Map<String, Object?> toJson() => {
        KaryawanField.id: id,
        KaryawanField.firstName: firstName,
        KaryawanField.lastName: lastName,
        KaryawanField.email: email,
        KaryawanField.noHp: noHp,
        KaryawanField.alamat: alamat,
        KaryawanField.jenisKelamin: jenisKelamin
      };

  static Karyawan fromJson(Map<String, Object?> json) => Karyawan(
      id: json[KaryawanField.id] as int,
      firstName: json[KaryawanField.firstName] as String,
      lastName: json[KaryawanField.lastName] as String,
      email: json[KaryawanField.email] as String,
      noHp: json[KaryawanField.noHp] as String,
      alamat: json[KaryawanField.alamat] as String,
      jenisKelamin: json[KaryawanField.jenisKelamin] as String);
}
