//بيانات اضافية
import 'package:flutter/material.dart';
import 'package:onyx/core/responsive/home/dropdown.dart';
import 'package:onyx/core/theme/app_colors.dart';

class Additionaldata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildTextField('رقم مركز التكلفة'),
                ),
                Expanded(child: Dropdown('', lable: 'نص رقم مخازن',)),
                Expanded(child: Dropdown('', lable: 'دليل فرعي3',)),
                Expanded(child: _buildTextField('دليل فرعي4')),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
                  width: 360,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: _buildTextField('دليل فرعي5'),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                SizedBox(width: 300, child: _buildTextField('دليل فرعي6')),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.griid)),
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        border: UnderlineInputBorder(),
      ),
    );
  }


}
