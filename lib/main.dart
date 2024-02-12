import 'package:alfalakyapp/Appcubit/cubit.dart';
import 'package:alfalakyapp/Classes/bloc_observer.dart';
import 'package:alfalakyapp/Modules/addData.dart';
import 'package:alfalakyapp/Modules/showData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()
{
  Bloc.observer = MyBlocObserver();

  runApp( MyApp());
}

class MyApp extends StatelessWidget
{


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(create: (context) => AppCubit()..CreateDB(),
  child:
      
      MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowDataScreen(),
    )
    );
  }
}

