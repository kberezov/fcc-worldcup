#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 

if [[ $YEAR != 'year' ]]
then
  TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
  TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
fi

done
