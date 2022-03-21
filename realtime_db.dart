import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class realtime_db extends StatefulWidget {
  const realtime_db({Key? key}) : super(key: key);

  @override
  _realtime_dbState createState() => _realtime_dbState();
}

class _realtime_dbState extends State<realtime_db> {
  late DatabaseReference _dbref;
  String databasejson = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dbref = FirebaseDatabase.instance.reference();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(" Database: " + databasejson),
              ),
              TextButton(
                  onPressed: () {
                    _createDB();
                  },
                  child: const Text(" Create DB")),
              TextButton(
                  onPressed: () {
                    _realdb_once();
                  },
                  child: const Text(" Read Value")),
              TextButton(
                  onPressed: () {
                    _readdb_onechild();
                  },
                  child: const Text(" Read One Child")),
              TextButton(
                  onPressed: () {
                    _updatevalue();
                  },
                  child: const Text(" Update Value")),
              TextButton(
                  onPressed: () {
                    _delete();
                  },
                  child: const Text(" Delete Value")),
            ],
          ),
        ),
      ),
    );
  }

  _updatevalue() {
    _dbref.child("JobProfile").update({"Website2": "www.siesedu.in"});
  }
  
  _delete() {
    _dbref.child("Profile").remove();
  }

  _createDB() {
    _dbref.child("Profile").set(" My Profile");
    _dbref
        .child("JobProfile")
        .set({'Website': "www.siesgst.com", "Website2": "www.siesedu.com"});
  }

  _realdb_once() {
    _dbref.once().then((DataSnapshot dataSnapshot) {
      print(" Read Once - " + dataSnapshot.value.toString());
      setState(() {
        databasejson = dataSnapshot.value.toString();
      });
    });
  }

  _readdb_onechild() {
    _dbref
        .child("JobProfile")
        .child("Website2")
        .once()
        .then((DataSnapshot dataSnapshot) {
      print(" Read Once - " + dataSnapshot.value.toString());
      setState(() {
        databasejson = dataSnapshot.value.toString();
      });
    });
  }

  
}