import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_cubit/viewModels/cubits/home/home_cubit.dart';
import 'package:pagination_with_cubit/viewModels/cubits/posts/posts_cubit.dart';
import 'package:pagination_with_cubit/views/screens/home_screen.dart';

class PaginationWithCubit extends StatelessWidget {
  const PaginationWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    var postsCubit = PostsCubit.get(context);
    return BlocProvider(
      create: (context) => HomeCubit(postsCubit),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
