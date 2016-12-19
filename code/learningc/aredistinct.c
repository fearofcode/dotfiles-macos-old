int areDistinct(int * arr, int len) {
    for(int ind1 = 0; ind1 < len; ind1++) {
	for(int ind2 = ind1 + 1; ind2 < len; ind2++) {
	    if (arr[ind1] == arr[ind2]) {
		return 0;
	    }
	}
    }

    return 1;
}
