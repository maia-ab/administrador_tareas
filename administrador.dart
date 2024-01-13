import 'dart:io';
import 'clases/persona.dart';
import 'clases/tarea.dart';

void main(List<String> args) {
  bool continuar = true;
  while (continuar) {
    print('1. Agregar tarea');
    print('2. Ver tareas');
    print('3. Completar tareas');
    print('4. Ver tareas completas');
    print('5. Ver tareas pendientes');
    print('6. Eliminar tarea');
    print('7. Limpiar tareas');
    print('8. Tareas a realizar en fecha:');
    print('9. Agregar contacto');
    print('10. Asignar tarea a un contacto');
    print('11. Ver contactos');
    print('12. Salir');
    stdout.write('Seleccione accion a realizar: ');
    int opcion = int.parse(stdin.readLineSync()!);
    switch (opcion) {
      case 1:
        stdout.write('Ingresar el nombre de la tarea: ');
        String? nombre = stdin.readLineSync();

        if (nombre == "") {
          print("No puede crearse una tarea sin nombre.");
          break;
        } else if (tareas.getTareasPorNombre().contains(nombre)) {
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
        if (descripcion == "") {
          descripcion = "Sin descripción";
        }

        Tarea tareaCreada = new Tarea(
            nombre: nombre,
            fechaEntrega: fechaAAsignar,
            fechaCreacion: DateTime.now(),
            descripcion: descripcion);
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
        if (tareas.hayPendientes()) {
          tareas.verTareasPendientes();
        } else {
          print("No hay tareas pendientes.");
        }
        break;

      case 6:
        stdout.write('Ingresar el nombre de la tarea que quiera completar: ');
        String nombreDeTarea = stdin.readLineSync()!;
        if (tareas.getTareasPorNombre().contains(nombreDeTarea)) {
          tareas.removeTareaPorNombre(nombreDeTarea);
          print("Tarea eliminada!");
        } else {
          print("No existe una tarea con ese nombre.");
        }
        break;

      case 7:
        if (!tareas.estaVacio()) {
          tareas.vaciarListado();
          print("Tareas eliminadas!");
        } else {
          print("No hay tareas a eliminar.");
        }
        break;

      case 8:
        stdout.write('Ingrese fecha: ');
        String fechaIngresada = stdin.readLineSync()!;
        DateTime fechaAFiltrar = DateTime.parse(fechaIngresada);
        tareas.verTareasPorFechaDeEntrega(fechaAFiltrar);
        break;

      case 9:
        stdout.write('Ingrese nombre de nuevo contacto: ');
        String nombreContacto = stdin.readLineSync()!;

        stdout.write('Ingrese DNI de nuevo contacto: ');
        int dniContacto = int.parse(stdin.readLineSync()!);

        Persona personaNueva = Persona(nombreContacto, dniContacto);

        contactos.agregarIntegrante(personaNueva);

        break;

      case 10:
        stdout.write('Ingrese nombre de contacto: ');
        String nombreContacto = stdin.readLineSync()!;
        Persona contacto = contactos.getIntegrantePorNombre(nombreContacto);

        stdout.write('Ingrese tarea que quiere asignar: ');
        String nombreTarea = stdin.readLineSync()!;
        Tarea tarea = tareas.getTareaPorNombre(nombreTarea);

        if (contactos.existeIntegranteConNombre(nombreContacto) &&
            tareas.existeTareaConNombre(nombreTarea)) {
          contacto.asignarTarea(tarea);
        } else {
          print(
              "Los contactos y tareas deben estar creados antes de asignarse.");
        }

        break;

      case 11:
        if (!contactos.estaVacio()) {
          contactos.verIntegrantes();
        } else {
          print("No hay contactos agregados.");
        }
        ;

        break;

      case 12:
        print('Adios!');
        continuar = false;
        break;

      default:
        print("Opción inválida.");
    }
  }
}

ListadoDeTareas tareas = new ListadoDeTareas();
GrupoDePersonas contactos = new GrupoDePersonas("Contactos");
List<GrupoDePersonas> grupos = [];
