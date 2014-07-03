# What is This?

This program generates P- and S-wave travel time tables for many velocity models.
Generated time tables will be read by `getTp` routine in `sub.greenMfar.f90` without modifications.

# Usage

Please execute `make` to generate `iasp91.ptime`.

# Dependencies

- [TauP](http://www.seis.sc.edu/TauP/)
- `kshramt` (`pip-3.x install --user -U kshramt`)
