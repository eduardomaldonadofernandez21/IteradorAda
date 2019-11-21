with Ada.Command_Line; use Ada.Command_Line;

package Iterador is

   type Int_array is array (Natural range <>) of Integer;
   type Binary_Iterators is record
      Values : Int_array (1..Argument_Count);
      Positions : Int_array (0..Argument_Count-1);
      Pointer : Integer;
      Size : Integer;
      Count : Integer;
   end record;

   function CreatePosition return Int_array;
   function CreateBinary_Iterators (V : Int_array) return Binary_Iterators;
   function HasNext (rec : Binary_Iterators) return Boolean;
   function Next (rec : Binary_Iterators) return Int_array;
   procedure PointerCalculator (rec : in out Binary_Iterators); --return Binary_Iterators;
   function TamCount (rec : Binary_Iterators) return Integer;

end Iterador;
