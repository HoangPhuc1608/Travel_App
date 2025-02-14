import 'package:flutter/material.dart';

class DeXuatDiaDanh extends StatefulWidget {
  const DeXuatDiaDanh({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DeXuatDiaDanhState();
  }
}

class DeXuatDiaDanhState extends State<DeXuatDiaDanh> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: const Text(
                "Đề xuất địa danh",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: const Text("Chọn tỉnh thành"),
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: 35,
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(7)),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Text(
                                "Hồ Chí Minh",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.black,
                              )
                            ],
                          ))),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 50, left: 15),
                child: const Text(
                  "Tên địa danh",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 15, right: 15),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Nhập tên địa danh",
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: const Text(
                  "Mô tả",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 15, right: 15),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Nhập mô tả",
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Container(
                  height: 35,
                  width: 160,
                  margin: const EdgeInsets.only(bottom: 30, left: 20),
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 5, bottom: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.photo_library,
                        color: Colors.greenAccent,
                      ),
                      Text("Ảnh")
                    ],
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: Container(
                    height: 35,
                    width: 160,
                    margin: const EdgeInsets.only(bottom: 30, right: 20),
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.place,
                          color: Colors.redAccent,
                        ),
                        Text("Địa điểm")
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
      bottomSheet: Container(
        width: 380,
        margin: const EdgeInsets.only(left: 7, bottom: 30),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.blueAccent),
        child: TextButton(
          onPressed: () {},
          child: const Text(
            "Chia Sẻ",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
