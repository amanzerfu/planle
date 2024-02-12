import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:leplan/Pages/signin_screen.dart';
import 'package:leplan/Pages/time_lines.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}):super(key :key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int unicode = 0x1F60A;
  final List myToDoList = [
    'Database update',
    'Tutorial',
    'Refactor the Codes',
    'Drink Coffee',
  ];
  void updateIndex(int oldIndex,int newIndex)
  {
    setState(() {
      if(oldIndex < newIndex)
        {
          newIndex--;
        }
      //get tile
      final tile= myToDoList.removeAt(oldIndex);

      //place tile new position
      myToDoList.insert(newIndex, tile);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      bottomNavigationBar: CurvedNavigationBar(
        onTap:(value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TimeLines(),));
        },
        animationDuration: Duration(milliseconds: 300),
        backgroundColor:Colors.brown,
          items: [Icon(Icons.home),
        Icon(Icons.favorite),
        Icon(Icons.settings),
        Icon(Icons.manage_accounts),
      ],),
      body: SafeArea(
        child: Column(
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Thank you Jesus!",style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(DateTime.now().toString(),style: TextStyle(color: Colors.brown[200]),)
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.brown[600],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12),
                      child:IconButton(
                        iconSize: 10,
                        color: Colors.blue,
                        onPressed: () {
                         FirebaseAuth.instance.signOut().then((value) {
                           Navigator.push(context,MaterialPageRoute(builder: (context)=>SignInScreen()));
                         }).onError((error, stackTrace) {
                           ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                             content:
                               Container(
                                 padding: EdgeInsets.all(16),
                                 height: 45,
                                 decoration: BoxDecoration(
                                   color: Colors.red,
                                   borderRadius: BorderRadius.circular(20)
                                 ),
                                 child: SnackBar(content: Text("${error.toString()}"),
                                 behavior: SnackBarBehavior.floating,
                                 backgroundColor: Colors.transparent,
                                 elevation: 0,),
                               ),
                             ),
                           );
                           print("Error : ${error.toString()}");
                         });
                        },
                        icon: Icon(
                          Icons.ads_click,
                        ),
                      )
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                Container(
                  decoration: BoxDecoration(color: Colors.brown[600],borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Icon(Icons.search,color: Colors.white,),
                      SizedBox(width: 10,),
                      Text("search",style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("How do  you want to spend your day?"
                      ,style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,fontSize: 12),),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.brown[600],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Text("What a nice day",
                          style: TextStyle(fontSize: 12),),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        SizedBox(
          height: 25,
        ),
            Expanded(
              child: Container(
                color: Colors.brown[600],
                child: ReorderableListView(
                  padding: EdgeInsets.symmetric(horizontal: 26.0),
                  children: [
                    for(final tile in myToDoList)
                      ListTile(key:ValueKey(tile.hashCode),
                      title: Text(tile,style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.white),),
                      ),
                  ],
                  onReorder: (olderIndex,newIndex) => updateIndex(olderIndex, newIndex),
                ),
              ),
            ),
          ]
        ) ,
      ),
    );
  }
}
