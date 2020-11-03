divert(-1)
changecom()
define(`M4NHEADER', `')

define(`HEADING', `# $1')

define(`NAME_TEXT', `THISNAME() - BRIEF()')

define(`CHARACTER_CLASS', $1)
define(`CONCEPT', $2)
define(`CONCEPT_DEFINITION', $2)
define(`FLAG', $1 -- $2)
define(`__', $1)
define(`THIS', THISNAME)
define(`MATH', $1)
define(`PI', pi)
define(`POW', $1^$2)
define(`SQRT', square root of $1)
define(`FLOOR', floor($1))
define(`CEIL', ceil($1))
define(`ABS', |$1|)
define(`VAR', 1)

define(`ARGUMENT', $1)
define(`CHAR', $1)
define(`CAST', ($1)($2))
define(`CONSTANT', $1)
define(`COMMENT', /* $1 */)
define(`DEFINITION', $1)
define(`LITERAL', $1)
define(`OPERATOR', $1)
define(`FUNCTION', $1())
define(`HEADER', <$1>)
define(`LT', <)
define(`GT', >)
define(`IDENTIFIER', $1)
define(`SPACE', space)
define(`TYPE', $1)
define(`TYPEDEF', $1)
define(`STRUCTDEF', struct $1)
define(`MEMBER', $1)

ifelse(`THISTYPE', `function', `define(`DESC_INTRO', 1)')
ifelse(`THISTYPE', `macro', `define(`DESC_INTRO', 1)')
ifelse(`THISTYPE', `tgfunction', define(`DESC_INTRO', 1)define(`PRETTYTYPE', `family of functions'), define(`PRETTYTYPE', `THISTYPE()'))

define(`PROTOTYPE', $1)

ifdef(`VALUE_MIN', `define(`VALUE', `THIS() must be at least VALUE_MIN().')')
ifdef(`VALUE_MAX', `define(`VALUE', `THIS() must be at most VALUE_MAX().')')
ifdef(`VALUE_FIXED', `define(`VALUE', `THIS() is defined as VALUE_FIXED().')')

define(`VALUE_SELECT', LITERAL($1) -- $2)
ifdef(`VALUES', `
	define(`VALUE', `ifdef(`VALUES', `VALUES() popdef(`VALUES') VALUE()')')
	define(`VALUE_PRE', `THIS() may be defined with one of the following values with the indicated meaning:')
')


define(`RETURN', $1 -- $2)
define(`RETURN_SUCCESS', A successfull call returns $1.)
define(`RETURN_FAILURE', `On failure, $1 is returned.')
define(`RETURN_ALWAYS', `The THIS() PRETTYTYPE() returns $1.')
define(`RETURN_0', `The THIS() function returns 0 on success, non-zero on failure.')
ifdef(`RETURNS',
	`define(`RETURN_LIST')
	define(`RETURN_VALUE',
		ifdef(`RETURNS', `RETURNS()popdef(`RETURNS')ifdef(`RETURNS', `RETURNS()')')
	')
)
define(`NOVALUE', `The THIS() PRETTYTYPE() does not return a value.')
define(`NORETURN', `The THIS() PRETTYTYPE() does not return.')
define(`NEGATIVE', a negative value)
define(`POSITIVE', a positive value)
define(`NONNEGATIVE', a non-negative value)
define(`NONZERO', a non-zero value)
define(`ZERO', 0)
define(`NONNULL', a non-NULL pointer)

define(`UNDEFINED', $1)
define(`ASSERT_REPRESENTABLE', $1 is not representable as a $4 or the value $5)
define(`ASSERT_NONZERO', ARGUMENT($1) is LITERAL(0))
define(`ASSERT_NONNULL', ARGUMENT($1) is CONSTANT(NULL))
define(`ASSERT_NOOVERLAP', ARGUMENT($1) and ARGUMENT($2) overlap)
ifdef(`UNDEFINEDS', `
	define(`UNDEFINED_BEHAVIOR', `ifdef(`UNDEFINEDS', `UNDEFINEDS() popdef(`UNDEFINEDS') UNDEFINED_BEHAVIOR()')')
')

define(`UNSPECIFIED', $1)
ifdef(`UNSPECIFIEDS', `
	define(`UNSPECIFIED_BEHAVIOR', `ifdef(`UNSPECIFIEDS', `UNSPECIFIEDS() popdef(`UNSPECIFIEDS') UNSPECIFIED_BEHAVIOR()')')
')

define(`IMPLEMENTATION', $1)
ifdef(`IMPLEMENTATIONS', `
	define(`IMPLEMENTATION_DEFINED', `ifdef(`IMPLEMENTATIONS', `IMPLEMENTATIONS() popdef(`IMPLEMENTATIONS') IMPLEMENTATION_DEFINED()')')
')


define(`LOCALE', "$1")
