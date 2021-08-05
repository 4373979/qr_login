import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_login/data/protocol/models.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomePage extends StatefulWidget {
  UserModel? userModel;

  HomePage({Key? key, required this.userModel}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(userModel: userModel);
}

class _HomePageState extends State<HomePage> {
  UserModel? userModel;
  TextEditingController? _outputController;
  _HomePageState({required this.userModel});

  @override
  initState() {
    super.initState();
    this._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('用户：'),
            Text(userModel!.userName),
            Text('登陆成功'),
            SizedBox(height: 50),
            TextField(
              controller: this._outputController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: '您扫描的条形码或qrcode将显示在该区域',
                hintStyle: TextStyle(fontSize: 15),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 7, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            // this._buttonGroup(),
            ElevatedButton(
              child: Text("扫码登陆"),
              onPressed: _scan,
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }

  Widget _buttonGroup() {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 120,
            child: InkWell(
              onTap: _scan,
              child: Card(
                child: Column(
                  children: <Widget>[
                    Divider(height: 20),
                    Expanded(flex: 1, child: Text("扫码登陆")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future _scan() async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    if (barcode == null) {
      print('什么都没识别到');
    } else {
      this._outputController!.text = barcode;
    }
  }
}
