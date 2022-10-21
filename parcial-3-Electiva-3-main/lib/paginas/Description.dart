import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget {
  final detalles;

  const Description({super.key, required this.detalles});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: alto,
            width: ancho,
            decoration: BoxDecoration(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(height: 15),
                  const Text(
                    "PRECAUCION; DETALLES",
                    style: TextStyle(
                        color: Color.fromARGB(255, 160, 18, 13),
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Container(height: 20),
                  Container(
                    width: ancho,
                    height: 190,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 211, 212, 153),
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          //Titulos:
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("Titulo: ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 69, 22, 114),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                Text("Moddificado: ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 69, 22, 114),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                Text("Lugar de Nac. ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 69, 22, 114),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                Text("Raza ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 69, 22, 114),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                Text("Cabello: ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 69, 22, 114),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                Text("Cuidado: ",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 69, 22, 114),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ],
                            ),
                          ),

                          //Datos
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: ancho - 165,
                                child: Text(
                                    widget.detalles['title'] ??
                                        "Nothing about this",
                                    maxLines: 1,
                                    style: const TextStyle(
                                        color: CupertinoColors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11)),
                              ),
                              Text(
                                  widget.detalles['modified'] ??
                                      "Nothing about this",
                                  style: const TextStyle(
                                      color: CupertinoColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11)),
                              Text(
                                  widget.detalles['place_of_birth'] ??
                                      "Nothing about this",
                                  style: const TextStyle(
                                      color: CupertinoColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11)),
                              Text(
                                  widget.detalles['race'] ??
                                      "Nothing about this",
                                  style: const TextStyle(
                                      color: CupertinoColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11)),
                              Text(
                                  widget.detalles['hair'] ??
                                      "Nothing about this",
                                  style: const TextStyle(
                                      color: CupertinoColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11)),
                              Container(
                                width: 220,
                                child: Text(
                                    widget.detalles['warning_message'] ??
                                        "Nothing about this",
                                    style: const TextStyle(
                                        color: CupertinoColors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: ancho,
                    height: 130,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 211, 212, 153),
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Descripcion",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 69, 22, 114),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11)),
                          const SizedBox(height: 10),
                          Text(
                              widget.detalles['description'] ??
                                  "Nothing about this",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                      width: ancho,
                      height: 340,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 211, 212, 153),
                        borderRadius: BorderRadius.all(Radius.circular(35)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: widget.detalles['remarks'] != null
                            ? Column(
                                children: [
                                  const Text("Mas Buscados",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 69, 22, 114),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11)),
                                  const SizedBox(height: 10),
                                  Text(widget.detalles['remarks'],
                                      maxLines: 18,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            : widget.detalles['caution'] != null
                                ? Column(
                                    children: [
                                      const Text("Cuidado",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 69, 22, 114),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11)),
                                      const SizedBox(height: 10),
                                      Text(widget.detalles['caution'],
                                          maxLines: 18,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  )
                                : widget.detalles['details'] != null
                                    ? Column(
                                        children: [
                                          const Text("Detalles",
                                              style: TextStyle(
                                                  color: CupertinoColors
                                                      .activeBlue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11)),
                                          const SizedBox(height: 10),
                                          Text(widget.detalles['details'],
                                              maxLines: 18,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      )
                                    : const Center(
                                        child: Text("Nothing about this",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11)),
                                      ),
                      )),
                  SizedBox(height: 20)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
