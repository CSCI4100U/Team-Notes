class GeoLocation{
  String? address;
  String? city;

  GeoLocation({this.address, this.city});

  GeoLocation.fromMap(Map map){
    this.address = map['address'];
    this.city = map['city'];
  }


  Map<String,Object?> toMap(){
    return {
      'address': this.address,
      'city': this.city
    };
  }

  String toString(){
    return 'address: $address, city: $city';
  }
}