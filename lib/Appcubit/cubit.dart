import 'package:alfalakyapp/Appcubit/states.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';



class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);


  int score1 = 0;
  int score2 = 0;
  int hiddenScore1 = 0;
  int hiddenScore2 = 0;
  late int diff;


  void changeScrore(bool isScore1)
  {
    if(isScore1)
    {
      score1++;
      hiddenScore1++;
    }
    else
    {
      score2++;
      hiddenScore2++;
    }
    

    emit(AppChangeScoreStates());
  }

  void showFinalImage()
  {
      hiddenScore1 = 0;
      hiddenScore2 = 0;

      emit(AppChangeScoreStates());

  }




  Database? db;

  void CreateDB() {
    openDatabase('mainDB.db', version: 1,
        onCreate: (db, version)
        {
      print('Database created');
      db.execute('create table kora(id integer primary key autoincrement,'
          'img1 TEXT,'
          'img1Win TEXT,'
          'img2 TEXT,'
          'img2Win TEXT,'
          'txt1 varchar(150),'
          'txt2 varchar(150),'
          'txt1Color varchar(50),'
          'txt2Color varchar(50),'
          'pointsColor varchar(50),'
          'difPoints integer,'
          'item1Sound TEXT,'
          'item1WinSound TEXT,'
          'item2Sound TEXT,'
          'item2WinSound TEXT'
          ' )'
      ).then((value)
      {
        print('Tables Created');
      }).catchError((err)
      {
        print('Error when create tables ${err.toString()}');
      });
    },
        onOpen: (db)
    {
      getData(db).then((value)
      {
        print('DB Opened and returned with data !');
      });

    }).then((value)
    {
      db = value;
      emit(AppCreateDBStates());
    });
  }

  Future InsertIntoDB({
    required String img1,
    required String img1Win,

    required String img2,
    required String img2Win,

    required String txt1,
    required String txt2,

    required String txt1Color,
    required String txt2Color,
    required String pointsColor,

    required int difPoints,

    required String item1Sound,
    required String item1WinSound,
    required String item2Sound,
    required String item2WinSound,

  }) async {
    return await db!.transaction((txn) {
      txn.rawInsert(
              'INSERT INTO kora(img1 , img1Win, img2, img2Win , txt1 , txt2, txt1Color, txt2Color, pointsColor, difPoints, item1Sound, item1WinSound, item2Sound, item2WinSound) '
                  'VALUES("$img1","$img1Win","$img2","$img2Win","$txt1","$txt2","$txt1Color","$txt2Color","$pointsColor","$difPoints","$item1Sound","$item1WinSound","$item2Sound","$item2WinSound")')
          .then((value)
      {
        print('$value Inserted successfully');
        emit(AppInsertDBStates());

        getData(db);

      }).catchError((err) {
        print('error when inserting data ');
      });
      return Future(() => null);
    });
  }

  List<Map> koraData = [];

  Future<List<Map>?> getData(db)async
  {

    koraData = [];

    emit(AppGetLoadDBStates());

   await db!.rawQuery('SELECT * FROM kora').then((value)
    {
      emit(AppGetDBStates());
     return koraData.addAll(value);


    });
  }


  // UpdateData({
  //   @required String? status,
  //   @required int? id,
  // }) async {
  //   db!.rawUpdate(
  //     'UPDATE tasks set status = ? WHERE id = ?',
  //     ['$status', '$id'],
  //   ).then((value)
  //   {
  //     getData(db);
  //     emit(AppUpdateDBStates());
  //   });
  // }

  DeleteData({
    @required int? id,
  }) async {
    db!.rawUpdate(
      'DELETE FROM kora WHERE id = ?',
      ['$id'],
    ).then((value)
    {
      getData(db).then((value)
      {
        emit(AppDeleteDBStates());
      });

    });
  }

  // bool isbottomsheetshown = false;
  //
  // void chageIndex(int index) {
  //   current_index = index;
  //   emit(AppChangeBottomNavBarState());
  // }
  //
  // void changebottomsheetState(bool statee)
  // {
  //   isbottomsheetshown = statee;
  //   emit(AppchangebottomsheetState());
  // }
  Future<void> deleteTable() async
  {

   databaseFactory.deleteDatabase(await getDatabasesPath() + '/alfalaky.db');
}
}
