using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BusinessRuleException
/// </summary>
[Serializable]
public class BusinessRuleException : Exception
{
    public List<string> RuleDetails { get; set; }
    public BusinessRuleException(string message, List<string> reasons) : base(message)
    {
        //
        // TODO: Add constructor logic here
        //
        this.RuleDetails = reasons;
    }
}
