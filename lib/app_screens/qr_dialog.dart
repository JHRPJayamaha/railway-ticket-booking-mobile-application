import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:railway_app_final/model/qr_data_model.dart';

class QRDialog extends StatefulWidget {
  final bool isDocumentCollection;
  final bool isDownloadEnabled;
  final String nicNumber;
  final String ticketQuantity;
  final String date;
  final String time;
  final String trainClass;
  final String totalPrice;
  final String startLocation;
  final String endLocation;

  QRDialog(
      {Key key,
      this.isDocumentCollection = false,
      @required this.isDownloadEnabled,
      @required this.trainClass,
      @required this.ticketQuantity,
      @required this.nicNumber,
      @required this.date,
      @required this.time,
      @required this.totalPrice,
      @required this.startLocation,
      @required this.endLocation})
      : super(key: key);

  @override
  _QRDialogState createState() => _QRDialogState();
}

class _QRDialogState extends State<QRDialog> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final GlobalKey globalKey = GlobalKey();
  String jsonQrDataSet;
  String encodedJsonQrDataSet;

  String _path = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      QRDataSet qrDataSet = QRDataSet(
        date: widget.date,
        time: widget.time,
        ticketQuantity: widget.ticketQuantity,
        nicNumber: widget.nicNumber,
        startLocation: widget.startLocation,
        endLocation: widget.endLocation,
        totalPrice: widget.totalPrice,
        trainClass: widget.trainClass,
      );
      jsonQrDataSet = jsonEncode(qrDataSet);
    });
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    encodedJsonQrDataSet = stringToBase64.encode(jsonQrDataSet);
    print(encodedJsonQrDataSet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white),
                child: RepaintBoundary(
                  key: globalKey,
                  child: QrImage(
                    foregroundColor: Color(0xff752898),
                    backgroundColor: Colors.white,
                    data: encodedJsonQrDataSet,
                    version: QrVersions.auto,
                    size: 320,
                    gapless: true,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.close, color: Colors.white, size: 40),
                ),
              ),
            ),
            widget.isDownloadEnabled
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 75),
                      child: GestureDetector(
                        onTap: () async {
                          // _capturePng().then((value) {
                          //   if (value) {
                          //     print("Success");
                          //     _showToast(
                          //         context,
                          //         'Saved to external storage. PATH : $_path',
                          //         false);
                          //   } else {
                          //     _showToast(context, 'Failed', false);
                          //   }
                          // });
                        },
                        child: Container(
                          width: 230,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x40000000),
                                  offset: Offset(3, 3),
                                  blurRadius: 2.0,
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Download',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context, String message, bool isError) {
    final scaffold = _scaffoldKey.currentState;
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: isError ? Duration(seconds: 30) : Duration(minutes: 1),
        action: isError
            ? null
            : SnackBarAction(
                label: 'Open',
                onPressed: () {
                  // ignore: unnecessary_statements
                  scaffold.hideCurrentSnackBar;
                  // openFile();
                }),
      ),
    );
  }

  // Future<void> openFile() async {
  //   final filePath = _path + '/qr_code.png';
  //   print('Complete Path: $filePath');
  //   final result = await OpenFile.open(filePath, type: "image/png");
  //   print(result.message);
  // }

  // Future<bool> _capturePng() async {
  //   RenderRepaintBoundary boundary =
  //       globalKey.currentContext.findRenderObject();
  //   ui.Image image = await boundary.toImage();
  //   ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   Uint8List pngBytes = byteData.buffer.asUint8List();
  //   print(pngBytes);
  //
  //   final tempDir = (await getExternalStorageDirectory()).path;
  //   final qrCodeFile = File('$tempDir/qr_code.png');
  //   var file = await qrCodeFile.writeAsBytes(pngBytes);
  //   _path = tempDir;
  //
  //   print(tempDir);
  //
  //   if (file != null) {
  //     return true;
  //   }
  //
  //   return false;
  // }
}
