import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Complaint {
  final String id;
  final String title;
  final String description;

  // fromJson
  Complaint.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'];

  // toJson
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
      };

  Complaint({required this.id, required this.title, required this.description});
}

final complaintsProvider =
    StateNotifierProvider<ComplaintNotifier, List<Complaint>>((ref) {
  return ComplaintNotifier(ref: ref);
});

class ComplaintNotifier extends StateNotifier<List<Complaint>> {
  ComplaintNotifier({required this.ref}) : super([]);

  final Ref ref;

  void createComplaint(String title, String description) {
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    state = [
      Complaint(id: id, title: title, description: description),
      ...state,
    ];
    _saveToSessionStorage();
  }

  void editComplaint(String id, String title, String description) {
    state = [
      for (final complaint in state)
        if (complaint.id == id)
          Complaint(id: id, title: title, description: description)
        else
          complaint,
    ];
    _saveToSessionStorage();
  }

  void deleteComplaint(String id) {
    state = state.where((complaint) => complaint.id != id).toList();
    _saveToSessionStorage();
  }

  void _saveToSessionStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final complaintsJson = jsonEncode(state.map((c) => c.toJson()).toList());
    await prefs.setString('complaints', complaintsJson);
    loadFromSessionStorage();
  }

  void loadFromSessionStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final complaintsJson = prefs.getString('complaints');
    if (complaintsJson != null) {
      final complaintsList = jsonDecode(complaintsJson) as List;
      state = complaintsList.map((json) => Complaint.fromJson(json)).toList();
    }
  }
}
