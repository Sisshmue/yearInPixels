import 'dart:async';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:year_in_pixels/colorBox.dart';
import 'package:year_in_pixels/colorProvider.dart';
import 'package:popover/popover.dart';
import 'record.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

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
    Timer.periodic(Duration(seconds: 1), (Timer t) => setState(() {}));
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
      backgroundColor: Color(0xFFF8EDD9),
      drawer: Drawer(
        width: 300,
        backgroundColor: Color(0xFFF8EDD9),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  title: Text(
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
                  leading: Icon(
                    Icons.logout,
                  ),
                  title: Text("Log out"),
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
                  context, MaterialPageRoute(builder: (context) => Record()));
              // print(
              //   _myBox.get("$day & $month"),
              // );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
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
              SizedBox(
                height: 150,
              ),
              AvatarGlow(
                glowColor: colorProvider.getColor,
                glowCount: 5,
                repeat: true,
                duration: Duration(seconds: 5),
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
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    k_colorBox(
                      k_color: colorProvider.getBoxColor1 == Colors.white10
                          ? Colors.green
                          : colorProvider.getBoxColor1,
                      cirnum: 1,
                    ),
                    SizedBox(
                      //height: 20,
                      width: 20,
                    ),
                    k_colorBox(
                      // k_color: Colors.orangeAccent,
                      k_color: colorProvider.getBoxColor2 == Colors.white10
                          ? Colors.orangeAccent
                          : colorProvider.getBoxColor2,
                      cirnum: 2,
                    ),
                    SizedBox(
                      // height: 20,
                      width: 20,
                    ),
                    k_colorBox(
                      //k_color: Colors.blueAccent,
                      k_color: colorProvider.getBoxColor3 == Colors.white10
                          ? Colors.blueAccent
                          : colorProvider.getBoxColor3,
                      cirnum: 3,
                    ),
                    SizedBox(
                      //height: 20,
                      width: 20,
                    ),
                    k_colorBox(
                      //k_color: Colors.red,
                      k_color: colorProvider.getBoxColor4 == Colors.white10
                          ? Colors.red
                          : colorProvider.getBoxColor4,
                      cirnum: 4,
                    ),
                    SizedBox(
                      //height: 20,
                      width: 20,
                    ),
                    k_colorBox(
                      //k_color: Colors.black,
                      k_color: colorProvider.getBoxColor5 == Colors.white10
                          ? Colors.black
                          : colorProvider.getBoxColor5,
                      cirnum: 5,
                    ),
                  ],
                ),
              ),
              //)
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class k_colorBox extends StatelessWidget {
  Color k_color;
  int cirnum;
  k_colorBox({
    super.key,
    required this.k_color,
    required this.cirnum,
  });

  @override
  Widget build(BuildContext context) {
    //For Provider
    var colorProvider = Provider.of<ColorProvider>(context);
    return GestureDetector(
      onTap: () {
        colorProvider.setColor(k_color);
      },
      onLongPress: () {
        colorProvider.setCirnum(cirnum);
        showPopover(
          backgroundColor: Colors.black12,
          radius: 30,
          context: context,
          bodyBuilder: (context) => ColorBox(),
          width: 250,
          height: 150,
        );
      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: k_color,
        ),
      ),
    );
  }
}
