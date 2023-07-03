class ActionStudent {
  String? sId;
  String? eventDate;
  String? time;
  String? title;
  String? subtitle;

  ActionStudent(
      {this.sId, this.eventDate, this.time, this.title, this.subtitle});

  ActionStudent.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    eventDate = json['eventDate'];
    time = json['time'];
    title = json['title'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['eventDate'] = this.eventDate;
    data['time'] = this.time;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    return data;
  }
}
