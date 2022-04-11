class DBModel {
  final int? id;
  final String name;
  final String? icon;
  final double price;
  final DateTime date;

  // int? get id => _id;
  // String get name => _name;
  // String? get icon => _icon;
  // double get price => _price;
  // DateTime get date => _date;

  DBModel(
      {this.id,
      required this.name,
      this.icon,
      required this.date,
      required this.price});

  DBModel.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"],
        icon = res["icon"],
        price = res["price"],
        date = res["date"];

  Map<String, dynamic> toMap() {
    return ({
      "_id": id,
      "_name": name,
      "price": price,
      "date": date.toString(),
      "icon": icon,
    });
  }
}
