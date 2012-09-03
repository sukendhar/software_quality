Feature: Input Client Survey
  In order to get information about client's environment
  A client
  Should fill out the survey

  Background:
    Given the survey
#START
    """
    survey "Survey" do

      section "Basic questions" do

        label "To learn more about your project, we would like the following information:"

        q01 "Do you use work tracking tool?", :pick => :one
        a "Pivotal Tracker"
        a "Mingle"
        a "none"
        a "other1", :string
      
        q02 "What languages do you use with your web site?", :pick => :one
        answer "Ruby"
        answer "Python"
        answer "Java"
        answer "C#"
        answer "other2", :string
      
        q03 "Do you have CI (continous integration)?", :pick => :one
        answer "Travis"
        answer "Jenkins"
        answer "CruiseControl.rb"
        answer "none"
        answer "other3", :string
      
        q04 "Do you use bug tracking tool?", :pick => :one
        answer "Pivotal Tracker"
        answer "JIRA"
        answer "bugzilla"
        answer "Github"
        answer "Bitbucket"
        answer "none"
        answer "other4", :string
      
        q05 "What types of testing do you do?"
        a "testtypes", :text
      
        q06 "What types of metrics do you use on your project?"
        a "metrics", :text
      
        q07 "To be part of early access, may I please get read-access to the above tools?", :pick => :one
        answer "Yes"
        answer "No"
      
        q07b "What operating system do you use for development and testing?", :pick => :one
        answer "Mac"
        answer "Linux"
        answer "PC"
        answer "other7b", :string

        q07c "What hosting provider do you use for development and testing?", :pick => :one
        answer "Heroku"
        answer "Engine Yard"
        answer "other7c", :string

        q08 "To be part of early access, may I please get read-access to your source code?", :pick => :one
        answer "yes"
        answer "no"
      
        q09 "May I have an email to contact you"
        a "email", :string
      
        q10 "Project (DataSet tag)"
        a_10 "dataset", :string

        label "Thanks,"
        label "SoftwareQualityCraft Team"
      end
    end
    """
#END

    Scenario: HAPPY-PATH: Yes to everything
      When I go to the surveys page
      And I press "Take it"
      # Q1
      Then I should see "Do you use work tracking tool?"
      And I choose "Mingle"
      And I choose "Pivotal Tracker"
      And I choose "none"

      # Q2
      Then I should see "What languages do you use with your web site?"
      And I choose "C#"
      And I choose "Java"
      And I choose "Python"
      And I choose "Ruby"

      # Q3
      Then I should see "Do you have CI (continous integration)?"
      And I choose "none"
      And I choose "CruiseControl.rb"
      And I choose "Jenkins"
      And I choose "Travis"

      # Q4
      Then I should see "Do you use bug tracking tool?"
      And I choose "none"
      And I choose "bugzilla"
      And I choose "JIRA"
      And I choose "Github"
      And I choose "Bitbucket"
      And I choose "Pivotal Tracker"

      # Q7
      Then I should see "To be part of early access, may I please get read-access to the above tools?"
      And I choose "No"
      And I choose "Yes"

      # Q7B
      Then I should see "What operating system do you use for development and testing?"
      And I choose "PC"
      And I choose "Linux"
      And I choose "Mac"

      # Q7C
      Then I should see "What hosting provider do you use for development and testing?"
      And I choose "Engine Yard"
      And I choose "Heroku"

      # Q8
      Then I should see "To be part of early access, may I please get read-access to your source code?"
      And I choose "no"
      And I choose "yes"

      # Q5
      Then I should see "What types of testing do you do?"
      And I fill in "testtypes" with "unit, gui, acceptance"

      # Q6
      Then I should see "What types of metrics do you use on your project?"
      And I fill in "metrics" with "coverage"

      # Q9
      Then I should see "May I have an email to contact you"
      And I fill in "email" with "example@example.com"

      Then I should see "Project (DataSet tag)"
      And I fill in "dataset" with "dataset yes01"

      And I press "Click here to finish"
      Then the survey should be complete

######################################################################

    Scenario: HAPPY-PATH: No/Unknown to everything
      When I go to the surveys page
      And I press "Take it"

      # Q1
      Then I should see "Do you use work tracking tool?"
      And I choose "other1"
      And I fill in "r_1_string_value" with "work-unknown"  

      # Q2
      Then I should see "What languages do you use with your web site?"
      And I choose "other2"
      And I fill in "r_2_string_value" with "lang-unknown"  

      # Q3
      Then I should see "Do you have CI (continous integration)?"
      And I choose "other3"
      And I fill in "r_3_string_value" with "ci-unknown"  

      # Q4
      Then I should see "Do you use bug tracking tool?"
      And I choose "other4"
      And I fill in "r_4_string_value" with "bugtool-unknown"  

      # Q7
      Then I should see "To be part of early access, may I please get read-access to the above tools?"
      And I choose "No"

      # Q7B
      Then I should see "What operating system do you use for development and testing?"
      And I choose "other7b"
      And I fill in "r_11_string_value" with "os-unknown"  

      # Q7C
      Then I should see "What hosting provider do you use for development and testing?"
      And I choose "other7c"
      And I fill in "r_12_string_value" with "os-unknown"  

      # Q8
      Then I should see "To be part of early access, may I please get read-access to your source code?"
      And I choose "no"

      # Q5
      Then I should see "What types of testing do you do?"
      And I fill in "testtypes" with ""

      # Q6
      Then I should see "What types of metrics do you use on your project?"
      And I fill in "metrics" with ""

      # Q9
      Then I should see "May I have an email to contact you"
      And I fill in "email" with ""

      # Q10
      Then I should see "Project (DataSet tag)"
      And I fill in "dataset" with "project-unknown"

      And I press "Click here to finish"
      Then the survey should be complete

#      Then show me the page
