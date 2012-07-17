#!/bin/sh
# Remotes is a list of the user's who's babs repo is interesting enough to
# warrant shameless poaching/cherry-picking

remotes="benhoskings"

for remote in $remotes; do
    git remote | grep $remote >/dev/null ||
        git remote add $remote git://github.com/$remote/babushka-deps.git
done

git fetch --all
