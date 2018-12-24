# Inns of Court
Tagging Protocols
(last updated 12-24-2018)

<!-- MarkdownTOC autolink="true" style="unordered"-->

- [Introduction](#introduction)
	- [Schema](#schema)
	- Taxonomy
	- File Organization
	- TEI Header
	- TEI Markup
		- File Structure
		- Structural Markup
		- Editorial Markup
		- Semantic Markup

<!-- /MarkdownTOC -->


<a name="introduction"></a>
	# Introduction
REED London is developed in conjunction with the Canadian Writing Research Collaboratory (CWRC), with TEI files tagged using CWRC-Writer and employing REED London-specific entities. The REED London CWRC home-page is available here: https://beta.cwrc.ca/reed. Information about the project, its participants, and collections can be accessed at that URL. The project is currently identified by REED as a "prototype" - and therefore are available in a provisional state.

Because the Inns of Court collection of REED London is transliterated from the original 2010 print collection, the process of tagging records has involved interpretation of print conventions for symbols, spacing, and alignment. Wherever possible we have adhered to representation of those symbols in the markup. This has created different challenges from REED Online collections (e.g., Staffordshire, Berkshire, etc., which can be found here: https://ereed.library.utoronto.ca/. Any differences in tagging protocols are decided in consultation with the REED editorial staff.

<a name="schema">## Schema</a>
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

### Editorial Markup
* Footnotes and glosses from the printed collection are represented inline with the marked up text (rather than at the foot of a web page). Where dates have been implicit in the printed text (e.g., 'Last Saturday', note: 25 December 1589) they have been made explicit and marked with date tags, replacing the note (e.g., `<date when-iso="1589-12-25">Last Saturday</ab>date>`). 
* Marginal notes from original documents have been maintained in REED transcription style, so that `<note type="marginal" rend="align-left">` or "align-right" is meant to recognize that placement in the document. This notation is not meant for display purposes at this point.
* Long and editorial endnotes are placed inline in CWRC-Writer. Where in the printed collection references within long and endnotes to other records are indicated by page number, wherever possible those interleaved notes are now recognized with a `<ref target="#">` to that/those objects within the CWRC collection.

### Semantic Markup
* People, places, and organizations are tagged as RDF-XML entities in CWRC; wherever possible, these entities resolve to authority files in VIAF, Wikidata, Geonames, ODNB, or similar using @corresp attribute. When entities also have a REED-EATS entity identifier, these entities are tagged with @sameAs attribute.
* entities that are of value to REED London (objects, occupations, performance- and entertainer-types, etc.) are managed using taxonomies and prefixed with `taxon:` in the record object.
* Currency is of particular interest in our work; monies are therefore tagged as `<measure type="currency" n=#">`, where the pound/shilling/pence string is replaced in the @n attribute with a cumulative calculation of pence. https://en.wikipedia.org/wiki/%C2%A3sd#Origins



