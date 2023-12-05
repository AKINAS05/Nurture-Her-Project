import 'package:flutter/material.dart';
class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent({required this.image,required this.title,required this.description});
}
List<UnbordingContent> contents =[
  UnbordingContent(
    title: 'Mindful Melodies',
    image:'assets/images/preinfo1.png',
    description: "Your exclusive oasis of Tranquility",
  ),
  UnbordingContent(
    title: 'Guardians of Security',
    image:'assets/images/preinfo2.png',
    description: "A 100% secure Haven",
  ),
  UnbordingContent(
    title: 'Precision in every pulse',
    image:'assets/images/preinfo3.png',
    description: "100% accurate data certified by Medical Experts",
  ),
];
