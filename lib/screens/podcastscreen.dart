import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'package:cached_network_image/cached_network_image.dart';



class PodcastScreen extends StatefulWidget{
  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  String imageurl = "";
  String imageurl2 = "";
  @override
  void initState(){
    super.initState();
    fetchgifs();
  }

  Future<void> fetchgifs() async{
    try {
      String geturl = await FirebaseStorage.instance.ref(
          "images/podcast/10161.gif").getDownloadURL();
      String geturl2 = await FirebaseStorage.instance.ref("images/podcast/10162.gif").getDownloadURL();
      setState(() {
        imageurl = geturl;
        imageurl2 = geturl2;
      });
    }catch(e){
      print("error catching image");
    }
  }
  
  Widget buildpodcastscreen(BuildContext context, String gifpathF, String giftext, String gifurl){
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            color: Color(0xFfe2e2e2),
            padding: EdgeInsets.only( left: 40, right: 40),
            height: 300,
            width: double.infinity,
            child: InkWell(
              onTap: (){
                launchurl2(gifurl);
              },
                child: CachedNetworkImage(
                    imageUrl: gifpathF,
                  placeholder: (context, imageurl) => Center(child: CircularProgressIndicator()),
                )
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 40),
          child: Center(child: Text(giftext, style: TextStyle(fontSize: 14,),textAlign: TextAlign.center,)),
        ),
      ],
    );
  }

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFF9F5F5),
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)),
              child: Image.asset("assets/images/podcast.png", width: double.infinity,fit: BoxFit.fill,height: 300,)),
          SizedBox(height: 10),
          Center(
            child: Text(
              "PodCast Editor Bilal Masoud",
              style: TextStyle(fontFamily: "ProtestStrike", fontSize: 30),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text("Hi, I am Bilal Masoud, a podcast editor for my university's content development team. I specialize in producing high-quality podcast episodes that are uploaded to our official YouTube channel. My role involves enhancing audio clarity, removing background noise, balancing sound levels, and ensuring smooth transitions between segments. I work closely with the team to uphold the university’s content standards while incorporating audio effects that make each episode engaging and professional for our audience.",
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10,),
          Center(
            child: Text(
              "Projects ",
              style: TextStyle(fontFamily: "ProtestStrike", fontSize: 20),
            ),
          ),
          buildpodcastscreen(context, imageurl, "In this podcast, I handled the audio editing process to ensure a smooth and engaging listening experience. I focused on removing background noise, balancing audio levels, and enhancing overall sound clarity. Additionally, I organized the content flow to maintain a natural conversation pace, adding subtle music and sound effects where necessary to enrich the audio. My goal was to create a professional and polished final product that keeps listeners engaged from start to finish.", "https://www.youtube.com/watch?v=JH6f14e-bHI&t=131s"),
          buildpodcastscreen(context, imageurl2, "For this podcast, I concentrated on improving the audio quality and pacing of the episode. I meticulously edited out unnecessary pauses, distractions, and filler words to create a more cohesive and focused narrative. I also optimized the dialogue for clarity, ensuring that the speakers' voices were well-balanced and pleasant to listen to. My editing process aimed to present the content in a clear and compelling manner, contributing to an overall professional production.", "https://youtu.be/IdNg3xDHH6w?si=spRfByqrqo5mrLvt")
        ],
      ),
    );
  }

  Future<void> launchurl2(String url) async {
    if(kIsWeb){
      html.window.open(url, 'blank');
    }
    else if (!await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }else{
      throw Exception("could not launch $url");
    }
  }
  
}