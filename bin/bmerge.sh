echo \
./app/assets/stylesheets/application.css.scss \
./app/assets/stylesheets/bootstrap_and_overrides.css.scss \
./app/controllers/confirmations_controller.rb \

./app/controllers/users_controller.rb \
./app/models/ability.rb \
./app/models/user.rb \
./app/views/devise/mailer/confirmation_instructions.html.erb \
./app/assets/javascripts/application.js \
./app/views/devise/shared/_links.html.haml

for i in ./app/controllers/registrations_controller.rb ; do
    #echo "= $i =================================================================="
    #./bin/dif $i
    cp ../rails-prelaunch-signup-1click/$i ${i}_MERGE
done
