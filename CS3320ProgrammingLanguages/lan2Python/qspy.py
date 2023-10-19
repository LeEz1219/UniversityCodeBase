import time

def partition (array, l, h):
    pivot = array[h]
    i = (l - 1)
    for j in range(l, h):
        if(array[j] < pivot):
            i += 1 
            temp = array[i]
            array[i] = array[j]
            array[j] = temp

    temp = array[i+1]
    array[i+1] = array[h]
    array[h] = temp
    return (i+1)

def quicksort (array, l, h):
    if (l < h):
        partitionindex = partition(array, l, h)
        quicksort(array, l, partitionindex - 1)
        quicksort(array, partitionindex + 1, h)

def printtime(array, arraysize):
    print("unsorted array: ")
    print(array)
    start = time.time()
    quicksort(array, 0, arraysize -1)
    end = time.time()
    print "\tStart time:",
    print(start)
    print "\tEnd time:",
    print(end)
    print "\tRun time:",
    print(end-start)
    print("sorted array: ")
    print(array)
    print("\n")

if __name__ == "__main__":
    array1 = [11, 22, 44, 33, 77, 66, 55,99]
    arraysize1 = len(array1)
    printtime(array1, arraysize1)
    array2 = [112, 28, 81, 198, 92, 466, 58, 597, 46, 989]
    arraysize2 = len(array2)
    printtime(array2, arraysize2)
    array3 = [222, 444, 587, 456, 455, 678, 716, 729, 782, 239, 195, 495, 794, 309, 988]
    arraysize3 = len(array3)
    printtime(array3, arraysize3)
