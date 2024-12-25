//انزال من
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:onyx/core/utils/responsive_utils.dart';

class TapInsurance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AdaptiveLayout(
        desktopLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: buildDateField('التاريخ'),
                    ),
                    const SizedBox(width: 30),
                    Expanded(child: _buildDropdown('نوع التأمين')),
                    SizedBox(width: 30),
                    Expanded(child: _buildDropdown('شركة التامين')),
                    SizedBox(width: 30),
                    Expanded(child: _buildDropdown('العملة')),
                    SizedBox(width: 30),
                    Expanded(child: _buildTextField('سعر التحويل')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _buildTextField('اخر موعد للشحن')),
                    SizedBox(width: 30),
                    Expanded(child: _buildTextField('مبلغ التأمين')),
                    SizedBox(width: 30),
                    Expanded(child: _buildTextField('مبلغ قسط التأمين')),
                    SizedBox(width: 30),
                    Expanded(
                        child: _buildTextField('شروط التأمين Text Area Field')),
                  ],
                ),
              ],
            ),
          ),
        ),
        tabletLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: buildDateField('التاريخ'),
                    ),
                    Expanded(child: _buildDropdown('نوع التأمين')),
                    Expanded(child: _buildDropdown('شركة التامين')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _buildTextField('اخر موعد للشحن')),
                    Expanded(child: _buildDropdown('العملة')),
                    Expanded(child: _buildTextField('سعر التحويل')),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _buildTextField('مبلغ قسط التأمين')),
                    Expanded(
                        child: _buildTextField('شروط التأمين Text Area Field')),
                  ],
                ),
              ],
            ),
          ),
        ),
        mobileLayout: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildTextField('سعر التحويل'),
                _buildDropdown('العملة'),
                _buildDropdown('شركة التامين'),
                _buildDropdown('نوع التأمين'),
                buildDateField('التاريخ'),
                _buildTextField('شروط التأمين Text Area Field'),
                _buildTextField('مبلغ قسط التأمين'),
                _buildTextField('مبلغ التأمين'),
                _buildTextField('اخر موعد للشحن')
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffd6d6d6))),
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey),
        border: UnderlineInputBorder(),
      ),
    );
  }

  Widget _buildDropdown(String label) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DropdownButtonFormField2<String>(
        decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffd6d6d6))),
            contentPadding: EdgeInsets.all(10)),
        iconStyleData:
            IconStyleData(icon: Icon(Icons.keyboard_arrow_down), iconSize: 24),
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
    );
  }
}

Widget buildDateField(String label) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: TextField(
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffd6d6d6))),
            labelText: label,
            labelStyle: TextStyle(
              fontSize: 14,
              color: Color(0xff819AA7),
            ),
            suffixIcon: Icon(
              Icons.calendar_month,
              color: Color(0xff819AA7),
            ),
            border: UnderlineInputBorder(),
          ),
          keyboardType: TextInputType.datetime,
        ),
      ),
    ),
  );
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
