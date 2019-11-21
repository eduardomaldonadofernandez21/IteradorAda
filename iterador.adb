with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;

package body Iterador is
   --Creamos un record Binary_Iterators
   function CreatePosition return Int_Array is
      P : Int_array (0..Argument_Count-1);
   begin
      for I in 0 .. Argument_Count-1 loop
        P(I) := 0;
      end loop;
      return P;
   end CreatePosition;

   function CreateBinary_Iterators (V : Int_array) return Binary_Iterators is
      Tam : constant Integer := Argument_Count;
      res : constant Binary_Iterators :=
        (Values => V,
         Positions => CreatePosition,
         Size => Tam,
         Pointer => Tam - 1,
         Count => 0);
   begin
      return res;
   end CreateBinary_Iterators;

   function HasNext (rec : Binary_Iterators) return Boolean is
   begin
      return rec.count /= rec.Size;
   end HasNext;

   function Next (rec : Binary_Iterators) return Int_array is
      J : Integer := 0;
      Copia : Binary_Iterators := rec;
   begin
      PointerCalculator(Copia);
      declare
         Iteration : Int_array(0..Copia.Count);
      begin
         for I in 0 .. Copia.Size-1 loop
         if Copia.Positions(I) = 1 then
            Iteration(J) := Copia.Values(I+1);
               J := J + 1;
            --Put_Line(Integer'Image(Copia.Values(I)));
         end if;
      end loop;
      return Iteration;
      end;
      --Put_Line(Integer'Image(rec.Count) & Integer'Image(Copia.Count));
   end Next;


   procedure PointerCalculator (rec : in out Binary_Iterators) is
      --Copia : Binary_Iterators := rec;
   begin
      if rec.Positions(rec.Pointer) = 0 then
         rec.Positions(rec.Pointer) := 1;
         rec.Count := rec.Count + 1;
         rec.Pointer := rec.Size -1;
      else
         rec.Positions(rec.Pointer) := 0;
         rec.Count := rec.Count -1;
         if rec.Pointer >= 0 then
            rec.Pointer := rec.Pointer - 1;
            PointerCalculator(rec);
         else
            rec.Pointer := rec.Size -1;
         end if;
      end if;
   end PointerCalculator;

   function TamCount (rec : Binary_Iterators) return Integer is
      Tam : Integer;
      Copia : Binary_Iterators := rec;
   begin
      PointerCalculator(Copia);
      Tam := Copia.Count;
      return Tam;
   end TamCount;

end Iterador;


