import 'package:flutter/material.dart';
import 'package:stockholm/stockholm.dart';

class StockholmTableDemoPage extends StatefulWidget {
  const StockholmTableDemoPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StockholmTableDemoPageState();
}

class StockholmTableDemoPageState extends State<StockholmTableDemoPage> {
  bool drawGrid = false;
  bool resizableColumns = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StockholmToolbar(
          children: [
            const SizedBox(width: 4, height: 32),
            StockholmCheckbox(
              value: drawGrid,
              label: 'Draw grid',
              onChanged: (value) {
                setState(() {
                  drawGrid = value;
                });
              },
            ),
            const SizedBox(width: 16, height: 32),
            StockholmCheckbox(
              value: resizableColumns,
              label: 'Resizable columns',
              onChanged: (value) {
                setState(() {
                  resizableColumns = value;
                });
              },
            ),
          ],
        ),
        Expanded(
          child: StockholmTable(
            drawGrid: drawGrid,
            resizableColumns: resizableColumns,
            headerBuilder: (context) {
              return const [
                StockholmTableHeaderCell(child: Text('0')),
                StockholmTableHeaderCell(child: Text('1')),
                StockholmTableHeaderCell(child: Text('2')),
                StockholmTableHeaderCell(child: Text('3')),
                StockholmTableHeaderCell(child: Text('4')),
                StockholmTableHeaderCell(child: Text('5')),
                StockholmTableHeaderCell(child: Text('6')),
                StockholmTableHeaderCell(child: Text('7')),
                StockholmTableHeaderCell(child: Text('8')),
                StockholmTableHeaderCell(child: Text('9')),
              ];
            },
            rowBuilder: (context, row, selected) {
              return [
                StockholmTableCell(child: Text('$row/0')),
                StockholmTableCell(child: Text('$row/1')),
                StockholmTableCell(child: Text('$row/2')),
                StockholmTableCell(child: Text('$row/3')),
                StockholmTableCell(child: Text('$row/4')),
                StockholmTableCell(child: Text('$row/5')),
                StockholmTableCell(child: Text('$row/6')),
                StockholmTableCell(child: Text('$row/7')),
                StockholmTableCell(child: Text('$row/8')),
                StockholmTableCell(child: Text('$row/9')),
              ];
            },
            rowCount: 100,
            columnCount: 10,
            columnWidths: const [50, 50, 50, 50, 50, 50, 50, 50, 50, 50],
          ),
        )
      ],
    );
  }
}
