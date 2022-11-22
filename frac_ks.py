def fractionalKnapsack(W, val, wt):
	arr.sort(key=lambda x: (x.value/x.weight), reverse=True)
	finalvalue = 0.0

	for item in arr:
		if item.weight <= W:
			W -= item.weight
			finalvalue += item.value
		else:
			finalvalue += item.value * W / item.weight
			break
	return finalvalue


if __name__ == "__main__":

	W = 50
	val = [60, 100, 120]
	wt = [10, 20, 30]
	max_val = fractionalKnapsack(W, val, wt)
	print(max_val)
