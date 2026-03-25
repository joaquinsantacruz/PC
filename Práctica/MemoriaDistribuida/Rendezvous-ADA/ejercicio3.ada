Procedure Ejercicio3 IS
    Task Central is
        Entry Periferico1;
        Entry Periferico2;
        Entry Tiempo;
    End Central;

    Task type Periferico is
        Entry Identificador;
    End Periferico;

    array_perifericos: array (1..2) of Periferico;

    Task Timer is
        Entry Empezar;
    End Timer;

    Task Body Central is
        only_p2: Boolean := False;
        Accept Periferico1;

        loop
            SELECT
                when (not only_p2) => Accept Periferico1;
            OR
                Accept Periferico2;
                only_p2 := True;
                Timer.Empezar(180.0);
            OR
                when (only_p2) => Accept Tiempo;
                                  only_p2 := False;
            END SELECT;
        end loop;
    End Central;

    Task Body Periferico is
        id: Integer;
        
        Accept Identificador(id)

        if (id == 1) then
            Central.Periferico1
            loop
                señal = generarSeñal()
                SELECT
                    Central.Periferico1(señal);
                OR DELAY 120.0
                    null
                END SELECT;
            end loop;
        else
            recibida: Boolean;
            loop
                recibida := False;
                señal = generarSeñal()
                while (not recibida) loop   
                    SELECT
                        Central.Periferico2(señal);
                        recibida := True 
                    ELSE 
                        delay 60.0
                    END SELECT;
                end loop;
            end loop;
        end if;
    End Periferico;

    Task Body Timer is
        tiempo: Float;
        loop
            Accept Empezar(t: IN FLoat) do
                tiempo := t;
            end Empezar;
            delay tiempo;
            Central.Tiempo;
        end loop;
    End Timer;

    Begin
        array_perifericos(1).Identificador(1)
        array_perifericos(2).Identificador(2)
    End Ejercicio3;