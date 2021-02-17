// To parse this JSON data, do
//
//     final projectResponse = projectResponseFromJson(jsonString);

import 'dart:convert';

List<ProjectResponse> projectResponseFromJson(String str) => List<ProjectResponse>.from(json.decode(str).map((x) => ProjectResponse.fromJson(x)));

String projectResponseToJson(List<ProjectResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProjectResponse {
    ProjectResponse({
        this.id,
        this.nombre,
        this.fechaEstimada,
        this.progresoTotal,
        this.estado,
    });

    int id;
    String nombre;
    String fechaEstimada;
    int progresoTotal;
    int estado;

    factory ProjectResponse.fromJson(Map<String, dynamic> json) => ProjectResponse(
        id: json["id"],
        nombre: json["nombre"],
        fechaEstimada: json["fechaEstimada"],
        progresoTotal: json["progresoTotal"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "fechaEstimada": fechaEstimada,
        "progresoTotal": progresoTotal,
        "estado": estado,
    };
}
