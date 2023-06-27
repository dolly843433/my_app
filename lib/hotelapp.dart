import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/hotelCard.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HotelApp(),
  ));
}

// ignore: use_key_in_widget_constructors
class HotelApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HotelAppState createState() => _HotelAppState();
}

class _HotelAppState extends State<HotelApp> {
  //here i'm going to add a list of image url that I collected from the internet
  //you can use the image that you want, just copy and paste their Urls here inside the list
  List<String> urls = [
    "https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg?width=2119&height=1195&fit=crop&format=pjpg&auto=webp",
    "https://www.gstsevakendra.org/uploads/service/1654855565-hotel.jpg",
    "https://www.telegraph.co.uk/content/dam/Travel/2017/November/tunisia-sidi-bou-GettyImages-575664325.jpg",
    "https://restaurantindia.s3.ap-south-1.amazonaws.com/s3fs-public/content9733.jpg"
  ];
  
  static get https => null;
  //sometime we can face some http request erreur if the owner of the picture delted it or the url is not available
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFFF6F7FF),
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Let's start by adding the text
            const Text(
              "Where You Wanna go ? ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            
            const SizedBox(
              height: 20.0,
            ),
            //Now let's add some elevation to our text field
            //to do this we need to wrap it in a Material widget
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(30.0),
              shadowColor: const Color.fromARGB(84, 151, 123, 123),
              child: const TextField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Search for Hotel, Flight...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 30.0),
            //Now let's Add a Tabulation bar
            DefaultTabController(
              length: 3,
              child: Expanded(
                child: Column(
                  children: [
                    const TabBar(
                      indicatorColor: Color(0xFFFE8C68),
                      unselectedLabelColor: Color(0xFF555555),
                      labelColor: Color(0xFFFE8C68),
                      labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      tabs: [
                        Tab(
                          text: "Hotel",
                        ),
                        Tab(
                          text: "Place",
                        ),
                        Tab(
                          text: "Food",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 300.0,
                      
                      child: TabBarView(
                        children: [
                          //Now let's create our first tab page
                          ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              //Now let's add and test our first card
                              HotelCard( imgUrl: urls[0], hotelName: "Luxary Hotel", location: 'Caroline', rating: 3,),
                              HotelCard( imgUrl: urls[1], hotelName: "Luxary Hotel", location: 'Caroline', rating: 4,),
                              HotelCard( imgUrl: urls[2], hotelName: "Luxary Hotel", location: 'Caroline', rating: 5,),
                           
                            ],
                          ),
                          ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              //Here you can add what ever you want
                               HotelCard(imgUrl: urls[0], hotelName: "Luxary Hotel", location: 'Caroline', rating: 3,),
                               HotelCard(imgUrl: urls[1], hotelName: "Luxary Hotel", location: 'Caroline', rating: 4,),
                               HotelCard(imgUrl: urls[3], hotelName: "Luxary Hotel", location: 'Caroline', rating: 5,),
                            ],
                          ),
                          ListView(
                            scrollDirection: Axis.horizontal,
                            children: [                       
                                     HotelCard(imgUrl: urls[3], hotelName: "Luxary Hotel", location: 'Caroline', rating: 3,),
                                  ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: const  [
           BottomNavigationBarItem(
            icon:  Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
    );
  }
}
