class SiteInfos {
  final int id;
  final String? sector;
  final String? name;
  final String? address;
  final String? desc;
  final String? map;
  final int? ateliers;
  final int? bureaux;
  final int? coworking;

  final List<String>? photos;

  SiteInfos({
    required this.id,
    this.sector,
    this.name,
    this.address,
    this.desc,
    this.map,
    required this.ateliers,
    required this.bureaux,
    required this.coworking,
    this.photos,
  });

  SiteInfos.fromJson(Map<String, dynamic> site)
      : id = site["id"] as int,
        sector = site["sector"],
        name = site["name"],
        address = site["address"],
        desc = site["desc"],
        map = site["map"],
        ateliers = site["ateliers"],
        bureaux = site["bureaux"],
        coworking = site["coworking"],
        photos = List<String>.from(site["photos"]);
}
