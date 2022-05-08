import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card_page.dart';


import 'model/person_model.dart';


class Formpage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body:Container(
          color: Colors.white,
          child: Column(
            children: [
              AppBarCont(),
              _Body(),


            ],
          ),
        ),

    );
  }
}
class AppBarCont extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 160,
      child: CustomPaint(
        painter: _Topper(),
        child: Row(children: [
          SizedBox(
            width: 20),
           Icon(Icons.view_headline_rounded,
           color: Colors.white70
             ,
           size: 24.0,),
          SizedBox(width: 20,),
          Container(
            child: Text("Formulario de Datos",style: TextStyle(fontSize: 25),),
          )

        ],),
      ),
    );
  }


}


class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Middle(),
        _Bottom(),
      ],
    );
  }
}

class _Middle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1.2,
      child: Container(
        height: 300,
        width: 320,
        margin: const EdgeInsets.symmetric(vertical: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(
                  0,
                  3,
                ),
              )
            ]),
        child: _InBox(),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
          color: Colors.blue,
          child: const Text(
            "Confirmar Datos",
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => _Createalert(context),
            );
          },
        ),

    );
  }
}



class _InBox extends StatefulWidget {
  @override
  State<_InBox> createState() => _InBoxState();
}

class _InBoxState extends State<_InBox> {
   late TextEditingController _name;
   late TextEditingController _number;
  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _name.addListener(() {
      setState(() {
        Yo.name=_name.text;
      });
    });

    _number = TextEditingController();
    _number.addListener(() {
      setState(() {
      Yo.number=_number.text;
      });
    });
  }

  @override
  void dispose() {
    _name.dispose();
    _number.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration:  InputDecoration(
                labelText: 'Nombre ',
              ),
              controller: _name,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Telefono',
              ),
              controller: _number,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          _Date(),
          const SizedBox(
            height: 15,
          ),
          _Genre(),
        ],
      ),
    );
  }
}

class _Date extends StatefulWidget {
  @override
  State<_Date> createState() => _DateState();
}

class _DateState extends State<_Date> {


  late TextEditingController _controller;
  DateTime selectedDate = DateTime.now();

  @override
  void initState(){
    super.initState();
    _controller=TextEditingController();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();

  }

  void selectDate (BuildContext context) async {
    final value = await showDatePicker(
        context:  context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2099));
    if (value != null && value!=selectedDate) {
      setState(() {
        selectedDate= value;
        _controller.text=selectedDate.day.toString()+"/"+selectedDate.month.toString()+"/"+selectedDate.year.toString();
        Yo.date=_controller.text;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Row (children: [
      SizedBox(width: 40),
      Container(
        child: RaisedButton(
          color:Colors.deepOrange,
          child: const Icon (Icons.calendar_today),
          onPressed: ()=> selectDate(context),
        ),

      ),
      SizedBox(width: 20),
      Container(
          child: Text((() {
            if(_controller==null){
              return "cumpleaños desconocido";
            }else{
              return _controller.text;
            }



          })()))


    ],);
  }
}

class _Genre extends StatefulWidget {
  @override
  State<_Genre> createState() => _GenreState();
}

class _GenreState extends State<_Genre> {
  String _genre = "";


    @override
    Widget build(BuildContext context) {
      return SizedBox(
        child: Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Text("Género"),
            const SizedBox(
              width: 60,
            ),
            Column(
              children: [
                Text("Otro"),
                Radio(
                  groupValue: _genre,
                  value: "Otro",
                  onChanged: (v) {
                    setState(() {
                      _genre="$v";

                      Yo.gender="${_genre}";
                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                Text("F"),
                Radio(
                  groupValue: _genre,
                  value: "Femenino",
                  onChanged: (v) {
                    setState(() {
                      _genre="$v";
                      Yo.gender=_genre;

                    });
                  },
                ),
              ],
            ),
            Column(
              children: [
                Text("M"),
                Radio(
                  groupValue: _genre,
                  value: "Masculino",
                  onChanged: (v) {
                    setState(() {
                      _genre="$v";
                      Yo.gender=_genre;

                    });
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  AlertDialog _Createalert(BuildContext context) =>
      AlertDialog(
        title: const Text('Tus Datos'),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
        ListTile(
          title: Text('Género'),
          subtitle: Text(Yo.gender),
        ),
            ListTile(
              title: Text('Número'),
              subtitle: Text(Yo.number),
            ),
            ListTile(
              title: Text('Nombre'),
              subtitle: Text(Yo.name),
            ),
            ListTile(
              title: Text('Fecha de Nacimiento'),
              subtitle: Text(Yo.date),
            ),
        ],
        ),
        actions: [
          FlatButton(
            onPressed: () {
              var route = MaterialPageRoute(
                builder: (context) => CardPage(),
              );
              Navigator.of(context).push(route);
            },
            child: const Text("Confirmar"),
            textColor: Colors.blue,
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancelar"),
            textColor: Colors.blue,
          ),
        ],
      );



    
class _Topper extends CustomPainter {
  @override
  void paint( Canvas canvas, Size size){
    final paint = Paint();

    paint
      ..color=Colors.deepOrange
      ..style= PaintingStyle.fill;

    final path = Path();
    path
      ..moveTo(size.width,0)
      ..lineTo(size.width,120)
      ..lineTo(size.width*0.5,120*1.2)
      ..lineTo(0, 120)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint (covariant CustomPainter oldDelegate){
    return true;
  }
}



