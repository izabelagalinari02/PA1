
README file for Programming Assignment 1
========================================

Your directory should now contain the following files:

 Makefile
 README
 atoi.cl 
 stack.cl
 stack.test 

	The Makefile contains targets for compiling and running your
	program, as well as handing it in.

	The README contains this info. Part of the assignment is to
	answer the questions at the end of this README file.
	Just edit this file.

	atoi.cl is an implementation in Cool of the string to integer
	conversion function known from the C language.

	stack.cl is the skeleton file which you should fill in with
	your program.

	stack.test is a short test input to the stack machine. It is
	run through your program when you hand it in, and the output
	is also	handed in.


        The symlinked files (see "man ln") are that way to emphasize
        that they are read-only -- when we test your program, we already
        have our own versions.


Instructions
------------

	To compile and run your program, type:

	% gmake test

        Try it now -- it should work, and print "Nothing implemented"
        (among a few other things).


        To simply compile your program, type

        % gmake compile


	Instructions for turning in the assignment will be posted on the
	course web page.

	GOOD LUCK!

---8<------8<------8<------8<---cut here---8<------8<------8<------8<---

Questions on PA1
----------------

1. Describe your implementation of the stack machine in a single short
   paragraph.

   Minha implementação da máquina de pilha consiste na criação da classe 
   `StackCommand` e suas subclasses que contém cada uma das operações necessárias
   para a realização do exercício.


2. List 3 things that you like about the Cool programming language.

	- Gosto do fato de a linguagem é Orietada a Objetos, permitindo fazer 
	operações complexas, como herança por exemplo.
	- Também me agrada muito a linguagem ser fortemente tipada com tipagem estática,
	o que deixa o programa mais organizado e menos propenso a falhas, na minha opinião.
	- Gosto muito da forma com que a linguagem Cool implementa a definição de escopo, por
	meio de `{}`, ao invés de ser por identação, como o python.

3. List 3 things you DON'T like about Cool.
	
	- Não gosto do uso de `<-` para atribuição no lugar do `=`.
	- Achei que falta plugins ou uma IDE especializada para o uso da linguagem Cool. Fiz com
	o Sublime, e acaba que a IDE é apenas uma ferramenta de texto qualquer, como o bloco de notas.
	Além disso, achei que a depuração de erros bem limitada, o console apenas indica onde está o 
	erro durante a exucução, mas não exatamente qual o erro, o que dificulta a correção de bugs.
	- A linguagem é extretamamete simples e muitas vezes verbosa de mais. Me incomoda a falta de 
	um `for`, por exemplo, além do fato de ter que usar keywords como `loop` e `pool` ao usar
	o `while`.
