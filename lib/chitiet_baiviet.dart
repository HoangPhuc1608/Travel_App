import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vietnam_travel_app/Global/variables.dart';
import 'package:vietnam_travel_app/Models/baiviet_object.dart';
import 'package:vietnam_travel_app/Providers/baiviet_provider.dart';
import 'package:vietnam_travel_app/chitiet_dia_danh.dart';
import 'package:vietnam_travel_app/personal_page.dart';

// ignore: must_be_immutable
class ChiTietBaiViet extends StatefulWidget {
  BaiVietChiaSeObject baiviet;
  int index;
  int loaibaiviet;
  ChiTietBaiViet(
      {Key? key,
      required this.baiviet,
      required this.index,
      required this.loaibaiviet})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return ChiTietBaiVietState(baiviet, index, loaibaiviet);
  }
}

class ChiTietBaiVietState extends State<ChiTietBaiViet> {
  BaiVietChiaSeObject baiviet;
  int loaibaiviet;
  int index;
  List<BaiVietChiaSeObject> lstBaiViet = [];
  List<BaiVietChiaSeObject> lstBaiVietNoiBat = [];
  ChiTietBaiVietState(this.baiviet, this.index, this.loaibaiviet);

  _like(int id) async {
    setState(() {});
    bool boollike = await BaiVietProvider.likePost(id);
    _loadBaiViet();
  }

  _dislike(int id) async {
    setState(() {});
    bool boolUnLike = await BaiVietProvider.unLikePost(id);
    _loadBaiViet();
  }

  _loadBaiViet() async {
    var baivietdata = await BaiVietProvider.getAllBaiViet();
    var baivietnoibatdata = await BaiVietProvider.getAllBaiVietNoiBat();

    setState(() {
      if (loaibaiviet == 0) {
        lstBaiVietNoiBat = baivietnoibatdata;
        baiviet = lstBaiVietNoiBat[index];
      } else {
        lstBaiViet = baivietdata;
        baiviet = lstBaiViet[index];
      }
    });
  }

  _addViewPost() async {
    bool view = await BaiVietProvider.viewPost(baiviet.id);
    _loadBaiViet();
    // setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _addViewPost();
  }

  InkWell kLike(int value, IconData icon, Color color, Function ontap) {
    return InkWell(
      onTap: () => ontap(),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '$value',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0XFFB1BCD0),
            ),
          ),
        ],
      ),
    );
  }

  InkWell kUnLike(int value, IconData icon, Color color, Function ontap) {
    return InkWell(
      onTap: () => ontap(),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            '$value',
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0XFFB1BCD0),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: Color(0XFF242A37),
            size: 21,
          ),
        ),
        backgroundColor: const Color(0XFFFFFFFF),
        shadowColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Chi tiết bài viết",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
            color: Color(0XFF242A37),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              ListTile(
                leading: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PersonalPage(user: baiviet.user)));
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage(urlImage + baiviet.user.hinhAnh),
                    ),
                  ),
                ),
                title: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PersonalPage(user: baiviet.user)));
                  },
                  child: Text(
                    baiviet.user.hoTen,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        color: Color(0XFF242A37)),
                  ),
                ),
                subtitle: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    baiviet.thoiGian,
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Color(0XFFB1BCD0),
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const FaIcon(
                    FontAwesomeIcons.ellipsisV,
                    size: 16,
                    color: Color(0XFFB1BCD0),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    urlImage + baiviet.hinhanh.hinhAnh,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  baiviet.noiDung,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    color: Color(0XFF242A37),
                    height: 1.4,
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlaceDetail(baiviet.diadanh.id),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: const Color(0XFF0066FF),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        baiviet.diadanh.tenDiaDanh,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0XFF0066FF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    decoration: const BoxDecoration(
                      border: Border.fromBorderSide(
                        BorderSide(
                          width: 0.5,
                          color: Color(0XFFe4e6eb),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            kLike(
                                baiviet.likes_count,
                                baiviet.islike_count == 1
                                    ? Icons.thumb_up_alt
                                    : Icons.thumb_up_alt_outlined,
                                baiviet.islike_count == 1
                                    ? const Color(0XFF0066FF)
                                    : const Color(0XFFB1BCD0), () {
                              setState(() {
                                _like(baiviet.id);
                              });
                            }),
                            const SizedBox(
                              width: 15,
                            ),
                            Row(
                              children: [
                                kUnLike(
                                    baiviet.unlikes_count,
                                    baiviet.isdislike_count == 1
                                        ? Icons.thumb_down_alt
                                        : Icons.thumb_down_alt_outlined,
                                    baiviet.isdislike_count == 1
                                        ? const Color(0XFF0066FF)
                                        : const Color(0XFFB1BCD0), () {
                                  setState(() {
                                    _dislike(baiviet.id);
                                  });
                                }),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.solidEye,
                              color: Color(0XFFB1BCD0),
                              size: 18,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5, right: 10),
                              child: Text(
                                baiviet.views_count.toString(),
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0XFFB1BCD0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
