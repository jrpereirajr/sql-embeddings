Class dc.jrpereira.sqlembeddings.Main Extends %RegisteredObject
{

/// Property to store the model name.
Property ModelName As %String;

/// Property to store the value that needs to be embedded.
Property ValueToEmbed;

/// Method to initialize the object with the provided model name and value to embed.
/// This method ensures that both properties are set and validated.
/// @param modelName The name of the model to be used.
/// @param valueToEmbed The value to be embedded.
/// @return Status of the operation (success or error).
Method %OnNew(modelName As %String = "", valueToEmbed = "") As %Status [ Private, ServerOnly = 1 ]
{
    Set sc = $$$OK
    Try {
        // Set the properties with the provided values
        Set ..ModelName = modelName
        Set ..ValueToEmbed = valueToEmbed

        // Call the validation method to ensure all properties are properly set
        Set sc = ..Validate()
        If $$$ISERR(sc) {
            // Throw an exception if validation fails
            Throw ##class(%Exception.StatusException).CreateFromStatus(sc)
        }
    } Catch ex {
        // Capture and return any exception as a status
        Set sc = ex.AsStatus()
    }
    Return sc
}

/// Method to validate that all required properties are set.
/// @return Status of the validation (success or error).
Method Validate() As %Status
{
    // Check if ModelName is not empty
    If ..ModelName = "" {
        Return $$$ERROR($$$GeneralError, "ModelName is required")
    }
    // Check if ValueToEmbed is not empty
    If ..ValueToEmbed = "" {
        Return $$$ERROR($$$GeneralError, "ValueToEmbed is required")
    }
    Return $$$OK
}

/// Placeholder method for executing an action with the embedded value.
/// Currently returns an empty vector.
/// @return An empty vector.
Method Execute() As %Vector
{
    Return ""
}

}
