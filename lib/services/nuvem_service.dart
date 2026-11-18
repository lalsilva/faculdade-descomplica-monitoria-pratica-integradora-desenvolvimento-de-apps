import 'dart:convert'; // Pacote essencial para lidar com JSON[cite: 23]

class NuvemService {
  // Simula uma requisição GET para uma API externa
  static void simularSincronizacao() {
    print("Iniciando conexão com a nuvem...");

    // 1. O dado bruto que chega da API (Formato JSON)[cite: 18, 23]
    const respostaJson =
        '{"titulo": "Configurar Chave do Google Maps", "isConcluida": false, "prioridade": "Alta"}';

    // 2. A conversão de texto JSON para um Mapa em Dart[cite: 23]
    final tarefaConvertida = json.decode(respostaJson);

    // 3. Criação de variável extra para aplicar uma regra de negócio[cite: 23, 24]
    String moduloAtual = "Módulo 11";

    // 4. Regra simples: Destacar se for prioridade Alta[cite: 23, 24]
    bool isUrgente = tarefaConvertida['prioridade'] == "Alta";

    // 5. Exibição do resultado processado no console do VS Code[cite: 24]
    print("--- DADOS RECEBIDOS DA API ---");
    print("Nova Tarefa: ${tarefaConvertida['titulo']}");
    print(
      "Status: ${tarefaConvertida['isConcluida'] ? 'Concluída' : 'Pendente'}",
    );
    print("Contexto: $moduloAtual");
    print("Requer atenção imediata? $isUrgente");
    print(tarefaConvertida);
    print("----- FIM DA SINCRONIZAÇÃO -----");
  }
}
