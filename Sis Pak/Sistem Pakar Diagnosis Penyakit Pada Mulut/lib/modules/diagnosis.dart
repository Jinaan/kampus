import 'symptoms.dart';

class Diagnosis {
  static String? diagnoseGinggivitis(Symptoms s) {
    if (s.symptoms["Gusi Bengkak Merah Dan Berdarah"] &&
        s.symptoms["Terdapat Luka Antara Gigi Dan Gusi"] &&
        s.symptoms["Bau Mulut"] &&
        s.symptoms["Terdapat Benjolan Di Kepala Leher Atau Rahang"] &&
        s.symptoms["Demam"]) {
      return "GINGGVITIS (P001)";
    }
    return null;
  }

  static String? diagnoseTrenchMouth(Symptoms s) {
    if (s.symptoms["Gusi Mudah Berdarah"] &&
        s.symptoms["Kelenjar Getah Bening DiBawah Rahang Sering Membengkak"] &&
        s.symptoms["Pusing Dan Meriang"] &&
        s.symptoms["Gelisah"] &&
        s.symptoms["Kelelahan"]) {
      return "TRENCH MOUTH (P002)";
    }
    return null;
  }

  static String? diagnoseKandidiasis(Symptoms s) {
    if (s.symptoms["Pecah Pecah Dan Kemerahan Pada Sudut Mulut"] &&
        s.symptoms["Muncul Bintik Kuning Putih Atau Krem Di Mulut"] &&
        s.symptoms["Pendarahan Apabila Gusi Tergores"] &&
        s.symptoms["Gusi Mudah Berdarah"] &&
        s.symptoms["DiMulut Seperti Terdapat Kapas"]) {
      return "KANDIDIASIS (P003)";
    }
    return null;
  }

  static String? diagnoseAbsesPeriodental(Symptoms s) {
    if (s.symptoms["Pembengkakan Pada Gusi"] &&
        s.symptoms["Nyeri Pada Mulut"] &&
        s.symptoms["Sakit Saat Mengunyah Makanan"] &&
        s.symptoms["Muncul Nanah"]) {
      return "ABSES PERIODENTAL (P004)";
    }
    return null;
  }

  static String? diagnoseGlossitis(Symptoms s) {
    if (s.symptoms["Peradangan Pada Lidah"] &&
        s.symptoms["Permukaan Lidah Halus"] &&
        s.symptoms["Lidah Berwarna Merah Keputihan"] &&
        s.symptoms["Alergi Pada Pasta Gigi Dan Obat Kumur"] &&
        s.symptoms["Kesulitan Mengunyah Menelan Dan Berbicara"]) {
      return "GLOSSITIS (P005)";
    }
    return null;
  }

  static String? diagnoseAbsesPeriapikal(Symptoms s) {
    if (s.symptoms["Sakit Saat Membuka Mulut"] &&
        s.symptoms["Nyeri Saat Menelan Makanan"] &&
        s.symptoms["Gigi Terasa Sakit"] &&
        s.symptoms["Nyeri Gusi"] &&
        s.symptoms["Pembengkakan Kelenjar Getah Bening DiLeher"]) {
      return "ABSES PERIAPIKAL (P006)";
    }
    return null;
  }

  static String? diagnoseHerpesLabialis(Symptoms s) {
    if (s.symptoms["Kulit Terkelupas"] &&
        s.symptoms["Timbul Kerak Yang Berlebihan"] &&
        s.symptoms["Kesemutan Pada Wilayah Bibir"] &&
        s.symptoms["Rasa Sakit Dan Nyeri Pada Bibir Dan Mulut"] &&
        s.symptoms["Bibir Terasa Kering"]) {
      return "HERPES LABIALIS (P007)";
    }
    return null;
  }

  static String? diagnoseHerpesZoster(Symptoms s) {
    if (s.symptoms["Kehilangan Selera Makan"] &&
        s.symptoms["Tubuh Merasa Meriang Dan Pegal Pegal"] &&
        s.symptoms["Terasa Pusing"] &&
        s.symptoms["Sakit Dan Bercak Gatal DiKulit Dan Mulut"]) {
      return "HERPES ZOSTER (P008)";
    }
    return null;
  }

  static String? diagnoseAbsesPeriapik(Symptoms s) {
    if (s.symptoms["Leher Terasa Kaku"] &&
        s.symptoms["Timbul Kerak Yang Berlebihan"] &&
        s.symptoms["Kesemutan Pada Wilayah Bibir"] &&
        s.symptoms["Rasa Sakit Dan Nyeri Pada Bibir Dan Mulut"] &&
        s.symptoms["Bibir Terasa Kering"]) {
      return "ABSES PERIAPIK (P009)";
    }
    return null;
  }

  static String? diagnoseGingivostomatiitis(Symptoms s) {
    if (s.symptoms["Ujung Gusi Mengalami Pengikisan"] &&
        s.symptoms["Gusi Bengkak Merah Dan Berdarah"] &&
        s.symptoms["Gusi Berwarna Merah Terang"] &&
        s.symptoms["Banyak Luka Terbuka Berwarna Putih Dan Kuning"]) {
      return "GINGIVOSTOMATIITIS (P010)";
    }
    return null;
  }

  static List<String> diagnoseAll(Symptoms s) {
    // print(s.symptoms);
    List<String> result = [];
    // result.add(diagnoseGinggivitis(s));
    if (diagnoseGinggivitis(s) != null) {
      result.add(diagnoseGinggivitis(s)!);
    }
    if (diagnoseTrenchMouth(s) != null) {
      result.add(diagnoseTrenchMouth(s)!);
    }
    if (diagnoseKandidiasis(s) != null) {
      result.add(diagnoseKandidiasis(s)!);
    }
    if (diagnoseAbsesPeriodental(s) != null) {
      result.add(diagnoseAbsesPeriodental(s)!);
    }
    if (diagnoseGlossitis(s) != null) {
      result.add(diagnoseGlossitis(s)!);
    }
    if (diagnoseAbsesPeriapikal(s) != null) {
      result.add(diagnoseAbsesPeriapikal(s)!);
    }
    if (diagnoseHerpesLabialis(s) != null) {
      result.add(diagnoseHerpesLabialis(s)!);
    }
    if (diagnoseHerpesZoster(s) != null) {
      result.add(diagnoseHerpesZoster(s)!);
    }
    if (diagnoseAbsesPeriapik(s) != null) {
      result.add(diagnoseAbsesPeriapik(s)!);
    }
    if (diagnoseGingivostomatiitis(s) != null) {
      result.add(diagnoseGingivostomatiitis(s)!);
    }

    if (result.every((element) => element.isEmpty)) {
      result.add("Tidak ada diagnosis yang sesuai");
    }
    return result;
  }
}
