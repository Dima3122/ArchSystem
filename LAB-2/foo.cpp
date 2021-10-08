#include "foo.hpp"

void init_Matr(double** arr, int n)
{
	for (int i = 0; i < n; i++)
	{
		for (int j = 0; j < n + 1; j++)
		{
			arr[i][j] = rand() % 20;
		}
	}
}

void print_arr(double* arr, int n)
{
	for (int i = 0; i < n; i++)
	{
		cout << arr[i] << " ";
	}
}

void Gauss_method(double** arr,double* result, int n)
{
    int k;
    double tmp;
    for (int i = 0; i < n; i++)
    {
        tmp = arr[i][i];
        for (int j = n; j >= i; j--)
        {
            arr[i][j] /= tmp;
        }
        for (int j = i + 1; j < n; j++)
        {
            tmp = arr[j][i];
            for (k = n; k >= i; k--)
            {
                arr[j][k] -= tmp * arr[i][k];
            }
        }
    }
    /*îáðàòíûé õîä*/
    result[n - 1] = arr[n - 1][n];
    for (int i = n - 2; i >= 0; i--)
    {
        result[i] = arr[i][n];
        for (int j = i + 1; j < n; j++) 
        {
            result[i] -= arr[i][j] * result[j];
        }
    }
}

void Get_res(double** arr, double* result, int n)
{
    for (int i = 0; i < n; i++)
    {
        result[i] = arr[i][n];
    }
}

int check_matrix(double** arr, int n)
{
    int check = n * n, count = 0;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            if (arr[i][j] == 0)
            {
                count++;
            }
        }
    }
    if (check == count)
    {
        return -1;
    }
    return 0;
}

