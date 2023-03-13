#for p in `head movielist.txt`
while IFS='' read -r LinefromFile || [[ -n "${LinefromFile}" ]]; do
	part1=$(dirname "$LinefromFile")
	part2=$(basename "$LinefromFile")
	echo "$part2|$part1"
done < "$1"
