<cfcomponent>
    <cffunction name="adminLogin" access="remote" >
        <cfargument name="email" type="email"/>
        <cfargument name="password" type="string"/>

        <cfif arguments.email eq "">
            <cfset variable = "Please fill the Email">
            <cflocation url="../index.cfm">
        </cfif>

        <cfif arguments.password eq "">
            <cfset variable = "Please fill the Password field">
            <cflocation url="../index.cfm">
        </cfif>

        <cfquery  datasource="busbooking" result="outputdata" name="loginQuery">
            SELECT * FROM login WHERE email= <cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.email#"> AND password=<cfqueryparam CFSQLType="cf_sql_varchar" value="#arguments.password#"> AND status=1 AND role="admin"
        </cfquery>

        <cfif outputdata.RECORDCOUNT GT 0>
            <cfset Session.userId = loginQuery.id>
            <cfset Session.loggedin = true />
            <cfif Session.loggedin eq true>
                <cflocation url="../dashboard.cfm">
            </cfif> 
        <cfelse>
            <cfoutput>
            <cfset variable = "Please enter correct username and password">
                <cflocation url="../index.cfm">
            </cfoutput>
        </cfif>

    </cffunction>
</cfcomponent>
