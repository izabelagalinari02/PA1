class StackCommand inherits IO {
   elem: String <- "";
   next: StackCommand;

   isNil(): Bool { if (elem = "") then true else false fi };
   top(): String { elem };
   pop(): StackCommand { next };

   init(s: String, rest: StackCommand): StackCommand {
      {
         elem <- s;
         next <- rest;
         self;
      }
   };


   push(s: String): StackCommand {
      (new StackCommand).init(s, self)
   };

   operation(stack: StackCommand): StackCommand { stack };
};

class StackCommandPlus inherits StackCommand {
   add(stack: StackCommand): StackCommand {
      let first: Int,
         second: Int,
         result: String
      in {
         stack <- stack.pop();
         first <- (new A2I).a2i(stack.top());
         stack <- stack.pop();
         second <- (new A2I).a2i(stack.top());
         stack <- stack.pop();
         result <- (new A2I).i2a(first + second);
         (new StackCommand).init(result, stack); 
      }
   };

   operation(stack: StackCommand): StackCommand {
      add(stack)
   };
};

class StackCommandS inherits StackCommand {
   swap(stack: StackCommand): StackCommand {
      let first: String,
         second: String
      in {
         stack <- stack.pop();
         first <- stack.top();
         stack <- stack.pop();
         second <- stack.top();
         stack <- stack.pop();
         stack <- stack.push(first).push(second);
         stack;   
      }
   };

   operation(stack: StackCommand): StackCommand {
      swap(stack)
   };
};

class StackCommandD inherits StackCommand {
   // Imprime todos elementos 
   print_stack(stack: StackCommand): StackCommand {
      if (not stack.isNil()) then {
         out_string(stack.top()); // Imprime o que esta no topo
         out_string("\n");
         print_stack(stack.pop()); // Chama recursivamente o próximo
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
         if (cmd = "d") then { // Se o comando for "d", imprime a pilha
            new StackCommandD.operation(stack);
         }
         else if (cmd = "e") then { // Se o comando for "e", executa a operação correspondente ao topo da pilha
            let top: String <- stack.top() in {
               if (top = "+") then 
                  stack <- new StackCommandPlus.operation(stack) // Faz a soma
               else if (top = "s") then
                  stack <- new StackCommandS.operation(stack) // Faz a troca
               else
                  stack -- do nothing 
               fi fi;
            };
         }
         else 
            stack <- stack.push(cmd) // Empilha o comando
         fi fi;
      } pool
   };
};
