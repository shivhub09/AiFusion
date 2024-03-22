import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTile extends StatefulWidget {
  final String description;
  final String id;
  final bool status;

  const ToDoTile({
    required this.description,
    required this.id,
    required this.status,
  });

  @override
  _ToDoTileState createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  bool isDraggedLeft = false;

  // Method to reset the isDraggedLeft state
  void resetState() {
    setState(() {
      isDraggedLeft = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (!isDraggedLeft && details.delta.dx < 0) {
          setState(() {
            isDraggedLeft = true;
            print("dragged left");
          });
        } else if (isDraggedLeft && details.delta.dx > 0) {
          setState(() {
            isDraggedLeft = false;
          });
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.description,
                    style: GoogleFonts.urbanist(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Task ID: ${widget.id}',
                    style: GoogleFonts.urbanist(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            isDraggedLeft
                ? Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete_forever_outlined,
                            color: Colors.red),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.refresh, color: Colors.blue),
                        onPressed: resetState,
                      ),
                    ],
                  )
                : widget.status
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 30,
                      )
                    : Icon(
                        Icons.circle,
                        color: Colors.grey,
                        size: 30,
                      ),
          ],
        ),
      ),
    );
  }
}
