

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animationIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 56;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds:  500))
        ..addListener(() { 
          setState(() {
            
          });
        });
    _animationIcon = Tween<double>(begin: 0.0,end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(begin: Colors.blue,end: Colors.red).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.00,1.00,curve: Curves.linear)));
    _translateButton = Tween<double>(begin: _fabHeight,end: -14.0).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.0,0.75,curve: _curve)));
    super.initState();

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //Widgets
  Widget buttonWhatsapp(){
return Container (
  child: FloatingActionButton(
    heroTag: 'unq1',
    onPressed: (){},
    tooltip: "adeued",
    child: IconButton(
      onPressed: ()async{
        const url = 'https://wa.me/message/7UA7BNOG5TQXD1';
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      },
        icon: FaIcon(FontAwesomeIcons.whatsapp)),
  ),
);
  }

  Widget buttonInstagram(){
    return Container (
      child: FloatingActionButton(
        heroTag: 'unq2',
        onPressed: ()async{
          const url = 'https://www.instagram.com/skypropdelhi';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        tooltip: "adjbcjd",
        child: FaIcon(FontAwesomeIcons.instagram),
      ),
    );
  }

  Widget buttonFacebook(){
    return Container (
      child: FloatingActionButton(
        heroTag: 'unq3',
        onPressed: ()async{
          const url = 'https://www.facebook.com/skypropertiesdelhi';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        tooltip: "adhdhdhd",
        child: FaIcon(FontAwesomeIcons.facebook),
      ),
    );
  }

  Widget buttonYoutube(){
    return Container (
      child: FloatingActionButton(
        heroTag: 'unq4',
        onPressed: ()async{
          const url = 'https://www.youtube.com/channel/UC7RVm0eEr48uzE0vuX4upGw';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        tooltip: "adlihiwd",
        child: FaIcon(FontAwesomeIcons.youtube),
      ),
    );
  }
  Widget buttonTelegram(){
    return Container (
      child: FloatingActionButton(
          heroTag: 'unq6',
        onPressed: ()async{
          const url = 'https://t.me/skyproperties';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            throw 'Could not launch $url';
          }
        },
        tooltip: "adpppqlad",
        child: FaIcon(FontAwesomeIcons.telegram),
      ),
    );
  }

  Widget buttonToggle(){
    return Container (
      child: FloatingActionButton(
        heroTag: 'unq7',
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: "Toggle",
        child: AnimatedIcon(icon: AnimatedIcons.home_menu,progress: _animationIcon,),
      ),
    );
  }

  animate(){
    if(!isOpened)
      _animationController.forward();
    else
      _animationController.reverse();
    isOpened =!isOpened;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Color(0xff004274),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform(
                  transform: Matrix4.translationValues(0.0, _translateButton.value*5.0, 0.0),
                  child: buttonFacebook(),
                ),Transform(
                  transform: Matrix4.translationValues(0.0, _translateButton.value*4.0, 0.0),
                  child: buttonInstagram(),
                ),Transform(
                  transform: Matrix4.translationValues(0.0, _translateButton.value*3.0, 0.0),
                  child: buttonYoutube(),
                ),
                Transform(
                  transform: Matrix4.translationValues(0.0, _translateButton.value*2.0, 0.0),
                  child: buttonTelegram(),
                ),
                Transform(
                  transform: Matrix4.translationValues(0.0, _translateButton.value*1.0, 0.0),
                  child: buttonWhatsapp(),
                ),

                buttonToggle()

              ],
            ),
          ),
        ),
        extendBodyBehindAppBar: false,
            body: WebView(
            initialUrl: 'https://skypropertiespatelnagar.com/',
            javascriptMode: JavascriptMode.unrestricted,
          ),
      )
    );
  }
}

