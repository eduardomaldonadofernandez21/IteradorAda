with Iterador; use Iterador;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure Main is
   Values : Int_array(1..Argument_Count);
   Iter : Binary_Iterators;
begin
   for I in 1 .. Argument_Count loop
      Values(I) := Integer'Value(Argument(I));
      --Put_Line(Integer'Image(Values(I)));
   end loop;
   Iter := CreateBinary_Iterators(Values); --Hasta aquí todo chachi
   while HasNext(Iter) loop --Esto no es el fallo pero para no provocar bucle infi
      declare
         tester : Int_array (1..3);
      begin
         tester := Next(Iter);
         PointerCalculator(Iter);
         for J in tester'Range loop
            Put_Line(Integer'Image(tester(J)) & " ");
         end loop;
      end;
      Put_Line("------------");
   end loop;
   Set_Exit_Status (Success);
--exception
--when others =>
   --Set_Exit_Status (Failure);
   --Put_Line("Este argumento no es valido");
end Main;
