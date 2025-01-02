import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onyx/core/api/dio_consumer.dart';
import 'package:onyx/core/cache/cache_helper.dart';
import 'package:onyx/core/cubit/cubit.dart';
import 'package:onyx/core/repositories/user_repository.dart';
import 'package:onyx/features/login/screnn/login.dart';
import 'package:onyx/features/sales_system/features/all_customer_order/view/custome_request.dart';



void main() {
  runApp(const Onyx());
}

class Onyx extends StatelessWidget {
  const Onyx({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoiceCubit(),
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
        home: SignInScreen(),
      ),
    );
  }
}
