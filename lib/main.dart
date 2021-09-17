import 'package:day33/Animation/FadeAnimation.dart';
import 'package:day33/pages/profile.dart';
import 'package:day33/pages/settings.dart';
import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = [
    'All',
    'Illustration',
    'UIUX Design',
    'Graphic Design',
    'Icons'
  ];

  int activeTab = 0;
  bool run = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network('https://randomuser.me/api/portraits/men/81.jpg'),
              )
            ),
          )
        ],
        title: Container(
          height: 45,
          child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50),
                borderSide: BorderSide.none
              ),
              hintText: "Search e.g Login Page",
              hintStyle: TextStyle(fontSize: 14),
              
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Container(
                height: 150,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeAnimation(1, Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Today\'s popular', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
                        Text('Designs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                      ],
                    )),
                    FadeAnimation(1, Container(
                      width: 220,
                      child: AnimatedDrawing.svg(
                        "assets/blogging.svg",
                        run: this.run,
                        duration: new Duration(seconds: 3),
                        onFinish: () => setState(() {
                          this.run = false;
                        }),
                      ),
                    ))
                  ],
                ),
              ),
              SizedBox(height: 30,),
              FadeAnimation(1.2, Container(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: activeTab == index ? Colors.blue : Colors.grey.shade200
                        ),
                        child: Text(categories[index], style: TextStyle(color: activeTab == index ? Colors.white : Colors.black),),
                      ),
                    );
                }),
              )),
              SizedBox(height: 30,),
              post(1.2, 'https://cdn.dribbble.com/users/427857/screenshots/16434886/media/ae5f9ae8ef9dd88d9b51221d04e9b368.png?compress=1&resize=1200x900'),
              post(1.3, 'https://cdn.dribbble.com/users/2564256/screenshots/16375491/media/895c28ea1efd9423393a85c291c94ae6.png?compress=1&resize=1200x900'),
              post(1.4, 'https://cdn.dribbble.com/users/1962534/screenshots/16431541/media/7324634fc6300cff2ef93023f04b44c2.jpg?compress=1&resize=1200x900'),
              post(1.5, 'https://cdn.dribbble.com/users/6047818/screenshots/16425364/media/a855b66a9d41c79ef04ba5dd258516ef.png?compress=1&resize=1200x900'),
              post(1.6, 'https://cdn.dribbble.com/users/1615584/screenshots/16364085/media/f7a6bb29101ab59b53c72aba06f890dc.jpg?compress=1&resize=1200x900')
            ],
          ),
        ),
      ),
    );
  }

  post(delay, image) {
    return FadeAnimation(delay, Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(image),
      ),
    ));
  }
}
