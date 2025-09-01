class LoginEntity {
  DataEntity? data;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  LoginEntity({
    required this.data,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
        data: (json["Data"] != null) ? DataEntity.fromJson(json["Data"]) : null,
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );
}

class DataEntity {
  UserEntity? user;
  String? expiredAt;
  String? rawToken;
  String? refreshToken;

  DataEntity({
    required this.user,
    required this.expiredAt,
    required this.rawToken,
    required this.refreshToken,
  });

  factory DataEntity.fromJson(Map<String, dynamic> json) => DataEntity(
        user: UserEntity.fromJson(json["User"]),
        expiredAt: json["ExpiredAt"],
        rawToken: json["RawToken"],
        refreshToken: json["RefreshToken"],
      );
}

class UserEntity {
  String? id;
  String? username;
  String? fullname;
  String? title;
  String? department;
  String? defaultCompany;
  String? dashboard;
  String? personalId;
  String? mail;
  String? phone;
  List<RoleEntity>? role;
  List<CompanyEntity>? company;

  UserEntity({
    required this.id,
    required this.username,
    required this.fullname,
    required this.title,
    required this.department,
    required this.defaultCompany,
    required this.dashboard,
    required this.personalId,
    required this.mail,
    required this.phone,
    required this.role,
    required this.company,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json["Id"],
        username: json["Username"],
        fullname: json["Fullname"],
        title: json["Title"],
        department: json["Department"],
        defaultCompany: json["DefaultCompany"],
        dashboard: json["Dashboard"],
        personalId: json["PersonalId"],
        mail: json["Mail"],
        phone: json["Phone"],
        role: List<RoleEntity>.from(
            json["Role"].map((x) => RoleEntity.fromJson(x))),
        company: List<CompanyEntity>.from(
            json["Company"].map((x) => CompanyEntity.fromJson(x))),
      );
}

class CompanyEntity {
  String? id;
  String? codeCompany;
  String? company;
  String? codeBrand;
  String? brand;

  CompanyEntity({
    required this.id,
    required this.codeCompany,
    required this.company,
    required this.codeBrand,
    required this.brand,
  });

  factory CompanyEntity.fromJson(Map<String, dynamic> json) => CompanyEntity(
        id: json["Id"],
        codeCompany: json["CodeCompany"],
        company: json["Company"],
        codeBrand: json["CodeBrand"],
        brand: json["Brand"],
      );
}

class RoleEntity {
  String? id;
  String? nama;
  String? idCompany;

  RoleEntity({
    required this.id,
    required this.nama,
    required this.idCompany,
  });

  factory RoleEntity.fromJson(Map<String, dynamic> json) => RoleEntity(
        id: json["Id"],
        nama: json["Nama"],
        idCompany: json["IdCompany"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Nama": nama,
        "IdCompany": idCompany,
      };
}
