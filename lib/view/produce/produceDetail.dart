// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'dart:html' as html;
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'package:boxseller/Utils/Palette.dart';
import 'package:boxseller/get/getData.dart';
import 'package:boxseller/model/calculateMat.dart';
import 'package:boxseller/model/material.dart';

import '../../draw/drawRec.dart';
import '../../model/customer.dart';
import '../../model/order.dart';
import '../../widget/button_app.dart';
import '../../widget/text_widget.dart';

class ProduceDetail extends StatefulWidget {
  final BoxOrder order;

  ProduceDetail({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<ProduceDetail> createState() => _ProduceDetailState();
}

class _ProduceDetailState extends State<ProduceDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายการสั่งผลิตรอจัดซื้อ"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
                child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextWidget.textGeneralWithColor('ข้อมูลผลิตภัณฑ์', brownDark),
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
            Card(
              child: Container(
                  color: Colors.white,
                  child: ListTile(
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: const Center(
                                child: Text(
                                  '*',
                                  style: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget
                                        .order.materialCalculate![0].venderName,
                                    style: const TextStyle(
                                      color: Colors.brown,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'ราคาประเมินจัดซื้อ : ${claculatePriceTOShow(widget.order.materialCalculate![0].calculateMat)} บาท',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'ราคาเสนอลูกค้า : ${widget.order.materialCalculate![0].calculateMat.costNet} บาท',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 119, 108, 104),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'ราคาต่อกล่อง : ${widget.order.materialCalculate![0].calculateMat.pricePerBox.toStringAsFixed(2)} บาท',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 119, 108, 104),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'จำนวนกล่องที่ได้ : ${widget.order.materialCalculate![0].calculateMat.boxAmount} กล่อง',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 119, 108, 104),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'จำนวนกระดาษที่ต้องสั่ง : ${widget.order.materialCalculate![0].calculateMat.paperAmount} แผ่น',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 119, 108, 104),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(4.0),
                              child: CustomPaint(
                                painter: MyRectanglePainter(
                                    calculateMat: widget.order
                                        .materialCalculate![0].calculateMat),
                                size: Size(
                                    widget.order.materialCalculate![0]
                                            .widthPaper *
                                        0.1,
                                    widget.order.materialCalculate![0]
                                            .heightPaper *
                                        0.1),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              padding: EdgeInsets.all(10),
                              child: ButtonApp.buttonMain(
                                  context, 'ใบเเบบตัด', () async {
                                // print(widget.boxOrder.id);
                                // print(widget.boxOrder.status);
                                // var confirmOrder = widget.boxOrder;
                                // confirmOrder.status = 'purchase';
                                // confirmOrder.materialCalculate = [];
                                // confirmOrder.materialCalculate!
                                //     .add(widget.listPaper[index]);
                                // confirmOrder.updateOrder();
                              }),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                padding: EdgeInsets.all(10),
                                child: ButtonApp.buttonMainNext(
                                    context, 'ปรับสถานะรอจัดส่ง', () async {
                                  // print(widget.boxOrder.id);
                                  // print(widget.boxOrder.status);
                                  // var confirmOrder = widget.boxOrder;
                                  // confirmOrder.status = 'purchase';
                                  // confirmOrder.materialCalculate = [];
                                  // confirmOrder.materialCalculate!
                                  //     .add(widget.listPaper[index]);
                                  // confirmOrder.updateOrder();
                                }))
                          ],
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  double claculatePriceTOShow(CalculateMat calculateMat) {
    return calculateMat.pricePerBox * calculateMat.boxAmount;
  }
}

Future<void> _createPDF(BoxOrder order, MaterialPaper paper) async {
  var now = new DateTime.now();
  var formatter = new DateFormat('dd/MM/yyyy');
  String formattedDate = formatter.format(now);

  //Create a PDF document.
  //Create a PDF document
  final PdfDocument document = PdfDocument();

  //Add a new page
  final PdfPage page = document.pages.add();

  //PdfFont font = await getFont(GoogleFonts.prompt());

  //Create a string format to set text alignment
  final PdfStringFormat format = PdfStringFormat(
      alignment: PdfTextAlignment.center,
      lineAlignment: PdfVerticalAlignment.middle);
  final PdfStringFormat middleFormat =
      PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle);

  // final PdfGridRowStyle pdfGridRowStyle = new PdfGridRowStyle();
  // pdfGridRowStyle.font =
  //     PdfStandardFont(PdfFontFamily.helvetica, 15, style: PdfFontStyle.bold);

  //Create padding, borders for PDF grid
  final PdfPaddings padding = PdfPaddings(left: 2);
  final PdfPen linePen = PdfPen(PdfColor(0, 0, 0), width: 2);
  final PdfPen lastRowBorderPen = PdfPen(PdfColor(0, 0, 0), width: 1);
  final PdfBorders borders =
      PdfBorders(left: linePen, top: linePen, bottom: linePen, right: linePen);
  final PdfBorders lastRowBorder = PdfBorders(
      left: linePen, top: linePen, bottom: lastRowBorderPen, right: linePen);

  //Create a new font
  // final PdfFont font = await getFont(GoogleFonts.prompt());

  //final PdfFont font = PdfStandardFont(PdfFontFamily.helvetica, 9);

  String propmtregular = "asset/font/Prompt-Regular.ttf"; //path to asset
  ByteData prom = await rootBundle.load(propmtregular);
  Uint8List soundbytes =
      prom.buffer.asUint8List(prom.offsetInBytes, prom.lengthInBytes);
  PdfFont font = PdfTrueTypeFont(soundbytes, 12);

  //Drawing the grid as two seperate grids

  //Create a grid
  final PdfGrid headerGrid = PdfGrid();
  //Set font for all cells
  headerGrid.style.font = font;
  //Add columns
  headerGrid.columns.add(count: 3);
  //Set column width
  headerGrid.columns[0].width = 80;
  headerGrid.columns[2].width = 80;
  //Add a row
  final PdfGridRow headerRow1 = headerGrid.rows.add();
  //Set row height
  headerRow1.height = 70;
  //Add cell value and style properties
  headerRow1.cells[0].value = 'BOX SELLER';
  headerRow1.cells[0].style.stringFormat = format;
  headerRow1.cells[1].value = 'ใบเสนอราคา';
  headerRow1.cells[1].style.stringFormat = format;
  headerRow1.cells[1].columnSpan = 2;
  final PdfGridRow headerRow2 = headerGrid.rows.add();
  headerRow2.cells[0].value = '';
  headerRow2.cells[0].columnSpan = 3;
  headerRow2.height = 15;
  final PdfGridRow headerRow3 = headerGrid.rows.add();
  headerRow3.cells[0].value = 'ชื่อลูกค้า :';
  headerRow3.cells[0].style.stringFormat = middleFormat;
  headerRow3.cells[0].style.cellPadding = padding;
  headerRow3.cells[1].value = order.customerName;
  headerRow3.cells[1].style.stringFormat = middleFormat;
  headerRow3.cells[1].style.cellPadding = padding;
  headerRow3.cells[2].value = 'DATE: $formattedDate';
  headerRow3.cells[2].style.stringFormat = middleFormat;
  headerRow3.cells[2].style.cellPadding = padding;
  final PdfGridRow headerRow4 = headerGrid.rows.add();

  headerRow4.cells[0].value =
      'ที่อยู่่ : ${order.customerAddress} (${order.customerTel}) ';
  headerRow4.cells[0].columnSpan = 3;
  headerRow4.height = 25;
  //Set border for all rows
  for (int i = 0; i < headerGrid.rows.count; i++) {
    final PdfGridRow headerRow = headerGrid.rows[i];
    if (i == headerGrid.rows.count - 1) {
      for (int j = 0; j < headerRow.cells.count; j++) {
        headerRow.cells[j].style.borders = lastRowBorder;
      }
    } else {
      for (int j = 0; j < headerRow.cells.count; j++) {
        headerRow.cells[j].style.borders = borders;
      }
    }
  }
  //Draw grid and get drawn bounds
  final PdfLayoutResult result =
      headerGrid.draw(page: page, bounds: const Rect.fromLTWH(1, 1, 0, 0))!;

  //Create a new grid
  PdfGrid contentGrid = PdfGrid();
  contentGrid.style.font = font;
  contentGrid.columns.add(count: 3);
  //Add grid header
  contentGrid.headers.add(1);
  contentGrid.columns[0].width = 80;
  //contentGrid.columns[1].width = 380;
  contentGrid.columns[2].width = 80;
  //Get header and set values
  final PdfGridRow contentHeader = contentGrid.headers[0];
  contentHeader.cells[0].value = 'ลำดับ';
  contentHeader.cells[0].style.stringFormat = format;
  contentHeader.cells[0].style.borders = borders;
  contentHeader.cells[1].value = 'สินค้า';
  contentHeader.cells[1].style.stringFormat = format;
  contentHeader.cells[1].style.borders = borders;
  contentHeader.cells[2].value = 'จำนวน';
  contentHeader.cells[2].style.stringFormat = format;
  contentHeader.cells[2].style.borders = borders;
  //Add content rows
  contentGrid = _addContentRow(
      '1',
      contentGrid,
      format,
      middleFormat,
      padding,
      'กล่อง${order.name} ขนาด ${order.widthBox * 0.1} x ${order.longBox * 0.1} x ${order.heightBox * 0.1} ซม.',
      '${paper.calculateMat.boxAmount}');
  // contentGrid = _addContentRow('2', contentGrid, format, middleFormat, padding);
  // contentGrid = _addContentRow('3', contentGrid, format, middleFormat, padding);
  // contentGrid = _addContentRow('4', contentGrid, format, middleFormat, padding);
  // contentGrid = _addContentRow('5', contentGrid, format, middleFormat, padding);
  //Add a new row
  final PdfGridRow totalRow = contentGrid.rows.add();
  totalRow.cells[0].value = 'ราคารวม ${paper.calculateMat.costNet} บาท';
  //Set column span
  totalRow.cells[0].columnSpan = 3;
  totalRow.cells[0].style.stringFormat = format;
  totalRow.height = 25;
  //Set borders for all cells in grid
  for (int i = 0; i < contentGrid.rows.count; i++) {
    final PdfGridRow contentRow = contentGrid.rows[i];
    for (int j = 0; j < contentRow.cells.count; j++) {
      contentRow.cells[j].style.borders = borders;
    }
  }
  //Draw content grid based on the bounds calculated in first grid
  contentGrid.draw(
      page: result.page,
      bounds: Rect.fromLTWH(1, result.bounds.top + result.bounds.height, 0, 0));

//   //Save PDF document
//   final List<int> bytes = document.save();
//   //Dispose the document
//   document.dispose();

//   //Get external storage directory
//   Directory directory = (await getApplicationDocumentsDirectory())!;
//   //Get directory path
//   String path = directory.path;
//   //Create an empty file to write PDF data
//   File file = File('$path/Output.pdf');
//   //Write PDF data
//   await file.writeAsBytes(bytes, flush: true);
//   //Open the PDF document in mobile
//   OpenFile.open('$path/Output.pdf');

  //Add a page and draw text
  // document.pages.add().graphics.drawString(
  //     'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 20),
  //     brush: PdfSolidBrush(PdfColor(0, 0, 0)),
  //     bounds: Rect.fromLTWH(20, 60, 150, 30));
  //Save the document
  List<int> bytes = await document.save();
  //Dispose the document
  document.dispose();

  html.AnchorElement(
      href:
          "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
    ..setAttribute(
        "download", "quotation-${order.customerName}-$formattedDate.pdf")
    ..click();
}

//Custom method to create content row and set style properties
PdfGrid _addContentRow(
    String srNo,
    PdfGrid grid,
    PdfStringFormat format,
    PdfStringFormat middleFormat,
    PdfPaddings padding,
    String title,
    String quantity) {
  //Add a row
  final PdfGridRow contentRow1 = grid.rows.add();
  //Set height
  contentRow1.height = 18;
  //Set values and style properties
  contentRow1.cells[0].value = srNo;
  contentRow1.cells[0].style.stringFormat = format;
  //Set row span
  //contentRow1.cells[0].rowSpan = 6;
  //contentRow1.cells[1].rowSpan = 6;
  contentRow1.cells[1].value = '  $title';
  contentRow1.cells[2].value = '  $quantity';
  // contentRow1.cells[2].rowSpan = 6;
  // final PdfGridRow contentRow2 = grid.rows.add();
  // contentRow2.cells[1].value = 'DESIGN NO-';
  // contentRow2.cells[1].style.cellPadding = padding;
  // contentRow2.cells[1].style.stringFormat = middleFormat;
  // final PdfGridRow contentRow3 = grid.rows.add();
  // contentRow3.cells[1].value = 'GROSS WEIGHT-';
  // contentRow3.cells[1].style.cellPadding = padding;
  // contentRow3.cells[1].style.stringFormat = middleFormat;
  // final PdfGridRow contentRow4 = grid.rows.add();
  // contentRow4.cells[1].value = 'DIAMOND CTS-';
  // contentRow4.cells[1].style.cellPadding = padding;
  // contentRow4.cells[1].style.stringFormat = middleFormat;
  // final PdfGridRow contentRow5 = grid.rows.add();
  // contentRow5.cells[1].value = 'GOLD COLOUR-';
  // contentRow5.cells[1].style.cellPadding = padding;
  // contentRow5.cells[1].style.stringFormat = middleFormat;
  // final PdfGridRow contentRow6 = grid.rows.add();
  // contentRow6.cells[1].value = '';
  // contentRow6.height = 15;
  // final PdfGridRow contentRow7 = grid.rows.add();
  // contentRow7.cells[0].value = '';
  // contentRow7.cells[0].columnSpan = 4;
  // contentRow7.height = 5;
  return grid;
}
