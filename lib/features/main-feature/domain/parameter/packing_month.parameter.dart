class PackingMonthParameter {
  final String? idCompany;

  const PackingMonthParameter(this.idCompany);

  Map<String, dynamic> toJson() => {
        'id_company': idCompany,
      };
}
