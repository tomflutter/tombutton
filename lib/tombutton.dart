import 'package:flutter/material.dart';
import 'package:tombutton/models/TombButtonModel.dart';

class TombButton extends StatefulWidget {
  final TombButtonModel model; // Menggunakan model sebagai input

  TombButton({required this.model});

  @override
  _TombButtonState createState() => _TombButtonState();
}

class _TombButtonState extends State<TombButton> with TickerProviderStateMixin {
  // Animasi scale tombol saat ditekan
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  // Animasi warna gradient tombol
  late AnimationController _colorController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller untuk animasi scale
    _scaleController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    // Inisialisasi controller untuk animasi gradient background
    _colorController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _colorAnimation = ColorTween(begin: widget.model.backgroundColor, end: Colors.purple).animate(
      CurvedAnimation(parent: _colorController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _scaleController.forward();
        _colorController.forward(); // Mulai animasi warna saat ditekan
      },
      onTapUp: (_) {
        _scaleController.reverse();
        _colorController.reverse(); // Kembalikan animasi warna
      },
      onTap: widget.model.onPressed,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: SizedBox(
              width: widget.model.width,
              height: widget.model.height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_colorAnimation.value!, widget.model.backgroundColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.4, 1],
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8.0,
                      spreadRadius: 4.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Biarkan background transparan karena sudah ada gradient
                    shadowColor: Colors.transparent, // Nonaktifkan shadow default
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    splashFactory: InkRipple.splashFactory,
                  ),
                  onPressed: widget.model.onPressed,
                  child: Text(
                    widget.model.text,
                    style: TextStyle(fontSize: widget.model.fontSize, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
