class Projects {
  List<Project> projectsList = [];

  Projects.fromJson(dynamic json) {
    json.forEach((v) {
      projectsList.add(Project.fromJson(v));
    });
  }
}

class Project {
  Project({
    this.uid,
    this.orgUid,
    this.labl,
    this.srid,
    this.mapType,
    this.loc,
    this.inputType,
    this.stats,
    this.totalSize,
    this.imgCount,
    this.totalCost,
    this.expiresAt,
    this.customData,
    this.updatedAt,
    this.createdAt,
  });

  Project.fromJson(dynamic json) {
    uid = json['uid'];
    orgUid = json['org_uid'];
    labl = json['labl'];
    srid = json['srid'];
    mapType = json['map_type'];
    loc = json['loc'];
    inputType = json['input_type'];
    stats = json['stats'];
    totalSize = json['total_size'];
    imgCount = json['img_count'];
    totalCost = json['total_cost'];
    expiresAt = json['expires_at'];
    customData = json['custom_data'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  var uid;
  var orgUid;
  var labl;
  var srid;
  var mapType;
  var loc;
  var inputType;
  var stats;
  var totalSize;
  var imgCount;
  var totalCost;
  var expiresAt;
  var customData;
  var updatedAt;
  var createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = uid;
    map['org_uid'] = orgUid;
    map['labl'] = labl;
    map['srid'] = srid;
    map['map_type'] = mapType;
    map['loc'] = loc;
    map['input_type'] = inputType;
    map['stats'] = stats;
    map['total_size'] = totalSize;
    map['img_count'] = imgCount;
    map['total_cost'] = totalCost;
    map['expires_at'] = expiresAt;
    map['custom_data'] = customData;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    return map;
  }
}
