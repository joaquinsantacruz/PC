Procedure Ejercicio6 IS
    Task Coordinador IS
        Entry darSuma(prom: IN Integer)
    End Coordinador;

    Task type Worker;

    workers: array (1..10) of Worker

    Task Body Coordinador is
        suma_total: Integer := 0;
        monto_aux: Integer;
        promedio: Integer;
    Begin
        for i in 1..10 loop
            Accept darSuma(monto: IN Integer) do
                monto_aux = monto;
            End darSuma;
            suma_total += monto_aux;
        end loop;

        promedio := suma_total / 10;
    End Coordinador;

    Task Body Worker is
        numeros: array (1..100000) of Integer;
        suma: Integer;

        for i in 1..100000 loop
            suma += numeros(i)
        end loop;
        Coordinador.darSuma(suma);
    End Worker;

    Begin
        null;
    End Ejercicio6;