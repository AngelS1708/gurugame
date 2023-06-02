import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'terminos_y_condiciones_model.dart';
export 'terminos_y_condiciones_model.dart';

class TerminosYCondicionesWidget extends StatefulWidget {
  const TerminosYCondicionesWidget({Key? key}) : super(key: key);

  @override
  _TerminosYCondicionesWidgetState createState() =>
      _TerminosYCondicionesWidgetState();
}

class _TerminosYCondicionesWidgetState
    extends State<TerminosYCondicionesWidget> {
  late TerminosYCondicionesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TerminosYCondicionesModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: true,
          title: Text(
            'Términos y condiciones',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Poppins',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(0.0, 2.0),
                        )
                      ],
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Text(
                            'Términos y Condiciones de Guru Game.',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Text(
                            'Última actualización:  31/05/2023\n\nPor favor, lee estos términos y condiciones cuidadosamente antes de utilizar nuestra aplicación de repositorio de videojuegos. Al utilizar la aplicación, aceptas cumplir con estos términos y condiciones.\n\n•\tUso de la Aplicación La aplicación de repositorio de videojuegos está diseñada para permitir a los usuarios crear una cuenta, registrar los videojuegos que han jugado, marcar los juegos completados y llevar un seguimiento de los juegos en los que están actualmente jugando. El uso de la aplicación está sujeto a los siguientes términos y condiciones.\n\n•\tPrivacidad El uso de la aplicación está sujeto a nuestra política de privacidad. Al utilizar la aplicación, aceptas que recopilemos, almacenemos y procesemos tus datos personales de acuerdo con nuestra política de privacidad.\n\n•\tCuentas de Usuario Para utilizar ciertas funciones de la aplicación, es posible que debas crear una cuenta de usuario proporcionando información personal, como tu dirección de correo electrónico y contraseña. Eres responsable de mantener la confidencialidad de tu información de inicio de sesión y de todas las actividades que ocurran bajo tu cuenta. Nos reservamos el derecho de suspender o cancelar tu cuenta si sospechamos un uso indebido o no autorizado.\n\n•\tPropiedad Intelectual La aplicación de repositorio de videojuegos y todo su contenido, incluyendo pero no limitado a textos, gráficos, logotipos, iconos, imágenes, clips de audio, descargas digitales y compilaciones de datos, son propiedad de los propietarios legales y están protegidos por las leyes de propiedad intelectual aplicables. No se te otorga ningún derecho de propiedad sobre el contenido de la aplicación, excepto lo expresamente otorgado en estos términos y condiciones.\n\n•\tLimitación de Responsabilidad La aplicación de repositorio de videojuegos se proporciona \"tal cual\" y no ofrecemos ninguna garantía o representación con respecto a su precisión, confiabilidad o disponibilidad. En ningún caso seremos responsables por cualquier daño directo, indirecto, incidental, especial o consecuente derivado del uso o la imposibilidad de uso de la aplicación.\n•\tModificaciones de los Términos y Condiciones Nos reservamos el derecho de modificar estos términos y condiciones en cualquier momento sin previo aviso. Se te notificará sobre cualquier cambio sustancial en los términos y condiciones. El uso continuado de la aplicación después de dichos cambios constituirá tu aceptación de los términos y condiciones modificados.\n',
                            style: FlutterFlowTheme.of(context).labelLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
