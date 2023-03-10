import 'package:boxseller/Utils/Palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../model/order.dart';
import '../../widget/button_app.dart';
import '../../widget/text_widget.dart';

class OrderDetail extends StatefulWidget {
  BoxOrder order;

  OrderDetail({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  bool tab1 = true;
  bool tab2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height,
              child: ListView(children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextWidget.textGeneralWithColor('ข้อมูลออเดอร์', brownDark),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ButtonApp.buttonFixSized(context, ' ข้อมูลทั่วไป ',
                                () async {
                              // var res = await Get.to(MeaterialInput(
                              //   vender: widget.vender,
                              // ));
                              // if (res) {
                              setState(() {
                                tab1 = true;
                                tab2 = false;
                              });
                              // }
                            }, tab1),
                            ButtonApp.buttonFixSized(
                                context, ' วัตถุดิบกระดาษ ', () async {
                              // var res = await Get.to(MeaterialInput(
                              //   vender: widget.vender,
                              // ));
                              // if (res) {
                              setState(() {
                                tab1 = false;
                                tab2 = true;
                              });
                              // }
                            }, tab2),
                          ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                        child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          TextWidget.textGeneralWithColor(
                              'ข้อมูลผลิตภัณฑ์', brownDark),
                          Row(
                            children: [
                              TextWidget.textGeneralWithColor(
                                  'ข้อมูลผลิตภัณฑ์', brownDark),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget.textGeneral(
                                  'ชื่อผลิตภัณฑ์ : ${widget.order.name}'),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget.textGeneral(
                                  'น้ำหนักของผลิตภัณฑ์ : ${widget.order.weightProduct}'),
                            ],
                          ),
                          widget.order.isDeliveryProduct == 1
                              ? Row(
                                  children: [
                                    TextWidget.textGeneral(
                                        'บรรจุภัณฑ์ต้องผ่านกระบวนการจัดส่ง : ใช่'),
                                  ],
                                )
                              : Row(
                                  children: [
                                    TextWidget.textGeneral(
                                        'บรรจุภัณฑ์ต้องผ่านกระบวนการจัดส่ง : ไม่ใช่'),
                                  ],
                                ),
                          widget.order.isHumidityProduct == 2
                              ? Row(
                                  children: [
                                    TextWidget.textGeneral(
                                        'ความชื้นของผลิตภัณฑ์ : ชื้น'),
                                  ],
                                )
                              : widget.order.isHumidityProduct == 1
                                  ? Row(
                                      children: [
                                        TextWidget.textGeneral(
                                            'ความชื้นของผลิตภัณฑ์ : ชื้นเล็กน้อย'),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        TextWidget.textGeneral(
                                            'ความชื้นของผลิตภัณฑ์ : ไม่ชื้น'),
                                      ],
                                    ),
                          widget.order.isHumidityWarehouse == 1
                              ? Row(
                                  children: [
                                    TextWidget.textGeneral(
                                        'คลังที่จัดเก็บมีความชื้นหรือไม่ : ชื้น'),
                                  ],
                                )
                              : Row(
                                  children: [
                                    TextWidget.textGeneral(
                                        'คลังที่จัดเก็บมีความชื้นหรือไม่ : ไม่ชื้น'),
                                  ],
                                ),
                          widget.order.amount_stack_warehouse == true
                              ? Row(
                                  children: [
                                    TextWidget.textGeneral(
                                        'ซ้อนกันในคลังที่จัดเก็บมากกว่า 5 ชิ้น : ใช่'),
                                  ],
                                )
                              : Row(
                                  children: [
                                    TextWidget.textGeneral(
                                        'ซ้อนกันในคลังที่จัดเก็บมากกว่า 5 ชิ้น : ไม่ใช่'),
                                  ],
                                ),
                          widget.order.isSharpPrint == 1
                              ? Row(
                                  children: [
                                    TextWidget.textGeneral(
                                        'ความต้องการเพิ่มเติม : เน้นลวดลาย'),
                                  ],
                                )
                              : Row(
                                  children: [
                                    TextWidget.textGeneral(
                                        'ความต้องการเพิ่มเติม : เน้นความเเข็งเเรง'),
                                  ],
                                ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              TextWidget.textGeneralWithColor(
                                  'ข้อมูลบรรจุภัณฑ์ที่ต้องการสั่งผลิต',
                                  brownDark),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget.textGeneral(
                                  'จำนวนที่ต้องการสั่งผลิต (ชิ้น) : ${widget.order.orderAmount}'),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget.textGeneral(
                                  'กว้าง : ${widget.order.widthBox} มิลลิเมตร'),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget.textGeneral(
                                  'ยาว : ${widget.order.longBox} มิลลิเมตร'),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget.textGeneral(
                                  'สูง : ${widget.order.heightBox} มิลลิเมตร'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              TextWidget.textGeneralWithColor(
                                  'ลวดลายของบรรจุภัณฑ์', brownDark),
                            ],
                          ),
                          widget.order.isUseColorOver == true
                              ? Row(
                                  children: [
                                    TextWidget.textGeneral(
                                        'พิมพ์สีทั่วทั้งพื้นผิวกล่อง : ใช่'),
                                  ],
                                )
                              : Row(
                                  children: [
                                    TextWidget.textGeneral(
                                        'พิมพ์สีทั่วทั้งพื้นผิวกล่อง : ไม่'),
                                  ],
                                ),
                          widget.order.useDesignService == 2
                              ? Row(
                                  children: [
                                    TextWidget.textGeneral(
                                        'ระบุลวดลาย : ใช้บริการของทางร้าน'),
                                  ],
                                )
                              : widget.order.useDesignService == 1
                                  ? Row(
                                      children: [
                                        TextWidget.textGeneral(
                                            'ระบุลวดลาย : มีลวดลายเเล้ว'),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        TextWidget.textGeneral(
                                            'ระบุลวดลาย : ไม่พิมพ์ลวดลาย'),
                                      ],
                                    ),
                        ],
                      ),
                    )),

                    // ButtonApp.buttonMain(context, ' + วัตถุดิบกระดาษใหม่ ',
                    //     () async {
                    //   var res = await Get.to(MeaterialInput(
                    //     vender: widget.vender,
                    //   ));
                    //   if (res) {
                    //     setState(() {});
                    //   }
                    // }),
                    // Container(
                    //     height: MediaQuery.of(context).size.height * 0.5,
                    //     width: MediaQuery.of(context).size.width * 0.6,
                    //     padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
                    //     child: detail()),
                  ],
                ),
              ]),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height)
          ],
        ),
      )),
    );
  }




}
