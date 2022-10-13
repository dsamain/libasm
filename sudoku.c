#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>

int sudoku_solver(char sudoku[9][9]);

int checker(char sudoku[9][9]) {
    int col[9][9];
    int row[9][9];
    int sqr[9][9];
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            col[i][j] = row[i][j] = sqr[i][j] = 0;
        }
    }

    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            col[i][sudoku[i][j] - 1]++;
            row[j][sudoku[i][j] - 1]++;
            sqr[i - i%3 + j / 3][sudoku[i][j] - 1]++;
            if (col[i][sudoku[i][j] - 1] > 1 || row[j][sudoku[i][j] - 1] > 1 || sqr[i - i%3 + j / 3][sudoku[i][j] - 1] > 1) {
                return 0;
            }
        }
    }
    return 1;
}

int main() {
    char sudoku[9][9] = {
        {0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,0},
        {0,0,0,0,0,0,0,0,9}
    };

    printf("Enter a sudoku:\n");
    for (int i = 0; i < 9; i++) {
        scanf("%s", sudoku[i]);
        for (int j = 0; j < 9; j++) {
            sudoku[i][j] -= '0';
        }
    }

    //char sudoku[9][9] = {
        //{5,3,0,0,7,0,0,0,0},
        //{6,0,0,1,9,5,0,0,0},
        //{0,9,8,0,0,0,0,6,0},
        //{8,0,0,0,6,0,0,0,3},
        //{4,0,0,8,0,3,0,0,1},
        //{7,0,0,0,2,0,0,0,6},
        //{0,6,0,0,0,0,2,8,0},
        //{0,0,0,4,1,9,0,0,5},
        //{0,0,0,0,8,0,0,7,9}
    //};
    if (sudoku_solver(sudoku) != 42) {
        printf("can't find a solution\n");
        return 0;
    }

    printf("checker: %s\n", (checker(sudoku) ? "OK" : "KO"));
    printf("solution:\n");
    for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
            printf("%d ", sudoku[i][j]);
        }
        printf("\n");
    }
    
}


