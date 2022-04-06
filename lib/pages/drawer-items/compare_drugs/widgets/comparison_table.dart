import 'package:flutter/material.dart';

class Tables extends StatefulWidget {
  @override
  _TablesState createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table Widget"),
      ),
      body: Column(
          children: <Widget>[
            Text("TABLE WIDGET",
              textAlign:TextAlign.center,
              style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
            Padding(padding: const EdgeInsets.only(top: 30),),
            Text("Academic record:",
              textAlign:TextAlign.start,
              style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
            Table(
              border:TableBorder.all(width: 0.5,color: Colors.black,),
              children: [
                TableRow(
                    children: [
                      Text("Level Of Education"),
                      Text("Institution"),
                      Text("Board/University"),
                      Text("Year of Passing"),
                      Text("Aggregate")
                    ]
                ),
                TableRow(
                    children: [
                      Text("B.Tech upto 3rd sem"),
                      Text("ABES EC"),
                      Text("AKTU"),
                      Text("2022"),
                      Text("86%")
                    ]
                ),
                TableRow(
                    children: [
                      Text("Intermediate"),
                      Text("Tramadol is a strong pain relief medicine effective for both general and nerve-related pain. Tramadol can cause dependence and use may be limited by side effects such as nausea and sedation. Pain-relieving effects or side effects may be altered in some people due to genetic variation or drug interactions. Prescribed for Back Pain, Chronic Pain, Pain. May also be prescribed off label for Anxiety, Depression, Fibromyalgia, Obsessive Compulsive Disorder, Restless Legs Syndrome, Syringomyelia, Vulvodynia. Prescription and OTC Prescription only"),
                      Text("CBSE"),
                      Text("2018"),
                      Text("92.2%")
                    ]
                ),
                TableRow(
                    children: [
                      Text("High School"),
                      Text("St. Francis School"),
                      Text("ICSE"),
                      Text("2016"),
                      Text("91.2%")
                    ]
                ),
              ],
            ),
          ]
      ),
    );
  }
}