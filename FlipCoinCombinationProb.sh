echo "Welcome to Flip Coin Combination Simulation"
heads=1
tails=2
declare -A singlet
declare -A doublet
declare -A triplet
number_coins=2
triplet_coins=3
echo "Enter the number of flip: "
read countFlip
function singlet()
{
	for (( count=0 ; count < $countFlip ; count++ ))
	do
		result=$(( $RANDOM % 2 +1))
		if [[ $result -eq $heads ]]
		then
			coinResult=Heads
		else
			coinResult=Tails

		fi
	(( singlet[$coinResult]++))
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
function doublet()
{
        for (( count=0 ; count < $countFlip ; count++ ))
        do
		for (( coin_num=0 ; coin_num<$number_coins ; coin_num++ ))
                do
			result=$(( $RANDOM % 2 +1))
                	if [[ $result -eq $heads ]]
                	then
                        	coinsResult+=H
                	else
                        	coinsResult+=T

                fi
		done
        	((doublet[$coinsResult]++))
        	coinsResult=""
        done
}

function doubletPercentage()
{
        for index in ${!doublet[@]}
        do
                echo "The percentage of doublet[$index]=`expr "scale=2; ${doublet[$index]} * 100 / $countFlip" | bc`"
        done
}
function triplet()
{
        for (( count=0 ; count < $countFlip ; count++ ))
        do
                for (( coin_num=0 ; coin_num<$triplet_coins ; coin_num++ ))
                do
                        result=$(( $RANDOM % 2 +1))
                        if [[ $result -eq $heads ]]
                        then
                                triplet_coinsResult+=H
                        else
                                triplet_coinsResult+=T

                fi
                done
                ((triplet[$triplet_coinsResult]++))
                triplet_coinsResult=""
        done
}

function tripletPercentage()
{
        for index in ${!triplet[@]}
        do
                echo "The percentage of triplet[$index]=`expr "scale=2; ${triplet[$index]} * 100 / $countFlip" | bc`"
        done
}

singlet
singletPercentage
doublet
doubletPercentage
triplet
tripletPercentage
