import 'package:flutter/material.dart';
import 'package:practica1/models/personajes_model.dart';
import 'package:practica1/presentation/widgets/pinta_personajes.dart';
import 'package:practica1/services/personaje_service.dart';

class HomeFutureScreen extends StatefulWidget {
  const HomeFutureScreen({super.key});

  @override
  State<HomeFutureScreen> createState() => _HomeFutureScreenState();
}

class _HomeFutureScreenState extends State<HomeFutureScreen> {
  late Future<List<Personaje?>> futurePersonajes;

  @override
  void initState() {
    super.initState();
    futurePersonajes = getPersonajes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 35, 41),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 57, 255, 20),
        title: const Center(child: Text('Rick and morty app')), 
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 32, 35, 41),
          ),
          elevation: 10,),
      body: FutureBuilder(
        future: futurePersonajes,
        builder: (context, AsyncSnapshot<List<Personaje?>> data) {
          if(data.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 57, 255, 20),
              ),
            );
          }
          if(data.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Color.fromARGB(255, 214, 61, 46), size: 60),
                  const SizedBox(height: 10),
                  const Text(
                    'No se han podido cargar los datos',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 57, 255, 20),
                      foregroundColor: const Color.fromARGB(255, 32, 35, 41),
                    ),
                    onPressed: () {
                      setState(() {
                        futurePersonajes = getPersonajes();
                      });
                    },
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }
          return PintaPersonajes(personajes: data.data);
        },)
    );
  }
}
