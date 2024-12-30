//بطاقة الائتمان
import 'package:onyx/features/sales_system/features/new_customer_order/tab_pages/credit_Card_Table.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
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
                  child: _buildDropdown('نوع الحركة البنكية *'),
                ),
                Expanded(child: _buildTextField('اسم البنك*')),
                Expanded(child: _buildTextField('اسم البطاقة*')),
                Expanded(child: _buildDropdown('المبلغ البنكي*')),
                _buildExecuteButton(),
              ],
            ),
            const SizedBox(height: 16),
            DataTableExample12(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        border: const UnderlineInputBorder(),
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
            decoration: const InputDecoration(contentPadding: EdgeInsets.all(10)),
            iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down), iconSize: 24),
            hint: Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            items: const[
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

Widget _buildExecuteButton() {
  return const Row(
    children: [
      Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          children: [
            Icon(
              Icons.add_box,
              size: 40,
              color: Colors.green,
            ),
            Icon(
              Icons.restart_alt_outlined,
              size: 40,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    ],
  );
}
