const { PositiveDiagnosticError, UnexistingUserError } = require("./errors");

exports.positiveDiagnostic = ({fetchUser, persistDiagnostic}) => actor =>async ({date}) => {
    try{
        if(isNaN(date)) throw "Invalid timestamp"
        date = date?new Date(Number(date)):new Date()
        let user = await fetchUser(actor)
        if(!user) throw new UnexistingUserError()
        await persistDiagnostic({status:'positive', user, date})
    }catch(error){
        if(error instanceof UnexistingUserError) throw error
        throw new PositiveDiagnosticError(error)
    }
    
}