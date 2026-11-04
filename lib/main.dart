import 'package:flutter/material.dart';

// Ponto de entrada da aplicação
void main() {
  runApp(const MeuTodoApp());
}

// -------------------------------------------------------------
// MÓDULO 6: Representação do Dado (Dart)
// -------------------------------------------------------------
class Tarefa {
  String titulo;
  bool isConcluida;

  Tarefa({required this.titulo, this.isConcluida = false});
}

// -------------------------------------------------------------
// MÓDULO 7: Interface Gráfica e Gerenciamento de Estado
// -------------------------------------------------------------

// O App em si é um StatelessWidget (a casca não muda de estado)
class MeuTodoApp extends StatelessWidget {
  const MeuTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minhas Tarefas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TelaTarefas(), // Chama a tela principal
    );
  }
}

// A Tela de Tarefas é um StatefulWidget (a lista e os checkboxes mudam de estado)
class TelaTarefas extends StatefulWidget {
  const TelaTarefas({super.key});

  @override
  State<TelaTarefas> createState() => _TelaTarefasState();
}

class _TelaTarefasState extends State<TelaTarefas> {
  // Nossa lista "em memória" (Simulando o Banco de Dados por enquanto)
  List<Tarefa> tarefas = [
    Tarefa(titulo: "Estudar lógica de programação"),
    Tarefa(titulo: "Entrega da prática integradora", isConcluida: true),
  ];

  // Controlador para capturar o texto digitado na nova tarefa
  final TextEditingController _controladorDeTexto = TextEditingController();

  // Função para adicionar tarefa (RF01)
  void _adicionarNovaTarefa(String titulo) {
    if (titulo.isNotEmpty) {
      setState(() {
        tarefas.add(Tarefa(titulo: titulo));
      });
      _controladorDeTexto.clear();
      Navigator.of(context).pop(); // Fecha o modal
    }
  }

  // Função para abrir o modal de nova tarefa
  void _abrirModalNovaTarefa() {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Nova Tarefa"),
          content: TextField(
            controller: _controladorDeTexto,
            decoration: const InputDecoration(
              hintText: "Digite o título da tarefa...",
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancelar"),
            ),
            ElevatedButton(
              onPressed: () => _adicionarNovaTarefa(_controladorDeTexto.text),
              child: const Text("Salvar"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold é o esqueleto da tela (AppBar, Body, FloatingActionButton)
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Minhas Tarefas',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: tarefas.length,
        itemBuilder: (context, index) {
          final tarefa = tarefas[index];
          // CheckboxListTile monta a linha com o texto e o checkbox interativo
          return CheckboxListTile(
            title: Text(
              tarefa.titulo,
              style: TextStyle(
                decoration: tarefa.isConcluida
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            value: tarefa.isConcluida,
            onChanged: (bool? novoValor) {
              // setState avisa o Flutter para redesenhar a tela (RF02)
              setState(() {
                tarefa.isConcluida = novoValor ?? false;
              });
            },
          );
        },
      ),
      // Botão Flutuante que abre o modal (Fiel ao nosso Protótipo!)
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirModalNovaTarefa,
        child: const Icon(Icons.add),
      ),
    );
  }
}
