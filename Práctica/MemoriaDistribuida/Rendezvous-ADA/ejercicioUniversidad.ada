Procedure EjercicioUniversidad IS
    Task Corrector;

    Task Servidor IS
        Entry Documento_usuario(id: IN Integer; documento: IN text)
        Entry Documento_corrector();
    End Servidor;

    Task type Usuario is
        Entry Identificador(pos: IN Integer);
        Entry Recibir_documento(doc: IN text; ok: IN Boolean)
    End Usuario;

    array_usuarios: array (1..U) os Usuario;

    Task Body Servidor is
        a_corregir: cola;

        loop
            SELECT
                Accept Documento_usuario(id: IN Integer; documento: IN text) do
                    push(a_corregir, id, documento);
                end Entregar_documento;
            OR
                when (a_corregir'count > 0) =>
                    Accept Recibir_documento() do
                

    Task Body Usuario is
        documento: text;
        enviado: Boolean;
        id: Integer;

        Accept Identificador(pos: IN Integer) is
            id := pos;
        end Identificador;

        loop
            trabajarEnDocumento(documento);
            enviado := False;

            while (not enviado)
                SELECT
                    Servidor.Documento_usuario(id, documento);
                    enviado := True;
                OR DELAY 120.0
                    delay 60.0
                END SELECT;
            end loop;

            Accept Recibir_documento(doc: IN text, ok: IN Boolean) is
                documento := doc;
                todoOK := ok;
            end Recibir_documento;

            exit when (todoOK)
        end loop;
    End Usuario;

    Begin
        for i in 1..U loop
            array_usuarios(i).Identificador(i);
        end loop;
    End EjercicioUniversidad;