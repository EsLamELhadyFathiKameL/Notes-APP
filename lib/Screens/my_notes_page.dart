import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_notes_app/Widgets/my_floating_action_button.dart';
import 'package:my_notes_app/Widgets/my_notes_page_body.dart';

class MyNotesPage extends StatelessWidget {
  const MyNotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Text(
              "Notes",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: "Pacifico",
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    16,
                  ),
                ),
                color: Colors.white.withOpacity(0.1),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  MdiIcons.searchWeb,
                ),
              ),
            ),
          ],
        ),
      ),
      body: const MyNotesPageBody(),
      floatingActionButton: const MyFLoatingActionButton(),
    );
  }
}
