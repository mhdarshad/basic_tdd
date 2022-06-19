class Analytics {
  int? activecount;
  int? inactivecount;

  Analytics({this.activecount, this.inactivecount});

  Analytics.fromJson(Map<String, dynamic> json) {
    activecount = json['activecount'];
    inactivecount = json['inactivecount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activecount'] = this.activecount;
    data['inactivecount'] = this.inactivecount;
    return data;
  }
}
