import 'package:joken_po/utils/imports.dart';



class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {


  var _imageApp =  AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opcao abaixo!";


  void _opcaoSelecionada (String escolhausuario){


    var opcoes = ["pedra","papel","tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    print("Escolha do App: " + escolhaApp);
    print("Escolha do Usuario: " + escolhausuario);


    //escolha do app
    switch ( escolhaApp ){
      case "pedra" :
        setState(() {
          this._imageApp = AssetImage("images/pedra.png");
        });
      break;
      case "papel" :
        setState(() {
          this._imageApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura" :
        setState(() {
          this._imageApp = AssetImage("images/tesoura.png");
        });
        break;
      
    }


    //validacao do ganhador

    if(

        (escolhausuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhausuario == "tesoura" && escolhaApp == "papel") ||
        (escolhausuario == "papel" && escolhaApp == "pedra")


    ){

      //message
      setState(() {
        this._mensagem = "Parabéns!!! Você ganhou :)";
      });

    }
    else if(

    (escolhaApp == "pedra" && escolhausuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhausuario == "papel") ||
        (escolhaApp == "papel" && escolhausuario == "pedra")

    ){

      //message
      setState(() {
        this._mensagem = "!!! Você perdeu :(";
      });
    }else {
      setState(() {
        this._mensagem = "Empatou ;)";
      });
    }





  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Joken Po"),
      ),
      body: SingleChildScrollView(child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[



          Padding(
            padding: EdgeInsets.all(16.0),
            child: textApp("Escolha do App"),
          ),
          Image(image: this._imageApp,),

          /*  GestureDetector(
            child: Image.asset("images/padrao.png"),

            onTap: (){
              print("imagem clicada");
            },
            onDoubleTap: (){
              print("imagem clicada");
            },

          )*/
          textApp(this._mensagem),
          Divider(),
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset(
                  "images/papel.png",
                  width: MediaQuery.of(context).size.width/6,
                  fit: BoxFit.fitWidth,
                ),
              ),

              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset(
                  "images/pedra.png",
                  width: MediaQuery.of(context).size.width/6,
                  fit: BoxFit.fitWidth,
                ),
              ),

              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset(
                  "images/tesoura.png",
                  width: MediaQuery.of(context).size.width/6,
                  fit: BoxFit.fitWidth,
                ),
              ),

           /*   Image.asset(
                  "images/papel.png",
                  width: MediaQuery.of(context).size.width/6,
                  fit: BoxFit.fitWidth,
              ),
              Image.asset(
                  "images/pedra.png",
                  width: MediaQuery.of(context).size.width/6,
                  fit: BoxFit.fitWidth
              ),
              Image.asset(
                  "images/tesoura.png",
                  width: MediaQuery.of(context).size.width/6,
                  fit: BoxFit.fitWidth
              ),

              */

            ],
          ),
        ],
      ),)
    );
  }
}
