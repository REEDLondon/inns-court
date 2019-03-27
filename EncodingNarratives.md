# Inns of Court
## CWRC Encoding Narratives

### Ingesting from existing XML (Oxygen) file into CWRC using REED Record Template


1. Check that existing file has correct documentary structure as outlined in protocols
1. In CWRC (correct collection) Add Item and select "CWRC Document"
1. Choose "CWRC born digital" from options
1. Add record title in "Title Information" field
1. Give personal/corporate name and year(s) in "Name Information" fields
1. Repeat name and date(s) in "Origin Information" fields
1. Provide "Abstract" (may retrieve from Documents section of IoC
1. Give the record a CCC BY-NC-SA 4.0 access condition statement
1. Click "Next"
1. Choose Create Document "From Template" and "REED record template" from dropdown
1. Click Ingest

Review the log entries; in this first session choose:

- CWRC/Created/cwrc:ce-repository item created/In progress
- MODS/.../Complete

In CWRC Writer, Edit content

- From toolbar, choose "Edit source" (be careful - this is a bit tricky unless you know what you're doing with TEI)
- Copy and paste from the Oxygen file from the <text> element through the </TEI>. Click OK.
- From the toolbar, click "Validate". If the file is valid, then click "Save and exit". If the file is not valid, you will need to troubleshoot to find the error(s).

For new workflow stamp, choose:
content contribution/cwrc:evr-content added/Complete. Save.





