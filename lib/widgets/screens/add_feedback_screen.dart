import 'package:creative_portsaid/main.dart';
import 'package:flutter/material.dart';

class AddFeedbackScreen extends StatefulWidget {
  const AddFeedbackScreen({super.key});

  @override
  State<AddFeedbackScreen> createState() => _AddFeedbackScreenState();
}

class _AddFeedbackScreenState extends State<AddFeedbackScreen> {
  final List<String> _menuItems = [
    "Suggestions",
    "Complaint",
    "Session Feedback"
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  bool _isContactIncluded = false;

  String _selectedFeedbackType = 'Session Feedback';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Feedback'),
      ),
      body: Container(
        color: kBlueColor.withOpacity(0.5),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (value) {
                      setState(() {
                        _isContactIncluded = value!;
                      });
                    },
                    value: _isContactIncluded,
                  ),
                  const Text("Add Contact Information"),
                ],
              ),
              if (_isContactIncluded)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomeTextField(
                          txt: "Your Name", controller: nameController),
                      const SizedBox(height: 8),
                      CustomeTextField(
                          txt: "Email", controller: emailController),
                      const SizedBox(height: 8),
                      CustomeTextField(
                          txt: "Phone Number",
                          controller: phoneNumberController),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  iconDisabledColor: kGrayColor,
                  value: _selectedFeedbackType,
                  items: [
                    for (int i = 0; i < _menuItems.length; i++)
                      DropdownMenuItem(
                        value: _menuItems[i],
                        child: Text(_menuItems[i]),
                      ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedFeedbackType = value.toString();
                    });
                  },
                  hint: const Text('Select Feedback Type'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    CustomeTextField(txt: "Title", controller: titleController),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomeTextField(
                  txt: "Description",
                  controller: descriptionController,
                  maxLines: 7,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({
    super.key,
    required this.txt,
    required this.controller,
    this.maxLines = 1,
  });

  final String txt;
  final TextEditingController controller;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      style: TextStyle(color: kBlueColorScheme.primary),
      controller: controller,
      decoration: InputDecoration(
        hintText: txt,
        filled: true,
        fillColor: kGrayColor,
        focusColor: kGrayColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: kGrayColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 20.0,
        ),
      ),
    );
  }
}
