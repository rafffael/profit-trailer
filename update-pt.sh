#!/bin/bash
latest=$(curl -s https://api.github.com/repos/taniman/profit-trailer/releases | grep tag_name | cut -d '"' -f 4 | sed -n '1p')
read -p "Update to version ${latest}? (Y/N)" ANSWER
if [[ $ANSWER == "Y" ]]; then
wget https://github.com/taniman/profit-trailer/releases/download/${latest}/ProfitTrailer-${latest}.zip
unzip -j ProfitTrailer-${latest}.zip
fi
