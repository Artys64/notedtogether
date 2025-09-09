import 'package:flutter/material.dart';

void showNoteDialog({
  required BuildContext context,
  required ValueChanged<String> onSaved,

}) {
  showDialog(context: 
  context, builder: (context) => NoteDialog(
    onSaved: onSaved,
  )
 );
}

class NoteDialog extends StatefulWidget {
  const NoteDialog({
    required this.onSaved,
    super.key,
  });

  final ValueChanged<String> onSaved;

  @override
  NoteDialogState createState() => NoteDialogState();
}

class NoteDialogState extends State<NoteDialog> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                expands: true,
                maxLines: null,
                minLines: null,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write your note here...',
                  hintStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.onSaved(controller.text);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
