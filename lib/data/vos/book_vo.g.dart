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
      fields[0] as String?,
      fields[1] as int?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as int?,
      fields[6] as int?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as String?,
      fields[12] as String?,
      fields[13] as String?,
      fields[14] as String?,
      fields[15] as String?,
      fields[16] as String?,
      fields[17] as bool?,
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
      json['bookId'] as String?,
      json['categoryId'] as int?,
      json['categoryName'] as String?,
      json['author'] as String?,
      json['book_image'] as String?,
      json['book_image_width'] as int?,
      json['book_image_height'] as int?,
      json['book_review_link'] as String?,
      json['contributor'] as String?,
      json['contributor_note'] as String?,
      json['created_date'] as String?,
      json['description'] as String?,
      json['price'] as String?,
      json['book_uri'] as String?,
      json['publisher'] as String?,
      json['title'] as String?,
      json['updated_date'] as String?,
      json['selected'] as bool?,
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
