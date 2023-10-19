#include <stdio.h>
#include <time.h>

int partition(int array[], int l, int h){
	int pivot = array[h];
	int i = (l - 1);
	for(int j = l; j <= h - 1; j++){
		if(array[j] < pivot){
			i++;
			int temp = array[i];
			array[i] = array[j];
			array[j] = temp;
		}
	}
	int temp = array[i+1];
	array[i+1] = array[h];
	array[h] = temp;
	return (i+1);
}

void quicksort(int array[], int l, int h){
	if(l < h){
		int partitionindex = partition(array, l, h);
		quicksort(array, l, partitionindex - 1);
		quicksort(array, partitionindex + 1, h);
	}
}

void printquicksort(int array[], int arraysize){
	clock_t t;
	t = clock();
	printf("unsorted_array:\n");
	for(int i = 0; i < arraysize; i++)
		printf("%d ", array[i]);
	printf("\n");
	quicksort(array, 0, arraysize-1);
	t = clock() - t;
	double ft = ((double)t)/CLOCKS_PER_SEC;
	printf("run_time: %lf\n", ft);
	printf("sorted_array:\n");
	for(int i = 0; i < arraysize; i++)
		printf("%d ", array[i]);
	printf("\n\n");
}

int main(){
	int array1[] = {11, 22, 44, 33, 77, 66, 55,99};
	int arraysize1 = sizeof(array1)/sizeof(array1[0]);
	int array2[] = {112, 28, 81, 198, 92, 466, 58, 597, 46, 989};
	int arraysize2 = sizeof(array2)/sizeof(array2[0]);
	int array3[] = {222, 444, 587, 456, 455, 678, 716, 729, 782, 239, 195, 495, 794, 309, 988};
	int arraysize3 = sizeof(array3)/sizeof(array3[0]);
	printquicksort(array1, arraysize1);
	printquicksort(array2, arraysize2);
	printquicksort(array3, arraysize3);
}
