import 'package:alfalakyapp/Appcubit/cubit.dart';
import 'package:alfalakyapp/components/components.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';

class AddDataScreen extends StatelessWidget
{

  var formKey = GlobalKey<FormState>();


  var img1 = TextEditingController();
  var img1Win = TextEditingController();

  var img2= TextEditingController();
  var img2Win= TextEditingController();

  var txt1= TextEditingController();
  var txt2= TextEditingController();

  var txt1Color= TextEditingController();
  var txt2Color= TextEditingController();
  var pointsColor= TextEditingController();

  var difPoints= TextEditingController();

  var item1Sound= TextEditingController();
  var item1WinSound= TextEditingController();
  var item2Sound= TextEditingController();
  var item2WinSound= TextEditingController();



  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('إضافة عنصر جديد'),
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children:
                  [
                myTextFormField(
                  controller: img1,
                  keyboardType: TextInputType.none,
                  labelText: 'الصورة الأولي',
                  prefixIcon: Icon(Icons.image),
                  validator: (val)
                  {
                    if(val!.isEmpty)
                    {
                      return 'برجاء اختيار الصورة';
                    }
                  },
                  context: context,
                  onTap: ()
                  {
                    getImage(img1);
                  }
                ),

                    SizedBox(height: 10.0,),

                    myTextFormField(
                        controller: img1Win,
                        keyboardType: TextInputType.none,
                        labelText: 'صورة الفوز الأولي',
                        prefixIcon: Icon(Icons.image),
                        validator: (val)
                        {
                          if(val!.isEmpty)
                          {
                            return 'برجاء اختيار الصورة';
                          }
                        },
                        context: context,
                        onTap: ()
                        {
                          getImage(img1Win);
                        }
                    ),

                    SizedBox(height: 10.0,),

                    myTextFormField(
                        controller: img2,
                        keyboardType: TextInputType.none,
                        labelText: 'الصورة الثانية',
                        prefixIcon: Icon(Icons.image),
                        validator: (val)
                        {
                          if(val!.isEmpty)
                          {
                            return 'برجاء اختيار الصورة';
                          }
                        },
                        context: context,
                        onTap: ()
                        {
                          getImage(img2);
                        }
                    ),

                    SizedBox(height: 10.0,),

                    myTextFormField(
                        controller: img2Win,
                        keyboardType: TextInputType.none,
                        labelText: 'صورة الفوز الثانية',
                        prefixIcon: Icon(Icons.image),
                        validator: (val)
                        {
                          if(val!.isEmpty)
                          {
                            return 'برجاء اختيار الصورة';
                          }
                        },
                        context: context,
                        onTap: ()
                        {
                          getImage(img2Win);
                        }
                    ),

                    SizedBox(height: 10.0,),

                    myTextFormField(
                        controller: txt1,
                        keyboardType: TextInputType.name,
                        labelText: 'النص الأول',
                        prefixIcon: Icon(Icons.textsms_outlined),
                        validator: (val)
                        {
                          // if(val!.isEmpty)
                          // {
                          //   return 'برجاء اختيار الصورة';
                          // }
                        },
                        context: context,

                    ),

                    SizedBox(height: 10.0,),

                    myTextFormField(
                        controller: txt2,
                        keyboardType: TextInputType.name,
                        labelText: 'النص الثاني',
                        prefixIcon: Icon(Icons.textsms_outlined),
                        validator: (val)
                        {
                          // if(val!.isEmpty)
                          // {
                          //   return 'برجاء اختيار الصورة';
                          // }
                        },
                        context: context,

                    ),

                    SizedBox(height: 10.0,),

                    myTextFormField(
                        controller: txt1Color,
                        keyboardType: TextInputType.none,
                        labelText: 'لون النص الأول',
                        prefixIcon: Icon(Icons.color_lens_outlined),
                        validator: (val)
                        {
                          // if(val!.isEmpty)
                          // {
                          //   return 'برجاء اختيار الصورة';
                          // }
                        },
                        context: context,
                        onTap: ()
                        {
                          getColor(txt1Color, context);
                        }
                    ),

                    SizedBox(height: 10.0,),

                    myTextFormField(
                        controller: txt2Color,
                        keyboardType: TextInputType.none,
                        labelText: 'لون النص الثاني',
                        prefixIcon: Icon(Icons.color_lens_outlined),
                        validator: (val)
                        {
                          // if(val!.isEmpty)
                          // {
                          //   return 'برجاء اختيار الصورة';
                          // }
                        },
                        context: context,
                        onTap: ()
                        {
                          getColor(txt2Color, context);

                        }
                    ),

                    SizedBox(height: 10.0,),

                    myTextFormField(
                        controller: pointsColor,
                        keyboardType: TextInputType.none,
                        labelText: 'لون النقاط',
                        prefixIcon: Icon(Icons.color_lens_outlined),
                        validator: (val)
                        {
                          // if(val!.isEmpty)
                          // {
                          //   return 'برجاء اختيار الصورة';
                          // }
                        },
                        context: context,
                        onTap: ()
                        {
                          getColor(pointsColor, context);

                        }
                    ),

                    SizedBox(height: 10.0,),

                    myTextFormField(
                        controller: difPoints,
                        keyboardType: TextInputType.number,
                        labelText: 'عدد النقاط الفارقة بين الفائز',
                        prefixIcon: Icon(Icons.numbers),
                        validator: (val)
                        {
                          if(val!.isEmpty)
                          {
                            return 'برجاء اختيار عدد النقاط الفارقة';
                          }
                        },
                        context: context,

                    ),
                    SizedBox(height: 10.0,),

                    myTextFormField(
                        controller: item1Sound,
                        keyboardType: TextInputType.none,
                        labelText: 'صوت لمس العنصر الأول',
                        prefixIcon: Icon(Icons.audiotrack_outlined),
                        validator: (val)
                        {
                          // if(val!.isEmpty)
                          // {
                          //   return 'برجاء اختيار الصورة';
                          // }
                        },
                        context: context,
                        onTap: ()
                        {
                          getfile(item1Sound);

                        }
                    ),
                    SizedBox(height: 10.0,),

                    myTextFormField(
                        controller: item1WinSound,
                        keyboardType: TextInputType.none,
                        labelText: 'صوت فوز العنصر الأول',
                        prefixIcon: Icon(Icons.audiotrack_outlined),
                        validator: (val)
                        {
                          // if(val!.isEmpty)
                          // {
                          //   return 'برجاء اختيار الصورة';
                          // }
                        },
                        context: context,
                        onTap: ()
                        {
                          getfile(item1WinSound);

                        }
                    ),
                    SizedBox(height: 10.0,),

                    myTextFormField(
                        controller: item2Sound,
                        keyboardType: TextInputType.none,
                        labelText: 'صوت لمس العنصر الثاني',
                        prefixIcon: Icon(Icons.audiotrack_outlined),
                        validator: (val)
                        {
                          // if(val!.isEmpty)
                          // {
                          //   return 'برجاء اختيار الصورة';
                          // }
                        },
                        context: context,
                        onTap: ()
                        {
                          getfile(item2Sound);

                        }
                    ),
                    SizedBox(height: 10.0,),

                    myTextFormField(
                        controller: item2WinSound,
                        keyboardType: TextInputType.none,
                        labelText: 'صوت فوز العنصر الثاني',
                        prefixIcon: Icon(Icons.audiotrack_outlined),
                        validator: (val)
                        {
                          // if(val!.isEmpty)
                          // {
                          //   return 'برجاء اختيار الصورة';
                          // }
                        },
                        context: context,
                        onTap: ()
                        {
                          getfile(item2WinSound);

                        }
                    ),


                    SizedBox(height: 20.0,),

                    myButton(text: 'حفظ', function: ()
                    {
                      if(formKey.currentState!.validate())
                      {
                        AppCubit.get(context).InsertIntoDB(
                          img1: img1.text,
                          img1Win: img1Win.text,
                          img2: img2.text,
                          img2Win: img2Win.text,
                          txt1: txt1.text ?? ' ',
                          txt2: txt2.text?? ' ',
                          txt1Color:txt1Color.text.isNotEmpty ? txt1Color.text: '4294967295',
                          txt2Color:txt2Color.text.isNotEmpty ? txt2Color.text: '4294967295',
                          pointsColor:pointsColor.text.isNotEmpty ? pointsColor.text: '4294967295',
                          difPoints: int.parse(difPoints.text),
                          item1Sound:item1Sound.text,
                          item1WinSound:item1WinSound.text,
                          item2Sound:item2Sound.text,
                          item2WinSound:item2WinSound.text,
                        );
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم اضافة عنصر جديد بنجاح')));
                        Navigator.of(context).pop();
                      }

                    })

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getImage(TextEditingController controller)async
  {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if(picker != null)
    {
      controller.text = image!.path;

    }
    else
    {
      controller.text = "";
    }
  }

  void getColor(TextEditingController controller , context)
  {


      // create some values
      Color pickerColor = Color(0xff443a49);
      Color currentColor = Color(0xff443a49);

// ValueChanged<Color> callback
      void changeColor(Color color)
      {
       // setState(() => pickerColor = color);
      }

// raise the [showDialog] widget
      showDialog(
        context: context,
        builder: (context) =>
        AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            // child: ColorPicker(
            //   pickerColor: pickerColor,
            //   onColorChanged: (co)
            //   {
            //     currentColor = co;
            //   },
            // ),
            // Use Material color picker:
            //
            child: MaterialPicker(
              pickerColor: pickerColor,
                onColorChanged: (co)
                {
                  currentColor = co;
                },
              //showLabel: true, // only on portrait mode
            ),
            //
            // Use Block color picker:
            //
            // child: BlockPicker(
            //   pickerColor: currentColor,
            //   onColorChanged: changeColor,
            // ),
            //
            // child: MultipleChoiceBlockPicker(
            //   pickerColors: currentColors,
            //   onColorsChanged: changeColors,
            // ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: ()
              {
                controller.text = currentColor.value.toString();
                //setState(() => currentColor = pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),

    );
  }
}

void getfile(TextEditingController controller)async
{
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.audio
  );

  if(result != null)
  {
    controller.text = result.files.single.path!;
  }
  else
  {
    controller.text = "";
  }

}
