input macros
input hatching
input mparrows

verbatimtex
%&latex
\documentclass[oneside]{book}
\usepackage{../paper-ru}
\begin{document}
etex

filenametemplate "%j-%1c.mps";
prologues:=3;
setarrows(barbedsharp);
linecap:=butt;
%linejoin:=mitered;
%filenametemplate "%j-%1c.svg";
outputformat := "eps";


beginfig(5)
save u; u:=1cm;
save p; path p[];

z.v=(1,0.1)*u;

z.0=(0,0)*u;
z.1=(-.2,1.4)*u;
z.2=(.5,1)*u;
z.3=z.1+z.v;
z.4=(2,0)*u;

p1=z.0{(-1,1)}..z.1{z.v}..z.2..z.3{z.v}..z.4;

draw p1 penbold;
draw z.1--z.3;
draw ddline(z.0,z.4)(.3,.3) pensemibold;

endfig;

beginfig(10)
save u; u:=1cm;
save p; path p[];
pair u[], v[];

z.0=(0,0)*u;
z.1=(-.7,1)*u;
z.2=(2,1)*u;
z.3=(2,0)*u;

x.r= 2*u;
y.r=3.141592653589793*x.r;

p0=(z.0..z.1..z.2..z.3);

p1=p0 scaled (y.r/(arclength p0));

z.o=(-6,0)*u;

p2=arc((-x.r,0),(0,x.r),(x.r,0)) shifted z.o;

u0 = (x.r,0);

vardef draw_hairs(expr p) =
  save z, u;
  pair z[], u[];

  z[0] := point 0 of p;
  u[0] := (x.r,0);          % choose the initial vector

  for i = 1 upto 40:
    z[i] := point (arctime (i*arclength p/40) of p) of p;
    u[i] := u[i-1] rotated
      (angle(z[i]-z[i-1]-u[i-1]) - angle(-u[i-1]));
    draw z[i]--z[i]+u[i] penhair withcolor .5;
  endfor
enddef;

draw_hairs(p1);
draw_hairs(p2);

drawarrow subpath (0,1.5) of p1 penbold;
draw subpath (1.5,3) of p1 penbold;
drawarrow subpath (0, arctime arclength p2/2  of p2) of p2 penbold;
draw subpath (arctime arclength p2/2  of p2, arctime arclength p2 of p2) of p2 penbold;
draw ddline(z.o-u0,z.3)(.1,.1) pensemibold;

endfig;

beginfig(20)
save u; u:=1cm;
save p; path p[];
pair u[], v[];

z.0=(0,0)*u;
z.1=(-.7,1)*u;
z.2=(.9,1)*u;
z.3=(.22,0)*u;

x.r= 2*u;
y.r=3.141592653589793*x.r;

p0=(z.0..z.1..z.2..z.3);

p1=p0 scaled (y.r/(arclength p0));

u0 = (x.r,0);

vardef draw_hairs(expr p) =
  save z, u;
  pair z[], u[];

  z[0] := point 0 of p;
  u[0] := (x.r,0);          % choose the initial vector

  for i = 1 upto 40:
    z[i] := point (arctime (i*arclength p/40) of p) of p;
    u[i] := u[i-1] rotated
      (angle(z[i]-z[i-1]-u[i-1]) - angle(-u[i-1]));
    draw z[i]--z[i]+u[i] penhair withcolor .5;
  endfor
enddef;

draw_hairs(p1);

drawarrow subpath (0,1.5) of p1 penbold;
draw subpath (1.5,3) of p1 penbold;
draw z.0-u0/2--z.3+u0 pensemibold;

z.t0=point (arctime (32*arclength p1/40) of p1) of p1;

dOt z.t0;

label.rt(btex $t_0$ etex, z.t0);

endfig;

end
