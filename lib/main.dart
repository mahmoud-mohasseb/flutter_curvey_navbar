import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:AyanApp/screens/pagefavorites.dart';
import 'package:AyanApp/screens/pageproducts.dart';
import 'package:AyanApp/screens/pageconversation.dart';
import 'package:AyanApp/screens/pageaccount.dart';
import 'package:AyanApp/screens/pageexplore.dart';

void main() {
  runApp(MaterialApp(
      home: Homepage(),
  ));
  }

class Homepage extends StatefulWidget {
  Homepage({Key key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

//class state in stateful widget 

class _HomepageState extends State<Homepage> {

  int pageIndex = 0 ;
  GlobalKey _bottomNavigationKey = GlobalKey();


//create all the pages for stateful widget since havng tapping and changes 

final PageProducts _listProducts= new PageProducts();
final PageFavorites _favorites= new PageFavorites();
final Conversationpage _conversation = new Conversationpage();
final Accountpage _account= new Accountpage();
final Explorepage _explore= new Explorepage();


//two widgets for switcher and pagechooser 
Widget _showPage = new PageProducts();
Widget _pageChooser(int page){

//switcher for widget pagechooser widget 
  switch(page){
    case 0 :
    return  _listProducts ;
    break ;
      case 1 :
    return  _favorites ;
    break ;
      case 2 :
    return  _conversation ;
    break ;
      case 3 :
    return  _account ;
    break ;
      case 4 :
    return  _explore ;
    break ;
default:
return new Container(
  child:new Center(
    child:new Text('no page found',
    style : new TextStyle(fontSize: 30),
    ),
    
  )
);
  }
}



  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
    //properties of nav bar 
    
    bottomNavigationBar: CurvedNavigationBar(
    key: _bottomNavigationKey,
    index: 2 ,
    backgroundColor: Colors.black,
    height: 50.0,
    animationDuration:Duration(milliseconds: 700),
    buttonBackgroundColor:Colors.white,
    
//icons used and styling 

  items: <Widget>[
    Icon(Icons.chat_bubble, size: 20 , color:Colors.deepOrange,),
    Icon(Icons.favorite, size: 20),
    Icon(Icons.home, size: 20),
    Icon(Icons.account_circle, size: 20),
    Icon(Icons.compare_arrows, size: 20),
  ],

//ontap inherit widget pagechooser 

    onTap: (int tappedIndex) {
      setState(() {
        _showPage = _pageChooser(tappedIndex);
      });
    },
  ),

//body page show after tapping 
  body: Container(
    color: Colors.white,
    child: Center(
      child: _showPage,

    ),
    
    ),
);
}}