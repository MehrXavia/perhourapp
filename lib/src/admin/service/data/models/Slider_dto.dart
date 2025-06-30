class SliderDto {
  SliderDto({
      this.id, 
      this.url, 
      this.image, 
      this.order,});

  SliderDto.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    image = json['imageUrl'];
    order = json['order'];
  }
  num? id;
  String? url;
  String? image;
  num? order;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['url'] = url;
    map['imageUrl'] = image;
    map['order'] = order;
    return map;
  }

}