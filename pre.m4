divert(-1)
changecom()
define(`m4npage', `
	define(`THISNAME', $1)
	define(`THISTYPE', $2)
')

define(`brief', `define(`BRIEF', `$1')')

define(`required_header', `')

define(`return_type', `')

define(`argument', `$1 $2')dnl $3 is the description

define(`describe', `define(`DESCRIPTION_TEXT', `The THISNAME THISTYPE $1')')

dnl TODO: move this to en-US.m4
define(`NAME_HEADER', `Name')
define(`SYNOPSIS_HEADER', `Synopsis')
define(`DESCRIPTION_HEADER', `Description')
