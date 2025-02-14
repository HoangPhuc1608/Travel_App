import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Models/quanan_object.dart';
import 'package:vietnam_travel_app/Providers/quanan_provider.dart';

// ignore: must_be_immutable
class RestaurantDetail extends StatefulWidget {
  int id;
  RestaurantDetail(this.id, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return RestaurantDetailState(id);
  }
}

class RestaurantDetailState extends State<RestaurantDetail> {
  int id;
  RestaurantDetailState(this.id);
  String urlImg = 'https://shielded-lowlands-87962.herokuapp.com/';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0X1A050505),
        elevation: 0,
        leading: null,
        leadingWidth: 0,
        titleSpacing: 0,
        title: TextButton(
          onPressed: () {},
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.arrowLeft,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
      body: FutureBuilder<QuanAnObject>(
        future: QuanAnProvider.getQuanAnByID(id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            QuanAnObject quan = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    urlImg + quan.hinhAnh,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: 232,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(10, 10, 130, 10),
                    child: Text(
                      quan.tenQuan,
                      style: const TextStyle(
                          fontFamily: 'Roboto',
                          height: 1.5,
                          fontSize: 24,
                          color: Color(0XFF242A37),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 50, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 18,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 10),
                          child: const FaIcon(
                            FontAwesomeIcons.mapMarkerAlt,
                            size: 18,
                            color: Color(0XFFFF2D55),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            quan.diaChi,
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.normal,
                                color: Color(0XFF242A37),
                                height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 50, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 18,
                          height: 18,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 10),
                          child: const FaIcon(
                            FontAwesomeIcons.clock,
                            size: 18,
                            color: Color(0XFF3EFF7F),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            quan.thoiGianHoatDong,
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.normal,
                                color: Color(0XFF242A37),
                                height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 50, bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 18,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 10),
                          child: const FaIcon(
                            FontAwesomeIcons.phoneAlt,
                            size: 18,
                            color: Color(0XFF0066FF),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            quan.sdt,
                            softWrap: true,
                            overflow: TextOverflow.clip,
                            style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.normal,
                                color: Color(0XFF242A37),
                                height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: const Text(
                      "Mô tả",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        height: 1.5,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFF242A37),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Text(
                      quan.moTa,
                      textAlign: TextAlign.justify,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Món ăn nổi bật",
                      style: TextStyle(
                        color: Color(0XFF242A37),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 240,
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.only(
                          top: 15,
                          right: 10,
                          left: 10,
                        ),
                        child: Card(
                          elevation: 1.0,
                          color: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(16.0),
                              topEnd: Radius.circular(16.0),
                              bottomStart: Radius.circular(16.0),
                              bottomEnd: Radius.circular(16.0),
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: quan.monan != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                      elevation: 2.0,
                                      color: Colors.white,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.only(
                                          topStart: Radius.circular(16.0),
                                          topEnd: Radius.circular(16.0),
                                          bottomStart: Radius.circular(16.0),
                                          bottomEnd: Radius.circular(16.0),
                                        ),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Image.network(
                                        urlImg + quan.monan!.hinhAnh,
                                        width: double.infinity,
                                        height: 170,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 5, 15, 5),
                                      child: Text(
                                        quan.monan!.tenMon,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w700,
                                          color: Color(0XE6242A37),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const Text("Không có dữ liệu"),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
          return const Center(
            child: SpinKitFadingCircle(
              color: Color(0XFF0066FF),
              size: 50.0,
            ),
          );
        },
      ),
    );
  }
}
