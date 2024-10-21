import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio2/screens/podcastscreen.dart';
import 'package:portfolio2/screens/reelsscreen.dart';
import 'package:page_transition/page_transition.dart';

class homescr extends StatefulWidget{
  @override
  State<homescr> createState() => _homescrState();
}

class _homescrState extends State<homescr> {
  @override
  Widget build(BuildContext context){
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xF9F5F5F5),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Bilal Masoud", style: TextStyle(fontSize: 25,fontFamily: "BebasNeue" ),),
            IconButton(onPressed: (){}, icon: Icon(Icons.menu_outlined, size: 20,))
          ],
        ),
        elevation: 1,
        backgroundColor: Color(0xF9e2e2e2),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Center(child: Text("Video Editor Bilal Masoud", style: TextStyle(fontFamily: "ProtestStrike", fontSize: 30),)),
          SizedBox(height: 30,),
          Center(child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text("Hi, I’m Bilal Masoud, a passionate video editor with 4 years of experience in creating engaging, high-quality video content. I specialize in bringing stories to life through seamless transitions, color grading, and captivating visuals. Whether it’s social media videos, short films, or corporate content, I focus on delivering top-notch work tailored to meet the specific needs of my clients.", style: TextStyle(fontSize: 14),textAlign: TextAlign.center,))),
          SizedBox(height: 30,),
          Center(child: Text("My Projects", style: TextStyle(fontFamily: "ProtestStrike", fontSize: 20),)),
          SizedBox(height: 50,),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: CarouselSlider(
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: 200,
                    autoPlay: false
                ),
                items: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                            onTap: (){
                              Navigator.push(context, PageTransition(child: ReelsScreen(), type: PageTransitionType.bottomToTop, childCurrent: Image.asset("assets/images/reels.png"),opaque: true));
                            },
                            child: Image.asset("assets/images/reels.png"))),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, PageTransition(child: PodcastScreen(), type: PageTransitionType.bottomToTop, childCurrent: Image.asset("assets/images/podcast.png")));
                          },
                            child: Image.asset("assets/images/podcast.png"))),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/images/travel.png")),
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}