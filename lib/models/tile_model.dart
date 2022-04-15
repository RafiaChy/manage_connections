import 'package:equatable/equatable.dart';

class TileModel extends Equatable {
  final String title;
  final String imagePath;
  bool isSelected;
  bool isSynced;
 
  TileModel({
    required this.title,
    required this.imagePath,
    required this.isSelected,
    required this.isSynced,
    
  });

  @override
  List<Object?> get props => [title, imagePath, isSelected, isSynced];
}
