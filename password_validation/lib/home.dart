import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool char = false;
  bool upperCase = false;
  bool lowerCase = false;
  int specialChars = 0;
  bool specialChar = false;

  void charsLength(String value) {
    if (value.trim().length >= 8) {
      setState(() {
        char = true;
      });
    } else if (value.length < 8) {
      setState(() {
        char = false;
      });
    }
  }

  void checkUpperCase(String value) {
    if (value.trim().contains(RegExp(r'[A-Z]'))) {
      setState(() {
        upperCase = true;
      });
    } else {
      setState(() {
        upperCase = false;
      });
    }
  }

  void checkLowerCase(String value) {
    if (value.trim().contains(RegExp(r'[a-z]'))) {
      setState(() {
        lowerCase = true;
      });
    } else {
      setState(() {
        lowerCase = false;
      });
    }
  }

  void checkSpecialChar(String value) {
    if (value.isEmpty) {
      setState(() {
        specialChars = 0;
      });
    }
    value.split('').forEach((element) {
      if (element.contains(RegExp(r'^[\\()<>{}|^+$&+!*#%?_=@.,.:;/]'))) {
        setState(() {
          specialChars++;
        });
      } else {
        setState(() {
          specialChars = 0;
        });
      }
    });
    setState(() {
      if (specialChars > 0) {
        specialChar = true;
      } else {
        specialChar = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onChanged: (value) {
                charsLength(value);
                checkUpperCase(value);
                checkLowerCase(value);
                checkSpecialChar(value);
                // print(value.length);
              },
            ),
            Text(
              "8 character minumum",
              style: TextStyle(color: char ? Colors.green : Colors.red),
            ),
            Text(
              "One UpperCase Character",
              style: TextStyle(color: upperCase ? Colors.green : Colors.red),
            ),
            Text(
              "One LowerCase Character",
              style: TextStyle(color: lowerCase ? Colors.green : Colors.red),
            ),
            Text(
              "One Special Character",
              style: TextStyle(color: specialChar ? Colors.green : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
