import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:v_covid/providers.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Providers()),
      ChangeNotifierProvider(create: (_) => ListProviders()),
    ],
    child: MyApp(),
  ), 
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'V-covid',
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.deepPurple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  
  @override
  void initState() {
    super.initState();
    Provider.of<Providers>(context, listen: false).getProviders();
    Provider.of<ListProviders>(context, listen: false).getProviders();
  }
  
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var formatter = new DateFormat("d MMMM yyyy");
    var model = Provider.of<Providers>(context).model;
    var listOfCase = Provider.of<ListProviders>(context).listModel;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Positioned(
                top: 85,
                right: 0,
                child: Image(
                  width: 190,
                  image: AssetImage('assets/fight_corona.jpg'),
                ),
              ),
              Positioned(
                top: 60,
                left: 30,
                child: 
                Wrap(
                  direction: Axis.vertical,
                  spacing: -10,   
                  children: <Widget>[
                    Text("Nonton", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35.0,)),
                    Text("COVID-19", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 45.0,)),
                  ]
                ) 
              ),
              Positioned(
                top: 220,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Wrap(
                      direction: Axis.vertical,
                      spacing: -10,   
                      children: <Widget>[
                        Wrap(
                          direction: Axis.horizontal,
                          children: <Widget>[
                            Text("Apa itu", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,)),
                            Text(" Coronavirus ?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.teal)),
                          ]
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.85,
                          margin: EdgeInsets.only(top: 15),
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text: 'adalah virus yang menyerang sistem pernapasan. Penyakit karena infeksi virus ini disebut ',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'COVID-19',
                                  style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)
                                ),
                                TextSpan(
                                  text: '. Virus ini bisa menyebabkan gangguan ringan pada sistem pernapasan, infeksi paru-paru yang berat, hingga kematian.',
                                )
                              ]
                            ),
                          ),
                        )
                      ]
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Pencegahan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),),
                          // Padding(padding: EdgeInsets.only(top:5),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              preventionContainer('assets/prevention/wash.png', 'Cucilah tangan pakai sabun'),
                              preventionContainer('assets/prevention/close.png', 'Tutup hidung & mulut ketika bersin'),
                              preventionContainer('assets/prevention/trash.png', 'Buang tissue bekas ke tempat sampah'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              preventionContainer('assets/prevention/distance.png', 'Selalu jaga jarak aman'),
                              preventionContainer('assets/prevention/masker.png', 'Gunakanlah masker'),
                              preventionContainer('assets/prevention/block.png', 'Jangan pegang wajah'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 680),
                height: 570,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),              
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, -1),
                      )
                    ]
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top:20, left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: Color(0xFFE5E5E5),
                            ),
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            underline: SizedBox(),
                            value: "Indonesia",
                            items: [
                              "Indonesia",
                              "Yogyakarta",
                              "Banjarnegara",
                              "Wonosobo",
                            ].map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value)
                              );
                            }).toList(),
                            onChanged: (value){},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Update Kasus",
                                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900, fontSize: 15.0)
                                    ),
                                  ] 
                                ),
                              ),
                              Text(
                                formatter.format(now),
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.0
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(2),),
                        Card(
                          elevation: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              cardCounter('Confirmed', (model != null)? model[0]?.confirmed : ''),
                              cardCounter('Recovered', (model != null)? model[0]?.recovered : ''),
                              cardCounter('Deaths', (model != null)? model[0]?.deaths : ''),
                            ],
                          ),
                        ),

                        Container(
                          height: 350,
                          padding: EdgeInsets.only(bottom: 20),
                          child: Card(
                            elevation: 5,
                            child: ListView(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: listOfCase != null?listOfCase
                              .map(
                                ((val) => listCaseProvince(val))
                              ).toList() : <Widget>[
                                Text('Data kosyong')
                              ]
                            ),
                          ),
                              
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      )
    );
  }

  Container listCaseProvince(val) {
    final nf = NumberFormat("#,###");

    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(margin: EdgeInsets.only(right: 10), width: 130, child: Text((val?.countryRegion != null)? val?.countryRegion: '', style: TextStyle(fontSize: 12,),)),
              listCardCounter('Confirmed', (val?.confirmed != null)? nf.format(int.parse(val?.confirmed)): ''),
              listCardCounter('Recovered', (val?.recovered != null)? nf.format(int.parse(val?.recovered)): ''),
              listCardCounter('Deaths', (val?.deaths != null)? nf.format(int.parse(val?.deaths)): ''),
            ],
          ),
        ],
      ),
    );
  }

  Container preventionContainer(images, title) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 5, top:15),
      width: 90,
      child: Column(
        children: <Widget>[
          Image(
            width: 90,
            image: AssetImage(images),
          ),
          Text(title, style: TextStyle(fontSize: 10), textAlign: TextAlign.center,),
        ],
      ),
    );
  }

  Container cardCounter(String status, counter) {
    var color;

    switch(status){
      case 'Confirmed':
        color = Colors.amber;        
      break;
      case 'Recovered':
        color = Colors.green;
      break;
      case 'Deaths':
        color = Colors.red;
      break;
    };

    return Container(
      height:80,
      width:90,
      margin: EdgeInsets.all(5), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(counter.toString(), style: TextStyle(fontSize: 25, color: color, fontWeight: FontWeight.w500)),
          Text(status)
        ],
      ),
    );
  }

  Container listCardCounter(String status, counter) {
    var color;

    switch(status){
      case 'Confirmed':
        color = Colors.amber;        
      break;
      case 'Recovered':
        color = Colors.green;
      break;
      case 'Deaths':
        color = Colors.red;
      break;
    };

    return Container(
      height:30,
      width:50,
      margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5), 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(counter.toString(), style: TextStyle(fontSize: 12, color: color, fontWeight: FontWeight.w500)),
          // Text(status, style: TextStyle(fontSize: 10, color: Colors.black))
        ],
      ),
    );
  }
}