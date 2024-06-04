import 'package:flutter/material.dart';

import 'screen/autentikasi/login.dart';
import 'screen/navbar/botomNavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: LoginPage(),
      home: BottomNavBar(user: 'user'),
    );
  }
}

// class Symptoms {
//   late bool gusiBengkakMerahDanBerdarah = false;
//   late bool terdapatLukaAntaraGigiDanGusi = false;
//   late bool bauMulut = false;
//   late bool terdapatBenjolanDiKepalaLeherAtauRahang = false;
//   late bool demam = false;
//   late bool pusingDanMeriang = false;
//   late bool gelisah = false;
//   late bool kelelahan = false;
//   late bool pecahPecahDanKemerahanPadaSudutMulut = false;
//   late bool munculBintikKuningPutihAtauKremDiMulut = false;
//   late bool pendarahanApabilaGusiTergores = false;
//   late bool gusiMudahBerdarah = false;
//   late bool kelenjarGetahBeningDiBawahRahangSeringMembengkak = false;
//   late bool permukaanLidahHalus = false;
//   late bool lidahBerwarnaMerahKeputihan = false;
//   late bool alergiPadaPastaGigiDanObatKumur = false;
//   late bool kesulitanMengunyahMenelanDanBerbicara = false;
//   late bool sakitSaatMengunyahMakanan = false;
//   late bool munculNanah = false;
//   late bool peradanganPadaLidah = false;
//   late bool sakitSaatMembukaMulut = false;
//   late bool nyeriSaatMenelanMakanan = false;
//   late bool nyeriGigi = false;
//   late bool timbulKerakYangBerlebihan = false;
//   late bool kesemutanPadaWilayahBibir = false;
//   late bool rasaSakitDanNyeriPadaBibirDanMulut = false;
//   late bool bibirTerasaKering = false;
//   late bool tubuhMerasaMeriangDanPegalPegal = false;
//   late bool sakitDanBercakGatalDiKulitDanMulut = false;
//   late bool leherTerasaKaku = false;
//   late bool nyeriGusi = false;
//   late bool gigiTerasaSakit = false;
//   late bool banyakLukaTerbukaBerwarnaPutihDanKuning = false;
//   late bool diMulutSepertiTerdapatKapas = false;
//   late bool pembengkakanPadaGusi = false;
//   late bool nyeriPadaMulut = false;
//   late bool pembengkakanKelenjarGetahBeningDiLeher = false;
//   late bool kehilanganSeleraMakan = false;
//   late bool terasaPusing = false;
//   late bool gusiBerwarnaMerahTerang = false;
//   late bool ujungGusiMengalamiPengikisan = false;
//   late bool kulitTerkelupas = false;
// }

// class Diagnosis {
//   static String? diagnoseGinggivitis(Symptoms s) {
//     if (s.gusiBengkakMerahDanBerdarah &&
//         s.terdapatLukaAntaraGigiDanGusi &&
//         s.bauMulut &&
//         s.terdapatBenjolanDiKepalaLeherAtauRahang &&
//         s.demam) {
//       return "GINGGVITIS (P001)";
//     }
//     return null;
//   }

//   static String? diagnoseTrenchMouth(Symptoms s) {
//     if (s.gusiMudahBerdarah &&
//         s.kelenjarGetahBeningDiBawahRahangSeringMembengkak &&
//         s.pusingDanMeriang &&
//         s.gelisah &&
//         s.kelelahan) {
//       return "TRENCH MOUTH (P002)";
//     }
//     return null;
//   }

//   static String? diagnoseKandidiasis(Symptoms s) {
//     if (s.pecahPecahDanKemerahanPadaSudutMulut &&
//         s.munculBintikKuningPutihAtauKremDiMulut &&
//         s.pendarahanApabilaGusiTergores &&
//         s.gusiMudahBerdarah &&
//         s.diMulutSepertiTerdapatKapas) {
//       return "KANDIDIASIS (P003)";
//     }
//     return null;
//   }

//   static String? diagnoseAbsesPeriodental(Symptoms s) {
//     if (s.pembengkakanPadaGusi &&
//         s.nyeriPadaMulut &&
//         s.sakitSaatMengunyahMakanan &&
//         s.munculNanah) {
//       return "ABSES PERIODENTAL (P004)";
//     }
//     return null;
//   }

//   static String? diagnoseGlossitis(Symptoms s) {
//     if (s.peradanganPadaLidah &&
//         s.permukaanLidahHalus &&
//         s.lidahBerwarnaMerahKeputihan &&
//         s.alergiPadaPastaGigiDanObatKumur &&
//         s.kesulitanMengunyahMenelanDanBerbicara) {
//       return "GLOSSITIS (P005)";
//     }
//     return null;
//   }

//   static String? diagnoseAbsesPeriapikal(Symptoms s) {
//     if (s.sakitSaatMembukaMulut &&
//         s.nyeriSaatMenelanMakanan &&
//         s.gigiTerasaSakit &&
//         s.nyeriGusi &&
//         s.pembengkakanKelenjarGetahBeningDiLeher) {
//       return "ABSES PERIAPIKAL (P006)";
//     }
//     return null;
//   }

//   static String? diagnoseHerpesLabialis(Symptoms s) {
//     if (s.kulitTerkelupas &&
//         s.timbulKerakYangBerlebihan &&
//         s.kesemutanPadaWilayahBibir &&
//         s.rasaSakitDanNyeriPadaBibirDanMulut &&
//         s.bibirTerasaKering) {
//       return "HERPES LABIALIS (P007)";
//     }
//     return null;
//   }

//   static String? diagnoseHerpesZoster(Symptoms s) {
//     if (s.kehilanganSeleraMakan &&
//         s.tubuhMerasaMeriangDanPegalPegal &&
//         s.terasaPusing &&
//         s.sakitDanBercakGatalDiKulitDanMulut) {
//       return "HERPES ZOSTER (P008)";
//     }
//     return null;
//   }

//   static String? diagnoseAbsesPeriapik(Symptoms s) {
//     if (s.leherTerasaKaku &&
//         s.timbulKerakYangBerlebihan &&
//         s.kesemutanPadaWilayahBibir &&
//         s.rasaSakitDanNyeriPadaBibirDanMulut &&
//         s.bibirTerasaKering) {
//       return "ABSES PERIAPIK (P009)";
//     }
//     return null;
//   }

//   static String? diagnoseGingivostomatiitis(Symptoms s) {
//     if (s.ujungGusiMengalamiPengikisan &&
//         s.gusiBengkakMerahDanBerdarah &&
//         s.gusiBerwarnaMerahTerang &&
//         s.banyakLukaTerbukaBerwarnaPutihDanKuning) {
//       return "GINGIVOSTOMATIITIS (P010)";
//     }
//     return null;
//   }

//   static List<String> diagnoseAll(Symptoms s) {
//     List<String> result = [];
//     // result.add(diagnoseGinggivitis(s));
//     if (diagnoseGinggivitis(s) != null) {
//       result.add(diagnoseGinggivitis(s)!);
//     }
//     if (diagnoseTrenchMouth(s) != null) {
//       result.add(diagnoseTrenchMouth(s)!);
//     }
//     if (diagnoseKandidiasis(s) != null) {
//       result.add(diagnoseKandidiasis(s)!);
//     }
//     if (diagnoseAbsesPeriodental(s) != null) {
//       result.add(diagnoseAbsesPeriodental(s)!);
//     }
//     if (diagnoseGlossitis(s) != null) {
//       result.add(diagnoseGlossitis(s)!);
//     }
//     if (diagnoseAbsesPeriapikal(s) != null) {
//       result.add(diagnoseAbsesPeriapikal(s)!);
//     }
//     if (diagnoseHerpesLabialis(s) != null) {
//       result.add(diagnoseHerpesLabialis(s)!);
//     }
//     if (diagnoseHerpesZoster(s) != null) {
//       result.add(diagnoseHerpesZoster(s)!);
//     }
//     if (diagnoseAbsesPeriapik(s) != null) {
//       result.add(diagnoseAbsesPeriapik(s)!);
//     }
//     if (diagnoseGingivostomatiitis(s) != null) {
//       result.add(diagnoseGingivostomatiitis(s)!);
//     }

//     if (result.every((element) => element.isEmpty)) {
//       result.add("Tidak ada diagnosis yang sesuai");
//     }
//     return result;
//   }
// }

// // Example usage
// void main() {
//   Symptoms s = Symptoms();
//   s.gusiBengkakMerahDanBerdarah = true;
//   s.terdapatLukaAntaraGigiDanGusi = true;
//   s.bauMulut = true;
//   s.terdapatBenjolanDiKepalaLeherAtauRahang = true;
//   s.demam = true;
//   s.pusingDanMeriang = true;
//   s.gelisah = true;

//   s.gusiMudahBerdarah = true;
//   s.kelenjarGetahBeningDiBawahRahangSeringMembengkak = true;
//   s.pusingDanMeriang = true;
//   s.gelisah = true;
//   s.kelelahan = true;

//   print(Diagnosis.diagnoseAll(s));
// }




// try another aproach using json

// class Symptoms {
//   late Map<String, dynamic> symptoms = {
//     "gusiBengkakMerahDanBerdarah": false,
//     "terdapatLukaAntaraGigiDanGusi": false,
//     "bauMulut": false,
//     "terdapatBenjolanDiKepalaLeherAtauRahang": false,
//     "demam": false,
//     "pusingDanMeriang": false,
//     "gelisah": false,
//     "kelelahan": false,
//     "pecahPecahDanKemerahanPadaSudutMulut": false,
//     "munculBintikKuningPutihAtauKremDiMulut": false,
//     "pendarahanApabilaGusiTergores": false,
//     "gusiMudahBerdarah": false,
//     "kelenjarGetahBeningDiBawahRahangSeringMembengkak": false,
//     "permukaanLidahHalus": false,
//     "lidahBerwarnaMerahKeputihan": false,
//     "alergiPadaPastaGigiDanObatKumur": false,
//     "kesulitanMengunyahMenelanDanBerbicara": false,
//     "sakitSaatMengunyahMakanan": false,
//     "munculNanah": false,
//     "peradanganPadaLidah": false,
//     "sakitSaatMembukaMulut": false,
//     "nyeriSaatMenelanMakanan": false,
//     "nyeriGigi": false,
//     "timbulKerakYangBerlebihan": false,
//     "kesemutanPadaWilayahBibir": false,
//     "rasaSakitDanNyeriPadaBibirDanMulut": false,
//     "bibirTerasaKering": false,
//     "tubuhMerasaMeriangDanPegalPegal": false,
//     "sakitDanBercakGatalDiKulitDanMulut": false,
//     "leherTerasaKaku": false,
//     "nyeriGusi": false,
//     "gigiTerasaSakit": false,
//     "banyakLukaTerbukaBerwarnaPutihDanKuning": false,
//     "diMulutSepertiTerdapatKapas": false,
//     "pembengkakanPadaGusi": false,
//     "nyeriPadaMulut": false,
//     "pembengkakanKelenjarGetahBeningDiLeher": false,
//     "kehilanganSeleraMakan": false,
//     "terasaPusing": false,
//     "gusiBerwarnaMerahTerang": false,
//     "ujungGusiMengalamiPengikisan": false,
//     "kulitTerkelupas": false,
//   };
// }

// class Diagnosis {
//   static String? diagnoseGinggivitis(Symptoms s) {
//     if (s.symptoms["gusiBengkakMerahDanBerdarah"] &&
//         s.symptoms["terdapatLukaAntaraGigiDanGusi"] &&
//         s.symptoms["bauMulut"] &&
//         s.symptoms["terdapatBenjolanDiKepalaLeherAtauRahang"] &&
//         s.symptoms["demam"]) {
//       return "GINGGVITIS (P001)";
//     }
//     return null;
//   }

//   static String? diagnoseTrenchMouth(Symptoms s) {
//     if (s.symptoms["gusiMudahBerdarah"] &&
//         s.symptoms["kelenjarGetahBeningDiBawahRahangSeringMembengkak"] &&
//         s.symptoms["pusingDanMeriang"] &&
//         s.symptoms["gelisah"] &&
//         s.symptoms["kelelahan"]) {
//       return "TRENCH MOUTH (P002)";
//     }
//     return null;
//   }

//   static String? diagnoseKandidiasis(Symptoms s) {
//     if (s.symptoms["pecahPecahDanKemerahanPadaSudutMulut"] &&
//         s.symptoms["munculBintikKuningPutihAtauKremDiMulut"] &&
//         s.symptoms["pendarahanApabilaGusiTergores"] &&
//         s.symptoms["gusiMudahBerdarah"] &&
//         s.symptoms["diMulutSepertiTerdapatKapas"]) {
//       return "KANDIDIASIS (P003)";
//     }
//     return null;
//   }

//   static String? diagnoseAbsesPeriodental(Symptoms s) {
//     if (s.symptoms["pembengkakanPadaGusi"] &&
//         s.symptoms["nyeriPadaMulut"] &&
//         s.symptoms["sakitSaatMengunyahMakanan"] &&
//         s.symptoms["munculNanah"]) {
//       return "ABSES PERIODENTAL (P004)";
//     }
//     return null;
//   }

//   static String? diagnoseGlossitis(Symptoms s) {
//     if (s.symptoms["peradanganPadaLidah"] &&
//         s.symptoms["permukaanLidahHalus"] &&
//         s.symptoms["lidahBerwarnaMerahKeputihan"] &&
//         s.symptoms["alergiPadaPastaGigiDanObatKumur"] &&
//         s.symptoms["kesulitanMengunyahMenelanDanBerbicara"]) {
//       return "GLOSSITIS (P005)";
//     }
//     return null;
//   }

//   static String? diagnoseAbsesPeriapikal(Symptoms s) {
//     if (s.symptoms["sakitSaatMembukaMulut"] &&
//         s.symptoms["nyeriSaatMenelanMakanan"] &&
//         s.symptoms["gigiTerasaSakit"] &&
//         s.symptoms["nyeriGusi"] &&
//         s.symptoms["pembengkakanKelenjarGetahBeningDiLeher"]) {
//       return "ABSES PERIAPIKAL (P006)";
//     }
//     return null;
//   }

//   static String? diagnoseHerpesLabialis(Symptoms s) {
//     if (s.symptoms["kulitTerkelupas"] &&
//         s.symptoms["timbulKerakYangBerlebihan"] &&
//         s.symptoms["kesemutanPadaWilayahBibir"] &&
//         s.symptoms["rasaSakitDanNyeriPadaBibirDanMulut"] &&
//         s.symptoms["bibirTerasaKering"]) {
//       return "HERPES LABIALIS (P007)";
//     }
//     return null;
//   }

//   static String? diagnoseHerpesZoster(Symptoms s) {
//     if (s.symptoms["kehilanganSeleraMakan"] &&
//         s.symptoms["tubuhMerasaMeriangDanPegalPegal"] &&
//         s.symptoms["terasaPusing"] &&
//         s.symptoms["sakitDanBercakGatalDiKulitDanMulut"]) {
//       return "HERPES ZOSTER (P008)";
//     }
//     return null;
//   }

//   static String? diagnoseAbsesPeriapik(Symptoms s) {
//     if (s.symptoms["leherTerasaKaku"] &&
//         s.symptoms["timbulKerakYangBerlebihan"] &&
//         s.symptoms["kesemutanPadaWilayahBibir"] &&
//         s.symptoms["rasaSakitDanNyeriPadaBibirDanMulut"] &&
//         s.symptoms["bibirTerasaKering"]) {
//       return "ABSES PERIAPIK (P009)";
//     }
//     return null;
//   }

//   static String? diagnoseGingivostomatiitis(Symptoms s) {
//     if (s.symptoms["ujungGusiMengalamiPengikisan"] &&
//         s.symptoms["gusiBengkakMerahDanBerdarah"] &&
//         s.symptoms["gusiBerwarnaMerahTerang"] &&
//         s.symptoms["banyakLukaTerbukaBerwarnaPutihDanKuning"]) {
//       return "GINGIVOSTOMATIITIS (P010)";
//     }
//     return null;
//   }

//   static List<String> diagnoseAll(Symptoms s) {
//     List<String> result = [];
//     // result.add(diagnoseGinggivitis(s));
//     if (diagnoseGinggivitis(s) != null) {
//       result.add(diagnoseGinggivitis(s)!);
//     }
//     if (diagnoseTrenchMouth(s) != null) {
//       result.add(diagnoseTrenchMouth(s)!);
//     }
//     if (diagnoseKandidiasis(s) != null) {
//       result.add(diagnoseKandidiasis(s)!);
//     }
//     if (diagnoseAbsesPeriodental(s) != null) {
//       result.add(diagnoseAbsesPeriodental(s)!);
//     }
//     if (diagnoseGlossitis(s) != null) {
//       result.add(diagnoseGlossitis(s)!);
//     }
//     if (diagnoseAbsesPeriapikal(s) != null) {
//       result.add(diagnoseAbsesPeriapikal(s)!);
//     }
//     if (diagnoseHerpesLabialis(s) != null) {
//       result.add(diagnoseHerpesLabialis(s)!);
//     }
//     if (diagnoseHerpesZoster(s) != null) {
//       result.add(diagnoseHerpesZoster(s)!);
//     }
//     if (diagnoseAbsesPeriapik(s) != null) {
//       result.add(diagnoseAbsesPeriapik(s)!);
//     }
//     if (diagnoseGingivostomatiitis(s) != null) {
//       result.add(diagnoseGingivostomatiitis(s)!);
//     }

//     if (result.every((element) => element.isEmpty)) {
//       result.add("Tidak ada diagnosis yang sesuai");
//     }
//     return result;
//   }
// }

// // Example usage
// void main() {
//   Symptoms s = Symptoms();
//   s.symptoms["gusiBengkakMerahDanBerdarah"] = true;
//   s.symptoms["terdapatLukaAntaraGigiDanGusi"] = true;
//   s.symptoms["bauMulut"] = true;
//   s.symptoms["terdapatBenjolanDiKepalaLeherAtauRahang"] = true;
//   s.symptoms["demam"] = true;
//   s.symptoms["pusingDanMeriang"] = true;
//   s.symptoms["gelisah"] = true;

//   s.symptoms["gusiMudahBerdarah"] = true;
//   s.symptoms["kelenjarGetahBeningDiBawahRahangSeringMembengkak"] = true;
//   s.symptoms["pusingDanMeriang"] = true;
//   s.symptoms["gelisah"] = true;
//   s.symptoms["kelelahan"] = true;

//   print(Diagnosis.diagnoseAll(s));
// }
