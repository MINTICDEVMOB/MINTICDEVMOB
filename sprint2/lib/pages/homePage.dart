import 'package:flutter/material.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(image: AssetImage("assets/images/nature.jpg")),
              /*Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.lightGreenAccent
                        //Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child:
                    const Image(image: AssetImage("assets/images/bosque.png")),
                ),
              ),*/

              const SizedBox(
                height: 20,
              ),


              Text(
                "La cascada más alta de Colombia\n" "LA CHORRERA",
                style: const TextStyle(
                    fontSize: 20, fontStyle: FontStyle.italic
                ),
                  textAlign : TextAlign.center
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Ciudad: Bogotá - Choachí\n "
                    "\nDepartamento: Cundinamarca\n "
                    "\nTemperatura: En promedio 18°C\n "
                "\nDescripción: A pesar que no es tan grande, es igualmente hermosa y vale la pena conocer. Se puede pasar atrás de ella por detrás de la cortina de agua de 40 metros",
                style: const TextStyle(
                    fontSize: 14, fontStyle: FontStyle.normal
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Colors.green
                    //Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child:
                  const Image(image: AssetImage("assets/images/bosque.png")),
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


/*
const Image(
                image: AssetImage("assets/images/nature.png",
              ),

child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(
                  image: AssetImage("assets/images/gaia.png"),
                ),
              ],
            ),
 */