class FileClassificationResult {
  final int klikun;
  final int shipun;
  final int maliy;

  int get total => klikun + shipun + maliy;

  FileClassificationResult({
    required this.klikun,
    required this.shipun,
    required this.maliy,
  });
}
