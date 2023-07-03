class NotificationAdmin {
  String? name;
  String? title;
  String? subtitle;
  String? time;
  String? date;
  String? avt;

  NotificationAdmin(
      {this.name, this.title, this.subtitle, this.time, this.date, this.avt});

  NotificationAdmin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    subtitle = json['subtitle'];
    time = json['time'];
    date = json['date'];
    avt = json['avt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['time'] = this.time;
    data['date'] = this.date;
    data['avt'] = this.avt;
    return data;
  }
}