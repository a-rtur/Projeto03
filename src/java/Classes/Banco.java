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
    
    private static ArrayList<Fornecedor> fornecedores;
    public static ArrayList<Fornecedor> getFonecedor(){
        if (fornecedores==null){
            fornecedores = new ArrayList<>();
        }
        return fornecedores;
    }
}
