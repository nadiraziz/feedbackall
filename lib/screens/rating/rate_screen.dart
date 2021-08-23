import 'package:feedback/screens/home/home.dart';
import 'package:feedback/screens/welcome_screen.dart';
import 'package:feedback/services/questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

QuizBrain RatingBrain = QuizBrain();

class Rating extends StatefulWidget {
  static String id = 'rate_screen';

  const Rating({Key? key}) : super(key: key);

  @override
  _RatingState createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double rating = 2.0;
  List<int?> ratedList = [];


  @override
  Widget build(BuildContext context) {
    var nameController;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child: Image.asset('assets/images/rating.png', fit: BoxFit.fitWidth,)),
          Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Text(RatingBrain.getQuestionText(),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 35.0,color: Colors.deepPurple, fontWeight: FontWeight.bold),),
          ),
          // TextFormField(
          //   controller: nameController,
          //   decoration: InputDecoration(
          //       hintText: "Enter Name",
          //       labelText: "Name"
          //   ),
          // ),
          Expanded(
            child: RatingBar.builder(
              initialRating: rating,
              allowHalfRating: true,
              minRating: 1,
              itemCount: 5,
              itemBuilder: (context, _) => Icon(Icons.star,color: Colors.amber),
              onRatingUpdate: (value) {
                setState(() {
                  rating = value;
                  ratedList.add(rating.toInt());
                  print(ratedList);
                  if (!RatingBrain.isFinished()){
                    rating = 5;
                    RatingBrain.nextQuestion();
                  }else{
                    Map<String,dynamic> data ={
                      'car': ratedList[0],
                      'home': ratedList[1],
                      'room': ratedList[2],
                      'kitchen': ratedList[3],
                      'toilet': ratedList[4],
                    };
                    FirebaseFirestore.instance.collection('ratingResponse').add(data);
                    setState(() {
                      RatingBrain.reset();
                      ratedList = [];
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    });
                  }
                });
              },

            ),
          ),

        ],
      ),
    );
  }
}


