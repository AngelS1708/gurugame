import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarPerfilModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CorreElectronico widget.
  TextEditingController? correElectronicoController1;
  String? Function(BuildContext, String?)? correElectronicoController1Validator;
  // State field(s) for CorreElectronico widget.
  TextEditingController? correElectronicoController2;
  String? Function(BuildContext, String?)? correElectronicoController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    correElectronicoController1?.dispose();
    correElectronicoController2?.dispose();
  }

  /// Additional helper methods are added here.

}
