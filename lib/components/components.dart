import 'package:flutter/Material.dart';

Widget myTextFormField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  required String labelText,
  required Icon prefixIcon,
  required String? Function(String? x) validator,
  required context,

  void Function(String x)?  onChanged,
  void Function()?  onTap,
  void Function(String x)?  onFieldSubmitted,
  // void Function() SuffixOnPressed  = (){},
  bool isPassword = false,
  // Widget? suffixIcon,
  IconButton? suffixButtonIcon ,

})
{
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: isPassword,
    decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixButtonIcon,
        // IconButton(
        //   icon: suffixIcon!,
        //   onPressed: SuffixOnPressed,
        // ),
        border: OutlineInputBorder()
    ),
    onTap: onTap,
    validator: validator,
    onFieldSubmitted: onFieldSubmitted,
    onChanged: onChanged,
  );
}

Widget myButton({

  required String text,
  required void Function() function,

  double radius = 0.0,
  bool isUpperCase = true,
  Color textColor = Colors.white,
  double width = double.infinity,
  Color color = Colors.blue,
}) {
  return Container(
    width: width,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius)
    ),

    child: MaterialButton(
      height: 50.0,
      onPressed: function,
      child: Text(
        isUpperCase ?  text.toUpperCase() : text,
        style: TextStyle(color: textColor),),
    ),
  );
}

Widget myDivider() => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20.0),
  child: Container(width: double.infinity , height: 2.0 ,color: Colors.grey.withOpacity(0.5),),
);
