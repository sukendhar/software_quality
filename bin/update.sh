if [ "X$1X" = "XX" ] ; then
    echo "$0 commit-msg" ; exit
fi

# LOCAL: (after "rake" run)
git add .
git commit -m "$1"
git push
rake db:drop db:migrate db:test:prepare db:seed
rake surveyor FILE=surveys/presurvey.rb
# rails s

# REMOTE:
# git push heroku
# heroku run rake db:migrate 
# heroku run rake surveyor FILE=surveys/presurvey.rb
# heroku open
# heroku logs
