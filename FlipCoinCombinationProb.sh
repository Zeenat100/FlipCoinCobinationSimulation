echo "Welcome to Flip Coin Combination Simulation"
heads=1
tails=2
result=$(( $RANDOM % 2 +1))
echo $result
if [[ $result -eq $heads ]]
then
	echo "Heads is the winner"
else
	echo "Tails is the winner"
fi

