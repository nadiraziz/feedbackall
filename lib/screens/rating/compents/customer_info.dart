import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback/screens/rating/compents/rate_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CustomerInfo extends StatefulWidget {
  const CustomerInfo({Key? key}) : super(key: key);
  static String id = 'customerInfo_screen';
  @override
  _CustomerInfoState createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {

  String name = "";
  String phone = '';
  String email = "";
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.amber;
    }
    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Expanded(child: Image.asset('assets/images/vivah.png', fit: BoxFit.fitWidth)),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Name *',
                ),
                onChanged: (val) => {
                  setState(() => name = val)
                },
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Email';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Enter your email?',
                  labelText: 'Email *',
                ),
                onChanged: (val) => {
                  setState(() => email = val)
                },

              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  hintText: 'Enter your mobile number',
                  labelText: 'Phone *',
                ),
                onChanged: (val) => {
                  setState(() => phone = val)
                },
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                     });
                    },
                  ),
                  SizedBox(width: 20.0,),
                  Text('Are You Interested to get updates?')
                ],
              ),
              ElevatedButton(onPressed: (){
                Map<String,dynamic> customerData ={
                  'name': name,
                  'email': email,
                  'phone': phone,
                };
                if(isChecked){
                  FirebaseFirestore.instance.collection('customerInfo').add(customerData);
                }
                if (_formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Rating(customerName: name,
                            customerEmail: email,
                            customerPhone: phone),
                    ),
                  );
                }
              },
                child: Text('Next'),
                style: TextButton.styleFrom(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
