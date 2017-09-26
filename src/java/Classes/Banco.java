package Classes;

import java.util.ArrayList;

public class Banco {
    private static ArrayList<Cliente> clientes;
    private static ArrayList<Fornecedor> fornecedores;
    private static int index;
    
    public static ArrayList<Cliente> getCliente(){
        if(clientes==null){
            clientes = new ArrayList<>();
        }
        return clientes;
    }
    
    public static ArrayList<Fornecedor> getFonecedor(){
        if (fornecedores==null){
            fornecedores = new ArrayList<>();
        }
        return fornecedores;
    }

    public static int getIndex() {
        return index;
    }

    public static void setIndex(int valor) {
        index = valor;
    }
    

    
}
