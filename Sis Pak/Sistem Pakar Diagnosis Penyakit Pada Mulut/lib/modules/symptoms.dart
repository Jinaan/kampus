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

//   Symptoms({
//     this.gusiBengkakMerahDanBerdarah = false,
//     this.terdapatLukaAntaraGigiDanGusi = false,
//     this.bauMulut = false,
//     this.terdapatBenjolanDiKepalaLeherAtauRahang = false,
//     this.demam = false,
//     this.pusingDanMeriang = false,
//     this.gelisah = false,
//     this.kelelahan = false,
//     this.pecahPecahDanKemerahanPadaSudutMulut = false,
//     this.munculBintikKuningPutihAtauKremDiMulut = false,
//     this.pendarahanApabilaGusiTergores = false,
//     this.gusiMudahBerdarah = false,
//     this.kelenjarGetahBeningDiBawahRahangSeringMembengkak = false,
//     this.permukaanLidahHalus = false,
//     this.lidahBerwarnaMerahKeputihan = false,
//     this.alergiPadaPastaGigiDanObatKumur = false,
//     this.kesulitanMengunyahMenelanDanBerbicara = false,
//     this.sakitSaatMengunyahMakanan = false,
//     this.munculNanah = false,
//     this.peradanganPadaLidah = false,
//     this.sakitSaatMembukaMulut = false,
//     this.nyeriSaatMenelanMakanan = false,
//     this.nyeriGigi = false,
//     this.timbulKerakYangBerlebihan = false,
//     this.kesemutanPadaWilayahBibir = false,
//     this.rasaSakitDanNyeriPadaBibirDanMulut = false,
//     this.bibirTerasaKering = false,
//     this.tubuhMerasaMeriangDanPegalPegal = false,
//     this.sakitDanBercakGatalDiKulitDanMulut = false,
//     this.leherTerasaKaku = false,
//     this.nyeriGusi = false,
//     this.gigiTerasaSakit = false,
//     this.banyakLukaTerbukaBerwarnaPutihDanKuning = false,
//     this.diMulutSepertiTerdapatKapas = false,
//     this.pembengkakanPadaGusi = false,
//     this.nyeriPadaMulut = false,
//     this.pembengkakanKelenjarGetahBeningDiLeher = false,
//     this.kehilanganSeleraMakan = false,
//     this.terasaPusing = false,
//     this.gusiBerwarnaMerahTerang = false,
//     this.ujungGusiMengalamiPengikisan = false,
//     this.kulitTerkelupas = false,
//   });
// }

// class SymptomAction {
//   static Symptoms getSymptoms() {
//     return Symptoms();
//   }
// }
class Symptoms {
  late Map<String, dynamic> symptoms = {
    "Gusi Bengkak Merah Dan Berdarah": false,
    "Terdapat Luka Antara Gigi Dan Gusi": false,
    "Bau Mulut": false,
    "Terdapat Benjolan Di Kepala Leher Atau Rahang": false,
    "Demam": false,
    "Pusing Dan Meriang": false,
    "Gelisah": false,
    "Kelelahan": false,
    "Pecah Pecah Dan Kemerahan Pada Sudut Mulut": false,
    "Muncul Bintik Kuning Putih Atau Krem Di Mulut": false,
    "Pendarahan Apabila Gusi Tergores": false,
    "Gusi Mudah Berdarah": false,
    "Kelenjar Getah Bening DiBawah Rahang Sering Membengkak": false,
    "Permukaan Lidah Halus": false,
    "Lidah Berwarna Merah Keputihan": false,
    "Alergi Pada Pasta Gigi Dan Obat Kumur": false,
    "Kesulitan Mengunyah Menelan Dan Berbicara": false,
    "Sakit Saat Mengunyah Makanan": false,
    "Muncul Nanah": false,
    "Peradangan Pada Lidah": false,
    "Sakit Saat Membuka Mulut": false,
    "Nyeri Saat Menelan Makanan": false,
    "Nyeri Gigi": false,
    "Timbul Kerak Yang Berlebihan": false,
    "Kesemutan Pada Wilayah Bibir": false,
    "Rasa Sakit Dan Nyeri Pada Bibir Dan Mulut": false,
    "Bibir Terasa Kering": false,
    "Tubuh Merasa Meriang Dan Pegal Pegal": false,
    "Sakit Dan Bercak Gatal DiKulit Dan Mulut": false,
    "Leher Terasa Kaku": false,
    "Nyeri Gusi": false,
    "Gigi Terasa Sakit": false,
    "Banyak Luka Terbuka Berwarna Putih Dan Kuning": false,
    "DiMulut Seperti Terdapat Kapas": false,
    "Pembengkakan Pada Gusi": false,
    "Nyeri Pada Mulut": false,
    "Pembengkakan Kelenjar Getah Bening DiLeher": false,
    "Kehilangan Selera Makan": false,
    "Terasa Pusing": false,
    "Gusi Berwarna Merah Terang": false,
    "Ujung Gusi Mengalami Pengikisan": false,
    "Kulit Terkelupas": false,
  };
  List<String> getSymptomsKeys() {
    return symptoms.keys.toList();
  }
}
