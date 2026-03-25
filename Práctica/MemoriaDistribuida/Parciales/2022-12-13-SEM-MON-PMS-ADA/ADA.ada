Procedure ADA is
    Task BD is
        Entry solicitarEscritura();
        Entry solicitarLectura();
        Entry cerrarEscritura();
        Entry cerrarLectura();
    End BD;

    Task type Escritor is
        Entry darAcceso();
    End Escritor;

    Task type Lector;
        Entry darAcceso();
    End Lector;

    escritores = array (1..E) of Escritor;
    lectores = array (1..L) of Lector;

    Task Body BD is
        usando: Integer;
        cant_usando: Integer := 0;
    Begin
        loop
            SELECT
                when (cant_usando = 0) =>
                    Accept solicitarEscritura();
                    Accept cerrarEscritura();
            OR
                when (solicitarEscritura'count = 0) => 
                    Accept solicitarLectura();
                    cant_usando := cant_usando + 1;
            OR
                when (cant_usando > 0) =>
                    Accept cerrarLectura();
                    cant_usando := cant_usando - 1;
            END SELECT;
        end loop;
    End BD;

    Task Body Escritor is
        escritura: String;
        esperando: Boolean := True;
    Begin
        loop
        escritura := generarEscritura()
            while (esperando) loop
                SELECT
                    BD.solicitarEscritura();
                    escribirBD(escritura);
                    BD.cerrarEscritura();
                    esperando := False
                ELSE
                    delay 60.0;
                END SELECT;
            end loop;
        end loop;
    End Escritor;

    Task Body Lector is
        lectura: String;
    Begin
        loop
            SELECT
                BD.solicitarLectura();
                lectura := leerBD();
                BD.cerrarLectura();
            OR DELAY 120.0
                delay 300.0
            END SELECT;
        end loop;
    End Lector;

    Begin
        null;
    End ADA;
