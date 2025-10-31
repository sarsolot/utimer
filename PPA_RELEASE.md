# PPA Release Process

This document describes how to release utimer to the Ubuntu PPA.

## Version Naming Convention

**Important:** PPA has a quirk where you cannot reuse the same upstream version number. Therefore, we use a different versioning scheme for PPA uploads than for the source repository.

### Version Mapping

| Source Version | configure.ac | Git Tag | PPA Package Version | PPA Tarball Name |
|----------------|--------------|---------|---------------------|------------------|
| 0.5-0          | 0.5-0        | v0.5-0  | 0.5-0ubuntu1~ppa6   | utimer_0.5.orig.tar.gz |
| 0.5-1          | 0.5-1        | v0.5-1  | 0.5.1-1ubuntu1~ppa1 | utimer_0.5.1.orig.tar.gz |
| 0.5-2          | 0.5-2        | v0.5-2  | 0.5.2-1ubuntu1~ppa1 | utimer_0.5.2.orig.tar.gz |

### Pattern Explanation

- **Source version**: `0.5-N` (where N is the release number)
- **PPA version**: `0.5.N-1ubuntu1~ppa1` (converts hyphen to dot, adds Debian revision)
- **PPA tarball**: `utimer_0.5.N.orig.tar.gz` (uses dot notation)

The `.N` in PPA versions increments with each source release to avoid reusing upstream version numbers, which Launchpad does not allow.

**Note:** For the 0.5-N series, we maintain this naming scheme for consistency. Starting with 0.6-N, we may align the source and PPA versioning to use the same format (e.g., both using `0.6.N`).

## Release Steps

### 1. Update Version in Source

Edit these files:
- `configure.ac` - Update AC_INIT version
- `ChangeLog` - Add release entry
- `debian/changelog` - Add new entry (use source version format for now)
  - **Important**: Check the Ubuntu release codename! Update from current release (e.g., `plucky` → `questing` or whatever is current)
  - See: https://wiki.ubuntu.com/Releases

### 2. Commit and Tag

```bash
git checkout -b release/v0.5-N
git add configure.ac ChangeLog debian/changelog
git commit -m "chore: bump version to 0.5-N for release"
git push -u origin release/v0.5-N
```

Create PR, merge to master, then:

```bash
git checkout master
git pull
git tag -a v0.5-N -m "Release v0.5-N

- Feature descriptions
- Bug fixes
- etc."
git push origin v0.5-N
```

### 3. Build PPA Package

```bash
# Download source tarball from GitHub
cd ~/tmpfs/utimer/ppa/utimer_0.5
wget https://github.com/sarsolot/utimer/archive/refs/tags/v0.5-N.tar.gz -O utimer-0.5-N.tar.gz

# Rename for Debian (convert 0.5-N to 0.5.N)
cp utimer-0.5-N.tar.gz utimer_0.5.N.orig.tar.gz

# Extract
tar -xzf utimer_0.5.N.orig.tar.gz
cd utimer-0.5-N

# Update debian/changelog to use PPA version
# Change: utimer (0.5-N... to utimer (0.5.N-1ubuntu1~ppa1...
# Also verify Ubuntu release codename (plucky/questing/etc)
nano debian/changelog

# Build source package
debuild -S -sa -d

# Upload to PPA
cd ..
dput ppa:sarsolot/utimer utimer_0.5.N-1ubuntu1~ppa1_source.changes

# Clean up (keep only the PPA release files)
rm -rf utimer-0.5-N utimer-0.5-N.tar.gz
```

### 4. Important Notes

- **Always update debian/changelog in the extracted tarball** to use the PPA version format (0.5.N-1 not 0.5-N)
- The `-1` in `0.5.N-1` is the Debian revision (first packaging of this upstream version)
- The `ubuntu1` indicates Ubuntu-specific changes
- The `~ppa1` ensures PPA packages are superseded by official Ubuntu packages if they exist
- Launchpad will email you about build status for each Ubuntu release

### 5. Verify Upload

- Check https://launchpad.net/~sarsolot/+archive/ubuntu/utimer
- Wait for build completion emails
- Test installation: `sudo apt update && sudo apt install utimer`

## debian/changelog Format

The changelog entry in the git repository should use the source version (0.5-N), but when building for PPA, it must be temporarily changed to the PPA version (0.5.N-1ubuntu1~ppa1) in the extracted tarball.

**In git (source) - before release:**
```
utimer (0.5-2ubuntu1~ppa1) <current-ubuntu-release>; urgency=medium
```

**For PPA build (extracted tarball) - during build:**
```
utimer (0.5.2-1ubuntu1~ppa1) <current-ubuntu-release>; urgency=medium
```

**Key changes:**
- Version: `0.5-2` → `0.5.2-1` (hyphen to dot, add Debian revision)
- Ubuntu release: Always verify and update the codename (e.g., `plucky` → `questing`)

This allows the source repository to track the logical version while accommodating PPA's constraints.
