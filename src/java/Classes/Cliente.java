package Classes;

public class Cliente {
    private String nome;
    private String cpf;
    private String rg;
    private String endereco;
    private String telefone;
    private String email;

    public static void cadastrarCliente(String nome, String cpf, String rg, String email, String endereco, String telefone){
        Cliente c = new Cliente();
        c.setNome(nome);
        c.setEmail(email);
        c.setTelefone(telefone);
        c.setCpf(cpf);
        c.setRg(rg);
        c.setEndereco(endereco);
        Banco.getCliente().add(c);
    }
    
    public static boolean verificarCpf(String cpf){
        boolean retorno = false;
        for(int i = 0; i < Banco.getCliente().size(); i++) {
            if(Banco.getCliente().get(i).getCpf().equals(cpf)) {
                i = Banco.getCliente().size() + 1;
                retorno = true;
            }
            else {
                retorno = false;
            }
        }
        return retorno;
    }
    
    public static boolean verificarRg(String rg){
        boolean retorno = false;
        for(int i = 0; i < Banco.getCliente().size(); i++) {
            if(Banco.getCliente().get(i).getCpf().equals(rg)) {
                i = Banco.getCliente().size() + 1;
                retorno = true;
            }
            else {
                retorno = false;
            }
        }
        return retorno;
    }
    
    public static int pesquisarBanco(int valor, String pesquisa){
        boolean podeEntrar = true;
        int retorno = -1;
        if (podeEntrar == true) {
            String separadorInteiro[] = Banco.getCliente().get(valor).getNome().split("");
            String separadorPalavras[] = Banco.getCliente().get(valor).getNome().split(" ");
            String acumuladorInteiro = "";
            for (int i = 0; i < separadorInteiro.length; i++) {
                acumuladorInteiro = acumuladorInteiro + separadorInteiro[i];
                if (acumuladorInteiro.equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                }
            }
            if (separadorPalavras.length > 1) {
                for (int i = 0; i < separadorPalavras.length; i++) {
                    String separadorCaracterePalavra [] = separadorPalavras[i].split("");
                    String acumuladorPalavras = "";
                    for (int j = 0; j < separadorCaracterePalavra.length; j++) {
                        acumuladorPalavras = acumuladorPalavras + separadorCaracterePalavra[j];
                        if (acumuladorPalavras.equals(pesquisa)) {
                            retorno = valor;
                            podeEntrar = false;
                        }
                    }
                }
            }
        }
        if (podeEntrar == true) {
            String separadorInteiro [] = Banco.getCliente().get(valor).getCpf().split("");
            String acumuladorInteiro = "";
            for (int i = 0; i < separadorInteiro.length; i++) {
                acumuladorInteiro = acumuladorInteiro + separadorInteiro[i];
                if (acumuladorInteiro.equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                }
            }
        }
        if (podeEntrar == true) {
            String separadorInteiro [] = Banco.getCliente().get(valor).getRg().split("");
            String acumuladorInteiro = "";
            for (int i = 0; i < separadorInteiro.length; i++) {
                acumuladorInteiro = acumuladorInteiro + separadorInteiro[i];
                if (acumuladorInteiro.equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                }
            }
        }
        if (podeEntrar == true) {
            String separadorInteiro [] = Banco.getCliente().get(valor).getEmail().split("");
            String acumuladorInteiro = "";
            for (int i = 0; i < separadorInteiro.length; i++) {
                acumuladorInteiro = acumuladorInteiro + separadorInteiro[i];
                if (acumuladorInteiro.equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                }
            }
        }
        if (podeEntrar == true) {
            String separadorInteiro [] = Banco.getCliente().get(valor).getTelefone().split("");
            String acumuladorInteiro = "";
            for (int i = 0; i < separadorInteiro.length; i++) {
                acumuladorInteiro = acumuladorInteiro + separadorInteiro[i];
                if (acumuladorInteiro.equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                }
            }
        }
        if (podeEntrar == true) {
            String separadorInteiro[] = Banco.getCliente().get(valor).getEndereco().split("");
            String separadorPalavras[] = Banco.getCliente().get(valor).getEndereco().split(" ");
            String acumuladorInteiro = "";
            for (int i = 0; i < separadorInteiro.length; i++) {
                acumuladorInteiro = acumuladorInteiro + separadorInteiro[i];
                if (acumuladorInteiro.equals(pesquisa)) {
                    retorno = valor;
                    podeEntrar = false;
                }
            }
            if (separadorPalavras.length > 1) {
                for (int i = 0; i < separadorPalavras.length; i++) {
                    String separadorCaracterePalavra [] = separadorPalavras[i].split("");
                    String acumuladorPalavras = "";
                    for (int j = 0; j < separadorCaracterePalavra.length; j++) {
                        acumuladorPalavras = acumuladorPalavras + separadorCaracterePalavra[j];
                        if (acumuladorPalavras.equals(pesquisa)) {
                            retorno = valor;
                            podeEntrar = false;
                        }
                    }
                }
            }
        }
        return retorno;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
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
