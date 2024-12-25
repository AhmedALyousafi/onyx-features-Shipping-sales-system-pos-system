//جدول بطاقة الائتمان
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DataTableExample12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildFirstDataTable(),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: const Padding(
              padding: EdgeInsets.only(
                  right: 30.0, left: 80, top: 10.0, bottom: 10.0),
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  children: [
                    Text(
                      '100.000',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'الاجمالي',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            height: 40,
            color: Colors.grey,
            indent: 14,
            endIndent: 14,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[200],
            ),
            child: buildExpansionTile("بيانات إضافية "),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[200],
            ),
            child: buildExpansionTile2("الأصناف"),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildFirstDataTable() {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            height: 100,
            width: 1500,
            child: DataTable(
              headingRowColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 1, 100, 181)),
              columns: [
                DataColumn(
                    label: Text('نوع البطاقة',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('مبلغ البنك',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('نسبة العمولة',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('مبلغ العمولة',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('تاريخ الأستحقاق',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('الضريبة(%)',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('مبلغ الضريبة',
                        style: TextStyle(color: Colors.white))),
                DataColumn(
                    label: Text('رقم المرجع',
                        style: TextStyle(color: Colors.white))),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('مدي',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 1, 100, 181)))),
                  DataCell(Text('100.000')),
                  DataCell(Text('10%')),
                  DataCell(Text('10.000')),
                  DataCell(Text('15/6/2024')),
                  DataCell(Text('5')),
                  DataCell(Text('5.000')),
                  DataCell(Text('123')),
                ]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildExpansionTile(String title) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(title),
          children: [
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  buildTextField('رقم الجوال'),
                  buildTextField('عنوان العميل'),
                  buildDateField('تاريخ انتهاء الطلب'),
                  buildTextField('رقم المرجع'),
                  buildTextField('عدد المرفقات'),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildExpansionTile2(String title) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Theme(
        data: ThemeData().copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(title),
          children: [
            Container(
              color: Colors.white,
              child: SizedBox(
                height: 100,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          buildDropdownField('اسم المنتج*'),
                          SizedBox(
                            height: 20,
                            width: 1000,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text('اجمالي الاصناف المضافة(0)'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, {bool isLocked = false}) {
    return Expanded(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xffd6d6d6))),
                  labelText: label,
                  labelStyle: TextStyle(
                    fontSize: 14,
                    color: Color(0xff819AA7),
                  )),
            )),
      ),
    );
  }

  Widget buildDropdownField(String label) {
    return Expanded(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: DropdownButtonFormField2<String>(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffd6d6d6))),
                contentPadding: EdgeInsets.all(0)),
            iconStyleData: IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              iconEnabledColor: Color(0xff819AA7),
            ),
            dropdownStyleData: DropdownStyleData(
              padding: EdgeInsets.zero,
            ),
            menuItemStyleData: MenuItemStyleData(padding: EdgeInsets.zero),
            hint: Text(
              textAlign: TextAlign.left,
              label,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff819AA7),
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

  Widget buildDateField(String label) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
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
}
