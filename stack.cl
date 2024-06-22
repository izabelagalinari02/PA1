class StackCommand inherits IO {
   elem: String <- "";
   next: StackCommand;

   (* vê se a pilha esta vazia *)
   isNil(): Bool { if (elem = "") then true else false fi };

   (* retorna elemento do topo *)
   top(): String { elem };

   (* remove o elemento no topo da pilha e retorna o próximo comando *)
   pop(): StackCommand { next };

   (* inicializar a pilha com um elemento e o próximo comando *)
   init(s: String, rest: StackCommand): StackCommand {
      {
         elem <- s;
         next <- rest;
         self;
      }
   };

   (* adiciona um novo elemento no topo *)
   push(s: String): StackCommand {
      (new StackCommand).init(s, self)
   };

   (* método para operações na pilha. Pode ser sobrescrito por subclasses *)
   operation(stack: StackCommand): StackCommand { stack };
};

class StackCommandPlus inherits StackCommand {
   (* soma dois primeiros elementos *)
   add(stack: StackCommand): StackCommand {
      let first: Int,
         second: Int,
         result: String
      in {
         stack <- stack.pop(); (* remove o topo *)
         first <- (new A2I).a2i(stack.top()); (* converte o topo para inteiro *) 
         stack <- stack.pop(); (* remove novo topo *) 
         second <- (new A2I).a2i(stack.top()); (* converte novo topo para inteiro *)
         stack <- stack.pop(); (* remove novo topo *)
         result <- (new A2I).i2a(first + second); (* soma os inteiros e converte o resultado para string *)
         (new StackCommand).init(result, stack);  (* cria uma nova pilha com o resultado da soma *)
      }
   };
(* sobrescreve o método operation para realizar a soma *)
   operation(stack: StackCommand): StackCommand {
      add(stack)
   };
};

class StackCommandS inherits StackCommand {
   (* Troca os dois primeiros elementos da pilha *)
   swap(stack: StackCommand): StackCommand {
      let first: String,
         second: String
      in {
         stack <- stack.pop(); (* remove o topo *)
         first <- stack.top(); (* guarda o elemento do topo *)
         stack <- stack.pop(); (* remove o novo topo *)
         second <- stack.top(); (* guarda o novo topo *)
         stack <- stack.pop(); (* remove o proximo topo *)
         stack <- stack.push(first).push(second); (* empilhada na ordem invertida *)
         stack;   
      }
   };

   (* sobrescreve o método operation para realizar a troca *)
   operation(stack: StackCommand): StackCommand {
      swap(stack)
   };
};

class StackCommandD inherits StackCommand {
   (* Imprime todos elementos *)
   print_stack(stack: StackCommand): StackCommand {
      if (not stack.isNil()) then {
         out_string(stack.top()); (* Imprime o que esta no topo *)
         out_string("\n");
         print_stack(stack.pop()); (* Chama recursivamente o próximo *)
      } else {
         out_string("");
      }
      fi
   };   

   operation(stack: StackCommand): StackCommand {
      print_stack(stack)
   };
};

class Main inherits IO {

   stack: StackCommand <- (new StackCommand);

   main() : Object {
      let cmd: String <- "" in
      while (not cmd = "x") loop { (* Loop principal até o usuário digitar "x" *)
         out_string(">");
         cmd <- in_string();
         if (cmd = "d") then { (* Se o comando for "d", imprime a pilha *)
            new StackCommandD.operation(stack);
         }
         else if (cmd = "e") then { (* Se o comando for "e", executa a operação correspondente ao topo da pilha *)
            let top: String <- stack.top() in {
               if (top = "+") then 
                  stack <- new StackCommandPlus.operation(stack) (* Faz a soma *)
               else if (top = "s") then
                  stack <- new StackCommandS.operation(stack) (* Faz a troca *)
               else
                  stack 
               fi fi;
            };
         }
         else 
            stack <- stack.push(cmd) (* Empilha o comando *)
         fi fi;
      } pool
   };
};
