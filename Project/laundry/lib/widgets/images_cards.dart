import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:laundry/models/places.dart';
import 'image_card.dart';

class ImageCards extends StatefulWidget {
  @override
  _ImageCardsState createState() => _ImageCardsState();
}

class _ImageCardsState extends State<ImageCards> {
  List<Place> places = [
    Place(place: 'Austria', image: 'travel.jpg', days: 7),
    Place(place: 'USA', image: 'travel.jpg', days: 7),
    Place(place: 'Bali', image: 'travel.jpg', days: 7),
    Place(place: 'Jakarta', image: 'travel.jpg', days: 7),
    Place(place: 'Surabaya', image: 'travel.jpg', days: 7),
    Place(place: 'New York', image: 'travel.jpg', days: 7),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: places.length,
        itemBuilder: (_, index) {
          return ImageCard(
            name: places[index].place, 
            days: places[index].days, 
            picture: places[index].image, 
            place: places[index],
            );
        }),
    );
  }
}