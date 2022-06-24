*** Keywords ***

I have logged in as a non-admin role
    New Page    ${customerpage}
    Fill text   //input[@placeholder="Email"]       ${customerid}
    Fill text   //input[@placeholder="Password"]    ${customerpwd}
    Click       button:has-text("Login")

I have logged in as an admin role
    New Page    ${adminpage}
    Fill text   span:has-text("Email")       ${adminid}
    Fill text   input[name="password"]       ${adminpwd}
    Click       button:has-text("Login")