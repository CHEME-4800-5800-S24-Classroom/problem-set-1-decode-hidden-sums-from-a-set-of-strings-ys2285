
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
            # Trim the line to remove any leading/trailing whitespace
            trimmed_line = strip(line)
            
            # Create a MyPuzzleRecordModel instance for the current line
            model = build(trimmed_line) 
            
            # Add the model to the dictionary with the current line number as the key
            records[linecounter] = model
            
            # Increment
            linecounter += 1
        end
    end

    return records
end

# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #
