

import 'package:flutter/material.dart';

Widget defualtButton({
  double width=double.infinity,
  double height=40.0,
  Color color=Colors.blue,
  double radius=10.0,
  required VoidCallback function,
  required String text,

})=>Container(
  width: width,
  height: height,
  child: MaterialButton(
    child: Text(
      text,
      style:TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold
      ),
    ),
    onPressed: function,

  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: color,
  ),
);

/*         TextButton  */
Widget defualtTextButton({
  Color textColor=Colors.blue,
  bool isBold=false,
  required String text,
  required VoidCallback function,
})=> TextButton(
  onPressed: function,
  child: Text(
      text,
    style: TextStyle(
      color: textColor,
      fontWeight: !isBold ? FontWeight.normal:FontWeight.bold
    ),
  ),);


/*         TextField  */

Widget defualtTextField({
  required TextEditingController controller,
  required TextInputType type,
  required FormFieldValidator validate ,
  required String lable,
  required Function()  onTap,
  bool enableClick =true,
  Color color=Colors.blue,
  double radius=0.0,
   IconData? prefix,
   IconData? sufix,


})=>Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: color,
  ),
  child:   TextFormField(
  controller: controller,
  keyboardType: type,
  //controller
  decoration: InputDecoration(
  labelText: lable,
  border: OutlineInputBorder(),
  prefixIcon:Icon(
    prefix,
  )
  ),

  validator: validate,
   onTap:onTap,
    enabled: enableClick,


  ),
);

Widget defualtTaskItem(Map model)=> Padding(
  padding: const EdgeInsets.all(10.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 35,
        child: Text('${model['time']}'),
      ),
      SizedBox(
        width: 10,
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${model['title']}',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
          SizedBox(
            height: 5,
          ),
          Text('${model['date']}', style: TextStyle(color: Colors.grey),),
        ],
      )
    ],
  ),
);

