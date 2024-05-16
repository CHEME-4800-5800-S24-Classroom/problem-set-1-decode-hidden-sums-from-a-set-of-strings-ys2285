
# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #

"""
    puzzleparse(filename::String) -> Dict{Int64, MyPuzzleRecordModel}

Parses a file containing encoded lines of text, constructing a MyPuzzleRecordModel for each line.

# Arguments
- `filename::String`: The path to the file to be parsed.

# Returns
- `Dict{Int64, MyPuzzleRecordModel}`: A dictionary where each key is a line number (starting from 1) and the value is a MyPuzzleRecordModel instance holding the encoded line of text.
"""
function puzzleparse(filename::String)::Dict{Int64, MyPuzzleRecordModel}
    
    # Initialize a dictionary to hold line numbers and MyPuzzleRecordModel instances -
    records = Dict{Int64, MyPuzzleRecordModel}()
    linecounter = 1  
     -
    open(filename, "r") do io
        for line ∈ eachline(io)
            
            # process the data lines -
            records[linecounter] = _build(MyPuzzleRecordModel, line);
            
            # Increment
            linecounter += 1
        end
    end

    # return the header and the records -
    return records;
end

# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #
