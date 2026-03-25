Procedure ADA is
    Task Caja is
        Entry PrioridadAncianos(boletas: IN text; dinero: IN FLoat; vuelto: OUT Float; recibos: OUT text)
        Entry PrioridadBoletas(boletas: IN text; dinero: IN FLoat; vuelto: OUT Float; recibos: OUT text)
        Entry SinPrioridad(boletas: IN text; dinero: IN FLoat; vuelto: OUT Float; recibos: OUT text)
    End Caja;

    Task type Persona;

    personas: array (1..P) of Persona

    Task Body Caja is
        boletas: text := ...;
        dinero: Float := ...;
        vuelto: Float;
        recibos: text;
    Begin
        loop
            SELECT
                Accept PrioridadAncianos(boletas: IN text; dinero: IN FLoat; vuelto: OUT Float; recibos: OUT text) do 
                    vuelto, recibos := cobrar(boletas, dinero);
                End PrioridadAncianos;
            OR
                when (PrioridadAncianos'count = 0) =>
                    Accept PrioridadBoletas(boletas: IN text; dinero: IN FLoat; vuelto: OUT Float; recibos: OUT text) do
                        vuelto, recibos := cobrar(boletas, dinero);
                    End PrioridadBoletas;
            OR
                when (PrioridadAncianos'count = 0 and PrioridadBoletas = 0) =>
                    Accept SinPrioridad(boletas: IN text; dinero: IN FLoat; vuelto: OUT Float; recibos: OUT text) do
                        vuelto, recibos := cobrar(boletas, dinero);
                    End SinPrioridad;
            END SELECT;
        end loop;
    End Caja;

    Task Body Persona is
        cant_boletas: Integer := ...;
        anciana: Boolean := ...;
        boletas: text := ...;
        dinero: Float := ...;
        vuelto: Float;
        recibos: text;
    Begin
        if (anciana) then
            Caja.PrioridadAncianos(boletas, dinero, vuelto, recibos);
        else if (cant_boletas < 5) then
            Caja.PrioridadBoletas(boletas, dinero, vuelto, recibos);
        else
            Caja.SinPrioridad(boletas, dinero, vuelto, recibos);
        end if;
    End Persona;