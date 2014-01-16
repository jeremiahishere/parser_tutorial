def control_flow
  if condition1 && condition2
    foo = 'a'
  else
    foo = 'b'
  end

  foo = condition1 && condition2 ? 'a' : 'b'

  while foo == 'a'
    foo = 'b'
  end
end
