input macros
input hatching
input mparrows
input bike

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

beginfig(1);
save u; u:=1cm;
save p; path p[];
pair v[];

color c[];

c1 := (64/255, 224/255, 208/255);
c2 := (255/255, 128/255, 191/255);
c3 := (255/255, 179/255,  71/255);
c0:=c3;

z.p=(0,0)*u;
z.u=(2,0)*u;

p1 :=
  (0,0)*u%{down}
  .. tension 1.2 .. (2.5,-1.15)*u%{right}
  .. tension 1.2 .. (5,0)*u%{(.1,1)}
  .. tension 1.2 .. (2.5,.9)*u%{left}
  .. tension 1.2 .. cycle;

for i = 1 upto 40:
z[i] = point (directiontime right of (p1 rotated (-(-87+i*360/40)))) of p1;
v[i] = 2*u*unitvector(dir(-87+i*360/40));
endfor

for i = 1 upto 40:
draw z[i]--z[i]+v[i] penhair withcolor c1;
endfor

draw p1 penbold;

draw
for i = 1 upto 40:
z[i]+v[i]
...
endfor
cycle penbold;

draw_bicycle(z[5], z[5]+v[5], z[6]+v[6]-z[4]-v[4]);
draw z[5]--z[5]+v[5] penbold;
Dot z[5],z[5]+v[5];

draw_bicycle(z[29], z[29]+v[29], z[30]+v[30]-z[28]-v[28]);
draw z[29]--z[29]+v[29] penbold;
Dot z[29],z[29]+v[29];

draw_bicycle(z[15], z[15]+v[15], z[16]+v[16]-z[14]-v[14]);
draw z[15]--z[15]+v[15] penbold;
Dot z[15],z[15]+v[15];


whitelabel(btex $R$ etex rotated angle(v[15]),  .5[z[15], z[15]+v[15]]+(-1,2));
label.ulft(btex $Z$ etex,  z[15]);
whitelabel.rt(btex $P$ etex,  z[15]+v[15]);
endfig;


beginfig(3)
save u; u:=1cm;
save p; path p[];
pair u[], v[];


color c[];

c1 := (64/255, 224/255, 208/255);
c2 := (255/255, 128/255, 191/255);
c3 := (255/255, 179/255,  71/255);
c0:=c3;

z.0=(0,0)*u;
z.1=(-.05,.25)*u;
z.2=(0,.5)*u;

p1=z.0..z.1..z.2;



  z[0] = point 0 of p1;
  u[0] = (2,0)*u;          % choose the initial vector

  draw z[0]--z[0]+u[0];

  for i = 1 upto 10:
    z[i] = point (arctime (i*arclength p1/10) of p1) of p1;
    u[i] = u[i-1] rotated
      (angle(z[i]-z[i-1]-u[i-1]) - angle(-u[i-1]));
    draw z[i]--z[i]+u[i] penhair  withcolor c1;
  endfor

drawarrow p1 penbold;

label.bot(btex $R$ etex, z0+u0/2);
label.lft(btex $\Delta t$ etex, point 1 of p1);

endfig;


beginfig(5)
save u; u:=1cm;
save p; path p[];

color c[];

c1 := (64/255, 224/255, 208/255);
c2 := (255/255, 128/255, 191/255);
c3 := (255/255, 179/255,  71/255);
c0:=c3;

z.v=(1,0.1)*u;

z.0=(0,0)*u;
z.1=(-.2,1.4)*u;
z.2=(.5,1)*u;
z.3=z.1+z.v;
z.4=(2,0)*u;

x.r= 2*u;
y.r=3.141592653589793*x.r;

p0=z.0{(-1,1)}..z.1{z.v}..z.2..z.3{z.v}..z.4;
p1=p0 scaled (y.r/(arclength p0));

fill p1--cycle withcolor .7;
drawarrow subpath (0,3.5) of p1 penbold;
draw subpath (3.5,4) of p1 penbold;
draw (z.1--z.3) scaled (y.r/(arclength p0));
draw ddline(z.0,z.4)(.3,.3) scaled (y.r/(arclength p0)) pensemibold;

label(btex $F$ etex, .5[z.0,z.4]+(0,.5)*u);
label.urt(btex $\gamma$ etex, point 3.5 of p1);
endfig;

beginfig(10)
save u; u:=1cm;
save p; path p[];
pair u[], v[];

color c[];

c1 := (64/255, 224/255, 208/255);
c2 := (255/255, 128/255, 191/255);
c3 := (255/255, 179/255,  71/255);
c0:=c3;

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
    draw z[i]--z[i]+u[i] penhair withcolor c1;
  endfor
enddef;

draw_hairs(p1);
draw_hairs(p2);

drawarrow subpath (0,1.5) of p1 penbold;
draw subpath (1.5,3) of p1 penbold;
drawarrow subpath (0, arctime arclength p2/2  of p2) of p2 penbold;
draw subpath (arctime arclength p2/2  of p2, arctime arclength p2 of p2) of p2 penbold;
draw ddline(z.o-u0,z.3)(.1,.1) pensemibold;

z.lab=point .7 of p1;

z.X=.55[z.0,z.3] +(0,.07)*u;
Dot z.X;

label.lft(btex $\gamma$ etex, z.lab);
whitelabel(btex $F$ etex, (1.4,.5)*u+z.lab);
whitelabel(btex $D$ etex, (x.o,y.lab +.5*u));
whitelabel.top(btex $X$ etex, z.X);
endfig;

beginfig(13)
save u; u:=1cm;
save p; path p[];
pair u[], v[];

color c[];

c1 := (64/255, 224/255, 208/255);
c2 := (255/255, 128/255, 191/255);
c3 := (255/255, 179/255,  71/255);
c0:=c3;

z.0=(0,0)*u;
z.1=(-.1,.25)*u;
z.2=(-.15,.5)*u;

p1=z.0..z.1..z.2;



  z[0] = point 0 of p1;
  u[0] = (2,0)*u;          % choose the initial vector

  draw z[0]--z[0]+u[0] withcolor c1;
  draw ddline(z[0],z[0]+u[0])(-1,2) withcolor c2;

  for i = 1 upto 10:
    z[i] = point (arctime (i*arclength p1/10) of p1) of p1;
    u[i] = u[i-1] rotated
      (angle(z[i]-z[i-1]-u[i-1]) - angle(-u[i-1]));
    draw z[i]--z[i]+u[i] penhair withcolor c1;
    draw ddline(z[i],z[i]+u[i])(-1,2) penhair withcolor c2;
  endfor

drawarrow p1 penbold;

label.bot(btex рама etex, z0+u0/2);
label.top(btex хвост etex, z0+2.5*u0/2);

clip currentpicture to (-1,-1)*u--(-1,1)*u--(3,1)*u--(3,-1)*u--cycle;

endfig;

beginfig(15)
save u; u:=1cm;
save p; path p[];
pair u[], v[];

color c[];

c1 := (64/255, 224/255, 208/255);
c2 := (255/255, 128/255, 191/255);
c3 := (255/255, 179/255,  71/255);
c0:=c3;

z.0=(0,1.4)*u;
z.1=(.2,.6)*u;
z.2=(0,0)*u;

p1=z.0..z.1..z.2;



  z[0] = point 0 of p1;
  u[0] = (2cm,0) rotated -10;          % choose the initial vector

  for i = 1 upto 20:
    z[i] = point (arctime (i*arclength p1/20) of p1) of p1;
    u[i] = u[i-1] rotated
      (angle(z[i]-z[i-1]-u[i-1]) - angle(-u[i-1]));
    draw z[i]--z[i]+u[i] penhair withcolor c1;
  endfor

draw z7--z7+u7;
whitelabelarcsprof(z7+u7, z7, z7+ direction (arctime (7*arclength p1/20) of p1) of p1, 10, 8, btex $\alpha$ etex);


drawarrow subpath (0,1) of p1 penbold;
draw subpath (1,2) of p1 penbold;

dOt z7,z7+u7;

label.lft(btex $P$ etex, z7);
label.rt(btex $Z$ etex, z7+u7);

endfig;

beginfig(20)
save u; u:=1cm;
save p; path p[];
pair u[], v[];

color c[];

c1 := (64/255, 224/255, 208/255);
c2 := (255/255, 128/255, 191/255);
c3 := (255/255, 179/255,  71/255);
c0:=c3;

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
    draw z[i]--z[i]+u[i] penhair withcolor c1;
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
