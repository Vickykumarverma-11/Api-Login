class Login {
  Login({
      this.sessionToken, 
      this.authorizations,});

  Login.fromJson(dynamic json) {
    sessionToken = json['session_token'];
    detail = json['detail'];
    if (json['authorizations'] != null) {
      authorizations = [];
      json['authorizations'].forEach((v) {
        authorizations?.add(Authorizations.fromJson(v));
      });
    }
  }
  String? sessionToken;
  List<Authorizations>? authorizations;
String? detail;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['session_token'] = sessionToken;
    if (authorizations != null) {
      map['authorizations'] = authorizations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Authorizations {
  Authorizations({
      this.uid, 
      this.labl, 
      this.details, 
      this.resoCat, 
      this.moduleId,});

  Authorizations.fromJson(dynamic json) {
    uid = json['uid'];
    labl = json['labl'];
    details = json['details'] != null ? Details.fromJson(json['details']) : null;
    resoCat = json['reso_cat'];
    moduleId = json['module_id'];
  }
  String? uid;
  String? labl;
  Details? details;
  String? resoCat;
  String? moduleId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = uid;
    map['labl'] = labl;
    if (details != null) {
      map['details'] = details?.toJson();
    }
    map['reso_cat'] = resoCat;
    map['module_id'] = moduleId;
    return map;
  }

}

class Details {
  Details({
      this.id, 
      this.link, 
      this.group, 
      this.enabled,});

  Details.fromJson(dynamic json) {
    id = json['id'];
    link = json['link'];
    group = json['group'];
    enabled = json['enabled'];
  }
  String? id;
  String? link;
  String? group;
  bool? enabled;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['link'] = link;
    map['group'] = group;
    map['enabled'] = enabled;
    return map;
  }

}