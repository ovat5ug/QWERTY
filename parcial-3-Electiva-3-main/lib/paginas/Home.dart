import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parcial3/paginas/Description.dart';
import 'package:transition/transition.dart';

// import 'package:cached_network_image/cached_network_image.dart'; Las imagenes de la API no son compatibles con Flutter :(

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  //API:
  var API =
      "https://api.giphy.com/v1/gifs/trending?api_key=OGwBWUeX7nr36k2ZIvCRfENDy5tGuwsX&limit=25&rating=g";
  List Datos = [];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(156, 138, 163, 28),
      body: Stack(
        children: [
          //Titulo
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              width: ancho,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/img/fbi-fedposting.gif"),
                            fit: BoxFit.fill)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "INTEGRANTES DEL EQUIPO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: GestureDetector(
                            child: Column(
                          children: [
                            SizedBox(
                              width: ancho * 0.4,
                              height: 30,
                              child: const Text(
                                "Escobar Ortegón Ruben 25-0001-2018",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: ancho * 0.4,
                              height: 25,
                              child: const Text(
                                "Pérez Alberto Luis Gustavo 25-4879-2006",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ))),
                  ),
                ],
              ),
            ),
          ),

          //TODO contenido:
          Positioned(
              top: 300,
              bottom: 0,
              width: ancho - 20,
              child: Column(
                children: [
                  Datos.length != null
                      ? Expanded(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1, childAspectRatio: 2.8),
                              itemCount: Datos.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 16, 92, 41),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(35)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 30,
                                            top: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              //Titulos:
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text("Lugar: ",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              128,
                                                              158,
                                                              141),
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text("Último Reg.: ",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              128,
                                                              158,
                                                              141),
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text("Estado: ",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              128,
                                                              158,
                                                              141),
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text("Description: ",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              128,
                                                              158,
                                                              141),
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),

                                              //Datos
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 300,
                                                    child: Text(
                                                        Datos[index]['title'],
                                                        maxLines: 1,
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 11)),
                                                  ),
                                                  Text(
                                                      Datos[index][
                                                              'place_of_birth'] ??
                                                          "unknown",
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11)),
                                                  Text(
                                                      Datos[index]['status'] ==
                                                              "na"
                                                          ? "Searching"
                                                          : Datos[index]
                                                              ['status'],
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11)),
                                                  Container(
                                                      width: 200,
                                                      child: Text(
                                                          Datos[index]
                                                              ['description'],
                                                          maxLines: 2,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      11))),
                                                ],
                                              )
                                            ],
                                          ),
                                        )),
                                  ),
                                  onTap: () {
                                    //Mas detalles
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Description(
                                                detalles: Datos[index])));
                                  },
                                );
                              }),
                        )
                      : const Center(
                          child: Text(
                            "NOT DATA",
                            style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                ],
              ))
        ],
      ),
    );
  }

  //Configuracion y obtencion de la api
  @override
  void initState() {
    super.initState();
    if (mounted) {
      gamesData();
    }
  }

  void gamesData() {
    var url = Uri.http("api.fbi.gov", "/wanted/v1/list");
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodejsonData = jsonDecode(value.body);
        Datos = decodejsonData['items'];
        setState(() {});
      }
    });
  }
}
