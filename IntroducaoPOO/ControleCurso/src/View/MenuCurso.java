package View;

import java.util.Scanner;

import Controller.Curso;
import Model.Aluno;
import Model.Professores;

public class MenuCurso {

    //atributos
    private boolean continuar = true;
    private int operacao;
    Scanner sc = new  Scanner(System.in);

    //métodos
    public void menu(){
        //instacia curso e professor
        Professores professores = new Professores("José Pereira", "123", 15000);
        Curso curso = new Curso("Programação Java", professores);

        while (continuar) {
            System.out.println("Sistema de Gestão Escolar==");
            System.out.println("1. Cadastrar Aluno no Curso");
            System.out.println("2. Informações do Curso");
            System.out.println("3. Status da Turma");
            System.out.println("4. Sair");
            System.out.println("Escolha a Opção Desejada: ");
            operacao = sc.nextInt();
            switch (operacao){
                case 1:
                    System.out.println("Informe o Nome do Aluno");
                    String nomeAluno = sc.next();
                    System.out.println("Informe o cpf do Aluno");
                    String cpfAluno = sc.next();
                    System.out.println("Informe a Matricula");
                    String matriculaAluno = sc.next();
                    System.out.println("Informe a Nota do Aluno");
                    double notaAluno = sc.nextDouble();
                    Aluno aluno = new Aluno(nomeAluno, cpfAluno, matriculaAluno, notaAluno);
                    curso.adicionarAluno(aluno);
                break;

                case 2:
                    curso.exibirInformacoesCurso();
                break;

                case 3: // a fazer
                    break;

                case 4: 
                    System.out.println("Saindo...");
                    continuar = false;
                    break;

                default:
                System.out.println("Informe uma Operação Válida");
                break;
            }
        }
    }

}
