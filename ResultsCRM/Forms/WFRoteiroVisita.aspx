﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WFRoteiroVisita.aspx.vb" Inherits="ResultsCRM.WFRoteiroVisita" %>

<%@ Register src="../UserControls/WUCRoteiroVisita.ascx" tagname="WUCRoteiroVisita" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:WUCRoteiroVisita ID="WUCRoteiroVisita1" runat="server" />
    
    </div>
    </form>
</body>
</html>
