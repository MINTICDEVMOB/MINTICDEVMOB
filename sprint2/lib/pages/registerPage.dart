import 'package:flutter/material.dart';
import 'dart:io';
import "package:intl/intl.dart";
import 'package:sprint2/pages/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/User.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required String title}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre{
  masculino,
  femenino
}

class _RegisterPageState extends State<RegisterPage> {

  final _name = TextEditingController();
  final _password = TextEditingController();
  final _passwordConfirm = TextEditingController();
  final _email = TextEditingController();
  String data= "Información";
  Genre? _genre=Genre.masculino;
  String _buttonMsg = "Fecha de nacimiento";
  String _bornDate ="";

  void saveUser(User user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user));
  }

  void _onRegisterButtonClicked(){
    setState(() {

      if(_password.text == _passwordConfirm.text){
        //radioButton
        String genre = "Masculino";
        if(_genre==Genre.femenino){
          genre = "Femenino";
        }

        var user = User(_name.text, _email.text, _password.text, genre, _bornDate);
        saveUser(user);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));

      } else{
        _showMsg(context, "Las contraseñas deben ser iguales");
      }
    });

  }

  void _showSelectDate() async{
    final DateTime? newDate= await showDatePicker(
      context: context,
      initialDate: DateTime(2022, 6),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2022, 12),
      helpText: "Fecha de nacimiento",
    );
    if(newDate != null){
      setState(() {
        _bornDate = _dateConverter(newDate);
        _buttonMsg = "Fecha de nacimiento: $_bornDate";
      });
    }
  }

  String _dateConverter(DateTime newDate){
    final DateFormat formatter = DateFormat("yyyy-MM-dd");
    final String dateFormatted = formatter.format(newDate);
    return dateFormatted;
  }

  void _showMsg(BuildContext context, String msg){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(label: "Aceptar", onPressed: scaffold.hideCurrentSnackBar,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:false;
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(image: AssetImage("assets/images/hoja.png")),

                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre",
                  ),
                  keyboardType: TextInputType.text,
                ),

                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Correo electrónico",
                  ),
                  keyboardType: TextInputType.text,
                ),

                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Contraseña",
                  ),
                  keyboardType: TextInputType.text,
                ),

                const SizedBox(
                  height: 16,
                ),

                TextFormField(
                  controller: _passwordConfirm,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirme la contraseña",
                  ),
                  keyboardType: TextInputType.text,
                ),

                const SizedBox(
                  height: 16,
                ),

                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text("Masculino"),
                        leading: Radio<Genre>(
                          value: Genre.masculino,
                          groupValue: _genre,
                          onChanged: (Genre? value){
                            setState(() {
                              _genre = value;
                            });
                          },
                        ),
                      ),
                    ),

                    Expanded(
                      child: ListTile(
                        title: const Text("Femenino"),
                        leading: Radio<Genre>(
                          value: Genre.femenino,
                          groupValue: _genre,
                          onChanged: (Genre? value){
                            setState(() {
                              _genre = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),


                OutlinedButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 16, color: Colors.greenAccent
                    ),
                  ),
                  onPressed: (){
                    _showSelectDate();
                  },
                  child: Text(_buttonMsg),
                ),



                ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 16, color: Colors.green
                      ),
                    ),
                    onPressed: (){
                      _onRegisterButtonClicked();
                    },
                    child: const Text("Registrar")),

                Text(
                  data,
                  style: const TextStyle(
                      fontSize: 14, fontStyle: FontStyle.italic
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

