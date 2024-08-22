import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/size_config.dart';
import 'package:rider_app/values/styles.dart';
import 'package:rider_app/widgets/primary_btn.dart';

class ComplaintScreen extends StatefulWidget {
  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  String? _selectedIssue;
  TextEditingController _complaintController = TextEditingController();
  final List<Map<String, String>> _reviews = [
    {
      "title": "Vehicle Arrived late",
      "description": "The driver arrived late and I missed my trip",
      "time": "09:24"
    },
    {
      "title": "Vehicle Arrived late",
      "description": "The driver arrived late and I missed my trip",
      "time": "09:24"
    },
    {
      "title": "Vehicle Arrived late",
      "description": "The driver arrived late and I missed my trip",
      "time": "09:24"
    },
  ];

  void _submitComplaint() {
    if (_complaintController.text.length >= 10 && _selectedIssue != null) {
      // Submit complaint logic here
      print("Complaint submitted: ${_complaintController.text}");
      // Clear the form after submission
      setState(() {
        _complaintController.clear();
        _selectedIssue = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complaint Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _selectedIssue,
              decoration: InputDecoration(
                labelText: "Select Issue",
                border: OutlineInputBorder(),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedIssue = newValue;
                });
              },
              items: [
                DropdownMenuItem(
                  value: "Vehicle not clean",
                  child: Text("Vehicle not clean"),
                ),
                DropdownMenuItem(
                  value: "Vehicle Arrived late",
                  child: Text("Vehicle Arrived late"),
                ),
                // Add more issues here if needed
                DropdownMenuItem(
                    child: Text("Vehicle has mechanical fault"),
                    value: "Vehicle has mechanical fault"),
              ],
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _complaintController,
              decoration: InputDecoration(
                labelText: "Write your complaint here",
                hintText: "(minimum 10 characters)",
                border: OutlineInputBorder(),
              ),
              minLines: 1,
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            PrimaryBtn(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.close),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16.0),
                              SvgPicture.asset(
                                'assets/icons/success.svg',
                              ),
                              SizedBox(height: 20.0),
                              Text("Send successful",
                                  style: Styles.largeSecondary),
                              SizedBox(height: 10.0),
                              Text(
                                "Your complain has been send successful",
                                style: Styles.smallSecondary,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 20.0),
                              PrimaryBtn(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                borderRadius: BorderRadius.circular(8.0),
                                btnText: 'Back Home',
                                color: AppColors.primaryColor,
                              ),
                            ],
                          ),
                        );
                      });
                },
                btnText: 'Submit',
                color: AppColors.primaryColor),
            const SizedBox(height: 20.0),
            const Text("Recent Reviews",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: _reviews.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColorLight),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_reviews[index]["title"]!,
                                  style: Styles.mediumSecondary
                                      .copyWith(fontSize: 14)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.edit_outlined),
                                  // delete icon
                                  Icon(
                                    Icons.delete_outlined,
                                    color: AppColors.error,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(_reviews[index]["description"]!,
                                  style: const TextStyle(
                                      color: AppColors.fieldGray,
                                      fontSize: 12)),
                              //09:24
                              Text(
                                _reviews[index]["time"]!,
                                style: Styles.smallSecondary
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
