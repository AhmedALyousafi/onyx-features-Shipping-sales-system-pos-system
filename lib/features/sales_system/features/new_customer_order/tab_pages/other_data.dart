//بيانات اخرى
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Otherdata extends StatelessWidget {
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
                  child: _buildTextField('رقم المندوب'),
                ),
                SizedBox(width: 30),
                Expanded(child: _buildDropdown('رقم الممسوق')),
                SizedBox(width: 30),
                Expanded(child: _buildTextField('رقم السيارة')),
                SizedBox(width: 30),
                Expanded(child: _buildDropdown('رقم السائق')),
                SizedBox(
                  width: 30,
                ),
                Expanded(child: _buildTextField('رقم المستفيد *')),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 8),
                Expanded(child: _buildTextField('الحساب في البنك *')),
                SizedBox(width: 40),
                Expanded(child: _buildTextField('إجمالي التأمين')),
                SizedBox(width: 860),
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: DropdownButtonFormField2<String>(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffd6d6d6))),
                contentPadding: EdgeInsets.all(0)),
            iconStyleData: IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down), iconSize: 24),
            dropdownStyleData: DropdownStyleData(
              padding: EdgeInsets.zero,
            ),
            menuItemStyleData: MenuItemStyleData(padding: EdgeInsets.zero),
            hint: Text(
              textAlign: TextAlign.left,
              label,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            items: [
              DropdownMenuItem(
                child: Text("Option 1"),
                value: "1",
              ),
              DropdownMenuItem(
                child: Text("Option 2"),
                value: "2",
              ),
            ],
            onChanged: (value) {},
          ),
        ),
      ),
    );
  }
}
