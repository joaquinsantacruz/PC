En una clínica existe un médico de guardia que recibe continuamente peticiones de atención de las E enfermeras que trabajan en su piso y de las P personas que llegan a la clínica ser atendidos.  
Cuando una persona necesita que la atiendan espera a lo sumo 5 minutos a que el médico lo haga, si pasado ese tiempo no lo hace, espera 10 minutos y vuelve a requerir la atención del médico. Si no es atendida tres veces, se enoja y se retira de la clínica. 
Cuando una enfermera requiere la atención del médico, si este no lo atiende inmediatamente le hace una nota y se la deja en el consultorio para que esta resuelva su pedido en el momento que pueda (el pedido puede ser que el médico le firme algún  papel). Cuando la petición ha sido recibida por el médico o la nota ha sido dejada en el escritorio, continúa trabajando y haciendo más peticiones. 
El médico atiende los pedidos dándole prioridad a los enfermos que llegan para ser atendidos. Cuando atiende un pedido, recibe la solicitud y la procesa durante un cierto tiempo. Cuando está libre aprovecha a procesar las notas dejadas por las enfermeras. 

Que hago con "(el pedido puede ser que el médico le firme algún papel)"? 
Rta: Nada

Procedure Ejercicio4 IS
    Task Medico is
        Entry Atender_paciente;
        Entry Atender_enfermera;
        Entry Tomar_nota(nota: IN text);
    End Medico;

    Task Consultorio is
        Entry Dejar_nota(nota: IN text);
    End Consultorio;

    Task type Enfermera;
    Task type Persona;

    array_enfermeras: array (1..E) of Enfermera;
    array_personas: array (1..P) of Persona;

    Task Body Medico is
        nota: text;

        loop
            SELECT
                Accept Atender_paciente do
                    atenderPaciente();
                end Atender_paciente;
            OR
                when (Atender_paciente'count == 0) => 
                    Accept Atender_enfermera do
                        atenderEnfermera()
                    end Atender_enfermera;
            ELSE
                SELECT
                    Consultorio.Tomar_nota(nota);
                    procesarNota(nota);
                ELSE
                    null;
                END SELECT;
            END SELECT;
        end loop;
    End Medico;

    Task Body Enfermera is
        loop
            SELECT
                Medico.Atender_enfermera;
            ELSE
                nota: text := hacerNota();
                Consultorio.Dejar_nota(nota);
            END SELECT;
        end loop;
    End Enfermera;

    Task Body Consultorio is
        notas: Cola;
        loop
            SELECT
                Accept Dejar_nota(nota: IN text) do
                    push(notas, nota);
                end Dejar_nota;
            OR
                when (not esVacia(notas)) =>
                    Accept Tomar_nota(nota: OUT text) do
                        nota := pop(notas);
                    end Tomar_nota;
            END SELECT;
        end loop;
    End Consultorio;

    Task Body Paciente is
        atendido: Boolean := False;
        intentos: Integer := 0;

        while ((not atendido) and (intentos < 3)) loop
            SELECT
                Medico.Atender_paciente;
                atendido := True;
            OR DELAY 300.0
                intentos++;
                delay 600.0
            END SELECT;
        end loop;
    End Paciente;

    Begin
        null;
    End Ejercicio4;