import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'constants.dart';
import 'summary.dart';

class MedicalBillForm extends StatefulWidget {
  @override
  _MedicalBillFormState createState() => _MedicalBillFormState();
}

class _MedicalBillFormState extends State<MedicalBillForm> {
  final _formKey = GlobalKey<FormState>();
  String _patientName = "";
  String _patientAddress = "";
  String _hospitalName = "";
  DateTime _dateOfService = DateTime.now();
  double _billAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Bill Form'),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 150.0, 20.0, 150.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Patient Name',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a patient name.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _patientName = value!;
                    },
                    textAlignVertical: TextAlignVertical.bottom,
                    style: kInputTextStyle,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Patient Address'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a patient address.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _patientAddress = value!;
                    },
                    textAlignVertical: TextAlignVertical.bottom,
                    style: kInputTextStyle,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Hospital Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a hospital name.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _hospitalName = value!;
                    },
                    textAlignVertical: TextAlignVertical.bottom,
                    style: kInputTextStyle,
                  ),
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Date of Service'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a date of service.';
                      }
                      return null;
                    },
                    onTap: () async {
                      final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2021),
                          lastDate: DateTime.now());
                      if (date != null) {
                        setState(() {
                          _dateOfService = date;
                        });
                      }
                    },
                    readOnly: true,
                    controller: TextEditingController(
                        text: _dateOfService == null
                            ? ''
                            : DateFormat('MM-dd-yyyy').format(_dateOfService)),
                    textAlignVertical: TextAlignVertical.bottom,
                    style: kInputTextStyle,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Bill Amount'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a bill amount.';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _billAmount = double.parse(value!);
                    },
                    textAlignVertical: TextAlignVertical.bottom,
                    style: kInputTextStyle,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Save the medical bill data to a database or file
                          // and navigate to the summary page.
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MedicalBillSummary(
                                      patientName: _patientName,
                                      patientAddress: _patientAddress,
                                      hospitalName: _hospitalName,
                                      dateOfService: _dateOfService,
                                      billAmount: _billAmount,
                                    )),
                          );
                        }
                      },
                      style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all(const Size(293, 51)),
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor),
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
      ),
    );
  }
}
