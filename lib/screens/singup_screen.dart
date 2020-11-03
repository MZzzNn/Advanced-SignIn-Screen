import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/signin_screen.dart';
import '../widgets/textfield.dart';
class SingUpScreen extends StatefulWidget {
  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _userName;
  String _email;
  String _password;
  String _idePassword;
  List<double> elev=[0.5,0.5,0.5,0.5];
  _submitForm() {
    if (!_formKey.currentState.validate()) {
      return ;
    }
    _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60,),
                IconButton(icon: Icon(Icons.arrow_back,size: 25,),
                    onPressed:()=> Navigator.of(context).pop()),
                SizedBox(height: 60,),
                Text('Creat Account',style: Theme.of(context).textTheme.title.copyWith(fontSize: 35),),
                SizedBox(height: 40,),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      textField(
                          appear: false,
                          onSave: (value){
                            setState(() {
                              _userName=value;
                            });
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'UserName Required';
                            } else
                              return null;
                          },
                          context: context,
                          key: TextInputType.emailAddress,
                          obscure: false,
                          title: 'Full Name',
                          iconColor: elev[0]==0.5?Colors.black38:Colors.black,
                          icon:FontAwesomeIcons.user,
                          elev: elev[0],
                          function: (){
                            setState(() {
                              elev[1]=0.5;
                              elev[2]=0.5;
                              elev[3]=0.5;
                              elev[0]=4.0;
                            });
                          }
                      ),
                      SizedBox(height: 5),
                      textField(
                          appear: false,

                          onSave: (value){
                            setState(() {
                              _email=value;
                            });
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'EMAIL Required';
                            } else
                              return null;
                          },
                          context: context,
                          key: TextInputType.emailAddress,
                          obscure: false,
                          title: 'EMAIL',
                          iconColor: elev[1]==0.5?Colors.black38:Colors.black,
                          icon:FontAwesomeIcons.envelope,
                          elev: elev[1],
                          function: (){
                            setState(() {
                              elev[0]=0.5;
                              elev[2]=0.5;
                              elev[3]=0.5;
                              elev[1]=4.0;
                            });
                          }
                      ),
                      SizedBox(height: 5),
                      textField(
                          appear: false,

                          onSave: (value){
                            setState(() {
                              _password=value;
                            });
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'PASSWORD Required';
                            } else
                              return null;
                          },
                          context: context,
                          key: TextInputType.number,
                          obscure: true,
                          title: 'PASSWORD',
                          iconColor: elev[2]==0.5?Colors.black38:Colors.black,
                          icon:FontAwesomeIcons.lock,
                          elev: elev[2],
                          function: (){
                            setState(() {
                              elev[0]=0.5;
                              elev[1]=0.5;
                              elev[3]=0.5;
                              elev[2]=4.0;
                            });
                          }
                      ),
                      SizedBox(height: 5),
                      textField(
                          appear: false,
                          onSave: (value){
                            setState(() {
                              _idePassword=value;
                            });
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'PASSWORD Required';
                            } else if(value !=_password)
                              return 'The Password isn\'t identical';
                          },
                          context: context,
                          key: TextInputType.number,
                          obscure: true,
                          title: 'Confirm PASSWORD',
                          iconColor: elev[3]==0.5?Colors.black38:Colors.black,
                          icon: FontAwesomeIcons.lock,
                          elev: elev[3],
                          function:(){
                            setState(() {
                              elev[0]=0.5;
                              elev[1]=0.5;
                              elev[2]=0.5;
                              elev[3]=4.0;
                            });
                          }
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: _submitForm,
                    child: Container(
                        height: 50,
                        width: 130,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Theme.of(context).primaryColor.withOpacity(0.7), Theme.of(context).accentColor],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Sing UP  ',
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 15),),
                            Icon( Icons.arrow_forward,color: Colors.white,size: 22,)
                          ],
                        )
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ',
                        style: TextStyle(color: Colors.black38,fontWeight: FontWeight.w600,fontSize: 14),),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SignInScreen()));

                        },
                        child: Text('Sign IN',
                          style: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.w600,fontSize: 14),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35,)
              ],
            ),
          ),
        )
    );
  }
}



