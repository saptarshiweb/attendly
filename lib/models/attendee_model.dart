class Attendee {
  final String name;
  final String email;
  final String event;
  final String time;

  Attendee({
    required this.name,
    required this.email,
    required this.event,
    required this.time,
  });

  factory Attendee.fromJson(Map<String, dynamic> json) {
    return Attendee(
      name: json['name'],
      email: json['email'],
      event: json['event'],
      time: json['time'],
    );
  }
}