import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx/core/cubit/cubit.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/view/custome_request.dart';

void main() {
  runApp(const Onyx());
}

class Onyx extends StatelessWidget {
  const Onyx({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InvoiceCubit>(
          create: (context) => InvoiceCubit(),
        ),
        BlocProvider<InvoiceCubit>(
          create: (context) => InvoiceCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Customer and Sales Management',
        debugShowCheckedModeBanner: false,
        home: CustomeRequest(),
      ),
    );
  }
}
