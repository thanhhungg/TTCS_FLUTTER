import 'package:flutter/material.dart';
import 'package:flutter_application_2/Medicine/medicine_page.dart';
import 'package:flutter_application_2/Medicine/pick_video_photo.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../home_page.dart';
import 'list_image.dart';

// import 'image_picker.dart';

class CreateMedicine extends StatefulWidget {
  const CreateMedicine({
    super.key,
  });
  @override
  State<CreateMedicine> createState() => _CreateMedicineState();
}

class _CreateMedicineState extends State<CreateMedicine> {
  final _controller = PageController();
  final _controller2 = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: _w,
                  height: _h * 1 / 7.5,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 121, 23, 1),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '    KIDS\nONLINEs',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'QueulatUni',
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Trường mầm non Họa Mi',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SFPRODISPLAYBOLD',
                                fontSize: 15,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                mySheet(context);
                              },
                              icon: SvgPicture.asset(
                                  'assets/images/PhoneCall.svg'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          BackButton(
                            color: Colors.deepOrangeAccent,
                          ),
                          Text(
                            'Dặn thuốc',
                            style: TextStyle(
                                fontFamily: 'SFPRODISPLAYBOLD', fontSize: 18),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5, left: 10, right: 10, bottom: 5),
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          width: _w,
                          height: _h * 0.62,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                              bottom: Radius.circular(16),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0xFFe8e8e8),
                                  blurRadius: 15,
                                  offset: Offset(0, 0))
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Ngày bắt đầu uống"),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  Text(
                                    "16 thg 8, 2022",
                                    style: TextStyle(color: Colors.deepOrange),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: _w,
                                height: 0.2,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Ngày bắt đầu uống"),
                                  SizedBox(
                                    width: 120,
                                  ),
                                  Text(
                                    "16 thg 8, 2022",
                                    style: TextStyle(color: Colors.deepOrange),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                width: _w,
                                height: 0.2,
                                color: Colors.grey,
                              ),
                              selectedAssets.length == 0
                                  ? TextButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          _PickVideoPhoto(context);
                                        });
                                      },
                                      icon: Icon(Icons.add_circle_sharp),
                                      label: Text('Thêm thuốc'),
                                    )
                                  : Stack(children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        width: _w,
                                        height: 180,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 150,
                                              child: PageView.builder(
                                                itemCount:
                                                    selectedAssets.length,
                                                controller: _controller,
                                                itemBuilder: (context, index) =>
                                                    Container(
                                                        child: AssetEntityImage(
                                                  selectedAssets[index],
                                                  fit: BoxFit.cover,
                                                )),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            SmoothPageIndicator(
                                              controller: _controller,
                                              count: selectedAssets.length,
                                              effect: ScaleEffect(
                                                  dotHeight: 6,
                                                  dotWidth: 6,
                                                  activeDotColor:
                                                      Colors.deepOrange),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    DialogPage(
                                                      h: _h,
                                                      controller2: _controller2,
                                                      w: _w,
                                                    ));
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 290, top: 10),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 7, vertical: 5),
                                            width: 70,
                                            height: 21,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Colors.grey),
                                            child: Text(
                                              'Xem chi tiết',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                              SizedBox(
                                height: 4,
                              ),
                              Container(
                                width: _w,
                                height: 0.2,
                                color: Colors.grey,
                              ),
                              TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    showDialog(
                                        context: context,
                                        builder: (context) => DialogPage(
                                              h: _h,
                                              controller2: _controller2,
                                              w: _w,
                                            ));
                                  });
                                },
                                icon: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.grey,
                                ),
                                label: Text(
                                  'Chỉnh sửa danh sách thuốc',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                width: _w,
                                height: 0.2,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 220,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(255, 121, 23, 1)),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    'Lưu ý!',
                                    textAlign: TextAlign.center,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  content: Container(
                                    height: _h * 1 / 2.4,
                                    child: Column(children: [
                                      Text(
                                        '. Phụ huynh cần kiểm tra và nhập chính xác hình ảnh và thông tin thuốc, tên thuốc, liều lượng và thời gian uống và hạn sử dụng thuốc',
                                        softWrap: true,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '. Phụ huynh cần kiểm tra và nhập chính xác hình ảnh và thông tin thuốc, tên thuốc, liều lượng và thời gian uống và hạn sử dụng thuốc',
                                        softWrap: true,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '.Phụ huynh cần kiểm tra và nhập chính xác hình ảnh và thông tin thuốc, tên thuốc, liều lượng và thời gian uống và hạn sử dụng thuốc',
                                        softWrap: true,
                                        // overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        height: 0.2,
                                        width: _w,
                                        color: Colors.grey,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: Text(
                                                'Quay lại',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 20),
                                              )),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Get.to(MedicinePage(),
                                                    transition:
                                                        Transition.fade);
                                              },
                                              child: Text(
                                                'Đồng ý',
                                                style: TextStyle(
                                                    color: Colors.deepOrange,
                                                    fontSize: 20),
                                              ))
                                        ],
                                      )
                                    ]),
                                  ),
                                ),
                              );
                            });
                          },
                          child: Text(
                            'Tạo dặn thuốc',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DialogPage extends StatefulWidget {
  const DialogPage({
    super.key,
    required double h,
    required PageController controller2,
    required double w,
  })  : _h = h,
        _controller2 = controller2,
        _w = w;

  final double _h;
  final PageController _controller2;
  final double _w;
  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 90, left: 10, right: 10),
          child: SizedBox(
            height: widget._h * 0.6,
            child: PageView.builder(
                itemCount: selectedAssets.length + 1,
                controller: widget._controller2,
                itemBuilder: (context, index) => selectedAssets.length == 0 ||
                        index == selectedAssets.length
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 190),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromRGBO(44, 43, 43, 0.9),
                            ),
                            child: Column(
                              children: [
                                // Icon(Icons.add_circle),
                                IconButton(
                                  icon: Icon(Icons.add_circle,
                                      color: Colors.white, size: 40),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.pop(context);
                                      _PickVideoPhoto(context);
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Thêm thuốc",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Column(children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Ghi chú thuốc',
                                        style: TextStyle(
                                          fontFamily: 'SFPRODISPLAYBOLD',
                                          fontSize: 18,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: Text(
                                                  'Xác nhận xóa',
                                                  textAlign: TextAlign.center,
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                content: Container(
                                                  height: widget._h * 1 / 8,
                                                  child: Column(children: [
                                                    Text(
                                                      'Bạn chắc chắn muốn\nxóa dặn thuốc này?',
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      height: 0.2,
                                                      width: widget._w,
                                                      color: Colors.grey,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        TextButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            child: Text(
                                                              'Huỷ',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 20),
                                                            )),
                                                        SizedBox(
                                                          width: 40,
                                                        ),
                                                        TextButton(
                                                            onPressed: () {
                                                              setState(() {
                                                                selectedAssets
                                                                    .removeAt(
                                                                        index);
                                                                Navigator.pop(
                                                                    context);
                                                              });
                                                            },
                                                            child: Text(
                                                              'Xoá',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .deepOrange,
                                                                  fontSize: 20),
                                                            ))
                                                      ],
                                                    )
                                                  ]),
                                                ),
                                              ),
                                            );
                                          });
                                        },
                                        icon: Icon(Icons.delete))
                                  ],
                                ),
                              ),
                              Container(
                                height: 0.2,
                                width: widget._w,
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Container(
                                    height: 159,
                                    // width: 100,
                                    child: AssetEntityImage(
                                      selectedAssets[index],
                                      fit: BoxFit.cover,
                                    )),
                              )
                            ]),
                          ),
                        ),
                      )),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SmoothPageIndicator(
          controller: widget._controller2,
          count: selectedAssets.length + 1,
          effect: ScaleEffect(
              dotHeight: 6, dotWidth: 6, activeDotColor: Colors.white),
        ),
        SizedBox(
          height: 34,
        ),
        Container(
          width: 220,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(255, 121, 23, 1)),
          child: TextButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
                Get.to(CreateMedicine(), transition: Transition.fade);
              });
            },
            child: Text(
              'Thêm vào nhắc thuốc',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

void _PickVideoPhoto(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 5),
          child: PickVideoPhoto(),
        );
      });
}
