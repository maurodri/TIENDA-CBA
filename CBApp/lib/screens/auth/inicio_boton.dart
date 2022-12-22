import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home/components/body.dart';
import '../home/components/produccion.dart';
import 'auth_page.dart';

class InicioBoton extends StatefulWidget {
  const InicioBoton({Key? key}) : super(key: key);

  @override
  State<InicioBoton> createState() => _InicioBotonState();
}

class _InicioBotonState extends State<InicioBoton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Body();
          } else {
            return const AuthPage();
          }
        }),
      ),
    );
  }
}
