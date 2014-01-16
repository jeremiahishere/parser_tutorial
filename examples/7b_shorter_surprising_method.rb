# is it better code?
# removes parentheses, replaces string concatenation with interpolation, runs loops once
def record_error_with_less_nodes
  @supervisor.increment_error_count

  dashes = '-' * 90

  @error = %{#{exception.message}\n#{exception.backtrace.join("\n")}
#{dashes}\nQUEUE ELEMENT:\n#{@element.inspect}
#{dashes}\nRAW PAYLOAD:\n#{@response.inspect}
#{dashes}\nRAW BODY:\n#{@response_body.inspect}
#{dashes}\nPARSED PAYLOAD:\n#{@entity.inspect}}

  log("#{'=' * 90}\nERROR processing data!#{@error}")
end
