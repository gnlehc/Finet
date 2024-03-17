class ECategory {
  final int eCategoryID;
  final String eCategoryName;
  final String stsrc;

  ECategory({required this.eCategoryID, required this.eCategoryName, required this.stsrc});

  factory ECategory.fromJson(Map<String, dynamic> json) {
    return ECategory(
      eCategoryID: json['eCategoryID'],
      eCategoryName: json['eCategoryName'],
      stsrc: json['stsrc'],
    );
  }
}