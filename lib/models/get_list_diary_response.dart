// To parse this JSON data, do
//
//     final listDiaryResponse = listDiaryResponseFromJson(jsonString);

import 'dart:convert';

List<ListDiaryResponse> listDiaryResponseFromJson(String str) => List<ListDiaryResponse>.from(json.decode(str).map((x) => ListDiaryResponse.fromJson(x)));

String listDiaryResponseToJson(List<ListDiaryResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListDiaryResponse {
    ListDiaryResponse({
        this.id,
        this.contenido,
        this.fecha,
        this.hora,
        this.temaCita,
        this.idTema,
    });

    int id;
    String contenido;
    String fecha;
    String hora;
    TemaCita temaCita;
    int idTema;

    factory ListDiaryResponse.fromJson(Map<String, dynamic> json) => ListDiaryResponse(
        id: json["id"],
        contenido: json["contenido"],
        fecha: json["fecha"],
        hora: json["hora"],
        temaCita: TemaCita.fromJson(json["temaCita"]),
        idTema: json["idTema"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "contenido": contenido,
        "fecha": fecha,
        "hora": hora,
        "temaCita": temaCita.toJson(),
        "idTema": idTema,
    };
}

class TemaCita {
    TemaCita({
        this.id,
        this.tema,
    });

    int id;
    String tema;

    factory TemaCita.fromJson(Map<String, dynamic> json) => TemaCita(
        id: json["id"],
        tema: json["tema"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tema": tema,
    };
}
