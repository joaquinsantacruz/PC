Procedure Ejercicio2b IS
    Task Empleado is
        Entry Atender;
    End Empleado;

    Task type Cliente;
    array_clientes: array (1..C) of Cliente;

    Task Body Empleado is
        loop
            Accept Atender(pago: IN text; comprobante: OUT text) do
                comprobante = procesarPago(pago);
            end Atender;
        end loop;
    End Empleado;

    Task Body Cliente is
        pago: text := ...;
        comprobante: text;

        SELECT
            Empleado.Atender(pago, comprobante)
        OR DELAY 600.0
            null
        END SELECT;
    End Cliente;

    Begin
        null;
    End Ejercicio2b;