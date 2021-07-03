# LRPicks
Adobe Lightroom "Picks" Catalog Creator

Script used to manage Lightroom Catalogs for Backups.

When I go on out on a photoshoot there is a low percentage of shots that make the final cut for processing, depending on lighting etc. - These are marked as "Picks" in my catalogs.

Given the cost of cloud backup space or similar, I only want to push these selected images to remote backups - the ones that I really don't want to lose. I could afford to lose the images I don't think are worth processing, but haven't deleted.

This script runs against a specific catalog and creates a smaller subset catalog of just the picked images. It copies most (but not all) relevant details from the Lightroom sqlite database into a new database, including the JPG pre-rendered images used for faster loading, and hard links to the RAW files, so disk space isn't wasted locally.

This smaller catalog can be pushed into cloud/remote storage much faster and at lower cost than the entire catalog. It can be opened in Lightroom, and so far as I can tell, works perfectly.
