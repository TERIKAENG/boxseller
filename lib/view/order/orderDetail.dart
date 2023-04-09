// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:boxseller/Utils/Palette.dart';
import 'package:boxseller/model/calculateMat.dart';
import 'package:boxseller/model/material.dart';

import '../../draw/drawRec.dart';
import '../../model/order.dart';
import '../../widget/button_app.dart';
import '../../widget/text_widget.dart';

class OrderDetail extends StatefulWidget {
  final BoxOrder order;

  OrderDetail({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  int _selectedIndex = 0;

  late List<Widget> _widgetOptions;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var ord = widget.order;
    _widgetOptions = <Widget>[
      Detail(
        order: ord,
      ),
      IngredientList(
        boxOrder: widget.order,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ข้อมูลประเมินราคาและวัตถุดิบกระดาษ"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.aod),
            label: 'ข้อมูลทั่วไป',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: 'วัตถุดิบกระดาษ',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class IngredientList extends StatefulWidget {
  BoxOrder boxOrder;
  IngredientList({
    Key? key,
    required this.boxOrder,
  }) : super(key: key);

  @override
  State<IngredientList> createState() => _IngredientListState();
}

class _IngredientListState extends State<IngredientList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 160, 133, 105),
        title: const Text('วัตถุดิบกระดาษ'),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: 'ราคา',
            ),
            Tab(
              text: 'วันที่จัดส่ง',
            ),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Tab1(listPaper: widget.boxOrder.materialCalculate!, boxOrder: widget.boxOrder,),
          Tab2(),
        ],
      ),

      // body: ListView.builder(
      //   itemCount: ingredients.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       title: Text(ingredients[index]),
      //     );
      //   },
      // ),
    );
  }
}

class Tab1 extends StatefulWidget {
  List<MaterialPaper> listPaper;
  BoxOrder boxOrder;

  Tab1({
    Key? key,
    required this.listPaper,
    required this.boxOrder,
  }) : super(key: key);
  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: widget.listPaper.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                child: Card(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.white,
                      child: ListTile(
                        title: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.listPaper[index].venderName,
                              style: const TextStyle(
                                color: Colors.brown,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'ราคาต้นทุนกระดาษ : ${claculatePriceTOShow(widget.listPaper[index].calculateMat)}',
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(widget
                                .listPaper[index].calculateMat.bestestTemplate
                                .toString()),
                            CustomPaint(
                              painter: MyRectanglePainter(calculateMat: widget.listPaper[index].calculateMat),
                              size: Size(widget
                                .listPaper[index].widthPaper * 0.1, widget
                                .listPaper[index].heightPaper *0.1),
                            ),
                          ],
                        ),
                      )),
                ),
              );
            }));
  }

  double claculatePriceTOShow(CalculateMat calculateMat) {
    return calculateMat.pricePerBox * calculateMat.boxAmount;
  }
}

class Tab2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('This is tab 2'),
    );
  }
}

class Detail extends StatefulWidget {
  final BoxOrder order;

  Detail({super.key, required this.order});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
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
                              'ข้อมูลบรรจุภัณฑ์ที่ต้องการสั่งผลิต', brownDark),
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
    ));
  }
}
