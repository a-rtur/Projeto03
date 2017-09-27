package Classes;

public class Fornecedor {
    private String razao;
    private String nomef;
    private String cnpj;
    private String endereco;
    private String telefone;
    private String email;
    
    public static boolean verificarCnpj(String cnpj){
        boolean retorno = false;
        for(int i = 0; i <Banco.getFornecedor().size(); i++){
            if(Banco.getFornecedor().get(i).getCnpj().equals(cnpj)){
                    i = Banco.getFornecedor().size() + 1;
                    retorno = true;
            }
            else {
                retorno = false;
            }
        }
        return retorno;
    }
    
      public static void cadastrarFornecedor(String razao, String nome, String cnpj, String email, String endereco, String telefone){
          Fornecedor f = new Fornecedor();
          f.setRazao(razao);
          f.setNome(nome);
          f.setCnpj(cnpj);
          f.setEmail(email);
          f.setTelefone(telefone);
          f.setEndereco(endereco);
          Banco.getFornecedor().add(f);
    }
    
    public static int pesquisarBanco(int valor, String pesquisa){
        boolean podeEntrar = true;
        int retorno = -1;
        if (podeEntrar == true) {
            String separadorTexto [] = Banco.getFornecedor().get(valor).getNome().split(" ");
            for (int i = 0; i < separadorTexto.length; i++) {
                if (separadorTexto[i].equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                }
                else if (Banco.getFornecedor().get(valor).getNome().equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                    i = separadorTexto.length + 1;
                }
            }
        }
        if (podeEntrar == true) {
            String separadorTexto [] = Banco.getFornecedor().get(valor).getRazao().split(" ");
            for (int i = 0; i < separadorTexto.length; i++) {
                if (separadorTexto[i].equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                }
                else if (Banco.getFornecedor().get(valor).getRazao().equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                    i = separadorTexto.length + 1;
                }
            }
        }
        if (podeEntrar == true) {
            String separadorTexto [] = Banco.getFornecedor().get(valor).getCnpj().split(" ");
            for (int i = 0; i < separadorTexto.length; i++) {
                if (separadorTexto[i].equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                }
                else if (Banco.getFornecedor().get(valor).getCnpj().equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                    i = separadorTexto.length + 1;
                }
            }
        }
        if (podeEntrar == true) {
            String separadorTexto [] = Banco.getFornecedor().get(valor).getEmail().split(" ");
            for (int i = 0; i < separadorTexto.length; i++) {
                if (separadorTexto[i].equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                }
                else if (Banco.getFornecedor().get(valor).getEmail().equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                    i = separadorTexto.length + 1;
                }
            }
        }
        if (podeEntrar == true) {
            String separadorTexto [] = Banco.getFornecedor().get(valor).getTelefone().split(" ");
            for (int i = 0; i < separadorTexto.length; i++) {
                if (separadorTexto[i].equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                }
                else if (Banco.getFornecedor().get(valor).getTelefone().equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                    i = separadorTexto.length + 1;
                }
            }
        }
        if (podeEntrar == true) {
            String separadorTexto [] = Banco.getFornecedor().get(valor).getEndereco().split(" ");
            for (int i = 0; i < separadorTexto.length; i++) {
                if (separadorTexto[i].equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                }
                else if (Banco.getFornecedor().get(valor).getEndereco().equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                    i = separadorTexto.length + 1;
                }
            }
        }
        return retorno;
    }
    
    public String getRazao() {
        return razao;
    }

    public void setRazao(String razao) {
        this.razao = razao;
    }

    public String getNome() {
        return nomef;
    }

    public void setNome(String nomef) {
        this.nomef = nomef;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
