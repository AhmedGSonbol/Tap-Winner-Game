import 'dart:io';
import 'dart:math';

import 'package:alfalakyapp/Appcubit/cubit.dart';
import 'package:alfalakyapp/Appcubit/states.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChallengeScreen extends StatelessWidget
{
  int itemIndex;

  ChallengeScreen(this.itemIndex);

  final conController = ConfettiController();

  final player = AudioPlayer();

  @override
  Widget build(BuildContext context)
  {

    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {

        var cubit =  AppCubit.get(context);

        var model = cubit.koraData[itemIndex];


        return Stack(
          alignment: Alignment.topCenter,
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              body:  Stack(
                children:
                [
                    Positioned.fill(

                    child: Row(
                      children:
                      [

                          SizedBox(
                            height: double.infinity,

                            width: (cubit.hiddenScore1 - cubit.hiddenScore2).abs() < cubit.diff
                                ?
                            (MediaQuery.of(context).size.width) * (cubit.hiddenScore1 > cubit.hiddenScore2 ? 0.5 + (0.5 * (cubit.hiddenScore1-cubit.hiddenScore2) / cubit.diff) : 0.5 - (0.5 * (cubit.hiddenScore2 - cubit.hiddenScore1) / cubit.diff))-2
                                :
                            (MediaQuery.of(context).size.width) * (cubit.hiddenScore1 > cubit.hiddenScore2 ? 0.5 + (0.5 * (cubit.hiddenScore1-cubit.hiddenScore2) / cubit.diff) : 0.5 - (0.5 * (cubit.hiddenScore2 - cubit.hiddenScore1) / cubit.diff)),

                            //color: Colors.red,
                            child: Image.file(
                              File(model['img1']),
                              fit: BoxFit.fitHeight,

                            ),
                          ),
                        //
                        if((cubit.hiddenScore1 - cubit.hiddenScore2).abs() < cubit.diff)
                         const SizedBox(width: 4,),


                          SizedBox(
                            height: double.infinity,
                            width: (cubit.hiddenScore2 - cubit.hiddenScore1).abs() < cubit.diff
                                ?
                            (MediaQuery.of(context).size.width) * ((cubit.hiddenScore1 > cubit.hiddenScore2 ? 0.5 - (0.5 * (cubit.hiddenScore1-cubit.hiddenScore2) / cubit.diff) : 0.5 + (0.5 * (cubit.hiddenScore2 - cubit.hiddenScore1) / cubit.diff)))-2
                                :
                            (MediaQuery.of(context).size.width) * ((cubit.hiddenScore1 > cubit.hiddenScore2 ? 0.5 - (0.5 * (cubit.hiddenScore1-cubit.hiddenScore2) / cubit.diff) : 0.5 + (0.5 * (cubit.hiddenScore2 - cubit.hiddenScore1) / cubit.diff))),

                          //color: Colors.red,
                            child: Image.file(
                              File(model['img2']),
                              fit: BoxFit.fitHeight,

                            ),
                          ),
                      ],
                    ),
                  ),




                  Positioned(child: Text(cubit.score1.toString(),style: TextStyle(fontSize: 80,color: Color(int.tryParse(model['pointsColor']??4294967295)!)),),
                    top: 20,
                    left: 20,
                  ),

                  Positioned(child: Text(cubit.score2.toString(),style: TextStyle(fontSize: 80,color: Color(int.tryParse(model['pointsColor']??4294967295)!)),),
                    top: 20,
                    right: 20,
                  ),



                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(model['txt1'].toString(),
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(
                                int.tryParse(
                                    model['txt1Color']??4294967295)!),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),

                  ),

                  Positioned.fill(child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        model['txt2'].toString(),
                        style: TextStyle(
                            fontSize: 30,
                            color: Color(
                                int.tryParse(model['txt2Color']??4294967295)!),
                          fontWeight: FontWeight.bold
                        ),
                      ),
                  ),
                    right: 20,
                  ),

                  Row(
                    children:
                    [
                      Expanded(
                        child: InkWell(
                          onTap: ()
                          {
                            //player.stop();
                            player.seek(Duration(seconds: 0));

                            if(model['item1Sound'] != null)
                            {
                              player.play(UrlSource(model['item1Sound']));
                            }
                            cubit.changeScrore(true);
                          },
                          child: Container(),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: ()
                          {
                            //player.stop();
                            player.seek(Duration(seconds: 0));

                            if(model['item2Sound'] != null)
                            {
                              player.play(UrlSource(model['item2Sound']));

                            }
                            cubit.changeScrore(false);
                          },
                          child: Container(),
                        ),
                      )
                    ],
                  ),

                  (()
                  {
                    if(cubit.hiddenScore1 > cubit.hiddenScore2 && (cubit.hiddenScore1 - cubit.hiddenScore2) == cubit.diff )
                    {
                      //conController.duration = Duration(seconds: 2);
                      conController.play();
                      //player.stop();
                      player.seek(Duration(seconds: 0));

                      if(model['item1WinSound'] != null)
                      {
                        player.play(UrlSource(model['item1WinSound']));
                      }
                      return InkWell(
                        onTap: ()
                        {
                          cubit.showFinalImage();
                          conController.stop();
                          //player.stop();

                        },
                        child: Image.file(
                          File(model['img1Win']),
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      );

                    }
                    else  if(cubit.hiddenScore2 > cubit.hiddenScore1 && (cubit.hiddenScore2 - cubit.hiddenScore1)  == cubit.diff)
                    {
                      conController.play();
                      //player.stop();
                      player.seek(Duration(seconds: 0));

                      if(model['item2WinSound'] != null)
                      {
                        player.play(UrlSource(model['item2WinSound']));
                      }
                      return InkWell(
                        onTap: ()
                        {
                          cubit.showFinalImage();
                          conController.stop();
                         //player.stop();

                        },
                        child: Image.file(
                          File(model['img2Win']),
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      );

                    }
                    else
                    {
                      return Container();
                    }
                  }())

                ],
              ),///images
            ),

            ConfettiWidget(
              confettiController: conController,
            blastDirection: pi/2,
            )
          ],
        );

      },

    );
  }
}
