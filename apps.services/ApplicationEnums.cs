using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public enum ATTACHMENT_TYPES
{
    CLEARANCE_ATTACHMENT,
    REQUEST_ATTACHMENT,
    STAMPS_ATTACHMENT
}


public static class XtremeExtender
{
    public static bool In(this string obj, params string[] args)
    {
        return args.Contains(obj);
    }

}