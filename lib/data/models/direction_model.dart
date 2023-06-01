
class Direction {
  final String distance;
  final String duration;

  Direction({
    required this.distance,
    required this.duration,
  });

  factory Direction.fromJson(Map<String, dynamic> json) {
    return Direction(
      distance: json['legs'][0]["distance"]["text"],
      duration: json['legs'][0]["duration"]["text"],
    );
  }

  Map<String, dynamic> toJson() => {
    'distance': distance,
    'duration': duration,
  };
}