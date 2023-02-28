class TransaksiModel {
  int? id, type, total;
  String? name, createdAt, updateAt;

  TransaksiModel({
    this.id,
    this.type,
    this.total,
    this.name,
    this.createdAt,
    this.updateAt,
  });

  factory TransaksiModel.fromJson(Map<String, dynamic> json) {
    return TransaksiModel(
      id: json['id'],
      type: json['type'],
      total: json['total'],
      name: json['name'],
      createdAt: json['created_at'],
      updateAt: json['update_at'],
    );
  }
}
