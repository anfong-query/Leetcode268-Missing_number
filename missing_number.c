#include <stdio.h>

int missingNumber(int* nums, int numsSize){
	int sum = numsSize;
	for(int i = 0; i < numsSize; i++){
		sum += i;
		sum -= nums[i];
	}
	return sum;
}

int main(){
	int nums[] = {3,0,1};
	printf("%d\n", missingNumber(nums,3));
	return 0;
}
