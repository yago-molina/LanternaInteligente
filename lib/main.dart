import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // título Lanterna Inteligente
      title: 'Lanterna Inteligente',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        //habilitar material 3
        //brilho escuro
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFD700),
          brightness: Brightness.dark,
          //cor semente FFD700 (amarelo meio dourado)
          //brilho escuro
        ),
        scaffoldBackgroundColor: const Color(0xFF0D0D0D),
        // cor de fundo 0D0D0D
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF1A1A1A),
          color: Colors.white,
          centerTitle: true,
          elevation: 0,
          //cor de fundo 1A1A1A
          //cor da frente: branco
          // centraliza o título
          //elevação 0
        ),
      ),
      home: const LanternaScreen(),
    );
  }
}
class AppCores{
  static const amarelo = Color(0xFFFFD700);
  static const cinzaEscuro = Color(0xFF1A1A1A);
  static const cinzaMedio = Color(0xFF2C2C2C);
  static const cinzaTexto = Color(0xFF888888);
  static const vermelho = Color(0xFFEF5350);
  static const azul = Color(0xFF42A5F5);
  static const verde = Color(0xFF66BB6A);
  static const roxo = Color(0xFFAB47BC);
  // static const amarelo = FFD700 //Mantenha o padrão desta linha
  // cinzaEscuro 1A1A1A
  // cinzaMedio 2C2C2C
  // cinzaTexto 888888
  // vermelho EF5350
  // azul 42A5F5
  // verde 66BB6A
  // roxo AB47BC
}

class LanternaScreen extends StatefulWidget{
  const LanternaScreen({super.key});
  @override
  State<LanternaScreen> createState() => _LanternaScreenState();
}

class _LanternaScreenState extends State<LanternaScreen>{
  
  void initState(){
    super.initState();
  }

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),
      //cor de fundo 0D0D0D
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              // padding: simétrico horizontal 20, vertical 16
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // alinhamento mínimo do eixo: spaceBetween
                children: [
                  Text(
                    '🔦 Lanterna',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  // Text '🔦 Lanterna'
                  //   tamanho da fonte 20, negrito, branco, letterSpacing 1.5
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppCores.amarelo,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'LIGADA',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  )
                  // Container (badge de status)
                  //   cor: amarelo ou cinza por estado
                  //   raio: 20
                  //   Texto : 'LIGADA' ou 'DESLIGADA'
                ],
              ),
            ),

            // AQUI VAMOS INSERIR UM CONTAINER JUNTOS

            Container(
              decoration: BoxDecoration(
                color: AppCores.roxo.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              // decoração: roxo se ativo, cinzaEscuro se inativo
              child: Row(
                children: [
                  Icon(Icons.auto_mode, size: 30, color: Colors.white),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Modo Automático',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Ativa a lanterna automaticamente em ambientes escuros',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppCores.cinzaTexto,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: _modoAutomatico,
                    onChanged: _alternarModoAutomatico,
                    activeColor: AppCores.amarelo,
                  ),
                  // Icon: auto_mode
                  // Expanded: título e descrição
                  // Switch: value _modoAutomatico, onChanged _alternarModoAutomatico
                ],
              ),
            ),

            Expanded(
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    color: AppCores.amarelo.withOpacity(0.8),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppCores.amarelo.withOpacity(0.6),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.flashlight_on,
                    size: 80,
                    color: Colors.white,
                  ),
                  // duration: 400ms
                  // width/height: 160 se ligada, 120 se não
                  // forma: círculo
                  // cor: amarelo com opacidade se ligada
                  // boxShadow: brilho amarelo se ligada
                  // Icon: flashlight_on
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              // padding: bottom 60
              child: GestureDetector(
                // AQUI VAMOS INSERIR A AçÃO DEPOIS
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: AppCores.amarelo.withOpacity(0.8),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppCores.amarelo.withOpacity(0.6),
                        blurRadius: 15,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  // duration: 300ms
                  // width/height: 90, forma: círculo
                  // cor: amarelo se ligada, cinzaMedio se não
                  // Icon: power_settings_new, tamanho 40
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}