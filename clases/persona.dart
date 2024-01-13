import 'tarea.dart';

class Persona {
  final String? nombre;
  final int dni;
  ListadoDeTareas _tareasAsignadas = new ListadoDeTareas();

  Persona(this.nombre, this.dni) {}

  ListadoDeTareas getTareasAsignadas() {
    return _tareasAsignadas;
  }

  void asignarTarea(Tarea tarea) {
    _tareasAsignadas.addTarea(tarea);
  }

  void verTareasAsignadas() {
    _tareasAsignadas.verTareas();
  }

  @override
  toString() => "$nombre - Tareas asignadas: ${this.getTareasAsignadas()}";
}

class GrupoDePersonas {
  String? nombreDeGrupo;
  List<Persona> _integrantes = [];

  GrupoDePersonas(this.nombreDeGrupo);

  @override
  String toString() {
    return "$nombreDeGrupo - Integrantes: $_integrantes";
  }

  void agregarIntegrante(Persona integrante) {
    _integrantes.add(integrante);
  }

  Persona getIntegrantePorNombre(String nombre) {
    return _integrantes.firstWhere((per) => per.nombre == nombre);
  }

  List<int?> getDNIDeIntegrantes() {
    return _integrantes.map((inte) => inte.dni).toList();
  }

  void verIntegrantes() {
    return _integrantes.forEach(print);
  }

  bool existeIntegranteConNombre(String nombreInt) {
    return _integrantes.any((per) => per.nombre == nombreInt);
  }

  bool existeIntegranteConDNI(int idABuscar) {
    return _integrantes.any((per) => per.dni == idABuscar);
  }

  bool estaVacio() {
    return _integrantes.isEmpty;
  }

  void verTareasDeTodos() {
    return _integrantes.forEach((inte) {
      inte.getTareasAsignadas().verTareas();
    });
  }
}
