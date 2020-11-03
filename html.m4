divert(-1)
changecom()
define(`CHARACTER_CLASS', <a href="/character-class.html#$1" class="character">$1</a>)
define(`CONCEPT', <a href="#$1" class="concept">$2</a>)
define(`CONCEPT_DEFINITION', <h2 id="$1" class="concept">$2</h2>)
define(`FLAG', <div><dt>$1</dt><dd>$2</dd></div>)
define(`__', <li>$1</li>)
define(`THIS', <code class="THISTYPE">THISNAME</code>)
define(`MATH', <math>$1</math>)
define(`PI', &pi;)
define(`POW', $1<sup>$2</sup>)
define(`SQRT', &radic;$1)
define(`FLOOR', &lfloor;$1&rfloor;)
define(`CEIL', &lceil;$1&rceil;)
define(`ABS', |$1|)
define(`VAR', <var class="math">$1</var>)

define(`ARGUMENT', <var class="argument">$1</var>)
define(`CHAR', <code class="character">$1</code>)
define(`CAST', <code>(<span class="type">$1</span>)($2)</code>)
define(`CONSTANT', <a href="/i/$1.html" class="constant">$1</a>)
define(`COMMENT', <code class="comment">/* $1 */</code>)
define(`DEFINITION', <code class="definition">$1</code>)
define(`LITERAL', <code class="literal">$1</code>)
define(`OPERATOR', <code class="operator">$1</code>)
define(`FUNCTION', <a href="/i/$1.html" class="function">$1()</a>)
define(`HEADER', <a href="/i/$1.html" class="header">$1</a>)
define(`LT', &lt;)
define(`GT', &gt;)
define(`IDENTIFIER', <a href="/i/$1.html" class="identifier">$1</a>)
define(`SPACE', <code class="character"><i>space</i></code>)
define(`TYPE', <code class="type">$1</code>)
define(`TYPEDEF', <a href="/i/$1.html" class="type">$1</a>)
define(`STRUCTDEF', <a href="/i/$1.html" class="type">struct $1</a>)
define(`MEMBER', <code class="member">$1</code>)

ifelse(`THISTYPE', `function', `define(`DESC_INTRO', 1)')
ifelse(`THISTYPE', `macro', `define(`DESC_INTRO', 1)')
ifelse(`THISTYPE', `tgfunction', define(`DESC_INTRO', 1)define(`PRETTYTYPE', `family of functions'), define(`PRETTYTYPE', `THISTYPE()'))

define(`PROTOTYPE', $1)

ifdef(`VALUE_MIN', `define(`VALUE', `THIS() must be at least VALUE_MIN().')')
ifdef(`VALUE_MAX', `define(`VALUE', `THIS() must be at most VALUE_MAX().')')
ifdef(`VALUE_FIXED', `define(`VALUE', `THIS() is defined as VALUE_FIXED().')')

define(`VALUE_SELECT', <div><dt>LITERAL($1)</dt><dd>$2</dd></div>)
ifdef(`VALUES', `
	define(`VALUE', `ifdef(`VALUES', `VALUES() popdef(`VALUES') VALUE()')')
	define(`VALUE_PRE', `<p>THIS() may be defined with one of the following values with the indicated meaning:</p>')
')


define(`RETURN', <div><dt>$1</dt><dd>$2</dd></div>)
define(`RETURN_SUCCESS', <p>A successfull call returns $1.</p>)
define(`RETURN_FAILURE', `<p>On failure, $1 is returned.</p>')
define(`RETURN_ALWAYS', `<p>The THIS() PRETTYTYPE() returns $1.</p>')
define(`RETURN_0', `<p>The THIS() function returns 0 on success, non-zero on failure.</p>')
ifdef(`RETURNS',
	`define(`RETURN_LIST')
	define(`RETURN_VALUE',
		ifdef(`RETURNS', `RETURNS()popdef(`RETURNS')ifdef(`RETURNS', `RETURNS()')')
	')
)
define(`NOVALUE', `<p>The THIS() PRETTYTYPE() does not return a value.</p>')
define(`NORETURN', `<p>The THIS() PRETTYTYPE() does not return.</p>')
define(`NEGATIVE', <var class="return">a negative value</var>)
define(`POSITIVE', <var class="return">a positive value</var>)
define(`NONNEGATIVE', <var class="return">a non-negative value</var>)
define(`NONZERO', <var class="return">a non-zero value</var>)
define(`ZERO', <code class="literal">0</code>)
define(`NONNULL', <var class="return">a non-NULL pointer</var>)

define(`UNDEFINED', <li>$1</li>)
define(`ASSERT_REPRESENTABLE', <li><var class="argument">$1</var> is not representable as a <code class="type">$4</code> or the value <var class="constant">$5</var></li>)
define(`ASSERT_NONZERO', <li>ARGUMENT($1) is LITERAL(0)</li>)
define(`ASSERT_NONNULL', <li>ARGUMENT($1) is CONSTANT(NULL)</li>)
define(`ASSERT_NOOVERLAP', <li>ARGUMENT($1) and ARGUMENT($2) overlap</li>)
ifdef(`UNDEFINEDS', `
	define(`UNDEFINED_BEHAVIOR', `ifdef(`UNDEFINEDS', `UNDEFINEDS() popdef(`UNDEFINEDS') UNDEFINED_BEHAVIOR()')')
')

define(`UNSPECIFIED', <li>$1</li>)
ifdef(`UNSPECIFIEDS', `
	define(`UNSPECIFIED_BEHAVIOR', `ifdef(`UNSPECIFIEDS', `UNSPECIFIEDS() popdef(`UNSPECIFIEDS') UNSPECIFIED_BEHAVIOR()')')
')

define(`IMPLEMENTATION', <li>$1</li>)
ifdef(`IMPLEMENTATIONS', `
	define(`IMPLEMENTATION_DEFINED', `ifdef(`IMPLEMENTATIONS', `IMPLEMENTATIONS() popdef(`IMPLEMENTATIONS') IMPLEMENTATION_DEFINED()')')
')


define(`LOCALE', <code class="locale">"$1"</code>)

divert(0)dnl
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>THISNAME() - BRIEF()</title>
<link rel="stylesheet" type="text/css" href="man.css" />
</head>
<body>

<div id="synopsis">
<h1>Synopsis</h1>
<pre><code>ifdef(`INCLUDES', `<span class="preprocessor">INCLUDES()</span>
')<span class="signature">SIGNATURE()</span></code></pre>
</div>

<div id="description">
<h1>Description</h1>
<p>ifdef(`DESC_INTRO', `The THIS() PRETTYTYPE() ')DESCRIPTION()</p>
ifdef(`LC_CATEGORIES',
	`<div id="locale"><h2>Locale Specific Behavior</h2>
	<p>The behavior of THIS() may differ based on the current value of
	LC_CATEGORIES().</p>
	ifdef(`C_LOCALE', `<p>In the LOCALE(`C') locale, C_LOCALE().</p>')dnl
	ifdef(`OTHER_LOCALES', `<p>In locales other than LOCALE(`C'), OTHER_LOCALES().')dnl
	</div>')dnl
ifdef(`IMPLEMENTATION_DEFINED',
	`<h2>Implementation Defined Behavior</h2><ul>IMPLEMENTATION_DEFINED()
	</ul></div>')dnl
ifdef(`UNSPECIFIED_BEHAVIOR',
	`<h2>Unspecified Behavior</h2><ul>UNSPECIFIED_BEHAVIOR()</ul>')dnl
ifdef(`UNDEFINED_BEHAVIOR',
	`<h2>Undefined Behavior</h2><ul>UNDEFINED_BEHAVIOR()</ul>')dnl

</div>

ifdef(`VALUE',
`<div id="value">
<h1>Value</h1>
ifdef(`VALUE_PRE', `VALUE_PRE()<dl>')
VALUE()
ifdef(`VALUE_PRE', `</dl>')
</div>')

ifdef(`RETURN_VALUE',
`<div id="return">
<h1>Return Value</h1>
ifdef(`RETURNS', `<p>The THIS() PRETTYTYPE() returns one of the following values:</p><dl>')
RETURN_VALUE()
ifdef(`RETURN_LIST', `</dl>')
ifdef(`ERRORS',
	`<h2>Errors</h2>
	<p>On failure, IDENTIFIER(errno) maye be set to one of the following
	values to detail the cause of failure:</p>
	<dl>ERRORS()</dl>')
</div>')

<div id="conformance">
<h1>Conformance</h1>
<table>
	<tr><th>ISO/IEC 9899:1990</th><th>ISO/IEC 9899:1999</th><th>ISO/IEC 9899:2011</th></tr>
	<tr><td>C90()</td><td>C99()</td><td>C11()</td></tr>
</table>

<!-- table>
	<tr><th>POSIX.1-1990</th><th>POSIX.1-1996</th><th>POSIX.1-2001</th><th>POSIX.1-2008</th></tr>
	<tr><td>P90()</td><td>P96()</td><td>P01()</td><td>P08()</td></tr>
</table -->
</div>
</body>
</html>
