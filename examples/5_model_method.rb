def name
  (return 'Unknown Name') if !firstname && !lastname
  (return firstname + ' ' + lastname) if firstname && lastname
  (return firstname) if firstname
  lastname
end 
