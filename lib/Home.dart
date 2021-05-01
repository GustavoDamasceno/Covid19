import 'package:flutter/material.dart';
import 'main.dart';
import 'models/CovidApi.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // variavel para pegar tamanho do display
    final tamanhodatela = MediaQuery.of(context).size;
    return Scaffold(
        //Para buscar os dados da API e exibi-los na tela
        body: FutureBuilder<CovidApi>(
            future: fetch(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                // Inicio da construção do App - Dividido em 3 container
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Imagem superior
                    Container(
                      width: tamanhodatela.width,
                      height: tamanhodatela.height * 0.406,
                      // RGB branco para deixar container escondido
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      child: Image(
                        image: AssetImage('assets/images/appbar.png'),
                        fit: BoxFit.contain,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    // Container Informativo e Botões
                    Container(
                      width: tamanhodatela.width,
                      height: tamanhodatela.height * 0.4156,
                      // RGB branco para deixar container escondido
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Container Informativo
                          Container(
                            width: tamanhodatela.width * 0.8639,
                            height: tamanhodatela.height * 0.2281,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(1, 139, 221, 1.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                // Informação da API - LOCAL
                                Align(
                                  alignment: Alignment(0.0, -0.90),
                                  child: Text(
                                      snapshot.data.state +
                                          "-" +
                                          snapshot.data.uf,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      )),
                                ),
                                // Informação da API - Casos de COVID
                                Align(
                                  alignment: Alignment(-0.85, -0.35),
                                  child: Text(
                                    'Covid: ' + snapshot.data.cases.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                // Informação da API - Mortes de COVID
                                Align(
                                  alignment: Alignment(-0.85, -0.05),
                                  child: Text(
                                    'Mortes: ' +
                                        snapshot.data.deaths.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                // Informação da API - Suspeitos de COVID
                                Align(
                                  alignment: Alignment(-0.85, 0.25),
                                  child: Text(
                                    'Suspeitos: ' +
                                        snapshot.data.suspects.toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                // Informação da API - última atualização de COVID
                                Align(
                                  alignment: Alignment(-0.85, 0.95),
                                  child: Text(
                                    'Data: ' + snapshot.data.datetime,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                // Imagem do bonequinho com mascará
                                Align(
                                  alignment: Alignment(0.90, 1.0),
                                  child:
                                      Image.asset('assets/images/boneco.png'),
                                ),
                              ],
                            ),
                          ),
                          // Botões
                          Container(
                            width: tamanhodatela.width * 0.8639,
                            height: tamanhodatela.height * 0.1484,
                            // RGB branco para deixar container escondido
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Botão prevenção
                                SizedBox(
                                  width: tamanhodatela.width * 0.3889,
                                  height: tamanhodatela.height * 0.1484,
                                  child: RaisedButton(
                                    onPressed: () {
                                      print('Botão funcionando');
                                    },
                                    color: Color.fromRGBO(1, 139, 221, 1.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    // Criar stack para posicionar os comp. do btn
                                    child: Stack(
                                      children: [
                                        // Titulo do btn
                                        Align(
                                          alignment: Alignment(0.0, -0.80),
                                          child: Text(
                                            'Prevenção',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        // Imagem do btn
                                        Align(
                                          alignment: Alignment(0.0, 1.0),
                                          child: Image.asset(
                                            'assets/images/woman.png',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // Botão noticias
                                SizedBox(
                                  width: tamanhodatela.width * 0.3889,
                                  height: tamanhodatela.height * 0.1484,
                                  child: RaisedButton(
                                    onPressed: () {
                                      print('Botão funcionando');
                                    },
                                    color: Color.fromRGBO(1, 139, 221, 1.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                    // Criar stack para posicionar os comp. do btn
                                    child: Stack(
                                      children: [
                                        // Titulo do btn
                                        Align(
                                          alignment: Alignment(0.0, -0.80),
                                          child: Text(
                                            'Notícias',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment(0.0, 0.50),
                                          child: Image.asset(
                                              'assets/images/jornal.png'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Copyright
                    Container(
                      width: tamanhodatela.width,
                      height: tamanhodatela.height * 0.1784,
                      // RGB branco para deixar container escondido
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      child: Align(
                        alignment: Alignment(-0.95, 0.90),
                        child: Text(
                          "© Desenvolvido por Damasceno",
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            }));
  }
}
