package Model;

public class Professores extends  Pessoa{

    private double salario;

    public Professores(String nome, String cpf, double salario) {
        super(nome, cpf);
        this.salario = salario;
    }

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    @Override
    public void exibirInformacoes() {
        // TODO Auto-generated method stub
        super.exibirInformacoes();
        System.out.println("Salario: "+salario);
    }

    


}
