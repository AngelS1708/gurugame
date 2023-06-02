import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AddGameModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for NameGame widget.
  TextEditingController? nameGameController;
  String? Function(BuildContext, String?)? nameGameControllerValidator;
  // State field(s) for inpImage widget.
  TextEditingController? inpImageController;
  String? Function(BuildContext, String?)? inpImageControllerValidator;
  // State field(s) for DescripcionInp widget.
  TextEditingController? descripcionInpController;
  String? Function(BuildContext, String?)? descripcionInpControllerValidator;
  // State field(s) for InpGeneros widget.
  TextEditingController? inpGenerosController;
  String? Function(BuildContext, String?)? inpGenerosControllerValidator;
  // State field(s) for InpDesarrolladora widget.
  TextEditingController? inpDesarrolladoraController;
  String? Function(BuildContext, String?)? inpDesarrolladoraControllerValidator;
  // State field(s) for Inp widget.
  TextEditingController? inpController;
  String? Function(BuildContext, String?)? inpControllerValidator;
  // State field(s) for InpFecha widget.
  TextEditingController? inpFechaController;
  final inpFechaMask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? inpFechaControllerValidator;
  // State field(s) for InpPlataformas widget.
  TextEditingController? inpPlataformasController;
  String? Function(BuildContext, String?)? inpPlataformasControllerValidator;
  // State field(s) for InpMetacritic widget.
  TextEditingController? inpMetacriticController;
  String? Function(BuildContext, String?)? inpMetacriticControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nameGameController?.dispose();
    inpImageController?.dispose();
    descripcionInpController?.dispose();
    inpGenerosController?.dispose();
    inpDesarrolladoraController?.dispose();
    inpController?.dispose();
    inpFechaController?.dispose();
    inpPlataformasController?.dispose();
    inpMetacriticController?.dispose();
  }

  /// Additional helper methods are added here.

}
