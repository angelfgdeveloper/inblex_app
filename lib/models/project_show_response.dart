// To parse this JSON data, do
//
//     final projectShowResponse = projectShowResponseFromJson(jsonString);

import 'dart:convert';

ProjectShowResponse projectShowResponseFromJson(String str) => ProjectShowResponse.fromJson(json.decode(str));

String projectShowResponseToJson(ProjectShowResponse data) => json.encode(data.toJson());

class ProjectShowResponse {
    ProjectShowResponse({
        this.id,
        this.sprints,
        this.estado,
        this.descripcion,
        this.fechaEstimada,
        this.progresoTotal,
        this.nombre,
    });

    int id;
    List<Sprint> sprints;
    int estado;
    String descripcion;
    String fechaEstimada;
    int progresoTotal;
    String nombre;

    factory ProjectShowResponse.fromJson(Map<String, dynamic> json) => ProjectShowResponse(
        id: json["id"],
        sprints: List<Sprint>.from(json["sprints"].map((x) => Sprint.fromJson(x))),
        estado: json["estado"],
        descripcion: json["descripcion"],
        fechaEstimada: json["fechaEstimada"],
        progresoTotal: json["progresoTotal"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sprints": List<dynamic>.from(sprints.map((x) => x.toJson())),
        "estado": estado,
        "descripcion": descripcion,
        "fechaEstimada": fechaEstimada,
        "progresoTotal": progresoTotal,
        "nombre": nombre,
    };
}

class Sprint {
    Sprint({
        this.id,
        this.fechaInicio,
        this.fechaFin,
        this.progreso,
    });

    int id;
    String fechaInicio;
    String fechaFin;
    int progreso;

    factory Sprint.fromJson(Map<String, dynamic> json) => Sprint(
        id: json["id"],
        fechaInicio: json["fechaInicio"],
        fechaFin: json["fechaFin"],
        progreso: json["progreso"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fechaInicio": fechaInicio,
        "fechaFin": fechaFin,
        "progreso": progreso,
    };
}
