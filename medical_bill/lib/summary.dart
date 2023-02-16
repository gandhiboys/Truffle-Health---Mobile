import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constants.dart';
import 'globals.dart' as globals;
import 'homepage.dart';

class MedicalBillSummary extends StatelessWidget {
  final patientName;
  final patientAddress;
  final hospitalName;
  final dateOfService;
  final billAmount;

  const MedicalBillSummary({
    Key? key,
    required this.patientName,
    required this.patientAddress,
    required this.hospitalName,
    required this.dateOfService,
    required this.billAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        title: const Text(
          'Summary Page',
          style: kTextStyle,
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Summary of the bill',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(patientName, style: kInputTextStyle),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(patientAddress, style: kInputTextStyle),
                ),
                ListTile(
                  leading: const Icon(Icons.local_hospital),
                  title: Text(hospitalName, style: kInputTextStyle),
                ),
                ListTile(
                  leading: const Icon(Icons.date_range),
                  title: Text(DateFormat.yMMMd().format(dateOfService),
                      style: kInputTextStyle),
                ),
                ListTile(
                  leading: const Icon(Icons.attach_money),
                  title: Text('$billAmount', style: kInputTextStyle),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(293, 51)),
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      foregroundColor: MaterialStateProperty.all(
                        const Color(0xFFFFFFFF),
                      ),
                    ),
                    child: const Text(
                      'Edit',
                      style: kButtonTextStyle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: TextButton(
                    onPressed: () {
                      globals.bills.add({
                        "patientName": patientName.toString(),
                        "patientAddress": patientAddress.toString(),
                        "hospitalName": hospitalName.toString(),
                        "dateOfService": dateOfService.toString(),
                        "billAmount": billAmount.toString()
                      });

                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(293, 51)),
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      foregroundColor: MaterialStateProperty.all(
                        const Color(0xFFFFFFFF),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: kButtonTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
