# REED London Online: _Inns of Court_ README
*(last updated by Diane Jakacki, 01-31-2019)*

<!-- MarkdownTOC autolink="true" style="unordered"-->

- [Introduction](#introduction)
	- [Schema](#schema)
	- [Taxonomy](#taxonomy)
	- [File Organization](#file-organization)
	- [TEI Header](#tei-header)
	- [TEI Markup](#tei-markup)
		- [File Structure](#file-structure)
		- [Structural Markup](#structural-markup)
		- [Editorial Markup](#editorial-markup)
		- [Semantic Markup](#semantic-markup)

<!-- /MarkdownTOC -->


<a name="introduction"></a>
# Introduction
REED London Online is developed in conjunction with the Canadian Writing Research Collaboratory (CWRC) http://cwrc.ca, with TEI files tagged using CWRC-Writer and employing REED London-specific entities. Information about the REED London Online project, its participants and collections can be accessed at the REED London Online CWRC home-page: https://beta.cwrc.ca/reed. The project is currently identified by REED as a ***prototype*** - and therefore is available in a provisional state.

Because the REED London: _Inns of Court_ collection is transliterated from the original REED: _Inns of Court_  print collection (2010), the process of tagging records has involved interpretation of print conventions for symbols, spacing, and alignment. Wherever possible we have adhered to representation of those symbols in the markup. This has created different challenges from REED Online collections (e.g., _Staffordshire_, _Berkshire_, etc., which can be found here: https://ereed.library.utoronto.ca/. Any differences in tagging protocols are decided in consultation with the REED editorial staff.

<a name="schema"></a>
## Schema
REED London: _Inns of Court_ records are tagged using customized TEI schema adapted from REED schema developed by James Cummings. The REED London Online schema is integrated into the CWRC environment. The file can be found here: 
https://raw.githubusercontent.com/REEDLondon/inns-court/master/out/reed.rng

Inns of Court records are tagged using customized TEI schema adapted from REED schema developed by James Cummings. The REED London schema is integrated into the CWRC environment. The file can be found here: 
https://raw.githubusercontent.com/REEDLondon/inns-court/master/out/REED_London.rng

<a name="taxonomy"></a>
## Taxonomy
A complete list of repositories, record types, editorial and technical descriptions of documents, and taxonomies of occupations, objects, entertainment types, character types, crimes and misdemeanours, etc. can be found here:
https://raw.githubusercontent.com/REEDLondon/inns-court/master/taxonomy.xml

<a name="file-organization"></a>
## File Organization 
We will use the term "object" (as used in CWRC/Islandora) to describe a tagged record file. Record files for Inns of Court follow from the print collection, in which an object may include one or more records based on how they are organized in the print collection, depending on how each of the Inns maintained their records (e.g., year-to-year), etc. 

On Github, files are grouped in sub-directories based on categories identified in the printed collection, thus:

1. Diaries-Reminiscences
2. Diplomatic-Letters
3. Furnivals-Inn
4. Grays-Inn
5. Histories
6. Inner-Temple
7. Lincolns-Inn
8. Masque-Texts
9. Middle-Temple
10. Miscellaneous-Documents
11. Private-Letters

A corresponding list of the document/objects including REED London Online unique identifiers can be found in the ../taxonomy.xml file. 

The GitHub directory structure also includes sub-directories for templates, schemas, and deprecated files.

<a name="tei-header"></a>
## TEI Header
The project-based TEI header is maintained at least on an annual basis, recognizing REED's authority over the REED London Online project, documenting funding agencies, editorial and production staff, their respective roles and dates of participation. The header also includes xenodata section modeling MODS metadata (this metadata is specified for each record.) 

The REED London Online TEI Header for 2018 is published on the wiki and can be found here: https://github.com/REEDLondon/inns-court/wiki/REED-London-TEI-Header---2018
TEI header templates (by century) can be found in the GitHub  ../Templates sub-directory.

<a name="tei-markup"></a>
## TEI Markup
<a name="file-structure"></a>
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
If there is a gap included in the printed record, that should be placed outside of the `<ab>` tags thus: `<gap reason="omitted"/>`

If the record is translated, the translation appears directly below the `<div type="transcription">` with the same nested structure, replacing `<div type="transcription"> with <div type="translation">`

<a name="structural-markup"></a>
### Structural Markup
Beyond the file structure, records are tagged to replicate as accurately as possible the format provided in the printed collection. 

Abbreviated words have been expanded, with italics to indicate letters supplied by the editor. Where manuscripts yield insufficient evidence to judge individual scribal habits, abbreviations are expanded to classical forms in Latin and modern British forms in English. First names have been expanded wherever possible. However in cases where it is impossible to determine what the scribe intended – whether, for example, 'minstr' refers to one or several minstrels – the word has been left unexpanded. Therefore, the most useful tags include:
`<ex>` to indicate letters supplied by the editor to expand abbreviated words; `<del>` to indicate letters or words that have been struck through in the original; 
`<add place="above">`to indicate an insertion above the line (may also be below the line). 

In general, REED London Online follows the transcription conventions adopted by REED Online, which can be found here: https://ereed.library.utoronto.ca/about/series/#editorial

<a name="editorial-markup"></a>
### Editorial Markup
* Footnotes and glosses from the printed collection are represented inline with the marked up text (rather than at the foot of a web page). Where dates have been implicit in the printed text (e.g., 'Last Saturday', note: 25 December 1589) they have been made explicit and marked with date tags, replacing the note (e.g., `<date when-iso="1589-12-25">Last Saturday</ab>date>`). 
* Marginal notes from original documents have been maintained in REED transcription style, so that `<note type="marginal" place="margin_left">` or `<note type="marginal" place="margin_right">` is meant to recognize that placement in the document. This notation is not meant for display purposes at this point.
* Long and editorial endnotes are placed inline in CWRC-Writer. Where in the printed collection references within long and endnotes to other records are indicated by page number, wherever possible those interleaved notes are now recognized with a `<ref target="#">` to that/those objects within the CWRC collection.
* Lists are marked up using TEI list element - http://www.tei-c.org/release/doc/tei-p5-doc/en/html/ref-list.html, containing items.
* Tables are marked up using TEI table element http://www.tei-c.org/release/doc/tei-p5-doc/en/html/ref-table.html. Where information in a table cell is right- or center-aligned in the original transcribed document, the cell is tagged thus: `<cell rend="right">Summa £10</cell>`. For presentation' sake, these cells are also given the @role "data", so that they right-align in CWRC. Complicated tables that include curly braces or are similarly not easily represented in TEI are marked with `@rend="right_brace"` or similar. Where a table-cell contains currency the cell should be tagged `<cell role="data">`. The REED London CSS will then right-align that amount.

<a name="semantic-markup"></a>
### Semantic Markup
* People, places, and organizations are tagged as RDF-XML entities in CWRC; wherever possible, these entities resolve to authority files in VIAF, Wikidata, Geonames, ODNB, or similar using @corresp attribute. When entities also have a REED-EATS entity identifier, these entities are tagged with @sameAs attribute.
	* We plan to make "white lists" of REED people and place entities available in 2019.
* entities that are of value to REED London (objects, occupations, performance- and entertainer-types, etc.) are managed using taxonomies and prefixed with `taxon:` in the record object.
* Currency is of particular interest in our work; monies are therefore tagged as `<measure type="currency" n=#">[amount]</measure>`, where the pound/shilling/pence string is replaced in the @n attribute with a cumulative calculation of pence. https://en.wikipedia.org/wiki/%C2%A3sd#Origins
* Dates are tagged as RDF-XML entities in CWRC; old-style dates are corrected to new-style when they are tagged as entities. Each reference to a date in a document is tagged; this includes implicit date references (e.g., 'the same day', 'fift of November').  Where a date is also a holiday (e.g., All Saints Day, 1st November) it is tagged also as `<name type="holiday">`
* 
