import 'dart:io';

import 'package:alfalakyapp/Appcubit/cubit.dart';
import 'package:alfalakyapp/Appcubit/states.dart';
import 'package:alfalakyapp/Modules/addData.dart';
import 'package:alfalakyapp/Modules/challenge.dart';
import 'package:alfalakyapp/components/components.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowDataScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {


    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state)
      {

      },
      builder: (context, state)
      {
        var data = AppCubit.get(context).koraData;

        return Scaffold(
          appBar: AppBar(title: Text('العناصر المتاحة'),),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: ()
            {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddDataScreen(),));
            },
          ),
          body: ListView.separated(
            itemBuilder: (context, index) => itemBuilder(data[index],context,index),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: data.length,
          ),
        );
      }
    );
  }


  Widget itemBuilder(Map model , context , int index)
  {

    var cubit = AppCubit.get(context);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: ()
        {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)
          {
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeRight,
              DeviceOrientation.landscapeLeft,
            ]);
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
            cubit.diff = model['difPoints'];

           return ChallengeScreen(index);
          })).then((value)
          {
            cubit.score1=0;
            cubit.score2=0;
            cubit.hiddenScore1=0;
            cubit.hiddenScore2=0;

            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeRight,
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.portraitUp,
              DeviceOrientation.portraitDown,
            ]);

            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);  // to re-show bars

          });
        },
        child: Dismissible(
          key: UniqueKey(),
          onDismissed: (direction)
          {
            AppCubit.get(context).DeleteData(id: model['id']);

            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Deleted Sucessfully !')));

          },
          child: Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),

            child: Stack(
              children:
              [


                Row(
                  children:
                  [
                    Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0),bottomLeft: Radius.circular(25.0)),
                          child: Image.file(
                              File(model['img1']),
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: 180.0,
                          ),
                        ),
                    ),
                    SizedBox(width: 3,),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(25.0),bottomRight: Radius.circular(25.0)),
                        child: Image.file(
                          File(model['img2']),
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 180.0,
                        ),
                      ),
                    ),
                  ],
                ),///images

                Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(25.0),
                      ),

                    )),///dark

                Center(
                  child: CircleAvatar(
                    child: Text('${model['difPoints']}'),
                    radius: 25.0,
                    backgroundColor: Colors.white,
                  ),
                ),///diff

                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children:
                      [
                        Expanded(child: Center(child: Text('${model['txt1']}',style: TextStyle(fontSize: 20.0,color: Color(int.tryParse(model['txt1Color']??4294967295)!))))) ,
                        SizedBox(width: 60.0, ),
                        Expanded(child: Center(child: Text('${model['txt2']}',style: TextStyle(fontSize: 20.0,color: Color(int.tryParse(model['txt2Color']??4294967295)!)),))),
                      ],
                    ),
                  ),
                )///text

              ],
            ),
          ),
        ),
      ),
    );
  }
}
