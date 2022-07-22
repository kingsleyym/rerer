import 'package:flutter/material.dart';
import 'package:hayan_app/Models/site_infos.dart';
import 'package:hayan_app/widget/dropdown_location.dart';
import 'package:hayan_app/widget/notify_icon_button.dart';
import 'package:hayan_app/widget/search_bar.dart';
import 'package:hayan_app/widget/site_card.dart';
import '../widget/nav_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _currentLocation = "DUBAI Sud";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 48, 16, 48),
        child: Container(
            height: MediaQuery.of(context).size.height - 64,
            child: FutureBuilder<Object>(
              future: annuaireSrv.load(_annuaireFile),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _pageBuilder(snapshot.data as Annuaire);
                }else {return Container();
                }
                                  }
                                },
                              )),
                        ),
                      );
                    }
                  
                    Widget _pageBuilder(Annuaire annuaire) {
                      final sites = annuaire.sites;
                      final SiteInfos currentState = sites[_currentLocation]!;
                  
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _header(),
                          Spacer(),
                          SearchBar(
                            onPressed: () {},
                          ),
                          Spacer(),
                          Expanded(
                            flex: 20,
                            child: SiteCard(
                              siteInfos: currentSite,
                            ),
                          ),
                          Spacer(),
                          NavBar(),
                        ],
                      );
                    }
                  
                    Widget _header() {
                      return Row(
                        children: [
                          Column(children: [
                            DropDownLocation(
                              location: _currentLocation,
                              elements: [
                                "DUBAI Nord",
                                "DUBAI East",
                                "DUBAI Sud",
                              ],
                              onLocationChanged: (Location) {
                                setState(() {
                                  _currentLocation = Location;
                                });
                              },
                            ),
                          ]),
                          Spacer(),
                          NotifyIconButton(),
                        ],
                      );
                    }
                  }
                  
             