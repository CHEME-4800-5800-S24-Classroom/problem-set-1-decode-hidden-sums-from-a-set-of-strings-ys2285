# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# Here you can define any helper functions that might be useful for processing the models.

"""
`_extract_code_from_model(model::MyPuzzleRecordModel) -> Int64`

Extracts a two-digit integer from the MyPuzzleRecordModel by combining the first digit and the last digit found in the encoded line of text.

# Arguments
- `model::MyPuzzleRecordModel`: A model instance containing the encoded line of text.

# Returns
- `Int64`: The two-digit integer constructed from the first and last digits in the encoded line of text.
"""
function _extract_code_from_model(model::MyPuzzleRecordModel) :: Int64
    first_digit = parse(Int, match(r"\d", model.record).match)  # Extracts the first digit
    last_digit = parse(Int, match(r"\d(?=[^\d]*$)", model.record).match)  # Extracts the last digit
    
    return first_digit * 10 + last_digit  # Combines them into a two-digit integer
end

# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #

"""
    decode_part_1(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

Computes the overall hidden sum from a dictionary of MyPuzzleRecordModel instances and constructs a dictionary mapping line numbers to computed two-digit integers.

# Arguments
- `models::Dict{Int64, MyPuzzleRecordModel}`: A dictionary of models, each containing an encoded line of text.

# Returns
- `Tuple{Int64, Dict{Int64, Int64}}`: The overall hidden sum and a dictionary of line numbers to two-digit integers.
"""
function decode_part_1(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
    
    total = 0  
    codes = Dict{Int64, Int64}()  # Initialize the dictionary for line numbers and codes
    
    for (line_number, model) in models
        code = _extract_code_from_model(model)  # Use the private helper to get the code
        total += code  
        codes[line_number] = code  
    end
    
    return (total, codes) 
end


"""
    decode_part_2(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

Decodes the encoded text considering numerical digits and spelled-out words for numbers,
computes the overall hidden sum, and constructs a dictionary of two-digit integers.

# Arguments
- `models::Dict{Int64, MyPuzzleRecordModel}`: A dictionary of models, each containing an encoded line of text.

# Returns
- `Tuple{Int64, Dict{Int64, Int64}}`: The overall hidden sum and a dictionary mapping line numbers to two-digit integers.
"""
function decode_part_2(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}     
    total = 0
    codes = Dict{Int64, Int64}()
    
    for (line_number, model) in models
        # Use the _find_digit function to get the first and last digit or spelled-out number
        first_digit, last_digit = _find_digit(model.record)
        
        # Convert to two-digit integer
        code = first_digit * 10 + last_digit
        
        # Add to the total sum
        total += code
        
        # Store in the codes dictionary
        codes[line_number] = code
    end
     
    return (total, codes)
end

# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #