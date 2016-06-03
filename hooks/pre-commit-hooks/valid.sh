echo -e "\n#### Validating chef environment files ####"


if git-rev-parse --verify HEAD >/dev/null 2>&1; then
    against=HEAD
else
    against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

bad_file=0

for FILE in `git diff-index --name-status $against -- | cut -c3-` ; do

    if [ ${FILE: -5} == ".json" ]; then
        echo -e "  Validating $FILE..."
        cat $FILE | jq 'any'
        if [[ $? -ne 0 ]]; then
          echo -e "\tERROR: JSON parser failed!"
          bad_file=1
        fi
    fi
done

if [[ $bad_file -eq 1 ]]; then
  echo -e "\n"
  exit 1
else
  echo "#### All JSON files OK! #####"
  echo -e "\n"
  exit 0
fi
