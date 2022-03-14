import 'package:flutter/material.dart';
//import 'package:path/path.dart';

Widget defultBoutton({
  double width=5.0,
  required Color background,
  required Function function,
  required String text,
  bool isUpperCase=true,//paramrtars
})=> Container(
    width: width,
    color:background,
    child: MaterialButton(
      onPressed:function(),
      child: Text(
        isUpperCase?text.toUpperCase():text.toLowerCase(),
        style:TextStyle(color: Colors.white,
        ),

      ),
    )
);


Widget defaultFormField({
  //Parameter
  required TextEditingController controller,
  required TextInputType keyboardType,
  Function ?onChanged,
  Function ?onSubmit,
  Function ?onTab,
  bool isPassword=false,
  Function ?validate,
  required String label,
  required IconData prefix,
  IconData?suffix,
  Function?suffixPressed,
  bool isClickable=true,

})=>TextFormField(
  controller: controller,
  keyboardType: keyboardType,
  obscureText: isPassword,
  enabled: isClickable,
    onFieldSubmitted:(s){
     onSubmit!(s);
  },
  onChanged: (s){
    onChanged!(s);
  },
  onTap: (){
    onTab!();
  },
  validator: (s){
    validate!(s);
  },
  decoration: InputDecoration(
    labelText: label,
    prefixIcon:Icon(prefix,),
    suffixIcon: suffix !=null
        ?IconButton(
      onPressed: (){
        // suffixPressed!();
      },
      icon: Icon(suffix),
    )
        :null,
  ),
);
// Widget buildTaskItem(Map model,context){
//   return Dismissible(
//     key: Key(model['id'].toString()),
//     child: Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Row(
//         children: [
//           CircleAvatar(
//             radius: 40.0,
//             child: Text('${model['time']}'),
//           ),
//           SizedBox(width: 15.0,),
//           Expanded(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   '${model['title']}',
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.w700,
//                   ),),
//                 Text(
//                   '${model['date']}',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     color: Colors.grey,
//                   ),),
//               ],
//             ),
//           ),
//           SizedBox(width: 10.0,),
//           IconButton(
//             color: Colors.green,
//             onPressed: (){
//               NewsCubit.get(context).updateData(status: 'done', id: model['id']);
//             },
//             icon:Icon(Icons.check_circle,
//             ),
//           ),
//           IconButton(
//             color: Colors.grey,
//             onPressed: (){
//               NewsCubit.get(context).updateData(status: 'archive', id: model['id']);
//             },
//             icon:Icon(Icons.archive_outlined,
//             ),
//           ),
//
//         ],
//       ),
//     ),
//     onDismissed: (direction){
//       AppCubit.get(context).deleteData(id: model['id'],);
//     },
//   );
// }