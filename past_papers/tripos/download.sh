#!/usr/bin/env sh

set -eu

alias toupper="tr '[a-z]' '[A-Z]'"

# remove all empty pdfs before we start
find . -size 0 -name "*.pdf" -delete

attempt_download() {
    year="$1"
    prefix="$2"
    part="$3"
    suffix="$4"
    output_suffix="${5:-}"
    output_file="$(echo "$part" | toupper)_$year$output_suffix.pdf"
    # if already exists, don't bother
    if [ -f "$output_file" ]; then
        echo "skipping $output_file"
        return
    fi
    if wget -nc "https://www.maths.cam.ac.uk/undergrad/pastpapers/files/$year/$prefix$part$suffix.pdf" -O "$output_file"; then
        return
    else
        # generous approach to deletion. wget leaves around empty
        # files when it fails, and probably this is a bad idea, but
        # it works well enough.
        find . -size 0 -name "*.pdf" -delete
    fi
}

for year in {2001..2006} 2008; do
    for part in IA IB II; do
        attempt_download "$year" list_ "$part" ""
    done
done

for year in 2009 {2011..2015} 2019; do
    for part in IA IB II; do
        attempt_download "$year" List_ "$part" ""
    done
done

for year in 2010; do
    for part in IA IB II; do
        attempt_download "$year" Paper "$part" _all
    done
done

for year in 2016; do
    for part in ia ii; do
        attempt_download "$year" list_ "$part" ""
    done
    for part in ib; do
        attempt_download "$year" list_ "$part" _0
    done
done

for year in 2017; do
    for part in ia; do
        attempt_download "$year" list_ "$part" _0
    done
    for part in ib ii; do
        attempt_download "$year" list_ "$part" _1
    done
done

for year in 2018; do
    for part in ia ib ii; do
        attempt_download "$year" list_ "$part" "_$year"
    done
done

for year in 2007; do
    for part in IA IB II; do
        for paper in {1..4}; do
            attempt_download "$year" Paper "$part" "_$paper" "_$paper"
        done
    done
done
