import 'package:flutter/material.dart';
import 'package:untitled38/detaySayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var ulkerler = ['Türkiye','Almanya','İtalya','Çimce','Japonya'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
      ),
      body: SizedBox(
        height: 100,

        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ulkerler.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>Detaysayfa(ulkeAdi:ulkerler[index] ,)));
                },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        GestureDetector(
                            onTap: (){
                              print('Text İle ${ulkerler[index]} Tıklandı');

                            },
                            child: Text(ulkerler[index])),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: PopupMenuButton(
                            child: Icon(Icons.add),
                            itemBuilder: (context)=>[
                              PopupMenuItem(
                                value: 1,
                                child: Text('Sil'),

                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Text('Güncelle'),

                              ),

                            ],
                            onSelected: (menuValueItem){
                              if(menuValueItem == 1){
                                print('${ulkerler[index]} silindi');
                              }
                              if(menuValueItem==2){
                                print('${ulkerler[index]} Güncellendi');
                              }
                            },
                          )
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}
