import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NumbersRecord extends FirestoreRecord {
  NumbersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Digit" field.
  String? _digit;
  String get digit => _digit ?? '';
  bool hasDigit() => _digit != null;

  // "Letterinfo" field.
  String? _letterinfo;
  String get letterinfo => _letterinfo ?? '';
  bool hasLetterinfo() => _letterinfo != null;

  // "Introduction" field.
  String? _introduction;
  String get introduction => _introduction ?? '';
  bool hasIntroduction() => _introduction != null;

  // "Fact1" field.
  String? _fact1;
  String get fact1 => _fact1 ?? '';
  bool hasFact1() => _fact1 != null;

  // "Fact2" field.
  String? _fact2;
  String get fact2 => _fact2 ?? '';
  bool hasFact2() => _fact2 != null;

  void _initializeFields() {
    _digit = snapshotData['Digit'] as String?;
    _letterinfo = snapshotData['Letterinfo'] as String?;
    _introduction = snapshotData['Introduction'] as String?;
    _fact1 = snapshotData['Fact1'] as String?;
    _fact2 = snapshotData['Fact2'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('numbers');

  static Stream<NumbersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NumbersRecord.fromSnapshot(s));

  static Future<NumbersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NumbersRecord.fromSnapshot(s));

  static NumbersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NumbersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NumbersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NumbersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NumbersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NumbersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNumbersRecordData({
  String? digit,
  String? letterinfo,
  String? introduction,
  String? fact1,
  String? fact2,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Digit': digit,
      'Letterinfo': letterinfo,
      'Introduction': introduction,
      'Fact1': fact1,
      'Fact2': fact2,
    }.withoutNulls,
  );

  return firestoreData;
}

class NumbersRecordDocumentEquality implements Equality<NumbersRecord> {
  const NumbersRecordDocumentEquality();

  @override
  bool equals(NumbersRecord? e1, NumbersRecord? e2) {
    return e1?.digit == e2?.digit &&
        e1?.letterinfo == e2?.letterinfo &&
        e1?.introduction == e2?.introduction &&
        e1?.fact1 == e2?.fact1 &&
        e1?.fact2 == e2?.fact2;
  }

  @override
  int hash(NumbersRecord? e) => const ListEquality()
      .hash([e?.digit, e?.letterinfo, e?.introduction, e?.fact1, e?.fact2]);

  @override
  bool isValidKey(Object? o) => o is NumbersRecord;
}
