class AddPlasmaRequest {
  String fullName;
  String phoneNumber;
  String city;
  String hospitalName;
  String message;
  String bloodGroup;
  dynamic numberOfBloodBags;
  dynamic postedDate;

  AddPlasmaRequest({
    required this.fullName,
    required this.phoneNumber,
    required this.city,
    required this.hospitalName,
    required this.message,
    required this.bloodGroup,
    required this.numberOfBloodBags,
    this.postedDate,
  });

  //tojson
  Map<String, dynamic> toJson() => {
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'city': city,
        'hospitalName': hospitalName,
        'message': message,
        'bloodGroup': bloodGroup,
        'numberOfBloodBags': numberOfBloodBags,
        'postedDate': postedDate,
      };
}
