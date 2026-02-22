# Changelog

## ggsegdestrieux 2.0.0

### Breaking changes

- `destrieux` is now a `ggseg_atlas` object (from ggseg.formats)
  containing both 2D and 3D data. The separate `destrieux_3d` object has
  been removed.

- Use `ggplot() + ggseg::geom_brain(atlas = destrieux)` for 2D plots and
  `ggseg3d::ggseg3d(atlas = destrieux)` for 3D plots – both from the
  same object.

- `ggseg.formats` is now a hard dependency (in Depends).

- Package URLs updated from `ggsegverse` to `ggseg` GitHub organisation.

## ggsegdestrieux 1.0.01

- adapted atlas to ggseg \>= 1.6.0
- Added a `NEWS.md` file to track changes to the package.
