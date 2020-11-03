import 'package:flutter/material.dart';

Widget textField({double height=40,bool appear, Function validate,Function onSave,BuildContext context,var key ,bool obscure,String title, Color iconColor, IconData icon, double elev,Function function}){
  return Card(
    elevation: elev,
    shadowColor: Colors.blue[900],
    child:  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 9,
              child: TextFormField(
                style: Theme.of(context).textTheme.title.copyWith(fontSize: 15),
                validator: validate,
                onSaved: onSave ,
                keyboardType: key,
                obscureText: obscure,
                onTap: function,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical:10,horizontal:12 ),
                  prefixIcon:  Icon(icon,color: iconColor,size:22,),
                  labelText: title ,
                  errorStyle:  TextStyle(fontSize: 10),
                  labelStyle: TextStyle(color: Colors.black38,fontSize: 13),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none,color: Colors.white),),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder:  OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none,color: Colors.white),),
                  focusedBorder:  OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none,color: Colors.white),),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none,color: Colors.white),),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none,color: Colors.white),),
                ),
              ),
            ),
            appear==true?Expanded(
              flex: 2,
                child: InkWell(
                  onTap: (){},
                  child: Text('FORGOT',
                    style: TextStyle(color: elev ==0.5?Theme.of(context).primaryColor:Theme.of(context).accentColor,
                        fontSize: 11,fontWeight: FontWeight.w600),),
                )):Container(),
          ],
        ),
      ),
    ),
  );
}