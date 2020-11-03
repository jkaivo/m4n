die() {
	printf '%s: ' $(basename $0)
	printf "$@" >&2
	exit 1
}

main() {
	om4=text_m4

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
	else
		$om4 $1 | m4
	fi
}

main "$@"
