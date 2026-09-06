import 'package:flutter/material.dart';

import 'glow.dart';

class PortfolioBackground extends StatelessWidget {
  const PortfolioBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -180,
            right: -160,
            child: Glow(
              size: 500,
              opacity: .08,
            ),
          ),
          Positioned(
            top: 950,
            left: -260,
            child: Glow(
              size: 550,
              opacity: .045,
            ),
          ),
          Positioned(
            bottom: 500,
            right: -260,
            child: Glow(
              size: 500,
              opacity: .035,
            ),
          ),
        ],
      ),
    );
  }
}