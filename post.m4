define(`SYNOPSIS', `HEADING(SYNOPSIS_HEADER)
SYNOPSIS_TEXT')
define(`DESCRIPTION', `HEADING(DESCRIPTION_HEADER)
DESCRIPTION_TEXT')

divert(0)dnl
HEADER()
NAME()
SYNOPSIS()
DESCRIPTION()
ifdef(`OPTIONS', `OPTIONS()')dnl
ifdef(`OPERANDS', `OPERANDS()')dnl
ifdef(`STDIN', `STDIN()')dnl
ifdef(`INPUT_FILES', `INPUT_FILES()')dnl
ifdef(`ENVIRONMENT_VARIABLES', `ENVIRONMENT_VARIABLES()')dnl
ifdef(`ASYNCHRONOUS_EVENTS', `ASYNCHRONOUS_EVENTS()')dnl
ifdef(`STDOUT', `STDOUT()')dnl
ifdef(`STDERR', `STDERR()')dnl
ifdef(`OUTPUT_FILES', `OUTPUT_FILES()')dnl
ifdef(`EXTENDED_DESCRIPTION', `EXTENDED_DESCRIPTION()')dnl
ifdef(`EXIT_STATUS', `EXIT_STATUS()')dnl
ifdef(`CONSEQUENCE_OF_ERRORS', `CONSEQUENCE_OF_ERRORS()')dnl
ifdef(`RETURN_VALUE', RETURN_VALUE()')dnl
ifdef(`ERROS', `ERRORS()')