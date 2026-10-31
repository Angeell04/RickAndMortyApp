import 'package:http/http.dart';
import 'package:practica1/models/personajes_model.dart';
const _URL = 'https://rickandmortyapi.com/api/character';


Future<List<Personaje?>> getPersonajes() async {
  List<Personaje> personajes = [];
  Response response = await get(Uri.parse(_URL));
  if (response.statusCode != 200) {
    throw Exception('Error al cargar los personajes');
  }

  final Personajes personajesResponse = personajesFromJson(response.body);
  personajes.addAll(personajesResponse.personajes);
  return personajes;
}
