//انزال من
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Downloaddocument extends StatelessWidget {
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
                SizedBox(width: 8),
                Expanded(
                  child: _buildDropdown('نوع انزال الوثيقة'),
                ),
                SizedBox(width: 30),
                Expanded(child: _buildDropdown('انزال من')),
                SizedBox(width: 30),
                Expanded(child: _buildDropdown('رقم الوثيقة المرجعية')),
                SizedBox(width: 30),
                Expanded(child: _buildTextField('تاريخ الوثيقه المرجعية')),
                SizedBox(width: 30),
                Expanded(child: _buildTextField('رقم العقد*')),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                _buildExecuteButton(),
                SizedBox(width: 900),
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
            borderSide: BorderSide(color: Color(0xffd6d6d6))),
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        border: UnderlineInputBorder(),
      ),
    );
  }

  Widget _buildDropdown(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonFormField2<String>(
          decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffd6d6d6))),
              contentPadding: EdgeInsets.all(10)),
          iconStyleData: IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down), iconSize: 24),
          dropdownStyleData: DropdownStyleData(
            padding: EdgeInsets.zero,
          ),
          menuItemStyleData: MenuItemStyleData(padding: EdgeInsets.zero),
          hint: Text(
            label,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          items: [
            DropdownMenuItem(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("وثائق مراقبة"),
              ),
              value: "1",
            ),
            DropdownMenuItem(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("وثائق غير مراقبة"),
              ),
              value: "2",
            ),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }
}

Widget _buildExecuteButton() {
  return Row(
    children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.sim_card_download,
            size: 24,
          ),
          label: Text('تنفيذ'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey,
          ),
        ),
      ),
    ],
  );
}
