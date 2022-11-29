import 'package:cantrain/models/assigned_regiment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AssignedRegimentView extends StatefulWidget {
  const AssignedRegimentView({Key? key, this.assignedRegimentId}) : super(key: key);

  final int? assignedRegimentId;

  @override
  State<AssignedRegimentView> createState() => _AssignedRegimentView();
}

class _AssignedRegimentView extends State<AssignedRegimentView> {
  bool isLoaded = false;
  AssignedRegiment? assignedRegiment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${assignedRegiment?.regiment.name}',
          style: GoogleFonts.bebasNeue(),
        ),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemBuilder: itemBuilder
        ),
      ),
    );
  }

}
