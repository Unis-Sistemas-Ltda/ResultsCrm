﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WFBancoDados.aspx.vb" Inherits="ResultsCRM.WFBancoDados" %>

<%@ Register src="../UserControls/WUCBancoDados.ascx" tagname="WUCBancoDados" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:WUCBancoDados ID="WUCBancoDados1" runat="server" />
    
    </div>
    </form>
</body>
</html>
