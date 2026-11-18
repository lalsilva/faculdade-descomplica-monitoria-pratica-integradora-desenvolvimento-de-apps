import 'dart:convert'; // Pacote essencial para lidar com JSON[cite: 23]

import 'package:http/http.dart' as http; // Módulo 13[cite: 44]

class NuvemService {
  // Simula uma requisição GET para uma API externa
  static Future<void> simularSincronizacao() async {
    print("Iniciando conexão com a nuvem...");

    // MÓDULO 14: O nosso escudo de proteção[cite: 52]
    try {
      // MÓDULO 13: Buscando na internet de verdade![cite: 43]
      final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/2');
      final resposta = await http.get(url);

      // Regra de negócio (Forçando um erro se o servidor falhar)[cite: 48]
      if (resposta.statusCode != 200) {
        throw Exception("Falha no servidor. Código: ${resposta.statusCode}");
      }

      // 2. A conversão de texto JSON para um Mapa em Dart[cite: 23]
      final tarefaConvertida = json.decode(resposta.body);

      print("--- SUCESSO ---");
      print("Nova Tarefa: ${tarefaConvertida['title']}");
      print("Concluída? ${tarefaConvertida['completed']}");
    } catch (erro) {
      print("--- ERRO ---");
      print("Falha ao sincronizar com a nuvem: $erro");
    } finally {
      print("----- FIM DA SINCRONIZAÇÃO -----");
    }
  }
}
