import 'package:intl/intl.dart';

class Tarea {
  String? nombre;
  DateTime fecha;
  String? descripcion;
  bool _estaCompleta = false;

  Tarea(this.nombre, this.fecha, this.descripcion);

  bool get estadoActual => _estaCompleta;

  void cambiarEstado() => _estaCompleta = !_estaCompleta;

  @override
  String toString() =>
      "$nombre - Creada en fecha ${DateFormat('yyyy-MM-dd').format(fecha)} - $descripcion";
  // El DateFormat viene con el paquete de intl te permite formatear el DateTime como quieras en este caso lo use para que no muestre la hora.
}

class ListadoDeTareas {
  List<Tarea> tareas = [];

  List<Tarea> getTareas() {
    return tareas;
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

  void vaciarListado() {
    tareas.clear();
  }

  bool estaVacio() {
    return tareas.isEmpty;
  }

  List<Tarea> getTareasPorFecha(DateTime fechaIngresada) {
    return tareas.where((tarea) => tarea.fecha == fechaIngresada).toList();
  }

  void verTareasPorFecha(DateTime fechaIngresada) {
    return this.getTareasPorFecha(fechaIngresada).forEach(print);
  }
}
