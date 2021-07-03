SELECT
	lfi.id_global
FROM
	Adobe_images  i,
	AgLibraryFile lfi
WHERE
	i.rootFile = lfi.id_local AND
	i.pick     = 1.0;