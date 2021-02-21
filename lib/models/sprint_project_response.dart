// To parse this JSON data, do
//
//     final sprintResponse = sprintResponseFromJson(jsonString);

import 'dart:convert';

SprintResponse sprintResponseFromJson(String str) => SprintResponse.fromJson(json.decode(str));

String sprintResponseToJson(SprintResponse data) => json.encode(data.toJson());

class SprintResponse {
    SprintResponse({
        this.duracion,
        this.definicion,
        this.objetivos,
        this.fechaInicio,
        this.fechaFin,
        this.progreso,
        this.id,
    });

    int duracion;
    String definicion;
    List<Objetivo> objetivos;
    String fechaInicio;
    String fechaFin;
    int progreso;
    int id;

    factory SprintResponse.fromJson(Map<String, dynamic> json) => SprintResponse(
        duracion: json["duracion"],
        definicion: json["definicion"],
        objetivos: List<Objetivo>.from(json["objetivos"].map((x) => Objetivo.fromJson(x))),
        fechaInicio: json["fechaInicio"],
        fechaFin: json["fechaFin"],
        progreso: json["progreso"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "duracion": duracion,
        "definicion": definicion,
        "objetivos": List<dynamic>.from(objetivos.map((x) => x.toJson())),
        "fechaInicio": fechaInicio,
        "fechaFin": fechaFin,
        "progreso": progreso,
        "id": id,
    };
}

class Objetivo {
    Objetivo({
        this.id,
        this.nombre,
        this.descripcion,
        this.estado,
    });

    int id;
    String nombre;
    String descripcion;
    int estado;

    factory Objetivo.fromJson(Map<String, dynamic> json) => Objetivo(
        id: json["id"],
        nombre: json["nombre"],
        descripcion: json["descripcion"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "descripcion": descripcion,
        "estado": estado,
    };
}
