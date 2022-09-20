import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/helpers/helpers.dart';
import 'package:shoes_app/models/zapato_model.dart';
import 'package:shoes_app/widgets/widgets.dart';

class ZapatoDescScreen extends StatelessWidget {
  const ZapatoDescScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();

    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            const Hero(
              tag: 'zapato-1',
              child: ZapatoSizePreview(fullScreen: true),
            ),
            Positioned(
              top: 80,
              child: FloatingActionButton(
                onPressed: () {
                  cambiarStatusDark();
                  Navigator.pop(context);
                },
                backgroundColor: Colors.transparent,
                elevation: 0,
                highlightElevation: 0,
                child: const Icon(Icons.chevron_left, color: Colors.white, size: 60),
              ),
            )
          ]),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _MontoBuyNow(),
                  _ColoresYMas(),
                  _BotonesLikeCartSettings()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.only(bottom: 50, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const _BotonSombreado(icon: Icon(Icons.star_outline, size: 25, color: Colors.red)),
          _BotonSombreado(
            icon: Icon(Icons.shopping_cart, size: 25, color: Colors.grey.withOpacity(0.4)),
          ),
          _BotonSombreado(
            icon: Icon(Icons.settings, size: 25, color: Colors.grey.withOpacity(0.4)),
          ),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  const _BotonSombreado({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            blurRadius: 5,
          )
        ],
      ),
      child: icon,
    );
  }
}

class _ColoresYMas extends StatelessWidget {
  const _ColoresYMas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(left: 75, child: _BotonColor(color: Color(0xffC6D642), index: 4, img: 'assets/imgs/verde.png')),
                Positioned(left: 50, child: _BotonColor(color: Color(0xffFFAD29), index: 3, img: 'assets/imgs/amarillo.png')),
                Positioned(left: 25, child: _BotonColor(color: Color(0xff2099F1), index: 2, img: 'assets/imgs/azul.png')),
                _BotonColor(color: Color(0xff364D56), index: 1, img: 'assets/imgs/negro.png'),
              ],
            ),
          ),
          const BotonNaranja(texto: 'More related items', alto: 30, ancho: 170, color: Color(0xffFFC675)),
        ],
      ),
    );
  }
}

class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String img;

  const _BotonColor({
    Key? key,
    required this.color,
    required this.index,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 300),
      delay: Duration(milliseconds: index * 100),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = img;
        },
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          const Text('\$180.0', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const Spacer(),
          Bounce(
            delay: const Duration(milliseconds: 800),
            from: 8,
            child: const BotonNaranja(texto: 'Buy now', ancho: 120, alto: 40),
          )
        ],
      ),
    );
  }
}
