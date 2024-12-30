//انزال من
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:onyx/core/theme/app_colors.dart';

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
                Expanded(
                  child: _buildDropdown('نوع انزال الوثيقة'),
                ),
                Expanded(child: _buildDropdown('انزال من')),
                Expanded(child: _buildDropdown('رقم الوثيقة المرجعية')),
                Expanded(child: _buildTextField('تاريخ الوثيقه المرجعية')),
                Expanded(child: _buildTextField('رقم العقد*')),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildExecuteButton(),
                const SizedBox(width: 900),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.griid)),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        border: const UnderlineInputBorder(),
      ),
    );
  }

  Widget _buildDropdown(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButtonFormField2<String>(
          decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.griid)),
              contentPadding: EdgeInsets.all(10)),
          iconStyleData: const IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down), iconSize: 24),
          dropdownStyleData: const DropdownStyleData(
            padding: EdgeInsets.zero,
          ),
          menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.zero),
          hint: Text(
            label,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          items: const[
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
          icon: const Icon(
            Icons.sim_card_download,
            size: 24,
          ),
          label: const Text('تنفيذ'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey,
          ),
        ),
      ),
    ],
  );
}
