# Inns of Court
 of Court Tagging Protocols
(last updated 12-24-2018)

# Table of Contents
1. [Introduction(#introduction)]
2. [Schema(#schema)]
3. [Taxonomy(#taxonomy)]
4. [File Organization(#file-organization)]

## Introduction
Because the Inns of Court collection of REED London is transliterated from the original 2010 print collection, the process of tagging records has involved interpretation of print conventions for symbols, spacing, and alignment. Wherever possible we have adhered to representation of those symbols in the markup. This has created different challenges from REED Online collections (e.g., Staffordshire, Berkshire, etc., which can be found here: https://ereed.library.utoronto.ca/. Any differences in tagging protocols are decided in consultation with the REED editorial staff.

## Schema
Inns of Court records are tagged using customized TEI schema adapted from REED schema developed by James Cummings. The REED London schema is integrated into the CWRC environment. The file can be found here: 
https://raw.githubusercontent.com/REEDLondon/inns-court/master/out/reed.rng)

## Taxonomy
A complete list of repositories, record types, editorial and technical descriptions of documents, and taxonomies of occupations, objects, entertainment types, character types, crimes and misdemeanours, etc. can be found here:
https://raw.githubusercontent.com/REEDLondon/inns-court/master/taxonomy.xml

## File Organization 
We will use the term "object" (as used in CWRC/Islandora) to describe a tagged record file. Record files for Inns of Court follow from the print collection, in which an object may include one or more records based on how they are organized in the print collection, depending on how each of the Inns maintained their records (e.g., year-to-year), etc. 

On Github, files are grouped in sub-directories based on categories identified in the printed collection, thus:
1. Diaries_Reminiscences
2. Diplomatic_Letters
3. Furnivals_Inn
4. Grays_Inn
5. Histories
6. Inner_Temple
7. Lincolns_Inn
8. Masque_Texts
9. Middle_Temple
10. Miscellaneous Documents
11. Private_Letters

A corresponding list of the document/objects including REED London unique identifiers can be found in the ../taxonomy.xml file 

*The GitHub directory structure also includes sub-directories for templates, schemas, and deprecated files*


## TEI Header
The project-based TEI header is maintained at least on an annual basis, recognizing REED's authority over the REED London project, documenting funding agencies, editorial and production staff, their respective roles and dates of participation. The header also includes xenodata section modeling MODS metadata (this metadata is specified for each record. TEI header templates can be found in the GitHub ../Templates sub-directory.

## TEI Markup
### File Structure
An object containing a single transcribed record follows this structure:
````<text ana="taxon:[record-type] taxon:[unique id]" type="record">
	<body>
		<head>
			<date from-iso="YYYY" to-iso="YYYY">YYYY-YYYY</date></head> 
		<div type="transcription" xml:lang="en"> <!--this should be the language in which the record is written - for transcriptions, the language occurs at the div level. Always use two-letter ISO 639-1 code for language name-->
			<div>
				<head>
					<supplied>human readable information supplied from text</supplied></head>
				<pb type="folio" n="#"/> <!--this type can be folio, sheet, single-sheet -->
				<ab>body of record</ab>
			</div>
		</div>
	</body>
</text>
````
*if there is a gap included in the printed record, that should be placed outside of the <ab> tags thus: `<gap reason="omitted"/>`*

If the record is translated, the translation appears directly below the `<div type="transcription">` with the same nested structure, replacing `<div type="transcription"> with <div type="translation">`

### Structural Markup
Beyond the file structure, records are tagged to replicate as accurately as possible the format provided in the printed collection. Most useful tags include:
`<ex>` to indicate letters missing for scribal reasons from the original document
`<add place="above">`to indicate an insertion above the line (may also be below)


