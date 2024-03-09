import 'package:flutter/material.dart';
import 'package:myapp/_common/minhas_cores.dart';

InputDecoration getAuthenticationInputDecoration(String label) {
  return InputDecoration(
    hintText: label,
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64),
        borderSide:
            const BorderSide(color: MinhasCores.azulPrimario, width: 2)),
  );
}
