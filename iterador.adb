with Ada.Command_Line; use Ada.Command_Line;

package body Iterador is
   --Creamos un record Binary_Iterators
   function CreatePosition return Int_Array is
      P : Int_array (1..Argument_Count);
   begin
      for I in 1 .. Argument_Count loop
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
      Iteration : Int_array(0..rec.Count);
      J : Integer := 0;
      Copia : Binary_Iterators := rec;
   begin
      PointerCalculator(Copia);
      --Put_Line(Integer'Image(rec.Count) & Integer'Image(Copia.Count));
      for I in 1 .. Copia.Size loop
         if Copia.Positions(I) = 1 then
            Iteration(J) := rec.Values(I);
            J := J + 1;
         end if;
      end loop;
      return Iteration;
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

end Iterador;


