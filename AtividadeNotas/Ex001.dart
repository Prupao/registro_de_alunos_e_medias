import 'alunos.dart';
import 'notas.dart';
import 'dart:io';

var students = <Alunos>[];
var grades = <Notas>[];
var greatestAverage = grades[0].media;
int? option;

void menu (){
  print('[ 1 ] Cadastrar Alunos \n'
      '[ 2 ] Cadastrar Notas \n'
      '[ 3 ] Exibir as médias \n'
      '[ 4 ] Exibir aluno com maior nota \n'
      '[ 5 ] Sair');
  print('Escolha: ');
}

void addAlunos(){
  var aluno = Alunos();
  print("Informe a matricula do aluno: ");
  aluno.matricula = int.parse(stdin.readLineSync()!);
  print('Informe o nome: ');
  aluno.nome = stdin.readLineSync()!.toUpperCase();
  students.add(aluno);
  exibirAlunos();
}

void exibirAlunos(){
  for(var i = 0; i < students.length; i++){
    print("Matricula: ${students[i].matricula}\n"
        "Nome: ${students[i].nome}\n");
  }
}

void exibirMedias(){
  int? media;
  for(int i = 0; i < students.length; i++){
    if(grades[i].media! > 6 && grades[i].media! < 7){
      print('Sua nota original era ${grades[i].media!.toStringAsFixed(1)}');
       media = grades[i].media!.ceil();
       print("Matricula: ${students[i].matricula}\n"
           "Nome: ${students[i].nome}\n"
           "Média: ${media.toStringAsFixed(1)}\n"
           "Situação: APROVADO por arredondamento\n");
    }else if(grades[i].media! <= 6){
        print("Matricula: ${students[i].matricula}\n"
            "Nome: ${students[i].nome}\n"
            "Média: ${grades[i].media!.toStringAsFixed(1)}\n"
            "Situação: REPROVADO \n");
    }else if(grades[i].media! >= 7){
        print("Matricula: ${students[i].matricula}\n"
            "Nome: ${students[i].nome}\n"
            "Média: ${grades[i].media!.toStringAsFixed(1)}\n"
            "Situação: APROVADO \n");
    }
  }
}

double gerarMedia(int? idAluno, av1, av2, av3){
  double? media;
  for(int i = 0; i < students.length; i++){
    if(students[i].matricula == idAluno){
      media = (av1 + av2 + av3) / 3;
      break;
    }
  }
  return media!;
}

void AddAverage(){
  var notas = Notas();
  exibirAlunos();
  print("Informe a matricula do aluno: ");
  notas.matricula = int.parse(stdin.readLineSync()!);
  print('Informe a 1ª nota: ');
  notas.avaliacao1 = double.parse(stdin.readLineSync()!);
  print('Informe a 2ª nota: ');
  notas.avaliacao2 = double.parse(stdin.readLineSync()!);
  print('Informe a 3ª nota: ');
  notas.avaliacao3 = double.parse(stdin.readLineSync()!);
  notas.media = gerarMedia(notas.matricula, notas.avaliacao1, notas.avaliacao2, notas.avaliacao3);
  grades.add(notas);
  exibirMedias();
}

void Greater(){
  for(var i = 0; i < students.length; i++){
    if(grades[i].media! > greatestAverage!){
      greatestAverage = grades[i].media;
    }
  }
  for(var i = 0; i < grades.length; i++){
    if(greatestAverage! == grades[i].media!){
      print('Nome: ${students[i].nome}\n'
          'Média: ${greatestAverage}');
    }
  }
}

void main(){
  while(option != 5){
    try{
      menu();
      option = int.parse(stdin.readLineSync()!);
      switch(option){
        case 1:
          addAlunos();
          break;
        case 2:
          AddAverage();
          break;
        case 3:
          print('=*' * 12);
          print('---Alunos e médias---');
          exibirMedias();
          print('=*' * 12);
          break;
        case 4:
          Greater();
          break;
        default:
          print('SAINDO...');
          break;
      }
    }catch(e){
      print('=#' * 10);
    }
  }
}