#!/bin/bash

# Setup Location Varibles
SRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WRK_DIR="/Users/${USER}/Desktop/LR_BAK_$(date "+%Y%m%d")"
LR_ROOT="/Users/${USER}/Pictures/Lightroom"

# Create Folder for Backup and Change Directory
mkdir -p "$WRK_DIR"
cd ${WRK_DIR}

# Create Backup of Lightroom Catalog
cp ${LR_ROOT}/Lightroom.lrcat Lightroom.lrcat_bak
cp ${LR_ROOT}/Lightroom\ Previews.lrdata/previews.db previews.db_bak
cp ${LR_ROOT}/Lightroom\ Previews.lrdata/root-pixels.db root-pixels.db_bak

# Create Empty Lightroom Catalog
cp "${SRC_DIR}"/Lightroom.lrcat Lightroom.lrcat_new
cp -r "${SRC_DIR}"/Lightroom\ Previews.lrdata Lightroom\ Previews.lrdata_new

# Clone Picks Data from Backup to New DB
sqlite3 < "${SRC_DIR}"/sql/picks_catalog_clone.sql

# Clone Picks Previews from Backup to New DB
sqlite3 < "${SRC_DIR}"/sql/picks_catalog_previews.sql

# Get list of Picked Image files
sqlite3 Lightroom.lrcat_bak < "${SRC_DIR}"/sql/picks_catalog_files.sql | sed "s/|//g" > image_files
sqlite3 Lightroom.lrcat_bak < "${SRC_DIR}"/sql/picks_catalog_uuids.sql > image_uuids

# Create Folder Structure for Image files
awk -F"\/" '{$NF=""; print $0}' image_files | tr " " "/" | sort | uniq | xargs mkdir -p

# Copy Image files into New Catalog
while read f; do
	cp ${LR_ROOT}/${f} ${f}
done < image_files

# Get File list from Image UUIDs
find ${LR_ROOT}/Lightroom\ Previews.lrdata/ -type f | grep -f image_uuids | awk -F"\/\/" '{print $2}' > image_previews

# Create Folder Structure for Image Previews
awk -F"\/" '{$NF=""; print $0}' image_previews | tr " " "/" | sort | uniq | xargs -I{} mkdir -p Lightroom\ Previews.lrdata_new/{}

# Copy Image previews into New Catalog
while read f; do
	cp ${LR_ROOT}/Lightroom\ Previews.lrdata/${f} Lightroom\ Previews.lrdata_new/${f}
done < image_previews

# Clean up files
mv Lightroom.lrcat_new Lightroom.lrcat
mv Lightroom\ Previews.lrdata_new Lightroom\ Previews.lrdata

rm *_bak*
rm *_new*
rm image_*
