import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_bill/constants.dart';
import 'medical_form.dart';
import 'globals.dart' as globals;

class HomePage extends StatefulWidget {
  // final List bills = [];
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void deleteBill(int index) {
    setState(() {
      globals.bills.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Bills', style: kTextStyle),
        backgroundColor: kPrimaryColor,
      ),
      body: globals.bills.isEmpty
          ? const Center(
              child: Text('No Uploaded Bills', style: kInputTextStyle),
            )
          : ListView.builder(
              itemCount: globals.bills.length,
              itemBuilder: (context, index) {
                // return Card(
                //   margin: const EdgeInsets.all(20),
                //   elevation: 20,
                //   shape: const RoundedRectangleBorder(
                //       side: BorderSide(color: Colors.green, width: 3),
                //       borderRadius: BorderRadius.all(Radius.circular(15))),
                //   shadowColor: Colors.green[100],
                //   child: Column(
                //     // mainAxisSize: MainAxisSize.min,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: <Widget>[
                //       Column(
                //         children: const [
                //           Text("patientName: "),
                //           Text("patientAddress: "),
                //           Text("hospitalName: "),
                //           Text("dateOfService: "),
                //           Text("billAmount: "),
                //         ],
                //       ),
                //       // ListTile(
                //       //   leading: const Icon(Icons.person,
                //       //       color: Colors.cyan, size: 45),
                //       //   title: Text(globals.bills[index]["patientName"]!),
                //       //   // subtitle: Text(globals.bills[index]["billAmount"]!),
                //       // ),
                //       Column(
                //         children: [
                //           Text(globals.bills[index]["patientName"]!),
                //           Text(globals.bills[index]["patientAddress"]!),
                //           Text(globals.bills[index]["hospitalName"]!),
                //           Text(globals.bills[index]["dateOfService"]!),
                //           Text(globals.bills[index]["billAmount"]!),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
                return Card(
                  margin: const EdgeInsets.all(20),
                  elevation: 20,
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(color: kPrimaryColor, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  shadowColor: Colors.black,
                  color: Colors.grey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Patient Name: ',
                                style: kInputTextStyle,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Patient Address: ',
                                style: kInputTextStyle,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Hospital Name: ',
                                style: kInputTextStyle,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Date of Service: ',
                                style: kInputTextStyle,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Bill Amount: ',
                                style: kInputTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.tight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                globals.bills[index]["patientName"]!,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: kInputTextStyle,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                globals.bills[index]["patientAddress"]!,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: kInputTextStyle,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                globals.bills[index]["hospitalName"]!,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: kInputTextStyle,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                    globals.bills[index]["dateOfService"]!)),
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: kInputTextStyle,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                globals.bills[index]["billAmount"]!,
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: kInputTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MedicalBillForm()),
          );
        },
        tooltip: 'Add Bill',
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
