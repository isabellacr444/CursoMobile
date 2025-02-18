package Controller;

import java.util.ArrayList;
import java.util.List;

import Model.Aluno;
import Model.Professores;

public class Curso {
    //atributos 
    private String nomeCurso;
    private Professores professores;
    private List<Aluno> alunos ;
    //construtor
    public Curso(String nomeCurso, Professores professores) {
        this.nomeCurso = nomeCurso;
        this.professores = professores;
        alunos = new ArrayList<>();
    }
    
    //métodos
    //adicionar alunos 
    public void adicionarAluno(Aluno aluno){
        alunos.add(aluno);

    }
    //exibirInformacoesCurso
    public void exibirInformacoesCurso(){
        System.out.println("Nome do Curso: "+nomeCurso);
        System.out.println("Nome do Professor: "+professores.getNome());

        //foreach
        int contador = 0;
        System.out.println("=====================");
        for (Aluno aluno : alunos) {
            contador++;
            System.out.println(contador+". "+aluno.getNome());

        System.out.println("=======================");

        }
    }
}
