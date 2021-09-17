import 'package:day33/Animation/FadeAnimation.dart';
import 'package:day33/pages/settings.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({ Key? key }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List<String> posts = [
    'https://cdn.dribbble.com/users/6047818/screenshots/16425364/media/a855b66a9d41c79ef04ba5dd258516ef.png?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/6228692/screenshots/16452651/media/f0c5644c6686695f873f94294d6e2872.png?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/1187002/screenshots/16387491/media/15a6b53012791aeabe8debc092dbab5f.jpg?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/1962534/screenshots/16431541/media/7324634fc6300cff2ef93023f04b44c2.jpg?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/1615584/screenshots/16364085/media/f7a6bb29101ab59b53c72aba06f890dc.jpg?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/427857/screenshots/16434886/media/ae5f9ae8ef9dd88d9b51221d04e9b368.png?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/2564256/screenshots/16375491/media/895c28ea1efd9423393a85c291c94ae6.png?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/2564256/screenshots/16421629/media/fa97071b5dd84f924d6cda859e758648.png?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/1126935/screenshots/16438160/media/02e1bfa43512c40bd19be76fe53391f6.png?compress=1&resize=1200x900',
    'https://cdn.dribbble.com/users/2019344/screenshots/16425765/media/4ae7436b13d722ae28741508788ca425.png?compress=1&resize=1200x900'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Profile", style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(color: Colors.black,),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            }, 
            icon: Icon(Icons.settings, color: Colors.black,)
          )
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    FadeAnimation(1.2, Center(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300, width: 5)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network('https://randomuser.me/api/portraits/men/81.jpg'),
                        ),
                      ),
                    )),
                    SizedBox(height: 20,),
                    FadeAnimation(1.3, Text("Eduardo Hernandez", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),)),
                    SizedBox(height: 10,),
                    FadeAnimation(1.2, Text("Berkeley, California", style: TextStyle(color: Colors.grey, fontSize: 16),)),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FadeAnimation(1.2, Column(
                            children: [
                              Text("94K", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text("Following", style: TextStyle(color: Colors.grey,),),
                            ],
                          )),
                          FadeAnimation(1.5, Column(
                            children: [
                              Text("64K", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text("Followers", style: TextStyle(color: Colors.grey,),),
                            ],
                          )),
                          FadeAnimation(1.6, Column(
                            children: [
                              Text("1.5K", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text("Likes", style: TextStyle(color: Colors.grey,),),
                            ],
                          )),
                        ]
                      )
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            )
          ];
        },
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              FadeAnimation(2.2, Container(
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey.shade600,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(icon: Icon(Icons.list,),),
                    Tab(icon: Icon(Icons.grid_view,),),
                  ]
                )
              )),
              Expanded(
                child: FadeAnimation(2.2, Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return post((1.0 + index) / 4, posts[index], 'list');
                        }
                      ),
                      GridView.builder(
                        itemCount: posts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.2
                        ), 
                        itemBuilder: (context, index) {
                          return post((1.0 + index) / 4, posts[index], 'grid');
                        }
                      )
                    ]
                  )
                ))
              )
            ]
          ),
        ),
      ),
    );
  }

  post(delay, image, type) {
    return FadeAnimation(delay, Container(
      margin: type == 'grid' ? EdgeInsets.all(0) : EdgeInsets.only(top: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(image),
      ),
    ));
  }
}