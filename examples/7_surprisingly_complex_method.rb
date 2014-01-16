def record_error(exception)
  @supervisor.increment_error_count

  @error = exception.message + "\n" + exception.backtrace.join("\n") +
    "\n#{('-' * 90)}\nQUEUE ELEMENT:\n#{@element.inspect}" +
    "\n#{('-' * 90)}\nRAW PAYLOAD:\n#{@response.inspect}" +
    "\n#{('-' * 90)}\nRAW BODY:\n#{@response_body.inspect}" +
    "\n#{('-' * 90)}\nPARSED PAYLOAD:\n#{@entity.inspect}"
  log(('=' * 90) + "\nERROR processing data!" + @error)
end
