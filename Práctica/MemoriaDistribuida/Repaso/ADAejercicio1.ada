Procedure ADA IS
    Task Servidor;

    Task type API is
        Entry SolicitarPrecios(compra: OUT Float; venta: OUT Float);
    End API;

    APIs = array (1..20) of API;

    Task Body Servidor is
        precios_compra: array (1..20) of String;
        precios_venta: array (1..20) of String;
        precio_compra: String;
        precio_venta: String;
    Begin
        loop
            for i in 1..20 loop
                SELECT
                    APIs(id).SolicitarPrecios(precio_compra, precio_venta);
                    precios_compra(i) := precio_compra;
                    precios_venta(i) := precio_venta;
                OR DELAY 5.0
                    precios_compra(i) := '';
                    precios_venta(i) := '';
                END SELECT;
            end loop;
            mostrarPrecios(precios_compra, precios_venta)
        end loop;
    End Servidor;

    Task Body API is 
    Begin
        loop
            Accept SolicitarPrecios(compra: OUT String; venta: OUT String) do
                compra := generarPrecioCompra();
                venta := generarPrecioVenta();
            End SolicitarPrecios();
        end loop;
    End API;

    Begin
        null;
    End ADA;