import 'package:feedback/screens/rating/compents/rate_screen.dart';
import 'package:flutter/material.dart';



class CustomerInfo extends StatefulWidget {
  const CustomerInfo({Key? key}) : super(key: key);
  static String id = 'customerInfo_screen';
  @override
  _CustomerInfoState createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {

  String name = "";
  int phone = 0;
  String email = "";
  bool isChecked = false;

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
      return Colors.deepPurple;
    }
    return new Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Expanded(child: Image.asset('assets/images/vivah.png', fit: BoxFit.fitWidth)),
            TextFormField(
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
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter your mobile number',
                labelText: 'Phone *',
              ),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Rating(),
                ),
              );
            },
              child: Text('Next'),
              style: TextButton.styleFrom(),
            )
          ],
        ),
      ),
    );
  }
}
