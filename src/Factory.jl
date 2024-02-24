# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# Here you can define any necessary private helper functions. Remember to use the _ naming convention for private methods.

# Example of simplified validation logic (modify as needed)
function _validate_encoded_line(encoded_line::AbstractString) :: Bool
    # The encoded line should not be empty and must contain at least one digit
    # Adjust the logic to check for the presence of digits as needed for your specific case
    return !isempty(encoded_line) && any(isdigit, encoded_line)
end


# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE =================================================================================== #

"""
`build(encoded_line::AbstractString) -> MyPuzzleRecordModel`

Constructs a MyPuzzleRecordModel object from an encoded line of text, ensuring flexibility in handling string types.

# Arguments
- `encoded_line::AbstractString`: The line of text to be encoded into the model.

# Returns
- `MyPuzzleRecordModel`: An instance of MyPuzzleRecordModel with all fields populated.
"""
function build(encoded_line::AbstractString) :: MyPuzzleRecordModel

    if !_validate_encoded_line(encoded_line)
        error("Invalid encoded line. Please ensure it meets the required criteria.")
    end
    characters = collect(encoded_line)
    len = length(encoded_line)
    return MyPuzzleRecordModel(encoded_line, characters, len)
end

# ===== PUBLIC METHODS ABOVE HERE =================================================================================== #
