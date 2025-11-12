import '../../domain/entity/login.entity.dart';

class LoginModel {
  Data? data;
  int? code;
  bool? succeeded;
  String? message;
  String? description;

  LoginModel({
    required this.data,
    required this.code,
    required this.succeeded,
    required this.message,
    required this.description,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        data: (json["Data"] != null) ? Data.fromJson(json["Data"]) : null,
        code: json["Code"],
        succeeded: json["Succeeded"],
        message: json["Message"],
        description: json["Description"],
      );

  Map<String, dynamic> toJson() => {
        "Data": data!.toJson(),
        "Code": code,
        "Succeeded": succeeded,
        "Message": message,
        "Description": description,
      };

  LoginEntity toEntity() {
    return LoginEntity(
      data: data?.toEntity(),
      code: code,
      succeeded: succeeded,
      message: message,
      description: description,
    );
  }
}

class Data {
  User? user;
  String? expiredAt;
  String? rawToken;
  String? refreshToken;

  Data({
    required this.user,
    required this.expiredAt,
    required this.rawToken,
    required this.refreshToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["User"]),
        expiredAt: json["ExpiredAt"],
        rawToken: json["RawToken"],
        refreshToken: json["RefreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "User": user!.toJson(),
        "ExpiredAt": expiredAt,
        "RawToken": rawToken,
        "RefreshToken": refreshToken,
      };

  DataEntity toEntity() {
    return DataEntity(
      user: user?.toEntity(),
      expiredAt: expiredAt,
      rawToken: rawToken,
      refreshToken: refreshToken,
    );
  }
}

class User {
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
  List<Role>? role;
  List<Company>? company;

  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
        role: List<Role>.from(json["Role"].map((x) => Role.fromJson(x))),
        company:
            List<Company>.from(json["Company"].map((x) => Company.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Username": username,
        "Fullname": fullname,
        "Title": title,
        "Department": department,
        "DefaultCompany": defaultCompany,
        "Dashboard": dashboard,
        "PersonalId": personalId,
        "Mail": mail,
        "Phone": phone,
        "Role": List<dynamic>.from(role!.map((x) => x.toJson())),
        "Company": List<dynamic>.from(company!.map((x) => x.toJson())),
      };

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      fullname: fullname,
      title: title,
      department: department,
      defaultCompany: defaultCompany,
      dashboard: dashboard,
      personalId: personalId,
      mail: mail,
      phone: phone,
      role: role?.map((data) => data.toEntity()).toList(),
      company: company?.map((data) => data.toEntity()).toList(),
    );
  }
}

class Company {
  String? id;
  String? codeCompany;
  String? company;
  String? codeBrand;
  String? brand;

  Company({
    required this.id,
    required this.codeCompany,
    required this.company,
    required this.codeBrand,
    required this.brand,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["Id"],
        codeCompany: json["CodeCompany"],
        company: json["Company"],
        codeBrand: json["CodeBrand"],
        brand: json["Brand"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "CodeCompany": codeCompany,
        "Company": company,
        "CodeBrand": codeBrand,
        "Brand": brand,
      };

  CompanyEntity toEntity() {
    return CompanyEntity(
      id: id,
      codeCompany: codeCompany,
      company: company,
      codeBrand: codeBrand,
      brand: brand,
    );
  }
}

class Role {
  String? id;
  String? nama;
  String? idCompany;

  Role({
    required this.id,
    required this.nama,
    required this.idCompany,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["Id"],
        nama: json["Nama"],
        idCompany: json["IdCompany"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Nama": nama,
        "IdCompany": idCompany,
      };

  RoleEntity toEntity() {
    return RoleEntity(
      id: id,
      nama: nama,
      idCompany: idCompany,
    );
  }
}
