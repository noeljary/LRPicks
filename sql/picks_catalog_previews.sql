ATTACH 'Lightroom.lrcat_new' as A;
ATTACH 'root-pixels.db_bak'  as B;
ATTACH 'previews.db_bak'     as C;
ATTACH 'Lightroom Previews.lrdata_new/root-pixels.db' as D;
ATTACH 'Lightroom Previews.lrdata_new/previews.db'    as E;


INSERT INTO
	D.RootPixels
SELECT
	*
FROM
	B.RootPixels
WHERE
	uuid IN (
		SELECT
			lfi.id_global
		FROM
			A.Adobe_images  i,
			A.AgLibraryFile lfi
		WHERE
			i.rootFile = lfi.id_local AND
			i.pick     = 1.0
	);


INSERT INTO
	E.DeletedFacePreview
SELECT
	*
FROM
	C.DeletedFacePreview
WHERE
	uuid IN (
		SELECT
			lfi.id_global
		FROM
			A.Adobe_images  i,
			A.AgLibraryFile lfi
		WHERE
			i.rootFile = lfi.id_local AND
			i.pick     = 1.0
	);


INSERT INTO
	E.DeletedMotionPreview
SELECT
	*
FROM
	C.DeletedMotionPreview
WHERE
	uuid IN (
		SELECT
			lfi.id_global
		FROM
			A.Adobe_images  i,
			A.AgLibraryFile lfi
		WHERE
			i.rootFile = lfi.id_local AND
			i.pick     = 1.0
	);


INSERT INTO
	E.DeletedPyramid
SELECT
	*
FROM
	C.DeletedPyramid
WHERE
	uuid IN (
		SELECT
			lfi.id_global
		FROM
			A.Adobe_images  i,
			A.AgLibraryFile lfi
		WHERE
			i.rootFile = lfi.id_local AND
			i.pick     = 1.0
	);


INSERT INTO
	E.FacePreview
SELECT
	*
FROM
	C.FacePreview
WHERE
	uuid IN (
		SELECT
			lfi.id_global
		FROM
			A.Adobe_images  i,
			A.AgLibraryFile lfi
		WHERE
			i.rootFile = lfi.id_local AND
			i.pick     = 1.0
	);


INSERT INTO
	E.FacePreviewCacheEntry
SELECT
	*
FROM
	C.FacePreviewCacheEntry
WHERE
	uuid IN (
		SELECT
			lfi.id_global
		FROM
			A.Adobe_images  i,
			A.AgLibraryFile lfi
		WHERE
			i.rootFile = lfi.id_local AND
			i.pick     = 1.0
	);


INSERT INTO
	E.ImageCacheEntry
SELECT
	*
FROM
	C.ImageCacheEntry
WHERE
	uuid IN (
		SELECT
			lfi.id_global
		FROM
			A.Adobe_images  i,
			A.AgLibraryFile lfi
		WHERE
			i.rootFile = lfi.id_local AND
			i.pick     = 1.0
	);


INSERT INTO
	E.MotionPreview
SELECT
	*
FROM
	C.MotionPreview
WHERE
	uuid IN (
		SELECT
			lfi.id_global
		FROM
			A.Adobe_images  i,
			A.AgLibraryFile lfi
		WHERE
			i.rootFile = lfi.id_local AND
			i.pick     = 1.0
	);


INSERT INTO
	E.MotionPreviewCacheEntry
SELECT
	*
FROM
	C.MotionPreviewCacheEntry
WHERE
	uuid IN (
		SELECT
			lfi.id_global
		FROM
			A.Adobe_images  i,
			A.AgLibraryFile lfi
		WHERE
			i.rootFile = lfi.id_local AND
			i.pick     = 1.0
	);


INSERT INTO
	E.Pyramid
SELECT
	*
FROM
	C.Pyramid
WHERE
	uuid IN (
		SELECT
			lfi.id_global
		FROM
			A.Adobe_images  i,
			A.AgLibraryFile lfi
		WHERE
			i.rootFile = lfi.id_local AND
			i.pick     = 1.0
	);


INSERT INTO
	E.PyramidLevel
SELECT
	*
FROM
	C.PyramidLevel
WHERE
	uuid IN (
		SELECT
			lfi.id_global
		FROM
			A.Adobe_images  i,
			A.AgLibraryFile lfi
		WHERE
			i.rootFile = lfi.id_local AND
			i.pick     = 1.0
	);
