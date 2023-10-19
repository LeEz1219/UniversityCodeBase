    
#include<iostream>
#include<vector>
using namespace std;
vector<int> arr;
void print_vector(){
    for(int x=0;x<arr.size();x++){
        cout<<"\t"<<arr[x];
    }
}
void swapp(int l, int t)
{
    int temp=arr[l];
    arr[l]=arr[t];
    arr[t]=temp;
}
int partition_array(int left,int right,int pivot)
{
    while(!(left==right && right==pivot && left==pivot))
    {
        while(arr[right]>=arr[pivot] && left<right)
        {
            right--;
        }
        swapp(right,pivot);
        pivot=right;
        while(arr[left]<=arr[pivot] && right>left)
        {
            left++;
        }
        swapp(left,pivot);
        pivot=left;
    }
    return pivot;
}
void quicksort(int left,int right,int pivot)
{
    if(left>=right)
        return;
    int index=partition_array(left,right,pivot);
    quicksort(left,index-1,left);
    quicksort(index+1,right,index+1);
}
int main()
{
    int s;
    cout<<"Enter the size of the array: ";
    cin>>s;
    cout<<"\n Enter the array:\n";
    int ele;
    for(int i=0; i<s; i++)
    {
        cout<<"\t";
        cin>>ele;
        arr.push_back(ele);
    }
    quicksort(0,s-1,0);
    cout<<"\n Sorted Array is:\n";
    print_vector();
    return 0;
}
