import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class LabeledDivider extends LeafRenderObjectWidget {
  final String label;
  final double thickness;
  final Color color;
  const LabeledDivider(
      {super.key,
      required this.label,
      required this.thickness,
      required this.color});
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderLabeledDivider(
        label: label, thickness: thickness, color: color);
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderLabeledDivider renderObject) {
    renderObject._label = label;
    renderObject._thickness = thickness;
    renderObject._color = color;
  }
}

class RenderLabeledDivider extends RenderBox {
  String _label = '';
  double _thickness = 0.0;
  Color _color = Colors.black;
  late TextPainter _textPainter;
  RenderLabeledDivider(
      {required String label,
      required double thickness,
      required Color color}) {
    _label = label;
    _thickness = thickness;
    _color = color;
    _textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );
  }

  @override
  void performLayout() {
    _textPainter.text = TextSpan(
      text: _label,
      style: TextStyle(
        color: _color,
      ),
    );
    _textPainter.layout();
    final double textHeight = _textPainter.size.height;
    size = constraints.constrain(
      Size(
        double.infinity,
        _thickness + textHeight,
      ),
    );
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final Paint paint = Paint()..color = _color;
    final double yCenter = offset.dy + size.height / 2;
// Draw the line
    context.canvas.drawLine(
      offset,
      Offset(offset.dx + size.width, yCenter),
      paint,
    );
    // Draw the text
    final double textStart =
        offset.dx + (size.width - _textPainter.size.width) / 2;
    _textPainter.paint(
      context.canvas,
      Offset(textStart, yCenter - _textPainter.size.height / 2),
    );
  }

  @override
  void describeSemanticsConfiguration(
    SemanticsConfiguration config,
  ) {
    super.describeSemanticsConfiguration(config);
    config
      ..isSemanticBoundary = true
      ..label = 'Divider with text: $_label';
  }

  set label(String value) {
    if (_label != value) {
      _label = value;
      markNeedsSemanticsUpdate();
      markNeedsLayout();
    }
  }

  String get label => _label;

  set thickness(double value) {
    if (_thickness != value) {
      _thickness = value;
      markNeedsLayout();
    }
  }

  double get thickness => _thickness;

  set color(Color value) {
    if (_color != value) {
      _color = value;
      markNeedsPaint();
    }
  }
}
