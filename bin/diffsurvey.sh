sed -e '/"""/d' -e "/^#/d" -e "s,^[	 ][ 	]*,," surveys/presurvey.rb > /tmp/$$_p

awk '/#START/,/#END/ { print $0 }' < features/survey/input_survey.feature \
|   sed -e '/"""/d' -e "/^#/d" -e "s,^[	 ][ 	]*,," > /tmp/$$_i

sdiff -s -w200 /tmp/$$_p /tmp/$$_i

rm /tmp/$$_p /tmp/$$_i
