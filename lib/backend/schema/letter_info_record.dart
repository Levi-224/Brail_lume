import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LetterInfoRecord extends FirestoreRecord {
  LetterInfoRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Letter" field.
  String? _letter;
  String get letter => _letter ?? '';
  bool hasLetter() => _letter != null;

  // "Country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "AgeGroup" field.
  String? _ageGroup;
  String get ageGroup => _ageGroup ?? '';
  bool hasAgeGroup() => _ageGroup != null;

  // "Letterinfo" field.
  String? _letterinfo;
  String get letterinfo => _letterinfo ?? '';
  bool hasLetterinfo() => _letterinfo != null;

  // "InitialIntroduction" field.
  String? _initialIntroduction;
  String get initialIntroduction => _initialIntroduction ?? '';
  bool hasInitialIntroduction() => _initialIntroduction != null;

  // "WordSentence" field.
  String? _wordSentence;
  String get wordSentence => _wordSentence ?? '';
  bool hasWordSentence() => _wordSentence != null;

  // "ShortStory" field.
  String? _shortStory;
  String get shortStory => _shortStory ?? '';
  bool hasShortStory() => _shortStory != null;

  // "Rhyme" field.
  String? _rhyme;
  String get rhyme => _rhyme ?? '';
  bool hasRhyme() => _rhyme != null;

  void _initializeFields() {
    _letter = snapshotData['Letter'] as String?;
    _country = snapshotData['Country'] as String?;
    _ageGroup = snapshotData['AgeGroup'] as String?;
    _letterinfo = snapshotData['Letterinfo'] as String?;
    _initialIntroduction = snapshotData['InitialIntroduction'] as String?;
    _wordSentence = snapshotData['WordSentence'] as String?;
    _shortStory = snapshotData['ShortStory'] as String?;
    _rhyme = snapshotData['Rhyme'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('letter_info');

  static Stream<LetterInfoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LetterInfoRecord.fromSnapshot(s));

  static Future<LetterInfoRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LetterInfoRecord.fromSnapshot(s));

  static LetterInfoRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LetterInfoRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LetterInfoRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LetterInfoRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LetterInfoRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LetterInfoRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLetterInfoRecordData({
  String? letter,
  String? country,
  String? ageGroup,
  String? letterinfo,
  String? initialIntroduction,
  String? wordSentence,
  String? shortStory,
  String? rhyme,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Letter': letter,
      'Country': country,
      'AgeGroup': ageGroup,
      'Letterinfo': letterinfo,
      'InitialIntroduction': initialIntroduction,
      'WordSentence': wordSentence,
      'ShortStory': shortStory,
      'Rhyme': rhyme,
    }.withoutNulls,
  );

  return firestoreData;
}

class LetterInfoRecordDocumentEquality implements Equality<LetterInfoRecord> {
  const LetterInfoRecordDocumentEquality();

  @override
  bool equals(LetterInfoRecord? e1, LetterInfoRecord? e2) {
    return e1?.letter == e2?.letter &&
        e1?.country == e2?.country &&
        e1?.ageGroup == e2?.ageGroup &&
        e1?.letterinfo == e2?.letterinfo &&
        e1?.initialIntroduction == e2?.initialIntroduction &&
        e1?.wordSentence == e2?.wordSentence &&
        e1?.shortStory == e2?.shortStory &&
        e1?.rhyme == e2?.rhyme;
  }

  @override
  int hash(LetterInfoRecord? e) => const ListEquality().hash([
        e?.letter,
        e?.country,
        e?.ageGroup,
        e?.letterinfo,
        e?.initialIntroduction,
        e?.wordSentence,
        e?.shortStory,
        e?.rhyme
      ]);

  @override
  bool isValidKey(Object? o) => o is LetterInfoRecord;
}
