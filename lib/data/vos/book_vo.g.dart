// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookVOAdapter extends TypeAdapter<BookVO> {
  @override
  final int typeId = 1;

  @override
  BookVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookVO(
      bookId: fields[0] as String?,
      categoryId: fields[1] as int?,
      categoryName: fields[2] as String?,
      author: fields[3] as String?,
      bookImage: fields[4] as String?,
      bookImageWidth: fields[5] as int?,
      bookImageHeight: fields[6] as int?,
      bookReviewLink: fields[7] as String?,
      contributor: fields[8] as String?,
      contributorNote: fields[9] as String?,
      createdDate: fields[10] as String?,
      description: fields[11] as String?,
      price: fields[12] as String?,
      book_uri: fields[13] as String?,
      publisher: fields[14] as String?,
      title: fields[15] as String?,
      updatedDate: fields[16] as String?,
      selected: fields[17] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, BookVO obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.bookId)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.categoryName)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.bookImage)
      ..writeByte(5)
      ..write(obj.bookImageWidth)
      ..writeByte(6)
      ..write(obj.bookImageHeight)
      ..writeByte(7)
      ..write(obj.bookReviewLink)
      ..writeByte(8)
      ..write(obj.contributor)
      ..writeByte(9)
      ..write(obj.contributorNote)
      ..writeByte(10)
      ..write(obj.createdDate)
      ..writeByte(11)
      ..write(obj.description)
      ..writeByte(12)
      ..write(obj.price)
      ..writeByte(13)
      ..write(obj.book_uri)
      ..writeByte(14)
      ..write(obj.publisher)
      ..writeByte(15)
      ..write(obj.title)
      ..writeByte(16)
      ..write(obj.updatedDate)
      ..writeByte(17)
      ..write(obj.selected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookVO _$BookVOFromJson(Map<String, dynamic> json) => BookVO(
      bookId: json['bookId'] as String?,
      categoryId: json['categoryId'] as int?,
      categoryName: json['categoryName'] as String?,
      author: json['author'] as String?,
      bookImage: json['book_image'] as String?,
      bookImageWidth: json['book_image_width'] as int?,
      bookImageHeight: json['book_image_height'] as int?,
      bookReviewLink: json['book_review_link'] as String?,
      contributor: json['contributor'] as String?,
      contributorNote: json['contributor_note'] as String?,
      createdDate: json['created_date'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      book_uri: json['book_uri'] as String?,
      publisher: json['publisher'] as String?,
      title: json['title'] as String?,
      updatedDate: json['updated_date'] as String?,
      selected: json['selected'] as bool?,
    );

Map<String, dynamic> _$BookVOToJson(BookVO instance) => <String, dynamic>{
      'bookId': instance.bookId,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'author': instance.author,
      'book_image': instance.bookImage,
      'book_image_width': instance.bookImageWidth,
      'book_image_height': instance.bookImageHeight,
      'book_review_link': instance.bookReviewLink,
      'contributor': instance.contributor,
      'contributor_note': instance.contributorNote,
      'created_date': instance.createdDate,
      'description': instance.description,
      'price': instance.price,
      'book_uri': instance.book_uri,
      'publisher': instance.publisher,
      'title': instance.title,
      'updated_date': instance.updatedDate,
      'selected': instance.selected,
    };
