package com.example.examen__1.service;

import com.example.examen__1.model.Competidor;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class CompetidorService {
    private List<Competidor> competidores;

    public CompetidorService() {
        competidores = new ArrayList<>();
        cargarDatosIniciales();  // Método para cargar algunos competidores por defecto
    }

    public List<Competidor> obtenerCompetidores() {
        return competidores;
    }

    public void agregarCompetidor(Competidor competidor) {
        competidores.add(competidor);
    }

    private void cargarDatosIniciales() {
        // Agregar competidores iniciales aquí
        competidores.add(new Competidor("Carlos", "Ramirez", LocalDate.of(1998, 1, 5), "Colombia", "COL", 5, 2, 3, 8, "Competidor destacado"));
        competidores.add(new Competidor("Mariana", "Pajón", LocalDate.of(1995, 10, 10), "Colombia", "COL", 1, 1, 1, 1, "Medallista olímpica"));
        // Más competidores...
    }
}

