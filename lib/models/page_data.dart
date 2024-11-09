class PageData<T> {
  final int totalPages;
  final int totalElements;
  final bool first;
  final bool last;
  final int size;
  final List<T> content;
  final int number;
  final int numberOfElements;
  final bool empty;

  PageData({
    required this.totalPages,
    required this.totalElements,
    required this.first,
    required this.last,
    required this.size,
    required this.content,
    required this.number,
    required this.numberOfElements,
    required this.empty,
  });

  // Фабричный конструктор для десериализации с помощью функции fromJsonT
  factory PageData.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return PageData(
      totalPages: json['totalPages'] as int,
      totalElements: json['totalElements'] as int,
      first: json['first'] as bool,
      last: json['last'] as bool,
      size: json['size'] as int,
      content:
          (json['content'] as List).map((item) => fromJsonT(item)).toList(),
      number: json['number'] as int,
      numberOfElements: json['numberOfElements'] as int,
      empty: json['empty'] as bool,
    );
  }

  // Метод toJson с функцией преобразования для каждого элемента списка
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    return {
      'totalPages': totalPages,
      'totalElements': totalElements,
      'first': first,
      'last': last,
      'size': size,
      'content': content.map((item) => toJsonT(item)).toList(),
      'number': number,
      'numberOfElements': numberOfElements,
      'empty': empty,
    };
  }

  @override
  String toString() {
    return 'Page{totalPages: $totalPages, totalElements: $totalElements, first: $first, last: $last, size: $size, content: $content, number: $number, numberOfElements: $numberOfElements, empty: $empty}';
  }
}
