import 'package:flutter/material.dart';
import 'package:practica1/models/personajes_model.dart';

class PintaPersonajes extends StatefulWidget {
  final dynamic personajes;

  const PintaPersonajes({super.key, required this.personajes});

  @override
  State<PintaPersonajes> createState() => _PintaPersonajesState();
}

class _PintaPersonajesState extends State<PintaPersonajes> {
  int pintaPersonaje = -1;
  @override
  Widget build(BuildContext context) {
    return (pintaPersonaje == -1)
    ? _pintaLista(personajes: widget.personajes)
    : _pintaDetalle(index: pintaPersonaje, personaje: widget.personajes,);
  }

  Widget _pintaLista({required personajes}) {
    return ListView.builder(
      itemCount: widget.personajes.length,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          title: Text(
            widget.personajes[index].name,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 181, 204),
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(onPressed: () {
            setState(() {
              pintaPersonaje = index;
            });
          }, icon: const Icon(
            Icons.arrow_forward,
            color: Color.fromARGB(255, 57, 255, 20),
          )
          ),
          leading: CircleAvatar(
            radius: 26,
            backgroundColor: const Color.fromARGB(255, 57, 255, 20),
            backgroundImage: NetworkImage(widget.personajes[index].image),
          ),
          subtitle: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: (widget.personajes[index].status == Status.ALIVE)
                      ? const Color.fromARGB(117, 38, 255, 0)
                      : (widget.personajes[index].status == Status.DEAD)
                        ? const Color.fromARGB(255, 214, 61, 46)
                        : const Color.fromARGB(255, 0, 181, 204)
                ),
                child: Text(
                  'Estado: ${pintaEstado(widget.personajes[index].status.toString())}', // .name te saca solo "ALIVE" sin el "Status."
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        );

      }
    ); 
  }

  Widget _pintaDetalle({required int index, required personaje}) {
  return Column(
    children: [
      const SizedBox(height: 20), 
      
      CircleAvatar(
        radius: 100,
        backgroundColor: const Color.fromARGB(255, 57, 255, 20),
        backgroundImage: NetworkImage(widget.personajes[index].image),
      ),
      
      const SizedBox(height: 15),

      Text(
        widget.personajes[index].name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Color.fromARGB(255, 57, 255, 20),
        ),
      ),

      const SizedBox(height: 10),
      
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Género: ${pintaGenero(widget.personajes[index].gender.toString())}',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 0, 181, 204),
              )),
        ],
      ),
      
      const SizedBox(height: 10),
      
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Especie: ${pintaSpecie(widget.personajes[index].species.toString())}',
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 240, 225, 74),
              )
          ),
          const SizedBox(width: 10),
          Text(
            'Estado: ${pintaEstado(widget.personajes[index].status.toString())}', // Tu función
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
              ),
          ),
        ],
      ),
      
      const SizedBox(height: 20),
      
      IconButton(
        onPressed: () {
          setState(() {
            pintaPersonaje = -1;
          });
        }, 
        icon: const Icon(
          Icons.arrow_back,
          color: Color.fromARGB(255, 57, 255, 20),
          size: 32,
        ),
      ),
    ],
  );
}
}

String pintaSpecie(String especie) {
  switch (especie){
    case 'Species.HUMAN': return 'Humana';
    default: return'Alienígena';
  }
}

String pintaGenero(String genero) {
  switch (genero){
    case 'Gender.MALE': return 'Masculino';
    case 'Gender.UNKNOWN': return 'Desconocido';
    default: return'Femenino';
  }
}


String pintaEstado(String status) {
  switch(status){
    case 'Status.ALIVE' : return 'Vivo';
    case 'Status.DEAD' : return 'Muerto';
    default : return 'Paradero desconocido';
  }
}
