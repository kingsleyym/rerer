class SiteInfos {
  int? id;
  String? sector;
  String? name;
  String? address;
  String? desc;
  String? pic;
  List<Contact>? contacts;
  List<String>? photos;
  String? ateliers;
  String? bureaux;
  String? coworking;
  String? map;
  String? adress;
  String? buraux;
  String? conoring;

  SiteInfos({
    this.id,
    this.sector,
    this.name,
    this.address,
    this.desc,
    this.pic,
    this.contacts,
    this.photos,
    this.ateliers,
    this.bureaux,
    this.coworking,
    this.map,
    this.adress,
    this.buraux,
    this.conoring,
  });

  SiteInfos.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    sector = json["sector"];
    name = json["name"];
    address = json["address"];
    desc = json["desc"];
    pic = json["pic"];
    contacts =
        List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x)));
    photos = List<String>.from(json["photos"].map((x) => x));
    ateliers = json["ateliers"];
    bureaux = json["bureaux"];
    coworking = json["coworking"];
    map = json["map"];
    adress = json["adress"];
    buraux = json["buraux"];
    conoring = json["conoring"];
  }
}

class Contact {
  Contact({
    this.name,
    this.function,
    this.email,
    this.phone,
  });

  String? name;
  String? function;
  String? email;
  String? phone;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        name: json["name"],
        function: json["function"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "function": function,
        "email": email,
        "phone": phone,
      };
}
