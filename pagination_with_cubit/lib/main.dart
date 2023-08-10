import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_cubit/pagination_with_cubit.dart';
import 'package:pagination_with_cubit/viewModels/cubits/posts/posts_cubit.dart';
import 'package:pagination_with_cubit/viewModels/database/local/cache_helper.dart';
import 'package:pagination_with_cubit/viewModels/database/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  runApp(BlocProvider(
    create: (context) => PostsCubit(),
    child: const PaginationWithCubit(),
  ));
}
