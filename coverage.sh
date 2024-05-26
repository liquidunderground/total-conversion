#!/bin/sh

FILES="$(grep -E "^[0-9A-Za-z.]+:" CREDITS.txt)"
FILES_COUNT="$(echo "${FILES}" | wc -l)"

COVERAGE="$(echo "${FILES}" | grep -E "	")"
COVERAGE_COUNT="$(echo "${COVERAGE}" | wc -l)"
COVERAGE_FRAC="$(echo "3 k ${COVERAGE_COUNT} ${FILES_COUNT} / 100 * p q" | dc)"

CONTRIBUTORS="$(echo "${FILES}" | cut -sf 2 | sort | uniq -i)"
CONTRIBUTORS_COUNT="$(echo "${CONTRIBUTORS}" | wc -l)"

echo -e "=== ASSET COVERAGE REPORT ===\n"
echo -e "Total Files: ${FILES_COUNT}\nCoverage: ${COVERAGE_COUNT} (${COVERAGE_FRAC} %)\nContributors: ${CONTRIBUTORS_COUNT}\n"

IFS=$'\n'
echo -e "--- Contributors by name ---\n"
for n in $CONTRIBUTORS; do
	ABSOLUTE=$(echo "$FILES" | grep "${n}" | wc -l)
	RELCOV=$(echo "3 k ${ABSOLUTE} ${COVERAGE_COUNT} / 100 * p q" | dc)
	TOTCOV=$(echo "3 k ${ABSOLUTE} ${FILES_COUNT} / 100 * p q" | dc)
	echo "${n}"
done

echo -e "\n--- Coverage by Contributor ---\n"
for n in $CONTRIBUTORS; do
	ABSOLUTE=$(echo "$FILES" | grep "${n}" | wc -l)
	RELCOV=$(echo "3 k ${ABSOLUTE} ${COVERAGE_COUNT} / 100 * p q" | dc)
	TOTCOV=$(echo "3 k ${ABSOLUTE} ${FILES_COUNT} / 100 * p q" | dc)
	echo -e "${n}:\n  - Absolute file count: ${ABSOLUTE}\n  - Relative Coverage fraction: ${RELCOV} %\n  - Absolute coverage fraction: ${TOTCOV} %"
done

