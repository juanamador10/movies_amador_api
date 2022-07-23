import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";
import 'package:movies_new/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MovieID extends ChangeNotifier{
dynamic _movieidS = '';
      get movieidS {
        return _movieidS;
      }
      set movieidS( dynamic nombre ) {
        this._movieidS = nombre;
        notifyListeners();
      }

}

