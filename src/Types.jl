"""
    MyPuzzleRecordModel

A model for the puzzle records. The constructor takes a single argument, the record, and initializes the fields of the model.

### Fields
- `record::String`: The original record.
- `characters::Array{Char, 1}`: The characters of the record.
- `len::Int64`: The length of the record.
"""
mutable struct MyPuzzleRecordModel
    record::String # holds a single encoded line of text
    characters::Array{Char, 1} # holds the characters of the line of text
    len::Int64 # holds the length (number of characters) of the encoded line of text

    # constructor -
    MyPuzzleRecordModel(record::String) = new(record, collect(record), length(record));
end
