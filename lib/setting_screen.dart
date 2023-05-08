import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final user = FirebaseAuth.instance.currentUser!;

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("assets/images/bg1.jpg"), // <-- BACKGROUND IMAGE
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Image.asset(
                  'assets/images/profile.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                user.email!,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: (() {}),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        side: BorderSide.none,
                        shape: StadiumBorder()),
                  )),
              const SizedBox(
                height: 30,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.gear),
                  title: Text(
                    'Setting',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                  trailing: FaIcon(
                    FontAwesomeIcons.arrowRight,
                    size: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.book),
                  title: Text(
                    'Niên Luận ',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Công nghệ thông tin"),
                  onTap: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.circleInfo),
                  title: Text(
                    'Description',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Bui Duy Khang B1910078'),
                  onTap: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                child: ListTile(
                  leading: FaIcon(FontAwesomeIcons.user),
                  title: Text(
                    'Sign out',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () => FirebaseAuth.instance.signOut(),
                  trailing: FaIcon(
                    FontAwesomeIcons.rightFromBracket,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
