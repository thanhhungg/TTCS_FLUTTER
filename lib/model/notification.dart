import 'dart:convert';
class Notification {
  final String eventDate;
  final String time;
  final String title;
  final String subtitle;

  Notification({
    required this.eventDate,
    required this.time,
    required this.title,
    required this.subtitle,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'eventDate': eventDate});
    result.addAll({'time': time});
    result.addAll({'title': title});
    result.addAll({'subtitle': subtitle});
  
    return result;
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      eventDate: map['eventDate'] ?? '',
      time: map['time'] ?? '',
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) => Notification.fromMap(json.decode(source));

  Notification copyWith({
    String? eventDate,
    String? time,
    String? title,
    String? subtitle,
  }) {
    return Notification(
      eventDate: eventDate ?? this.eventDate,
      time: time ?? this.time,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  @override
  String toString() {
    return 'Notification(eventDate: $eventDate, time: $time, title: $title, subtitle: $subtitle)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Notification &&
      other.eventDate == eventDate &&
      other.time == time &&
      other.title == title &&
      other.subtitle == subtitle;
  }

  @override
  int get hashCode {
    return eventDate.hashCode ^
      time.hashCode ^
      title.hashCode ^
      subtitle.hashCode;
  }
}
