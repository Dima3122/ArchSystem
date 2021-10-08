#include "foo.hpp"
#include <fstream>

//метод гауса
int main()
{
    setlocale(LC_ALL, "ru");
    int n = 1000;
    double* result = new double[n];
    double** Matrix = new  double*[n];
    for (int i = 0; i < n+1; i++)
    {
        Matrix[i] = new double[n + 1];
    }
    init_Matr(Matrix, n);
    clock_t start = clock();
    Gauss_method(Matrix, result, n);
    clock_t end = clock(); 
    double seconds = (double)(end - start) / CLOCKS_PER_SEC; 
    ofstream out;          
    out.open("time.txt");
    out << seconds;
    out.close();
    return 0;
}