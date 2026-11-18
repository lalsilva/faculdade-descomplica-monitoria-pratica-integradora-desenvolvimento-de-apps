import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Dependência do pubspec.yaml[cite: 33]

class MapaTarefaScreen extends StatefulWidget {
  const MapaTarefaScreen({super.key});

  @override
  State<MapaTarefaScreen> createState() => _MapaTarefaScreenState();
}

class _MapaTarefaScreenState extends State<MapaTarefaScreen> {
  // Guarda os alfinetes (marcadores) que colocaremos no mapa[cite: 31]
  final Set<Marker> _marcadores = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local da Tarefa")),
      // O Mapa é apenas um Widget no corpo da tela!
      body: GoogleMap(
        mapType: MapType.normal, // Pode ser satellite, terrain, etc.[cite: 34]
        // 1. Onde a câmera começa (Ex: Centro de SP)
        initialCameraPosition: const CameraPosition(
          target: LatLng(-23.5505, -46.6333), // Latitude e Longitude[cite: 31]
          zoom: 14.0,
        ),
        // 2. Os nossos marcadores (Pins)[cite: 31]
        markers: _marcadores,
        // 3. A interatividade: O que acontece ao tocar no mapa?[cite: 31, 34]
        onTap: (LatLng coordenadaTocada) {
          // setState avisa a tela para se redesenhar com o novo marcador (Conceito do Módulo 7)
          setState(() {
            _marcadores.add(
              Marker(
                markerId: const MarkerId('local_escolhido'),
                position:
                    coordenadaTocada, // Pega a posição exata do toque[cite: 31]
                infoWindow: const InfoWindow(
                  title: 'Fazer tarefa aqui!', // Balão de texto ao clicar no pino[cite: 31]
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
