## Summary

- Re-save `desterieux` cortical atlas as unified `ggseg_atlas` object using
  `ggseg.formats` (150 regions, 2D polygon geometry)
- Add `ggseg.formats` as hard dependency
- Simplify package to data-only with roxygen2 docs
- Bump version to 2.0.0

## Breaking changes

- `ggseg.formats` now required (in Depends)
- Old `plot()` method replaced by `ggplot() + geom_brain()`

## Test plan

- [x] R CMD check passes (0/0/0)
- [x] 2D rendering works: `ggplot() + geom_brain(atlas = desterieux)`
- [ ] Visually inspect atlas regions and colour mappings

Generated with [Claude Code](https://claude.com/claude-code)
