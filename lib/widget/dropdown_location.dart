import 'package:flutter/material.dart';
import 'package:hayan_app/themes/app_theme.dart';

class DropDownLocation extends StatelessWidget {
  final String? location;
  final List<String> elements;
  final Function(String? Location)? onLocationChanged;
  const DropDownLocation({
    Key? key,
    required this.location,
    required this.elements,
    required this.onLocationChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_dropdown(), _currentLocation(location)],
    );
  }

  Widget _dropdown() {
    return DropdownButton(
        hint: Text("Emplacement"),
        underline: Container(),
        onChanged: onLocationChanged,
        style: AppTheme.theme.textTheme.bodyText2?.copyWith(fontSize: 12),
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: AppTheme.palette.accentColor,
        ),
        iconSize: 16,
        isDense: true,
        items: elements
            .map((e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                ))
            .toList());
  }

  Widget _currentLocation(String? location) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(4),
            child: Icon(
              Icons.location_on,
              size: 16,
              color: AppTheme.palette.accentColor,
            ),
          ),
          Text(
            location ?? "",
            style: AppTheme.theme.textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
