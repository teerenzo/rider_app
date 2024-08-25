import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rider_app/providers/complaintProvider.dart';
import 'package:rider_app/values/colors.dart';
import 'package:rider_app/values/size_config.dart';
import 'package:rider_app/values/styles.dart';
import 'package:rider_app/widgets/global_layout.dart';
import 'package:rider_app/widgets/primary_btn.dart';

class ComplaintScreen extends ConsumerStatefulWidget {
  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends ConsumerState<ComplaintScreen> {
  String? _selectedIssue;
  TextEditingController _complaintController = TextEditingController();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void initState() {
    ref.read(complaintsProvider.notifier).loadFromSessionStorage();
    super.initState();
  }

  void _submitComplaint() {
    if (_complaintController.text.length >= 10 && _selectedIssue != null) {
      final complaints = ref.watch(complaintsProvider);
      ref
          .read(complaintsProvider.notifier)
          .createComplaint(_selectedIssue!, _complaintController.text);

      setState(() {
        _complaintController.clear();
        _selectedIssue = null;
      });
    }
  }

  void _showComplaintDialog({Complaint? complaint, int? index}) {
    if (complaint != null) {
      _titleController.text = complaint.title;
      _descriptionController.text = complaint.description;
    } else {
      _titleController.clear();
      _descriptionController.clear();
    }

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(complaint == null ? 'New Complaint' : 'Edit Complaint'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  if (complaint == null) {
                    ref.read(complaintsProvider.notifier).editComplaint(
                        complaint!.id,
                        _titleController.text,
                        _descriptionController.text);
                  } else {
                    ref.read(complaintsProvider.notifier).editComplaint(
                        complaint.id,
                        _titleController.text,
                        _descriptionController.text);
                  }
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          );
        });
  }

  _showDeleteDialog({required String id}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Delete Complaint'),
            content: Text('Are you sure you want to delete this complaint?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  ref.read(complaintsProvider.notifier).deleteComplaint(id);
                  Navigator.pop(context);
                },
                child: Text('Delete'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final complaints = ref.watch(complaintsProvider);
    return GlobalLayout(
      child: Container(
        height: SizeConfig.screenH! * 0.8,
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
                  _submitComplaint();
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
            const SizedBox(height: 40.0),
            const Text("Recent Reviews",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: complaints.length,
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
                              Text(complaints[index].title,
                                  style: Styles.mediumSecondary
                                      .copyWith(fontSize: 14)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        _showComplaintDialog(
                                            complaint: complaints[index],
                                            index: index);
                                      },
                                      child: Icon(Icons.edit_outlined)),
                                  // delete icon
                                  GestureDetector(
                                    onTap: () {
                                      _showDeleteDialog(
                                          id: complaints[index].id);
                                    },
                                    child: Icon(
                                      Icons.delete_outlined,
                                      color: AppColors.error,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(complaints[index].description,
                                  style: const TextStyle(
                                      color: AppColors.fieldGray,
                                      fontSize: 12)),
                              //09:24
                              Text(
                                "09:24",
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
