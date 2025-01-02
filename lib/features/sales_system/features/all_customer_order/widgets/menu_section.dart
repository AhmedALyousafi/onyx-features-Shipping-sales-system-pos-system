import 'package:onyx/core/cubit/cubit.dart';
import 'package:onyx/core/repositories/user_repository.dart';
import 'package:onyx/features/Pos-System/features/pos/presentation/pos_screen.dart';
import 'package:onyx/features/Shipping-System/features/shipping/presentation/pages/home/drawer_widget.dart';

import 'package:onyx/features/sales_system/features/all_customer_order/view/custome_request.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/widgets/menu_Item.dart'; // تأكد من استيراد Flutter Bloc

// تأكد من استيراد الكيوبت الخاص بك

class MenuSection extends StatefulWidget {
  final String title;
  final IconData icon;
  final bool isExpanded;
  final List<String>? subItems;

  const MenuSection({
    super.key,
    required this.title,
    required this.icon,
    this.isExpanded = false,
    this.subItems,
  });

  @override
  State<MenuSection> createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  void _navigateToPage(BuildContext context, Widget page, Cubit cubit) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => cubit, // توفير الكيوبت للصفحة
        child: MaterialApp(
          title: 'POS System',
          theme: ThemeData(
            primaryColor: const Color(0xFF094F90),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF094F90),
            ),
            fontFamily: 'Readex Pro',
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: page,
        ),
      ),
    ));
    Scaffold.of(context).openEndDrawer(); // الإبقاء على endDrawer مفتوحًا
  }

  void _navigateToPage2(BuildContext context, Widget page, Cubit cubit) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => cubit, // توفير الكيوبت للصفحة
        child: MaterialApp(
          title: 'POS System',
          theme: ThemeData(
            primaryColor: const Color(0xFF094F90),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF094F90),
            ),
            fontFamily: 'Readex Pro',
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: CustomeRequest1(),
        ),
      ),
    ));
    Scaffold.of(context).openEndDrawer(); // الإبقاء على endDrawer مفتوحًا
  }

  void _navigateToPage1(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => MaterialApp(
        title: 'POS System',
        theme: ThemeData(
          primaryColor: const Color(0xFF094F90),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF094F90),
          ),
          fontFamily: 'Readex Pro',
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: POSScreen(),
      ),
    ));
    Scaffold.of(context).openEndDrawer(); // الإبقاء على endDrawer مفتوحًا
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuItem(
          title: widget.title,
          icon: widget.icon,
          isActive: _isExpanded,
          onTap: widget.subItems != null
              ? () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                }
              : null,
        ),
        if (_isExpanded && widget.subItems != null)
          ...widget.subItems!.map(
            (subItem) => Padding(
              padding: const EdgeInsets.only(right: 24),
              child: MenuItem(
                title: subItem,
                icon: Icons.circle_outlined,
                onTap: () {
                  if (subItem == 'نظام طلبات العملاء') {
                    _navigateToPage(context, CustomeRequest(), InvoiceCubit());
                  } else if (subItem == 'نظام البيع المباشر') {
                    _navigateToPage1(context, POSScreen());
                  } else if (subItem == 'نظام الشحن') {
                    _navigateToPage2(
                        context, CustomeRequest1(), InvoiceCubit());
                  }
                },
              ),
            ),
          ),
      ],
    );
  }
}
