import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokedex/app/global/controllers/global_controller.dart';
import 'package:pokedex/app/global/widgets/theme_button.dart';
import 'package:pokedex/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/rodape.png',
              ),
            ),
            Positioned(
              bottom: 15.0,
              left: 20.0,
              child: ThemeButton(),
            ),
            Container(
              padding: EdgeInsets.all(80),
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/logo.png',
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Comece a coletar\npokémons!',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 50),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                      ),
                      //controller: ,
                    ),
                    SizedBox(height: 10),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Senha',
                      ),
                      //controller: ,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: SizedBox(
                        width: 400,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.logar();
                          },
                          child: Text('Entrar'),
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
