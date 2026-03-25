Procedure Ejercicio1a is
    Task Puente is
        Entry Pasa_auto;
        Entry Pasa_camioneta;
        Entry Pasa_camion;
        Entry Sale_auto;
        Entry Sale_camioneta;
        Entry Sale_camion;
    End Puente;

    Task type Vehiculo;

    array_auto: array (1..A) of Vehiculo;
    array_camioneta: array (1..B) of Vehiculo;
    array_camion: array (1..C) of Vehiculo;

    Task Body Vehiculo is
        if tipo == "auto" then
            Puente.Pasa_auto
        elsif tipo == "camioneta" then
            Puente.Pasa_camioneta
        else
            Puente.Pasa_camion
        end if;

        pasaPuente()

        if tipo == "auto" then
            Puente.Sale_auto
        elsif tipo == "camioneta" then
            Puente.Sale_camioneta
        else
            Puente.Sale_camion
        end if;
    End Vehiculo;

    Task Body Puente is
        peso : Integer := 0;

        SELECT 
            when (peso + 1 <= 5) => Accept Pasa_auto do 
                                        peso += 1;
                                    End Pasa_auto;
        OR
            when (peso + 2 <= 5) => Accept Pasa_camioneta do
                                        peso += 1;
                                    End Pasa_camioneta;
        OR
            when (peso + 3 <= 5) => Accept pPsa_camion do
                                        peso += 1;
                                    End Pasa_camion;
        OR
            Accept Sale_auto do 
                peso -= 1;
            End Sale_auto;
        OR
            Accept Sale_camioneta do
                peso -= 2;
            End Sale_camioneta;
        OR
            Accept Sale_camion do
                peso -= 3;
            End Sale_camion;
        END SELECT;
    End Puente;
    
    Begin
        null;
    End Ejercicio1