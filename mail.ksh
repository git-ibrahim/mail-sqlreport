#!/usr/bin/ksh

. $HOME/.profile
cd $HOME
rm script.csv
sqlplus $BACEDB @script.sql
cat script.out |egrep "Validated|Live"

if [[ $? -ne 1 ]]
then
mv script.out script.csv
export DATE=`date '+%d'`"-"`date '+%b'`"-"`date '+%Y'`

echo "Hi All, PFA csv file"|mailx -s "VALIDATION DETAILS for ABC(Server: X.X.X.X SID: gothe) Report for $DATE" -a "$HOME/script.csv" xyz@xyz.com
fi
