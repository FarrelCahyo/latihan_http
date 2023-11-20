class UsersModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;

  UsersModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    page = json['page'] as int?;
    perPage = json['per_page'] as int?;
    total = json['total'] as int?;
    totalPages = json['total_pages'] as int?;
    data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['page'] = page;
    json['per_page'] = perPage;
    json['total'] = total;
    json['total_pages'] = totalPages;
    json['data'] = data?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    email = json['email'] as String?;
    firstName = json['first_name'] as String?;
    lastName = json['last_name'] as String?;
    avatar = json['avatar'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['email'] = email;
    json['first_name'] = firstName;
    json['last_name'] = lastName;
    json['avatar'] = avatar;
    return json;
  }
}