import 'package:flutter/material.dart';
import 'package:qr_login/data/protocol/models.dart';
import 'package:qr_login/data/repository/user_repository.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _unameController = new TextEditingController();
    TextEditingController _pwdController = new TextEditingController();

    final _formKey = GlobalKey<FormState>();

    void _userLogin() {
      if (_formKey.currentState!.validate()) {
        String username = _unameController.text;
        String password = _pwdController.text;
        LoginModel loginModel = new LoginModel(username, password);
        UserRepository userRepository = new UserRepository();
        userRepository
            .loginRequest(loginModel)
            .then((userModel) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(userModel: userModel),
                  ),
                ))
            .catchError((error) {
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text("登陆失败，用户名或密码错误")));
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              controller: _unameController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "您的用户名",
                prefixIcon: Icon(Icons.person), //图标
              ),
              validator: (value) {
                if (value!.trim().length == 0) {
                  return '请输入有效的用户名';
                }
              },
            ),
            TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)),
                validator: (value) {
                  if (value!.trim().length == 0) {
                    return '请输入有效的密码';
                  }
                },
                obscureText: true),
            MaterialButton(
              child: Text('登录'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                _userLogin();
              },
            )
          ],
        ),
      ),
    );
  }
}
