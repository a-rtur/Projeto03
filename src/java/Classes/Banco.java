package Classes;

import java.util.ArrayList;

public class Banco {
    private static ArrayList<Cliente> clientes;
    public static ArrayList<Cliente> getCliente(){
        if(clientes==null){
            clientes = new ArrayList<>();
        }
        return clientes;
    }
}
