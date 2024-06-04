Class dc.jrpereiraSqlProcDefs Extends %RegisteredObject
{

ClassMethod Embedding(modelName As %String = "", valueToEmbed = "") As %Vector [ SqlName = embedding, SqlProc ]
{
    Return ##class(dc.jrpereira.sqlembeddings.Main).%New(modelName, valueToEmbed).Execute()
}

}
