import 'package:intl/intl.dart';

class Tarea {
  String? nombre;
  final fechaEntrega;
  late final DateTime fechaCreacion;
  late final DateTime fechaFinalizacion;
  String? descripcion;
  bool _estaCompleta = false;

  Tarea(
      {required this.nombre,
      required this.fechaEntrega,
      required fechaCreacion,
      this.descripcion});

  bool get estadoActual => _estaCompleta;

  void cambiarEstado() => _estaCompleta = !_estaCompleta;

  @override
  String toString() {
    return "$nombre - Creada en fecha ${DateFormat('yyyy-MM-dd').format(DateTime.now())} - A completarse en fecha ${DateFormat('yyyy-MM-dd').format(fechaEntrega)} - $descripcion";
    // El DateFormat viene con el paquete de intl te permite formatear el DateTime como quieras en este caso lo use para que no muestre la hora.
  }
}

class ListadoDeTareas {
  List<Tarea> tareas = [];

  List<Tarea> getTareas() {
    return tareas;
  }

  Tarea getTareaPorNombre(String nombreABuscar) {
    return tareas.firstWhere((tarea) => tarea.nombre == nombreABuscar);
  }

  List<String?> getTareasPorNombre() {
    return tareas.map((tarea) => tarea.nombre).toList();
  }

  List<Tarea> getTareasCompletas() {
    return tareas.where((tarea) => tarea.estadoActual).toList();
  }

  //List<String?> getTareasPendientes() {
  //  return List<String?>;
  //}

  void addTarea(Tarea tarea) {
    tareas.add(tarea);
  }

  void removeTarea(Tarea tarea) {
    tareas.remove(tarea);
  }

  void removeTareaPorNombre(String nombreIngresado) {
    Tarea tareaAEliminar =
        tareas.firstWhere((tarea) => tarea.nombre == nombreIngresado);
    tareas.remove(tareaAEliminar);
  }

  void verTareas() {
    return tareas.forEach(print);
  }

  void verTareasCompletas() {
    return this.getTareasCompletas().forEach(print);
  }

  bool hayCompletas() {
    return tareas.any((tarea) => tarea.estadoActual);
  }

  bool existeTareaConNombre(String nombreTarea) {
    return tareas.any((per) => per.nombre == tareas);
  }

  void vaciarListado() {
    tareas.clear();
  }

  bool estaVacio() {
    return tareas.isEmpty;
  }

  List<Tarea> getTareasPorFechaDeEntrega(DateTime fechaIngresada) {
    return tareas
        .where((tarea) => tarea.fechaEntrega == fechaIngresada)
        .toList();
  }

  void verTareasPorFechaDeEntrega(DateTime fechaIngresada) {
    return this.getTareasPorFechaDeEntrega(fechaIngresada).forEach(print);
  }
}
