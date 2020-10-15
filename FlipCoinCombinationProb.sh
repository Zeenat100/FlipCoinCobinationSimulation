echo "Welcome to Flip Coin Combination Simulation"
heads=1
tails=2
declare -A singlet
echo "Enter the number of flip: "
read countFlip
function singlet()
{
	for (( count=0 ; count < $countFlip ; count++ ))
	do
		result=$(( $RANDOM % 2 +1))
		if [[ $result -eq $heads ]]
		then
			echo "Heads is the winner"
			coinResult=Heads
		else
			echo "Tails is the winner"
			coinResult=Tails

		fi
	((singlet[$coinResult]++))
	coinResult=""
	done
}

function singletPercentage()
{
	for index in ${!singlet[@]}
	do
		echo "The percentage of singlet[$index]=`expr "scale=2; ${singlet[$index]} * 100 / $countFlip" | bc`"
	done
}
singlet
singletPercentage

