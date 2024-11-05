import 'package:flutter/material.dart';

class TombButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final double fontSize;
  final double width;
  final double height;
  final VoidCallback onPressed;

  TombButton({
    required this.text,
    this.backgroundColor = Colors.blue,
    this.fontSize = 16.0,
    this.width = 150.0,
    this.height = 50.0,
    required this.onPressed,
  });

  @override
  _TombButtonState createState() => _TombButtonState();
}

class _TombButtonState extends State<TombButton> with TickerProviderStateMixin {
  // Untuk animasi scale tombol saat ditekan
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

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
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        _scaleController.forward();
      },
      onTapUp: (_) {
        _scaleController.reverse();
      },
      onTap: widget.onPressed,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: SizedBox(
              width: widget.width,
              height: widget.height,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: widget.backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  // Menambahkan efek ripple saat tombol ditekan
                  splashFactory: InkRipple.splashFactory,
                ),
                onPressed: widget.onPressed,  // Tidak perlu disalin lagi
                child: Text(
                  widget.text,
                  style: TextStyle(fontSize: widget.fontSize, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
