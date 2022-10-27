import 'dart:io';

List<Libro> libros = [];
List<CD> cds = [];

class Publicacion {
  String? titulo;
  int? precio;

  Publicacion(String titulo, int precio) {
    this.titulo = titulo;
    this.precio = precio;
  }

  get getTitulo {
    return this.titulo;
  }

  get getPrecio {
    return this.precio;
  }

  void set setTitulo(String titulo) {
    this.titulo = titulo;
  }

  void set setPrecio(int precio) {
    this.precio = precio;
  }
}

class Libro extends Publicacion {
  final int num_paginas;
  Libro(
      {required String titulo, required int precio, required this.num_paginas})
      : super(titulo, precio);

  getAll() {
    stdout.write("   Titulo: " +
        super.getTitulo +
        "   Precio: " +
        super.getPrecio.toString() +
        "   Numero de Páginas: " +
        this.num_paginas.toString());
  }
}

class CD extends Publicacion {
  final int tmp_reproduccion;
  CD(
      {required String titulo,
      required int precio,
      required this.tmp_reproduccion})
      : super(titulo, precio);

  getAll() {
    stdout.write("   Titulo: " +
        super.getTitulo +
        "   Precio: " +
        super.getPrecio.toString() +
        "   Tiempo de Reproducción: " +
        this.tmp_reproduccion.toString());
  }
}

void main() {
  Libro lib = new Libro(titulo: 'La Ecuatoriana', precio: 12, num_paginas: 43);
  libros.add(lib);

  CD cd = new CD(titulo: 'Canciones Andinas', precio: 20, tmp_reproduccion: 23);
  cds.add(cd);
  menu();
}

void menu() {
  stdout.write("Menú Principal\n");
  stdout.write("1. Libros\n");
  stdout.write("2. CDs\n");
  stdout.write("3. Salir\n");
  stdout.write("Elija una opción:");
  String? valor = stdin.readLineSync();
  int x = int.parse(valor!);
  switch (x) {
    case 1:
      menulibros();
      break;
    case 2:
      menuCDs();
      break;
    case 3:
      stdout.write("Hasta Pronto\n");
      break;
    default:
      stdout.write("La opcion elegida no es válida\n");
      menu();
  }
}

void menulibros() {
  stdout.write("Menú de Libros\n");
  stdout.write("1. Agregar Libro\n");
  stdout.write("2. Listar Libros\n");
  stdout.write("3. Volver al menú principal\n");
  stdout.write("Elija una opción:");
  String? valor = stdin.readLineSync();
  int x = int.parse(valor!);
  switch (x) {
    case 1:
      agregarlibro();
      menulibros();
      break;
    case 2:
      listarlibro();
      menulibros();
      break;
    case 3:
      stdout.write("Hasta Pronto\n");
      menu();
      break;
    default:
      stdout.write("La opcion elegida no es valida\n");
      menu();
  }
}

void agregarlibro() {
  stdout.write("Titulo: ");
  String? titulo = stdin.readLineSync();
  String titulos = "$titulo";
  stdout.write("Precio: ");
  String? precio = stdin.readLineSync();
  int precios = int.parse(precio!);
  stdout.write("Nro de Páginas: ");
  String? pagina = stdin.readLineSync();
  int paginas = int.parse(pagina!);
  Libro lib = new Libro(titulo: titulos, precio: precios, num_paginas: paginas);
  libros.add(lib);
}

void listarlibro() {
  for (var i = 0; i < libros.length; i++) {
    var posicion = i + 1;
    stdout.write("$posicion.");
    libros[i].getAll();
    stdout.write("\n");
  }
}

void menuCDs() {
  stdout.write("Menú de CDs\n");
  stdout.write("1. Agregar CD\n");
  stdout.write("2. Listar CDs\n");
  stdout.write("3. Volver al menú principal\n");
  stdout.write("Elija una opción:");
  String? valor = stdin.readLineSync();
  int x = int.parse(valor!);
  switch (x) {
    case 1:
      agregarCD();
      menuCDs();
      break;
    case 2:
      listarCDs();
      menuCDs();
      break;
    case 3:
      stdout.write("Hasta Pronto\n");
      menu();
      break;
    default:
      stdout.write("La opcion elegida no es valida\n");
      menu();
  }
}

void agregarCD() {
  stdout.write("Titulo: ");
  String? titulo = stdin.readLineSync();
  String titulos = "$titulo";
  stdout.write("Precio: ");
  String? precio = stdin.readLineSync();
  int precios = int.parse(precio!);
  stdout.write("Tiempo de Reproducción: ");
  String? tiempo = stdin.readLineSync();
  int tiempos = int.parse(tiempo!);
  CD cd = new CD(titulo: titulos, precio: precios, tmp_reproduccion: tiempos);
  cds.add(cd);
}

void listarCDs() {
  for (var i = 0; i < cds.length; i++) {
    var posicion = i + 1;
    stdout.write("$posicion.");
    cds[i].getAll();
    stdout.write("\n");
  }
}
