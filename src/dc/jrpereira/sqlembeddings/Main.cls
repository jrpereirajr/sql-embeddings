Class dc.jrpereira.sqlembeddings.Main Extends %RegisteredObject
{

Property ModelName As %String;

Property ValueToEmbed;

Method %OnNew(modelName As %String = "", valueToEmbed = "") As %Status
{
    Set sc = $$$OK
    Try {
        Set ..ModelName = modelName
        Set ..ValueToEmbed = valueToEmbed
    } Catch ex {
        Set sc = ex.AsStatus()
    }
    Return sc
}

Method Execute() As %Vector
{
    Return ""
}

}
