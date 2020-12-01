import 'dart:typed_data';
import 'package:lpinyin/lpinyin.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';

var excel;
SpreadsheetDecoder decoder;
List requiredRow;
Uint8List bytes;

Future<SpreadsheetDecoder> getExcel() async {
  ByteData data = await rootBundle.load("assets/qanda.xlsx");
  var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  excel = SpreadsheetDecoder.decodeBytes(bytes, update: true);
  return excel;
}

Future<List> readExcel(int j) async {
  List hanzisentences = [];

  int startingRownumber = 0;
  int endingRownumber = 94;

  String hanziold;

  await getExcel();

  var table = excel.tables["vocab"];

  for (int i = startingRownumber; i < endingRownumber; i++) {
    var value = table.rows[i];

    hanziold = value[j];

    hanzisentences.add(hanziold);
  }

  return hanzisentences;
}

Future<String> hanziToPinyin() async {
  int startingColnumber = 0;

  for (int j = startingColnumber; j < 1; j++) {
    List pinyinlist = [];
    var hanzi = await readExcel(j);

    for (int i = 0; i < hanzi.length; i++) {
      String pinyin = PinyinHelper.getPinyin(hanzi[i],
          separator: " ", format: PinyinFormat.WITH_TONE_MARK);

      pinyinlist.add(pinyin);
    }
    print(pinyinlist);
  }
}
