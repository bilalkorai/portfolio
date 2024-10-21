import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;

class ReelsScreen extends StatefulWidget {
  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  String image1url = "";
  String image2url = "";
  String image3url = "";
  String image4url = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchreelgifs();
  }

  void fetchreelgifs() async{
    String reel1gif = await FirebaseStorage.instance.ref("images/reels/r11.gif").getDownloadURL();
    String reel2gif = await FirebaseStorage.instance.ref("images/reels/r22.gif").getDownloadURL();
    String reel3gif = await FirebaseStorage.instance.ref("images/reels/r33.gif").getDownloadURL();
    String reel4gif = await FirebaseStorage.instance.ref("images/reels/r44.gif").getDownloadURL();
    setState(() {
      image1url = reel1gif;
      image2url = reel2gif;
      image3url = reel3gif;
      image4url = reel4gif;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F5F5),
      body: ListView(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Image.asset(
              "assets/images/reels.png",
              height: 300,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              "Reels Editor Bilal Masoud",
              style: TextStyle(fontFamily: "ProtestStrike", fontSize: 30),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "With over 3 years of experience in video editing, I specialize in creating engaging, high-quality content for social media platforms, particularly Instagram and Facebook Reels. My work focuses on capturing the essence of a brand's message and turning it into captivating visual stories that resonate with audiences.",
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          Center(
            child: Text(
              "Projects",
              style: TextStyle(fontSize: 20, fontFamily: "ProtestStrike"),
            ),
          ),
          SizedBox(height: 0),
          buildProjectItem(
            context,
            image1url,
            "In this reel, I’ve captured the best moments from a recent tour with friends. The video showcases scenic landscapes, candid interactions, and memorable experiences, all brought together with smooth transitions and dynamic cuts.I’ve employed color correction and timing to highlight key moments, ensuring that the energy and excitement of the trip are conveyed effectively. The video is edited to maintain a natural flow, with a fitting soundtrack that enhances the visual storytelling. This reel is a great example of my ability to edit travel content with attention to detail and engagement.",
            "https://www.instagram.com/reel/DAWZidNINME/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==",
          ),
          buildProjectItem(
            context,
            image2url,
            "This video showcases the serene and architectural beauty of my university’s outdoor environment. Focusing on the campus landscape, I’ve captured scenes of iconic buildings, walkways, and greenery.Through seamless transitions, precise cuts, and appropriate pacing, the video creates an engaging narrative. I’ve also applied color grading and sound effects to enhance the mood and atmosphere of each shot, ensuring the video reflects the lively and diverse spirit of university life.",
            "https://www.instagram.com/reel/C27y1lvoO2s/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==",
          ),
          buildProjectItem(
            context,
            image3url,
            "This video captures the exciting moments from a memorable tour to Karachi with my class fellows. From the bustling streets to iconic landmarks, the reel showcases the vibrant culture and energy of the city.  The video features well-timed transitions, lively music, and smooth editing to highlight the best parts of the trip. I’ve focused on creating an immersive experience that reflects both the fun and exploration of our group journey, blending scenic views with candid moments of the city’s dynamic atmosphere.",
            "https://www.instagram.com/reel/C0oKelDo_0C/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==",
          ),
          buildProjectItem(
            context,
            image4url,
            "This video captures the essence of Karachi’s cityscape during my trip for my cousin’s wedding. Focusing on the roads and iconic views of the city, I’ve compiled shots that reflect the dynamic energy of Karachi. The video transitions smoothly between different scenes, highlighting the hustle and bustle of city life, framed with well-timed cuts and cinematic pacing. With color correction and background music, the reel creates a visual journey through Karachi’s streets, offering a unique perspective of the city outside the wedding festivities.",
            "https://www.instagram.com/reel/C3fIXndIeBf/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==",
          )
        ],
      ),
    );
  }

  Widget buildProjectItem(BuildContext context, String gifPath, String description, String urll) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 40, left: 40, right: 40),
          height: 400,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () {
                launchurl(urll);
              },
              child:CachedNetworkImage(
                imageUrl: gifPath,
                placeholder: (context, imageurl) => Center(child: CircularProgressIndicator()),
              )
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 40, left: 60, right: 60, bottom: 40),
          child: Text(description, textAlign: TextAlign.center),
        ),
      ],
    );

  }

  Future<void> launchurl(String url) async {
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
