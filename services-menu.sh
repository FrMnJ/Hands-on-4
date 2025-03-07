#!/bin/bash

PS3="Selecciona una opcion: "

function list() {
  dir=/
  echo Ingresa la ruta absoluta:
  read dir
  ls $dir
  read -p "Presiona enter para continuar..."
  clear
}

function create_file() {
  file=/
  line=
  echo Ingresa la ruta absoluta del archivo a crear:
  read file
  echo Ingresa el contenido una linea:
  read line
  echo $line >$file
  read -p "Presiona enter para continuar..."
  clear
}

function compare() {
  file1=/
  file2=/
  echo Ingresa la ruta absoluta del primer archivo:
  read file1
  echo Ingresa la ruta absoluta del segundo archivo:
  read file2
  echo "Diferencias: "
  diff $file1 $file2
  read -p "Presiona enter para continuar..."
  clear
}

function show_use_awk() {
  echo "Awk is a scripting language used for manipulating data and generating reports. The awk command programming language requires no compiling and allows the user to use variables, numeric functions, string functions, and logical operators."
  echo "Awk is a utility that enables a programmer to write tiny but effective programs in the form of statements that define text patterns that are to be searched for in each line of a document and the action that is to be taken when a match is found within a line. Awk is mostly used for pattern scanning and processing. It searches one or more files to see if they contain lines that matches with the specified patterns and then perform the associated actions."
  echo "Uses:"
  echo "  1) Scans a file line by line"
  echo "  2) Splits a line into fields"
  echo "  3) Compares input line/fields to pattern"
  echo "  4) Perform an action on matched line"
  echo "  5) Transform data files"
  echo "  6) Produce formatted output"
  echo "Syntax:"
  echo "  awk options 'selection _criteria {action }' input-file > output-file"
  echo "Examples:"
  echo "  Print all lines"
  echo "    awk '{print}' example.txt"
  echo "  Print all lines with a pattern"
  echo "    awk '/pattern/ {print}' example.txt"
  echo "  Split a line into fields"
  echo "    awk '{print \$1, \$2}' example.txt"
  read -p "Presiona enter para continuar..."
  clear
}

function show_use_grep() {
  echo "The grep command in Unix/Linux is a powerful tool used for searching and manipulating text patterns within files. Its name is derived from the ed (editor) command g/re/p (globally search for a regular expression and print matching lines), which reflects its core functionality."
  echo "Syntax:"
  echo "  grep [options] pattern [files]"
  echo "Examples:"
  echo "  Case insensitive search:"
  echo "    grep -i pattern example.txt"
  echo "  Show the number of lines matching a pattern:"
  echo "    grep -c pattern example.txt"
  echo "  Show the files matching a pattern:"
  echo "    grep -l pattern *"
  echo "  Match full words only:"
  echo "    grep -w pattern example.txt"
  echo "  Show the line number of each match:"
  echo "    grep -n pattern example.txt"
  echo "  Show the lines that don't match a pattern:"
  echo "    grep -v pattern example.txt"
  read -p "Presiona enter para continuar..."
  clear
}

function flow() {
  select option in lst create cmp awk grep exit; do

    case $option in
    lst)
      list
      ;;
    create)
      create_file
      ;;
    cmp)
      compare
      ;;
    awk)
      show_use_awk
      ;;
    grep)
      show_use_grep
      ;;
    exit)
      echo "Saliendo..."
      break
      ;;
    *)
      echo "Invalid option"
      ;;
    esac
  done
}

flow
