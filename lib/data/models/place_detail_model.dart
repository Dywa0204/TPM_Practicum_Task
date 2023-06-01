

class Review {
  final String author_name;
  final String text;
  final rating;

  Review(this.author_name, this.text, this.rating);
}

class PlaceDetail {
  final String place_id;
  final String name;
  final List<dynamic> photoList;
  final List<dynamic>? review;

  PlaceDetail({
    required this.place_id,
    required this.name,
    required this.photoList,
    required this.review
  });

  factory PlaceDetail.fromJson(Map<String, dynamic> json) {
    return PlaceDetail(
      place_id: json['place_id'],
      name: json['name'],
      photoList: json["photos"],
      review: json["reviews"],
    );
  }

  Map<String, dynamic> toJson() => {
    'place_id': place_id,
    'name': name,
    'photoList': photoList,
    'review': review,
  };
}