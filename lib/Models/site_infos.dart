import 'package:meta/meta.dart';

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
      : this.id = site["id"] as int,
        this.sector = site["sector"],
        this.name = site["name"],
        this.address = site["address"],
        this.desc = site["desc"],
        this.map = site["map"],
        this.ateliers = site["ateliers"],
        this.bureaux = site["bureaux"],
        this.coworking = site["coworking"],
        this.photos = List<String>.from(site["photos"]);
}
