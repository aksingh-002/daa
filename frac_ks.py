def fractionalKnapsack(W, val, wt):
	arr.sort(key=lambda x: (val[x]/wt[x]), reverse=True)
	finalvalue = 0.0

	for i in range(len(val)):
		if wt[i] <= W:
			W -= wt[i]
			finalvalue += val[i]
		else:
			finalvalue += val[i] * W / wt[i]
			break
	return finalvalue


if __name__ == "__main__":

	W = 50
	val = [60, 100, 120]
	wt = [10, 20, 30]
	max_val = fractionalKnapsack(W, val, wt)
	print(max_val)
