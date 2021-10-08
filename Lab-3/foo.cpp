#include "foo.hpp"

double test_memory_HDD_SSD(int count_write)
{
    double* arr = new double[512];//4мб
    for(int i = 0; i < 512; i++)
    {
        arr[i] = i;
    }
    std::ofstream out;          
    out.open("rubbish.txt");
    clock_t start = clock();
    for(int i = 0; i < count_write; i++)
    {
        for(int j = 0; j < 512; j++)
        {
            out << arr[j];
        }
    }
    clock_t end = clock();
    double seconds = (double)(end - start) / CLOCKS_PER_SEC; 
    out.close();
    delete [] arr;
    return seconds;
}

double test_memory_oper(int count_write)
{
    double* arr = new double[512*count_write];//4мб
    clock_t start = clock();
    for(int i = 0; i < 512; i++)
    {
        for(int j = 0; j < count_write; j++)
        {
            arr[j] = i;
        }
    }
    clock_t end = clock();
    double seconds = (double)(end - start) / CLOCKS_PER_SEC; 
    delete [] arr;
    return seconds;
}

double Read_Test_HDD_SSD(int count_write)
{
    double* arr = new double[512 * count_write];//4мб
    for(int i = 0; i < 512; i++)
    {
        arr[i] = i;
    }
    std::fstream out;          
    out.open("rubbish.txt");
    for(int i = 0; i < count_write; i++)
    {
        for(int j = 0; j < 512; j++)
        {
            out << arr[j] << " ";
        }
    }
    delete [] arr;
    double* array = new double[512 * count_write];//4мб
    out.seekg(0);
    long int i = 0;
    clock_t start = clock();
    while (!out.eof())
	{
        out >> array[i];
        i++;
    }
    clock_t end = clock();
    double seconds = (double)(end - start) / CLOCKS_PER_SEC; 
    out.close();
    delete [] array;
    return seconds;
}

double Read_Test_OPR(int count_write)
{
    double* arr = new double[512*count_write];//4мб
    double* arr2 = new double[512*count_write];
    for(int i = 0; i < 512*count_write; i++)
    {
        arr[i] = i;
    }
    clock_t start = clock();
    for(int i = 0; i < 512*count_write; i++)
    {
        arr2[i] = arr[i];
    }
    clock_t end = clock();
    double seconds = (double)(end - start) / CLOCKS_PER_SEC; 
    delete [] arr;
    delete [] arr2;
    return seconds;
}