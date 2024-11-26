enum DeQuien{mio,ella}//Enumeracion para saber de quien es el mensaje

class Mensaje {
  final String text;
  final String? imageUrl;
  final DeQuien deQuien;

Mensaje({
required this.text,
this.imageUrl,
required this.deQuien
});//Constructor


}