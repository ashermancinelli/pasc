function useloop()
begin
  var a := 0;
  var i := 0;

  { For loop example }
  for i = 0; i < 10; i = i + 1;
  begin
    a = a + 1;
  end;

  return a;
end;
