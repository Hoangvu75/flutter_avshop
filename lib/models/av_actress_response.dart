class AvActressResponse {
  int? count;
  int? total;
  List<AvActress>? result;

  AvActressResponse({this.count, this.total, this.result});

  AvActressResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    total = json['total'];
    if (json['result'] != null) {
      result = <AvActress>[];
      json['result'].forEach((v) {
        result!.add(AvActress.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['total'] = total;
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AvActress {
  String? id;
  String? name;
  String? japanName;
  String? bust;
  String? waist;
  String? hip;
  String? height;
  String? birthday;
  String? imageUrl;
  String? siteUrl;

  AvActress(
      {this.id,
        this.name,
        this.japanName,
        this.bust,
        this.waist,
        this.hip,
        this.height,
        this.birthday,
        this.imageUrl,
        this.siteUrl});

  AvActress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    japanName = json['japanName'];
    bust = json['bust'];
    waist = json['waist'];
    hip = json['hip'];
    height = json['height'];
    birthday = json['birthday'];
    imageUrl = json['imageUrl'];
    siteUrl = json['siteUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['japanName'] = japanName;
    data['bust'] = bust;
    data['waist'] = waist;
    data['hip'] = hip;
    data['height'] = height;
    data['birthday'] = birthday;
    data['imageUrl'] = imageUrl;
    data['siteUrl'] = siteUrl;
    return data;
  }
}
