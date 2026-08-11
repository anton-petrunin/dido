vardef draw_bicycle(expr rear, front, frontdir) =
  save u, v, rearwheel, frontwheel, handlebar;
  save wheel_length, wheel_width, handlebar_width;

  pair u, v;
  path rearwheel, frontwheel, handlebar;

  % Sizes chosen inside the macro.
  wheel_length    := 24bp;
  wheel_width     := 3bp;
  handlebar_width := 20bp;

  % Direction of the frame and of the front wheel.
  u := unitvector(front - rear);
  v := unitvector(frontdir);

  % Rear wheel is parallel to the bicycle frame.
  rearwheel :=
      rear - .5wheel_length*u
      --
      rear + .5wheel_length*u;

  % Front wheel has the prescribed direction.
  frontwheel :=
      front - .5wheel_length*v
      --
      front + .5wheel_length*v;

  % Handlebar is perpendicular to the front wheel.
  handlebar :=
      front - .5handlebar_width*(v rotated 90) - .2handlebar_width*(v rotated 70)
      --
      front - .5handlebar_width*(v rotated 90)
      --
      front + .5handlebar_width*(v rotated 90)
      --
      front + .5handlebar_width*(v rotated 90)+.2handlebar_width*(v rotated 110);

begingroup;
linecap := rounded;
  % Draw wheels first, in gray.
  draw rearwheel
    withpen pencircle scaled wheel_width
    withcolor .5;

  draw frontwheel
    withpen pencircle scaled wheel_width
    withcolor .5;

    % Steering handlebar.
  draw handlebar
    withpen pencircle scaled 1.6bp withcolor .5;
endgroup;

enddef;
