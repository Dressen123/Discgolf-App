// This code defines a disc model based on my database i created-
class Disc {
  // Here i define all my variables
  final String name;
  final int speed;
  final int glide;
  final int turn;
  final int fade;

  Disc(
      {required this.name,
      required this.speed,
      required this.glide,
      required this.turn,
      required this.fade});

  // Here i get all the data from the "index.js" and database, so i can display them.
  factory Disc.fromJson(Map<String, dynamic> json) {
    return Disc(
      name: json['name'],
      speed: json['speed'],
      glide: json['glide'],
      turn: json['turn'],
      fade: json['fade'],
    );
  }
}
