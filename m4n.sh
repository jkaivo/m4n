die() {
	printf '%s: ' $(basename $0)
	printf "$@" >&2
	exit 1
}

get_file_type() {
	if (head -n1 $1 | grep -q m4npage); then
		echo m4n
		return
	fi

	if grep -q 'int main' $1; then
		echo utility
		return
	fi

	# TODO: detect other types
	echo function
}

m4n_m4n() {
	cat
}

utility_m4n() {
	cat <<-EOF
	m4npage($1, utility)
	brief(something)
	describe(is a program.)
	EOF
}

function_m4n() {
	cat <<-EOF
	m4npage($1, function)
	brief(something else)
	describe(is a function.)
	EOF
}

main() {
	while getopts O: opt; do
		case $opt in

		O)
			if ! command -v "${OPTARG}_m4" >/dev/null 2>/dev/null; then
				die 'invalid output type %s\n' "$OPTARG"
			fi

			om4=${OPTARG}_m4
			;;

		?)	exit 1;;
		esac
	done

	shift $((OPTIND - 1))


	if [ $# -lt 1 ]; then
		die 'missing operand\n'
	elif [ $# -gt 1 ]; then
		die 'too many operands\n'
	fi

	type=$(get_file_type $1)

	if [ $type != "m4n" ]; then
		# TODO: handle -O output (default to M4N)
		${type}_m4n $1
	else
		${om4:-text_m4} $1 | m4
	fi
}

main "$@"
