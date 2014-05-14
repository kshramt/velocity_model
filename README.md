# What is This?

This program generates a P-wave travel time table for the iasp91 velocity model.
Format of an output file, `iasp91.ptime`, is compatible with `jb.ptime` that is used by `getTp` in `sub.greenMfar.f90`.

# Usage

Please execute `make` to generate `iasp91.ptime`.

# Dependencies

- [TauP](http://www.seis.sc.edu/TauP/)
- `kshramt` (`pip-3.x install --user -U kshramt`)
