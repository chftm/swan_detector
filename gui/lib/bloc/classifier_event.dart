sealed class ClassifierEvent {}

class UploadFile extends ClassifierEvent {
  final Uri fileUri;

  UploadFile(this.fileUri);
}

class Back extends ClassifierEvent {}
