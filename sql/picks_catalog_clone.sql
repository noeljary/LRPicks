ATTACH 'Lightroom.lrcat_bak' as A;
ATTACH 'Lightroom.lrcat_new' as B;


INSERT INTO
	B.Adobe_AdditionalMetadata
SELECT
	*
FROM
	A.Adobe_AdditionalMetadata
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.Adobe_imageDevelopBeforeSettings
SELECT
	*
FROM
	A.Adobe_imageDevelopBeforeSettings
WHERE
	developSettings IN (
		SELECT
			id_local
		FROM
			A.Adobe_imageDevelopSettings
		WHERE
			image IN (
				SELECT
					id_local
				FROM
					A.Adobe_images
				WHERE
					pick = 1.0
			)
	);


INSERT INTO
	B.Adobe_imageDevelopSettings
SELECT
	*
FROM
	A.Adobe_imageDevelopSettings
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.Adobe_imageProofSettings
SELECT
	*
FROM
	A.Adobe_imageProofSettings
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.Adobe_imageProperties
SELECT
	*
FROM
	A.Adobe_imageProperties
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.Adobe_images
SELECT
	*
FROM
	A.Adobe_images
WHERE
	pick = 1.0;


INSERT INTO
	B.Adobe_libraryImageDevelopHistoryStep
SELECT
	*
FROM
	A.Adobe_libraryImageDevelopHistoryStep
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.Adobe_libraryImageDevelopSnapshot
SELECT
	*
FROM
	A.Adobe_libraryImageDevelopSnapshot
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.Adobe_libraryImageFaceProcessHistory
SELECT
	*
FROM
	A.Adobe_libraryImageFaceProcessHistory
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgFolderContent
SELECT
	*
FROM
	A.AgFolderContent
WHERE
	containingFolder IN (
		SELECT
			DISTINCT(lfo.id_local)
		FROM
			A.Adobe_images    i,
			A.AgLibraryFolder lfo,
			A.AgLibraryFile   lfi
		WHERE
			i.rootFile = lfi.id_local AND
			lfi.folder = lfo.id_local AND
			i.pick     = 1.0
	);


INSERT INTO
	B.AgHarvestedDNGMetadata
SELECT
	*
FROM
	A.AgHarvestedDNGMetadata
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgHarvestedExifMetadata
SELECT
	*
FROM
	A.AgHarvestedExifMetadata
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgHarvestedIptcMetadata
SELECT
	*
FROM
	A.AgHarvestedIptcMetadata
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgHarvestedMetadataWorklist
SELECT
	*
FROM
	A.AgHarvestedMetadataWorklist;


INSERT INTO
	B.AgInternedExifCameraSN
SELECT
	*
FROM
	A.AgInternedExifCameraSN;


INSERT INTO
	B.AgLastCatalogExport
SELECT
	*
FROM
	A.AgLastCatalogExport
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


DELETE FROM B.AgLibraryCollection;

INSERT INTO
	B.AgLibraryCollection
SELECT
	*
FROM
	A.AgLibraryCollection
WHERE
	id_local < 100
UNION
SELECT
	*
FROM
	A.AgLibraryCollection
WHERE
	id_local IN (
		SELECT
			DISTINCT(collection)
		FROM
			A.AgLibraryCollectionImage
		WHERE
			image IN (
				SELECT
					id_local
				FROM
					A.Adobe_images
				WHERE
					pick = 1.0
			)
	);


DELETE FROM B.AgLibraryCollectionChangeCounter;

INSERT INTO
	B.AgLibraryCollectionChangeCounter
SELECT
	*
FROM
	A.AgLibraryCollectionChangeCounter
WHERE
	collection IN (
		SELECT
			id_local
		FROM
			B.AgLibraryCollection
	);


DELETE FROM B.AgLibraryCollectionContent;

INSERT INTO
	B.AgLibraryCollectionContent
SELECT
	*
FROM
	A.AgLibraryCollectionContent
WHERE
	collection IN (
		SELECT
			id_local
		FROM
			B.AgLibraryCollection
	);


INSERT INTO
	B.AgLibraryCollectionCoverImage
SELECT
	*
FROM
	A.AgLibraryCollectionCoverImage
WHERE
	collection IN (
		SELECT
			id_local
		FROM
			B.AgLibraryCollection
	);


INSERT INTO
	B.AgLibraryCollectionImage
SELECT
	*
FROM
	A.AgLibraryCollectionImage
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgLibraryCollectionImageChangeCounter
SELECT
	*
FROM
	A.AgLibraryCollectionImageChangeCounter
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgLibraryCollectionImageOzAlbumAssetIds
SELECT
	*
FROM
	A.AgLibraryCollectionImageOzAlbumAssetIds
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgLibraryCollectionImageOzSortOrder
SELECT
	*
FROM
	A.AgLibraryCollectionImageOzSortOrder
WHERE
	collection IN (
		SELECT
			id_local
		FROM
			B.AgLibraryCollection
	);


INSERT INTO
	B.AgLibraryCollectionStack
SELECT
	*
FROM
	A.AgLibraryCollectionStack
WHERE
	collection IN (
		SELECT
			id_local
		FROM
			B.AgLibraryCollection
	);


INSERT INTO
	B.AgLibraryCollectionStackData
SELECT
	*
FROM
	A.AgLibraryCollectionStackData
WHERE
	collection IN (
		SELECT
			id_local
		FROM
			B.AgLibraryCollection
	);


INSERT INTO
	B.AgLibraryCollectionStackImage
SELECT
	*
FROM
	A.AgLibraryCollectionStackImage
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgLibraryFace
SELECT
	*
FROM
	A.AgLibraryFace
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgLibraryFile
SELECT
	*
FROM
	A.AgLibraryFile
WHERE
	id_local IN (
		SELECT
			DISTINCT(rootFile)
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgLibraryFolder
SELECT
	*
FROM
	A.AgLibraryFolder
WHERE
	id_local IN (
		SELECT
			DISTINCT(folder)
		FROM
			A.AgLibraryFile
		WHERE
			id_local IN (
				SELECT
					DISTINCT(rootFile)
				FROM
					A.Adobe_images
				WHERE
					pick = 1.0
			)
	);


INSERT INTO
	B.AgLibraryFolderStack
SELECT
	*
FROM
	A.AgLibraryFolderStack
WHERE
	id_local IN (
		SELECT
			DISTINCT(stack)
		FROM
			A.AgLibraryFolderStackData
		WHERE
			stack IN (
				SELECT
					DISTINCT(stack)
				FROM
					A.AgLibraryFolderStackImage
				WHERE
					image IN (
						SELECT
							id_local
						FROM
							A.Adobe_images
						WHERE
							pick = 1.0
					)
			)
	);


INSERT INTO
	B.AgLibraryFolderStackData
SELECT
	*
FROM
	A.AgLibraryFolderStackData
WHERE
	stack IN (
		SELECT
			DISTINCT(stack)
		FROM
			A.AgLibraryFolderStackImage
		WHERE
			image IN (
				SELECT
					id_local
				FROM
					A.Adobe_images
				WHERE
					pick = 1.0
			)
	);


INSERT INTO
	B.AgLibraryFolderStackImage
SELECT
	*
FROM
	A.AgLibraryFolderStackImage
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgLibraryIPTC
SELECT
	*
FROM
	A.AgLibraryIPTC
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgLibraryImageChangeCounter
SELECT
	*
FROM
	A.AgLibraryImageChangeCounter
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgLibraryImageOzAssetIds
SELECT
	*
FROM
	A.AgLibraryImageOzAssetIds
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgLibraryImageSearchData
SELECT
	*
FROM
	A.AgLibraryImageSearchData
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgLibraryImageSyncedAssetData
SELECT
	*
FROM
	A.AgLibraryImageSyncedAssetData
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgLibraryImport
SELECT
	*
FROM
	A.AgLibraryImport
WHERE
	id_local IN (
		SELECT
			DISTINCT(import)
		FROM
			A.AgLibraryImportImage
		WHERE
			image IN (
				SELECT
					id_local
				FROM
					A.Adobe_images
				WHERE
					pick = 1.0
			)
	);


INSERT INTO
	B.AgLibraryImportImage
SELECT
	*
FROM
	A.AgLibraryImportImage
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgLibraryRootFolder
SELECT
	*
FROM
	A.AgLibraryRootFolder
WHERE
	id_local IN (
		SELECT
			DISTINCT(rootFolder)
		FROM
			A.AgLibraryFolder
		WHERE
			id_local IN (
				SELECT
					DISTINCT(folder)
				FROM
					A.AgLibraryFile
				WHERE
					id_local IN (
						SELECT
							rootFile
						FROM
							A.Adobe_images
						WHERE
							pick = 1.0
					)
				)
			);


INSERT INTO
	B.AgLibraryUpdatedImages
SELECT
	*
FROM
	A.AgLibraryUpdatedImages
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgMetadataSearchIndex
SELECT
	*
FROM
	A.AgMetadataSearchIndex
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


INSERT INTO
	B.AgOutputImageAsset
SELECT
	*
FROM
	A.AgOutputImageAsset
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


DELETE FROM B.AgPhotoPropertySpec;

INSERT INTO
	B.AgPhotoPropertySpec
SELECT
	*
FROM
	A.AgPhotoPropertySpec;


INSERT INTO
	B.AgSourceColorProfileConstants
SELECT
	*
FROM
	A.AgSourceColorProfileConstants
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


DELETE FROM
	B.AgSpecialSourceContent;

INSERT INTO
	B.AgSpecialSourceContent
SELECT
	*
FROM
	A.AgSpecialSourceContent;


INSERT INTO
	B.AgTempImages
SELECT
	*
FROM
	A.AgTempImages
WHERE
	image IN (
		SELECT
			id_local
		FROM
			A.Adobe_images
		WHERE
			pick = 1.0
	);


DELETE FROM
	B.LrMobileSyncChangeCounter;

INSERT INTO
	B.LrMobileSyncChangeCounter
SELECT
	*
FROM
	A.LrMobileSyncChangeCounter;


DELETE FROM
	B.MigrationSchemaVersion;

INSERT INTO
	B.MigrationSchemaVersion
SELECT
	*
FROM
	A.MigrationSchemaVersion;
