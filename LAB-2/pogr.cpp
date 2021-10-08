#include<iostream>
#include<fstream>
#include<string>
using namespace std;

int main()
{    
    int n = 0; //n is the number of the integers in the file ==> 12
    double arr[10];
    double arr2[10];

    ifstream File;
    File.open("time2.txt");
    while(!File.eof())
    {
        File >> arr2[n];
        n++;
    }
    File.close();
    
    ifstream File2;
    File2.open("time.txt");
    File2 >> arr[9];
    double pogr = 0;
    //первая погрешность
    for(int i = 0; i < 3; i++)
    {
        pogr = arr[9] / arr2[i];
        arr[i] = pogr;
    }
    //вторая погрешность
    for(int i = 0; i < 3; i++)
    {
        pogr = arr[i]/arr2[i];
        arr2[i] = pogr;
    }

    File2.close();
    ofstream out;          
    out.open("time.txt", std::ifstream::in);
    for(int i = 0; i<3; i++)
    {
        out << "perl" << i << " "<< arr[i] << " " << arr2[i] << "\n";
    }
    out.close();
    return 0;
}