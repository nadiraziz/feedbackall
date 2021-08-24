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
  List<dynamic?> ratedList = [];
  final NameRated = TextEditingController();
  final Phone = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/vivah4.jpg'),fit: BoxFit.fill)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 200.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(211, 211, 211, 90),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  // offset: const Offset(
                  //   2.0,
                  //   3.0,
                  // ),
                  blurRadius: 3.0,
                  spreadRadius: 1.0,
                )]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Image.asset('assets/images/vivahblack.png', fit: BoxFit.fitWidth, )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Text(RatingBrain.getQuestionText(),textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 35.0,color: Colors.black87, fontWeight: FontWeight.w400),),
                  ),
                  RatingBar.builder(
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
                              'name':NameRated.text,
                              "phone": Phone.text,

                          };
                        FirebaseFirestore.instance.collection('ratingwithuser').add(data);
                        RatingBrain.reset();
                        ratedList = [];
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WelcomeScreen()),
                        );
                      }
                    });
                  },

                  ),
                  SizedBox(height: 30.0)

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




class TextEnquiry extends StatefulWidget {


  const TextEnquiry({Key? key}) : super(key: key);

  @override
  _TextEnquiryState createState() => _TextEnquiryState();
}

class _TextEnquiryState extends State<TextEnquiry> {
  String? Name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[

    ]
    );
  }
}
