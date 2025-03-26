// This code defines a disc model based on my database i created-
class Disc {
  // Here i define all my variables
  final String name;
  final int speed;
  final int glide;
  final int turn;
  final int fade;

  Disc(
      //constructor of the disc class, named and required. "required" is used to that you have to provide a value for each of the variables.
      {required this.name,
      required this.speed,
      required this.glide,
      required this.turn,
      required this.fade}); // The constructor allows for you to make a disc manually with all the values.

  // Here i get all the data from the "index.js" and database, so i can display them.
  factory Disc.fromJson(Map<String, dynamic> json) {
    // Takes the data from the backend and maps it to the disc class
    return Disc(
      name: json['name'],
      speed: json['speed'],
      glide: json['glide'],
      turn: json['turn'],
      fade: json['fade'],
    );
  }
}
