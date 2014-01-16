# 20% fewer nodes
# mostly by removing parentheses and return calls
def name_with_less_nodes
  if !firstname && !lastname
    'Unknown Name'
  elsif firstname && lastname
    firstname + ' ' + lastname
  elsif firstname
    firstname
  else
    lastname
  end
end 
