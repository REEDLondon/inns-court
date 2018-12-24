# inns-court
Inns of Court Tagging Protocols
(last updated 12-24-2018)

# INTRODUCTION
Because the Inns of Court collection of REED London is transliterated from the original 2010 print collection, the process of tagging records has involved interpretation of print conventions for symbols, spacing, and alignment. Wherever possible we have adhered to representation of those symbols in the markup. This has created different challenges from REED Online collections (e.g., Staffordshire, Berkshire, etc., which can be found here - https://ereed.library.utoronto.ca/). Any differences in tagging protocols are decided in consultation with the REED editorial staff.

# SCHEMA
Inns of Court records are tagged using customized TEI schema adapted from REED schema developed by James Cummings. The REED London schema is integrated into the CWRC environment. The file can be found here: 
https://raw.githubusercontent.com/REEDLondon/inns-court/master/out/reed.rng

# TAXONOMY
A complete list of repositories, record types, editorial and technical descriptions of documents, and taxonomies of occupations, objects, entertainment types, character types, crimes and misdemeanours, etc. can be found here:
https://raw.githubusercontent.com/REEDLondon/inns-court/master/taxonomy.xml

# FILE ORGANIZATION 
We will use the term "object" (as used in CWRC/Islandora) to describe a tagged record file. Record files for Inns of Court follow from the print collection, in which an object may include one or more records based on how they are organized in the print collection, depending on how each of the Inns maintained their records (e.g., year-to-year), etc. 

## FILE STRUCTURE
An object containing a single transcribed record follows this structure:
<text ana="taxon:[record-type] taxon:[unique id]" type="record">
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
*if there is a gap included in the printed record, that should be placed outside of the <ab> tags thus: <gap reason="omitted"/>*

If the record is translated, the translation appears directly below the <div type="transcription"> with the same nested structure, replacing <div type="transcription"> with <div type="translation">

