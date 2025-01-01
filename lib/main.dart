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
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  runApp(
    BlocProvider(
      create: (context) =>
          InvoiceCubit(UserRepository(api: DioConsumer(dio: Dio()))),
      child: const Onyx(),
    ),
  );
}

class Onyx extends StatelessWidget {
  const Onyx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer and Sales Management',
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    );
  }
}
