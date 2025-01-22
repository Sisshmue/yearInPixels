import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:year_in_pixels/color_box.dart';
import 'package:year_in_pixels/colorProvider.dart';
import 'package:popover/popover.dart';
import 'record.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser;
  final _myBox = Hive.box('myBox');

  @override
  void initState() {
    super.initState();
    // Update the state every second
    Timer.periodic(const Duration(seconds: 1), (Timer t) => setState(() {}));
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    // Fetch the current date and format it
    DateTime now = DateTime.now();
    String day = DateFormat('d').format(now); // Day of the month
    String month = DateFormat('MMMM').format(now); // Full month name

    //For Provider
    var colorProvider = Provider.of<ColorProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8EDD9),
      drawer: Drawer(
        width: 300,
        backgroundColor: const Color(0xFFF8EDD9),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: ListTile(
                  leading: const Icon(
                    Icons.person,
                    size: 30,
                  ),
                  title: const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: ListTile(
                  leading: const Icon(
                    Icons.logout,
                  ),
                  title: const Text("Log out"),
                  onTap: signOut,
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: colorProvider.getColor,
        actions: [
          GestureDetector(
            onTap: () {
              _myBox.put('$day & $month', colorProvider.getColor);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Record(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: Icon(Icons.check),
            ),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 150,
              ),
              AvatarGlow(
                glowColor: colorProvider.getColor,
                glowCount: 5,
                repeat: true,
                duration: const Duration(seconds: 5),
                child: Container(
                  decoration: BoxDecoration(
                    // elevation: 30,
                    color: colorProvider.getColor,
                    borderRadius: BorderRadius.circular(360),
                  ),
                  width: 280,
                  height: 280,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        month,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        day,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 130,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                "How was your day like?",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 230, 0, 230),
              //   child:
              Container(
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    KColorBox(
                      kColor: colorProvider.getBoxColor1 == Colors.white10
                          ? Colors.green
                          : colorProvider.getBoxColor1,
                      cirNum: 1,
                    ),
                    const SizedBox(
                      //height: 20,
                      width: 20,
                    ),
                    KColorBox(
                      // k_color: Colors.orangeAccent,
                      kColor: colorProvider.getBoxColor2 == Colors.white10
                          ? Colors.orangeAccent
                          : colorProvider.getBoxColor2,
                      cirNum: 2,
                    ),
                    const SizedBox(
                      // height: 20,
                      width: 20,
                    ),
                    KColorBox(
                      //k_color: Colors.blueAccent,
                      kColor: colorProvider.getBoxColor3 == Colors.white10
                          ? Colors.blueAccent
                          : colorProvider.getBoxColor3,
                      cirNum: 3,
                    ),
                    const SizedBox(
                      //height: 20,
                      width: 20,
                    ),
                    KColorBox(
                      //k_color: Colors.red,
                      kColor: colorProvider.getBoxColor4 == Colors.white10
                          ? Colors.red
                          : colorProvider.getBoxColor4,
                      cirNum: 4,
                    ),
                    const SizedBox(
                      //height: 20,
                      width: 20,
                    ),
                    KColorBox(
                      //k_color: Colors.black,
                      kColor: colorProvider.getBoxColor5 == Colors.white10
                          ? Colors.black
                          : colorProvider.getBoxColor5,
                      cirNum: 5,
                    ),
                  ],
                ),
              ),
              //)
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KColorBox extends StatelessWidget {
  Color kColor;
  int cirNum;
  KColorBox({
    super.key,
    required this.kColor,
    required this.cirNum,
  });

  @override
  Widget build(BuildContext context) {
    //For Provider
    var colorProvider = Provider.of<ColorProvider>(context);
    return GestureDetector(
      onTap: () {
        colorProvider.setColor(kColor);
      },
      onLongPress: () {
        colorProvider.setCirnum(cirNum);
        showPopover(
          backgroundColor: Colors.black12,
          radius: 30,
          context: context,
          bodyBuilder: (context) => const ColorBox(),
          width: 250,
          height: 150,
        );
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kColor,
        ),
      ),
    );
  }
}
