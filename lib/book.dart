class Book {
  String id;
  String title;
  String authors;
  String descritpion;
  String editor;
  String urlImage;

  Book(this.id, this.title, this.authors, this.descritpion, this.editor,
      this.urlImage);

  Book.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.title = map['volumeInfo']['title'];
    this.authors = (map['volumeInfo']['authors'] == null)
        ? ''
        : map['volumeInfo']['authors'].toString();
    this.descritpion = (map['volumeInfo']['description'] == null)
        ? ''
        : map['volumeInfo']['description'].toString();
    this.editor = (map['volumeInfo']['publisher'] == null)
        ? ''
        : map['volumeInfo']['publisher'].toString();
    try {
      this.urlImage =
          (map['volumeInfo']['imageLinks']['smallThumbnail'] == null)
              ? ''
              : map['volumeInfo']['imageLinks']['smallThumbnail'].toString();
    } catch (err) {
      this.urlImage = '';
    }
  }
}
