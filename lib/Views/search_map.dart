import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Models/address_object.dart';
import 'package:vietnam_travel_app/Providers/address_provider.dart';
import 'package:vietnam_travel_app/map_page.dart';
import 'dart:async';

class SearchMap extends StatefulWidget {
  const SearchMap({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SearchMapState();
  }
}

class SearchMapState extends State<SearchMap> {
  late List<AddressObject> data = [];
  TextEditingController txtSearch = TextEditingController();
  Timer? _debounce;
  void _searchDiaDiem() async {
    if (txtSearch.text.isNotEmpty) {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce = Timer(const Duration(milliseconds: 200), () async {
        setState(() {});
        data = await AddressProvider.getAllDiaDanh(txtSearch.text, null, null);
      });
    }
  }

  void _viewBanDo(String placeId) async {
    PlaceDetailObject place = await AddressProvider.getPlaceDetail(placeId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapPage(
          viDo: place.geometry.location.lat,
          kinhDo: place.geometry.location.lng,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFF0F2F5),
      appBar: AppBar(
        leading: null,
        leadingWidth: 0,
        titleSpacing: 0,
        elevation: 1.0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            controller: txtSearch,
            onChanged: (value) {
              _searchDiaDiem();
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Nhập địa điểm bạn muốn tìm kiếm...",
              hintStyle: const TextStyle(
                color: Color(0XFF242A37),
              ),
              contentPadding: const EdgeInsets.only(left: 15.0, top: 15.0),
              prefixIcon: IconButton(
                icon: const FaIcon(FontAwesomeIcons.arrowLeft),
                onPressed: () {
                  Navigator.pop(context);
                },
                iconSize: 20.0,
                color: const Color(0XFF242A37),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: ListView.builder(
          itemCount: data != [] ? data.length : 0,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _viewBanDo(data[index].place_id);
              },
              child: Card(
                elevation: 1.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0X1A006644),
                    child: FaIcon(
                      FontAwesomeIcons.mapMarkerAlt,
                      color: Color(0XFF0066FF),
                      size: 16,
                    ),
                  ),
                  title: Text(
                    data[index].structured_formatting.main_text,
                    softWrap: false,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    data[index].structured_formatting.secondary_text,
                    textAlign: TextAlign.left,
                    softWrap: false,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      height: 1.2,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
