Procedure ADA is
    Task Central is
        Entry pedirModelo(modelo: OUT Integer)
        Entry darResultado(cantidad: IN Integer)
    End Central;

    Task type Sucursal;

    sucursales: array (1..S) of Sucursal;

    Task Body Central is
        modelos: array (1..n) of Integer;
        modelo_actual: Integer;
        cant_actual: Integer;
        cant_aux: Integer;
    Begin
        for i in 1..n loop
            modelo_actual := modelos(i);
            cant_actual := 0;
            for j in j..S*2 loop
                SELECT
                    Accept pedirModelo(modelo: OUT Integer) do
                        modelo := modelo_actual;
                    End pedirModelo;
                OR
                    Accept darResultado(cantidad: IN Integer) do
                        cant_aux := cantidad;
                    End darResultado;
                    cant_actual := cant_actual + cant_aux;
                END SELECT;
            end loop;
            // INFORMAR CANTIDAD DE MODELO CON cant_actual
        end loop;
    End Central;

    Task Body Sucursal is
        modelo: Integer;
        cantidad: Integer;
    Begin
        for i in 1..n loop
            Central.pedirModelo(modelo);
            cantidad := DevolverStock(modelo, cantidad)
            Central.darResultado(cantidad)
        end loop;
    End Sucursal;

    Begin
        null;
    End ADA;