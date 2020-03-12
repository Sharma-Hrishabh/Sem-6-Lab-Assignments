#include<stdio.h> 
#include<stdlib.h> 
#include<math.h>
#include<graphics.h> 
void draw_line_dda(int x1,int y1,int x2,int y2)
{
    int dx,dy;
    dx = x2-x1;
    dy = y2-y1;
    int step;
    if(abs(dx) > abs(dy))
    {
        step = abs(dx);
    }
    else
    {
        step = abs(dy);
    }
    float incx,incy;
    incx = (dx/(float)step);
    incy = (dy/(float)step);
    for(int i=0;i<=step;i++)
    {
        putpixel(x1,y1,WHITE);
        x1+=incx;
        y1+=incy;
    }
}

void draw_line_bresenham(int x1,int y1,int x2,int y2){
    int dx,dy;
    dx = x2-x1;
    dy = y2-y1;
    int less = 2*dy;
    int large = 2*dy - 2*dx;
    putpixel(x1,y1,RED);
    int slope = 2*dy - dx;
    for(int i=0;i<dx;i++)
    {
        x1++;
        if(slope>=0)
        {
            y1++;
        }
        if(slope<0)
        {
            slope+=less;
        }
        else{
            slope+=large;
        }
        
        putpixel(x1,y1,RED);
    }
}

int main() 
{ 
    int x1,y1,x2,y2,x3,y3;
    printf("enter first point Coordinates");
    scanf("%d %d",&x1,&y1);
    fflush(stdin);
    printf("enter second point Coordinates");
    scanf("%d %d",&x2,&y2);
    fflush(stdin);
    printf("enter third point Coordinates");
    scanf("%d %d",&x3,&y3);
    fflush(stdin);
    int o;
    printf("choose 1.dda,2.bresenham");
    scanf("%d",&o);
    int gd = DETECT, gm; 
    initgraph(&gd, &gm,"");
    switch(o)
    {
        case 1:
            draw_line_dda(x1,y1,x2,y2);
            draw_line_dda(x2,y2,x3,y3);
            draw_line_dda(x3,y3,x1,y1);
            break;
        case 2:
            draw_line_bresenham(x1,y1,x2,y2);
            draw_line_bresenham(x2,y2,x3,y3);
            draw_line_bresenham(x1,y1,x3,y3);

    }
    
    // draw_line(100,100,150,150);
    // draw_line(150,150,200,100);
    // draw_line(200,100,100,100);
    
    delay(500000); 
    closegraph(); 
    return 0; 
}