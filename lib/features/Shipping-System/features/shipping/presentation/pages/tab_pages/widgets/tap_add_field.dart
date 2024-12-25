import 'package:onyx/core/utils/responsive.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class Addfield extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AdaptiveLayout(
          desktopLayout: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildDropdown('حقل اضافي 1'),
                  ),
                  Expanded(child: _buildDropdown('حقل اضافي 2')),
                  Expanded(child: _buildDropdown('حقل اضافي 3')),
                  Expanded(child: _buildDropdown('حقل اضافي 4')),
                  Expanded(child: _buildDropdown('حقل اضافي 5')),
                ],
              ),
              Row(
                children: [
                  Expanded(child: _buildDropdown('حقل اضافي 6')),
                  Expanded(child: _buildDropdown('حقل اضافي 7')),
                  Expanded(child: _buildDropdown('حقل اضافي 8')),
                  Expanded(child: _buildDropdown('حقل اضافي 9')),
                  Expanded(child: _buildDropdown('حقل اضافي 10')),
                ],
              ),
            ],
          ),
          tabletLayout: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('حقل اضافي 1'),
                  ),
                  Expanded(child: _buildDropdown('حقل اضافي 2')),
                  Expanded(child: _buildDropdown('حقل اضافي 3')),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('حقل اضافي 4'),
                  ),
                  Expanded(child: _buildDropdown('حقل اضافي 5')),
                  Expanded(child: _buildTextField('حقل اضافي 6')),
                ],
              ),
              Row(
                children: [
                  Expanded(child: _buildTextField('حقل اضافي 7')),
                  Expanded(child: _buildTextField('حقل اضافي 8')),
                  Expanded(child: _buildTextField('حقل اضافي 9')),
                  Expanded(child: _buildTextField('حقل اضافي 10')),
                ],
              ),
            ],
          ),
          mobileLayout: Column(
            children: [
              _buildTextField('حقل اضافي 1'),
              _buildDropdown('حقل اضافي 2'),
              _buildDropdown('حقل اضافي 3'),
              _buildDropdown('حقل اضافي 4'),
              _buildDropdown('حقل اضافي 5'),
              _buildDropdown('حقل اضافي 6'),
              _buildDropdown('حقل اضافي 7'),
              _buildDropdown('حقل اضافي 8'),
              _buildDropdown('حقل اضافي 9'),
              _buildDropdown('حقل اضافي 10'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffd6d6d6))),
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          border: UnderlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
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
    );
  }
}
