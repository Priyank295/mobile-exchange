import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

FirebaseAuth _auth = FirebaseAuth.instance;
FirebaseFirestore _fire = FirebaseFirestore.instance;

class _ProfileUpdateState extends State<ProfileUpdate> {
  @override
  Widget build(BuildContext context) {
    final User? user = _auth.currentUser;
    var userid = user!.uid;
    return StreamBuilder(
        stream: _fire.collection("users").doc(userid).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              body: Column(
                children: [
                  Stack(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 55, left: 30),
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: SvgPicture.asset(
                            "assets/arrow.svg",
                            color: Colors.black,
                            height: 18,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 55),
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                              fontFamily: "Lato",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 0.1,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.9),
                          spreadRadius: 0.4,
                          blurRadius: 2,
                          offset: Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Stack(
                          //   children: [
                          //     Container(
                          //       margin: EdgeInsets.only(top: 50),
                          //       child: Container(
                          //         height: 130,
                          //         child: ClipOval(
                          //           child: Stack(
                          //             children: [
                          //               Image.asset(
                          //                 "assets/dp2.jpg",
                          //                 fit: BoxFit.cover,
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: AssetImage("assets/dp2.jpg"),
                              child: Stack(children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Colors.white70,
                                      child: SvgPicture.asset(
                                          "assets/square.svg")),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 70),
                            child: TextFormField(
                              initialValue: snapshot.data!["Fname"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Lato",
                              ),
                              decoration: InputDecoration(
                                label: Text("First Name"),
                                labelStyle: TextStyle(
                                  color: Color(0xfffababab),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lato",
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF6342E8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 70),
                            child: TextFormField(
                              initialValue: snapshot.data!["Lname"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Lato",
                              ),
                              decoration: InputDecoration(
                                label: Text("Last Name"),
                                labelStyle: TextStyle(
                                  color: Color(0xfffababab),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lato",
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF6342E8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 70),
                            child: TextFormField(
                              initialValue: snapshot.data!["Email"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Lato",
                              ),
                              decoration: InputDecoration(
                                label: Text("Email"),
                                labelStyle: TextStyle(
                                  color: Color(0xfffababab),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lato",
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF6342E8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 70),
                            child: TextFormField(
                              initialValue: snapshot.data!["Phone"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Lato",
                              ),
                              decoration: InputDecoration(
                                label: Text("Phone"),
                                labelStyle: TextStyle(
                                  color: Color(0xfffababab),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lato",
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF6342E8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 70),
                            child: TextFormField(
                              initialValue: snapshot.data!["Address"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Lato",
                              ),
                              decoration: InputDecoration(
                                label: Text("Address"),
                                labelStyle: TextStyle(
                                  color: Color(0xfffababab),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lato",
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF6342E8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 70),
                            child: TextFormField(
                              initialValue: snapshot.data!["Zip"],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Lato",
                              ),
                              decoration: InputDecoration(
                                label: Text("Zipcode"),
                                labelStyle: TextStyle(
                                  color: Color(0xfffababab),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Lato",
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF6342E8),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Center(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 340,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF6342E8),
                                    borderRadius: BorderRadius.circular(56),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "UPDATE PROFILE",
                                          style: TextStyle(
                                            fontFamily: "Lato",
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return Container();
        });
  }
}