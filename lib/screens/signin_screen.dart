import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task6_3lir/screens/singup_screen.dart';
import '../widgets/textfield.dart';
import 'custom_paint.dart';
class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  List<double> elev=[0.5,0.5];
  _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;

    }    _formKey.currentState.save();

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
             SizedBox(height: 200,),
              Text('Login',style: Theme.of(context).textTheme.title,),
              SizedBox(height: 10,),
              Text(' Please sign in to continue.',style:
              TextStyle(color:Colors.grey[600],fontWeight: FontWeight.w600,fontSize: 16),),
              SizedBox(height: 50,),

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    textField(
                      appear: false,
                        onSave: (value){
                          setState(() {
                            _email=value;
                            print(_email);
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
                        iconColor: elev[0]==0.5?Colors.black38:Colors.black,
                        icon:FontAwesomeIcons.envelope,
                        elev: elev[0],
                        function: (){
                          setState(() {
                            elev[1]=0.5;
                            elev[0]=4.0;
                          });
                        }
                    ),
                    SizedBox(height: 10),
                    textField(
                        appear: true,
                        onSave: (value){
                          setState(() {
                            _password=value;
                            print(_password);
                          });
                        },
                        validate: (value) {
                          if (value.isEmpty || value.toString().length < 8) {
                            return 'Password Required';
                          } else
                            return null;
                        },
                        context: context,
                        key: TextInputType.number,
                        obscure: true,
                        title: 'PASSWORD',
                        iconColor: elev[1]==0.5?Colors.black38:Colors.black,
                        icon: FontAwesomeIcons.lock,
                        elev: elev[1],
                        function:(){
                          setState(() {
                            elev[0]=0.5;
                            elev[1]=4.0;
                          });
                        }
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
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
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('LOGIN  ',
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
                    Text('Don\'t have an account? ',
                      style: TextStyle(color: Colors.black38,fontWeight: FontWeight.w600,fontSize: 14),),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>SingUpScreen()));
                      },
                      child: Text('Sign UP',
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



