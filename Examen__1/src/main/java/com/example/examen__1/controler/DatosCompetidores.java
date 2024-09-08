package com.example.examen__1.controler;

import com.example.examen__1.model.Competidor;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class DatosCompetidores {
    private static final List<Competidor> competidores = new ArrayList<>();

    // Códigos predefinidos para países
    private static final String[] PAISES = {
            "Colombia", "Francia", "Estados Unidos", "Canada", "Brasil"
    };

    static {
        cargarDatosIniciales();
    }

    // Método para cargar competidores de ejemplo
    private static void cargarDatosIniciales() {
        competidores.add(crearCompetidor("Juan", "PÉREZ", LocalDate.of(1995, 5, 12), "Colombia", "Competidor experimentado"));
        competidores.add(crearCompetidor("Ana", "GARCÍA", LocalDate.of(1999, 7, 23), "Francia", "Promesa joven"));
    }

    // Crear competidor con datos aleatorios
    private static Competidor crearCompetidor(String nombre, String apellido, LocalDate fechaNacimiento, String pais, String descripcion) {
        return new Competidor(nombre, apellido, fechaNacimiento, pais, descripcion);
    }

    // Obtener lista de competidores
    public static List<Competidor> obtenerCompetidores() {
        return new ArrayList<>(competidores);
    }

    // Añadir un nuevo competidor a la lista
    public static void agregarCompetidor(Competidor competidor) {
        competidores.add(competidor);
        ordenarCompetidoresPorPuntaje();
    }

    // Método para eliminar competidor por índice
    public static void eliminarCompetidor(int indice) {
        if (indice >= 0 && indice < competidores.size()) {
            competidores.remove(indice);
        }
    }

    // Actualizar un competidor existente
    public static void actualizarCompetidor(int indice, Competidor competidorActualizado) {
        if (indice >= 0 && indice < competidores.size()) {
            competidores.set(indice, competidorActualizado);
        }
    }

    // Generar competidor con datos aleatorios
    public static void agregarCompetidorAleatorio() {
        Random random = new Random();
        String nombre = "Competidor" + random.nextInt(1000);
        String apellido = "Apellido" + random.nextInt(1000);
        LocalDate fechaNacimiento = LocalDate.of(1990 + random.nextInt(20), random.nextInt(12) + 1, random.nextInt(28) + 1);
        String pais = PAISES[random.nextInt(PAISES.length)];
        Competidor competidor = new Competidor(nombre, apellido, fechaNacimiento, pais, "Competidor generado aleatoriamente");
        competidores.add(competidor);
    }

    // Método para ordenar competidores por puntaje
    private static void ordenarCompetidoresPorPuntaje() {
        competidores.sort((c1, c2) -> Integer.compare(c2.getPuntajeTotal(), c1.getPuntajeTotal()));
    }
}
