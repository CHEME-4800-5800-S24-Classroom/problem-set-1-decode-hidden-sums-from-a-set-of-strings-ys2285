"""
    MyPuzzleRecordModel

TODO: Add documentation
"""
mutable struct MyPuzzleRecordModel
    record::String # holds a single encoded line of text
    characters::Array{Char, 1} # holds the characters of the line of text
    len::Int64 # holds the length (number of characters) of the encoded line of text
end
