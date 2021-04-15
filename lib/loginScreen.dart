import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isRememberMe = false;

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'E-mail',
          style: TextStyle(
              color: Colors.blueGrey[800],
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 2, offset: Offset(0, 2))
                ]),
            height: 50,
            child: TextField(
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14),
                    prefixIcon: Icon(Icons.email, color: Colors.blueGrey[800]),
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.blueGrey[100]))))
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Senha',
          style: TextStyle(
              color: Colors.blueGrey[800],
              fontSize: 16,
              fontWeight: FontWeight.normal),
        ),
        SizedBox(height: 10),
        Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, blurRadius: 2, offset: Offset(0, 2))
                ]),
            height: 50,
            child: TextField(
                obscureText: true,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14),
                    prefixIcon: Icon(Icons.lock, color: Colors.blueGrey[800]),
                    hintText: 'Senha',
                    hintStyle: TextStyle(color: Colors.blueGrey[100]))))
      ],
    );
  }

  Widget buildForgotPassBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print("Redefinindo senha"),
        padding: EdgeInsets.only(right: 0),
        child: Text(
          'Esqueci minha senha',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  Widget buildRememberCb() {
    return Container(
      padding: EdgeInsets.only(left: 0),
      height: 20,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
                value: isRememberMe,
                checkColor: Colors.blueGrey[600],
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    isRememberMe = value;
                  });
                }),
          ),
          Text('Manter conectado',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.normal))
        ],
      ),
    );
  }

  Widget buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5,
        onPressed: () => print('Login solicitado'),
        padding: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Colors.white,
        child: Text(
          'Login',
          style: TextStyle(
              color: Colors.brown[600],
              fontSize: 18,
              fontWeight: FontWeight.normal),
        ),
      ),
    );
  }

  Widget buildSignUpBtn() {
    return GestureDetector(
      onTap: () => print("Se cadastrando"),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
                text: "Ainda não tem uma conta? ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400)),
            TextSpan(
                text: 'Cadastrar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GestureDetector(
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFBE9E7),
                      Color(0xFFFFCCBC),
                      Color(0xFFFFAB91),
                      Color(0xFFFF8A65),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Trackejo',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 40,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(height: 50),
                        buildEmail(),
                        SizedBox(height: 40),
                        buildPassword(),
                        buildForgotPassBtn(),
                        buildRememberCb(),
                        buildLoginBtn(),
                        buildSignUpBtn(),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
