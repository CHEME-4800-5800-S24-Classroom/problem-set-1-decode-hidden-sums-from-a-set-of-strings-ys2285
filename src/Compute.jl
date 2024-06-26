# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
function _decode_part_1(model::MyPuzzleRecordModel)::Int64
     
    # for this line, get the characters -
    characters = model.characters;
    digits = filter(isnumeric, characters);
    value = Array{Char, 1}();
    # if (length(digits) > 1)
    #     push!(value, digits[1]);
    #     push!(value, digits[end]);
    # else
    #    push!(value, digits[1]);
    #    push!(value, digits[1]);
    # end
    push!(value, digits[1]);
    push!(value, digits[end]);


    # join the characters and parse the value -
    return value |> join |> x-> parse(Int64, x);
end

function _decode_part_2(model::MyPuzzleRecordModel)::Int64
    
    # we need to search for one, two, three, four, five, six, seven, eight, and nine, and replace these 
    # with 1, 2, 3, 4, 5, 6, 7, 8, and 9, respectively.  Then we can parse the value using the _decode_part_1 function
    
    # initialize -
    record = model.record;
    number_dictionary = Dict("one" => 1, "two" => 2, 
        "three" => 3, "four" => 4, "five" => 5, 
        "six" => 6, "seven" => 7, "eight" => 8, 
        "nine" => 9, "zero" => 0);

    # let's replace the words with the numbers. If we have a number in word form, then add a new start and end character to the word
    # and replace the word with the new word.  For example "eight" goes to "eeightt". So if we had a word like "eightwo"
    # then we would have "eeighttwoo". We'll then replace the word with the number.  In this example, we'd have e8t2o.
    # once all the numbers are replaced, we can then use the _decode_part_1 function to parse the value
    for (word, number) in number_dictionary
        if occursin(word, record)
            
            # replace the word with a modified varient -
            first_char = word[1] |> string;
            last_char = word[end] |> string;
            replacement_word = "$(first_char)$(word)$(last_char)";
            record = replace(record, word => replacement_word) |> x -> replace(x, word => number);
        end
    end

    # update the model -
    model.record = record;
    model.characters = collect(record);

    # now, we can use the _decode_part_1 function to parse the value -
    return _decode_part_1(model);
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
    
    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();
    
    # main -
    for (key, value) ∈ models
        
        # decode the value -
        codes[key] = _decode_part_1(value);

        # total the value -
        total += codes[key];
    end
    
    # return the total -
    return (total, codes);
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
     
    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();
     
    # main -
    for (key, value) ∈ models
         
         # decode the value -
         codes[key] = _decode_part_2(value);
 
         # total the value -
         total += codes[key];
    end
     
     # return the total -
     return (total, codes);
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #