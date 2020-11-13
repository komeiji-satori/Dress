#!/usr/bin/env wolframscript

FileSystemScan[
    Export[#,Import[#], IncludeMetaInformation->None]&,
    DirectoryName[$InputFileName],
    FileNameForms->"*.jpg"|"*.png"|"*.webp"
]
