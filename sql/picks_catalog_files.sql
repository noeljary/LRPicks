SELECT
	lrf.relativePathFromCatalog,
	lfo.pathFromRoot,
	lfi.originalFilename
FROM
	Adobe_images        i,
	AgLibraryRootFolder lrf,
	AgLibraryFolder     lfo,
	AgLibraryFile       lfi
WHERE
	i.rootFile     = lfi.id_local AND
	lfi.folder     = lfo.id_local AND
	lfo.rootFolder = lrf.id_local AND
	i.pick         = 1.0;