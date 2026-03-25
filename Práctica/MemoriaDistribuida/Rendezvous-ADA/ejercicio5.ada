Procedure Ejercicio5 IS
    Task Admin is
        Entry Termino_grupo(id: IN Integer; monto: IN Integer);
        Entry Ganador(id: IN Integer);
    End Admin;

    Task type Persona is
        Entry Comenzar;
    End Persona;

    Task type Equipo is
        Entry Identificador(pos: IN Integer);
        Entry Llegada;
        Entry Termine(sum: IN Integer);
    End Equipo;

    array_personas: array (1..20) of Persona;
    array_equipos: array (1..5) of Equipo;

    Task Body Persona is
        equipo: Integer := ...;
        suma: Integer := 0;
        equipo_ganador: Integer;

        Equipo.Llegada;
        Accept Comenzar;

        for i in 1..15 loop
            suma += Moneda();
        end loop;

        Equipo.Termine(suma);
        Admin.Ganador(equipo_ganador);
    End Persona;

    Task Body Equipo is
        id: Integer;
        suma: Integer := 0;

        Accept Identificador(pos: IN Integer) do
            id := pos;
        End Identificador;

        for i in 1..4 loop
            Accept Llegada;
        end loop;

        // id = 1 => 1 * 5 - 4 = 1
        //           1 * 5 - 1 = 4
        for i in id*5-4..id*5-1 loop
            Persona(i).Comenzar;
        end loop;

        for i in 1..4 loop
            Accept Termine(sum: IN Integer) do
                suma += sum;
            end Termine;
        end loop;

        Admin.Termino_grupo(id, suma);
    End Equipo;

    Task Body Admin is
        grupo_aux: Integer;
        suma_aux: Integer := 0;
        grupo_ganador: Integer;
        suma_ganadora: Integer := 0;

        for i in 1..5 do
            Accept Termino_grupo(id: IN Integer; monto: IN Integer) do
                grupo_aux := id;
                suma_aux := monto;
            End Termino_grupo;
            if (suma_aux > suma_ganadora) then
                grupo_ganador:= grupo_aux;
                suma_ganadora:= suma_aux;
            end if;
        end loop;

        for i in 1..20 loop
            Accept Ganador(grupo_ganador);
        end loop;
    End Admin;

    Begin   
        null;
    End Ejercicio5;