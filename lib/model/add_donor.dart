class AddDonor {
  String name;
  String phoneNumber;
  String city;
  String hospital;
  DateTime dateOfBirth;
  String bloodGroup;
  // dynamic postedDate;

  AddDonor({
    required this.name,
    required this.phoneNumber,
    required this.city,
    required this.hospital,
    required this.dateOfBirth,
    required this.bloodGroup,
    // required this.postedDate,
  });

  //tojson
  Map<String, dynamic> toJson() => {
        'name': name,
        'phoneNumber': phoneNumber,
        'city': city,
        'hospital': hospital,
        'dateOfBirth': dateOfBirth,
        'bloodGroup': bloodGroup,
        // 'postedDate': postedDate,
      };
}
