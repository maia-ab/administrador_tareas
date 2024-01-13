import 'dart:io';
import 'clases/tarea.dart';

void main(List<String> args) {
  bool continuar = true;
  while (continuar) {
    print('1. Agregar tarea');
    print('2. Ver tareas');
    print('3. Completar tareas');
    print('4. Ver tareas completas');
    print('5. Eliminar tarea');
    print('6. Limpiar tareas');
    print('7. Tareas a realizar en fecha:');
    print('8. Salir');
    stdout.write('Seleccione accion a realizar: ');
    int opcion = int.parse(stdin.readLineSync()!);
    switch (opcion) {
      case 1:
        stdout.write('Ingresar el nombre de la tarea: ');
        String nombre = stdin.readLineSync()!;

        if (tareas.getTareasPorNombre().contains(nombre)) {
          print("Ya existe una tarea con ese nombre.");
          break;
        }

        stdout.write('Ingresar fecha de entrega (AÑO-MES-DIA): ');
        String fechaIngresada = stdin.readLineSync()!;
        DateTime fechaAAsignar = DateTime.now(); // Valor por defecto.

        try {
          fechaAAsignar = DateTime.parse(fechaIngresada);
        } catch (e) {
          print("Formato de fecha incorrecto. Por favor usar Año-Mes-Día.");
          break;
        }

        stdout.write('Ingresar descripcion de la tarea (OPCIONAL):');
        String descripcion = stdin.readLineSync()!;

        Tarea tareaCreada =
            new Tarea(nombre, fechaAAsignar, DateTime.now(), descripcion);
        tareas.addTarea(tareaCreada);
        break;

      case 2:
        if (!tareas.estaVacio()) {
          tareas.verTareas();
        } else {
          print("No hay tareas creadas.");
        }
        break;

      case 3:
        stdout.write('Ingresar el nombre de la tarea que quiera completar: ');
        String nombreDeTarea = stdin.readLineSync()!;
        if (tareas.getTareasPorNombre().contains(nombreDeTarea)) {
          Tarea tareaACompletar = tareas
              .getTareas()
              .firstWhere((tarea) => nombreDeTarea == tarea.nombre);

          if (!tareaACompletar.estadoActual) {
            tareaACompletar.cambiarEstado();
          } else {
            print("Tarea ya fue completada.");
          }
        } else {
          print("La tarea indicada no ha sido creada");
        }
        ;
        break;

      case 4:
        if (tareas.hayCompletas()) {
          tareas.verTareasCompletas();
        } else {
          print("No hay tareas completas.");
        }
        break;

      case 5:
        stdout.write('Ingresar el nombre de la tarea que quiera completar: ');
        String nombreDeTarea = stdin.readLineSync()!;
        if (tareas.getTareasPorNombre().contains(nombreDeTarea)) {
          tareas.removeTareaPorNombre(nombreDeTarea);
          print("Tarea eliminada!");
        } else {
          print("No existe una tarea con ese nombre.");
        }
        break;

      case 6:
        if (!tareas.estaVacio()) {
          tareas.vaciarListado();
          print("Tareas eliminadas!");
        } else {
          print("No hay tareas a eliminar.");
        }
        break;

      case 7:
        stdout.write('Ingrese fecha: ');
        String fechaIngresada = stdin.readLineSync()!;
        DateTime fechaAFiltrar = DateTime.parse(fechaIngresada);
        tareas.verTareasPorFechaDeEntrega(fechaAFiltrar);
        break;

      case 8:
        print('Adios!');
        continuar = false;
        break;

      default:
        print("Opción inválida.");
    }
  }
}

ListadoDeTareas tareas = new ListadoDeTareas();

/*void agregarTarea(
    {required String nombre,
    required String fecha,
    descripcion = "Sin descripción"}) {
  bool hayError = false;
  String mensajeError;
  if (tareas.getTareasPorNombre().contains(nombre)) {
    hayError = true;
    mensajeError = "Tarea ya existe.";
  }

  try {
    DateTime selectedDate = DateTime.parse(userInput);
    print("Selected Date: $selectedDate");
  } catch (e) {
    print("Invalid date format. Please use YYYY-MM-DD.");
  }

  final nuevaTarea = new Tarea(nombre, fecha, descripcion);
  tareas.addTarea(nuevaTarea);
}*/

/*
void completarTarea(String nombreDeTarea) {}

void verTareasCompletas() {
  tareasCompletas.forEach(print);
}*/

/// Hay que armar una clase tarea y que tenga una variable cuyo
/// valor sea completa o pendiente
/// Armar los metodos necesarios para cambiar el estadon de
/// la tarea y modificar su print


/// Hay que armar una clase fecha con el formato pedido yyyy/mm/dd