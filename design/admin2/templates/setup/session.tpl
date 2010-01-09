{* DO NOT EDIT THIS FILE! Use an override template instead. *}



<form name="trashaction" method="post" action={concat( '/setup/session/', cond( $user_id, concat( $user_id, '/' ), '' ), cond( $view_parameters.offset|gt( 0 ), concat( '(offset)/', $view_parameters.offset ), '' ) )|ezurl}>

<div class="context-block">

{* Messages *}
{if $sessions_removed}
    {if $gc_sessions_completed}
        <div class="message-feedback">
            <h2><span class="time">[{currentdate()|l10n( shortdatetime )}]</span> {"The sessions were successfully removed."|i18n( "design/admin/setup/session" )}</h2>
        </div>
    {else}
      <div class="message-warning">
            <h2><span class="time">[{currentdate()|l10n( shortdatetime )}]</span> {"Not all timed out sessions were successfully removed."|i18n( "design/admin/setup/session" )}</h2>
            <p>
                {"The operation were cut short in order to avoid execution timeout."|i18n( "design/admin/setup/session" )}<br />
                {"Your alternatives are to:"|i18n( "design/admin/setup/session" )}
            </p>
            <ul>
                <li>{"Repeat the operation several times to complete it."|i18n( "design/admin/setup/session" )}</li>
                <li>{"Clear the timed out session data from command-line using: &gt;php bin/php/ezsessiongc.php"|i18n( "design/admin/setup/session" )}</li>
                <li>{"Install the session cleanup cronjob 'session_gc.php' and run on nightly intervals (see cronjob.ini or doc for how)"|i18n( "design/admin/setup/session" )}</li>
            </ul>
      </div>
    {/if}
{/if}


{* DESIGN: Header START *}<div class="box-header"><div class="box-ml">

<h1 class="context-title">{'Session administration'|i18n( "design/admin/setup/session" )}</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

<div class="context-attributes">

<label>{"Sessions"|i18n( "design/admin/setup/session" )}:</label>
    <p>{"Total number of sessions"|i18n( "design/admin/setup/session" )}: {$sessions_active}<br/>
        {let logged_in_count=fetch( user, logged_in_count )
             anonymous_count=fetch( user, anonymous_count )}
        {'There are %logged_in_count registered and %anonymous_count anonymous users online.'|i18n( 'design/admin/setup/session',,
          hash( '%logged_in_count', $logged_in_count, '%anonymous_count', $anonymous_count ) )}
        {/let}
    </p>
    <p>{"WARNING! When you remove sessions, users that are logged in will be logged out from the system."|i18n( "design/admin/setup/session" )}</p>


</div>

{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml">
<div class="block">
<input class="button" type="submit" name="RemoveAllSessionsButton" value="{"Remove all sessions"|i18n( "design/admin/setup/session" )}" />&nbsp;
<input class="button" type="submit" name="RemoveTimedOutSessionsButton" value="{"Remove timed out / old sessions"|i18n( "design/admin/setup/session" )}" />
</div>
{* DESIGN: Control bar END *}</div></div>
</div>
</div>


{* FILTERED SESSIONS WINDOW  *}

<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-ml">

<h2 class="context-title">{'Filtered sessions'|i18n( 'design/admin/setup/session' )}</h2>



{* DESIGN: Header END *}</div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">
<div class="context-attributes">

    {* List of sessions for a specific user *}
    {if $user_id}
        {let session_user=fetch( content,object, hash( 'object_id', $user_id ) )}
        <p>{'Displaying sessions for %username'|i18n( 'design/admin/setup/session',, hash( '%username', $session_user.name ) )}</p>
        {/let}
        <div class="buttonblock">
            <input class="button" type="submit" name="ShowAllUsersButton" value="{"Sessions for all users"|i18n( "design/admin/setup/session" )}" />
        </div>
    {else}
            <div class="block">
            <label>{'Users'|i18n( 'design/admin/setup/session' )}:</label>
            <select class="combobox" name="FilterType">
                <option value="everyone"{cond( eq( $filter_type, 'everyone' ), ' selected="selected"', '' )}>{"Everyone"|i18n( "design/admin/setup/session" )}</option>
                <option value="registered"{cond( eq( $filter_type, 'registered' ), ' selected="selected"', '' )}>{"Registered users"|i18n( "design/admin/setup/session" )}</option>
                <option value="anonymous"{cond( eq( $filter_type, 'anonymous' ), ' selected="selected"', '' )}>{"Anonymous users"|i18n( "design/admin/setup/session" )}</option>
            </select>
           <input class="button" type="submit" name="ChangeFilterButton" value="{"Update list"|i18n( "design/admin/setup/session" )}" />
           </div>

<div class="block">
<label>{'Include inactive users'|i18n( 'design/admin/setup/session' )}:</label>
<input class="checkbox" type="checkbox" name="InactiveUsersCheck" id="InactiveUsersCheck" {cond( eq( $expiration_filter_type, 'all' ), ' checked="checked"', '' )} value="active" />
</div>
<input type="hidden" name="InactiveUsersCheckExists" />

    {/if}

{section show=$sessions_list}
<table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
<tr><th class="tight"><img src={'toggle-button-16x16.gif'|ezimage} alt="{'Invert selection'|i18n( 'design/admin/setup/session' )}" onclick="ezjs_toggleCheckboxes( document.trashaction,
{if $user_id}'SessionKeyArray[]'{else}'UserIDArray[]'{/if}
); return false;" title="{'Invert selection.'|i18n( 'design/admin/setup/session' )}" /></th>

<th>
    <a class="topline" href={concat( '/setup/session/(offset)/', $view_parameters.offset, '/(sortby)/login' )|ezurl}>{"Login"|i18n( "design/admin/setup/session" )}</a>
</th>
{if $user_id|not}
<th>
    {"Count"|i18n( "design/admin/setup/session" )}
</th>
{/if}
<th>
    <a class="topline" href={concat( '/setup/session/(offset)/', $view_parameters.offset, '/(sortby)/email' )|ezurl}>{"Email"|i18n( "design/admin/setup/session" )}</a>
</th>
<th>
    <a class="topline" href={concat( '/setup/session/(offset)/', $view_parameters.offset, '/(sortby)/name' )|ezurl}>{"Full name"|i18n( "design/admin/setup/session" )}</a>
</th>
<th>
    <a class="topline" href={concat( '/setup/session/(offset)/', $view_parameters.offset, '/(sortby)/idle' )|ezurl}>{"Idle time"|i18n( "design/admin/setup/session" )}</a>
</th>
<th>
    <a class="topline" href={concat( '/setup/session/(offset)/', $view_parameters.offset, '/(sortby)/idle' )|ezurl}>{"Idle since"|i18n( "design/admin/setup/session" )}</a>
</th>
</tr>

{section var=session loop=$sessions_list sequence=array('bgdark', 'bglight')}
<tr valign="top" class="{$session.sequence}">
    {let session_user=fetch( content,object, hash( 'object_id', $session.user_id ) )}
    <td width="1%">
    {if $user_id}
        <input type="checkbox" name="SessionKeyArray[]" value="{$session.session_key|wash}" title="{'Select session for removal.'|i18n( 'design/admin/setup/session' )}" />
    {else}
        <input type="checkbox" name="UserIDArray[]" value="{$session.user_id}" title="{'Select session for removal.'|i18n( 'design/admin/setup/session' )}" />
    {/if}
    </td>
    <td width="15%">
        <a href={$session_user.main_node.url_alias|ezurl}>{$session.login}</a>
    </td>
    {if $user_id|not}
    <td width="1%">
        <a href={concat( 'setup/session/', $session.user_id )|ezurl}>{$session.count}</a>
    </td>
    {/if}
    <td width="15%">
        <a href="mailto:{$session.email|wash}">{$session.email|wash}</a>
    </td>
    <td width="30%">
        {$session_user.name|wash}
    </td>

    <td width="10%">
        {$session.idle.hour}:{$session.idle.minute}:{$session.idle.second}
    </td>
    <td width="19%">
      {if or($session.idle.minute|lt(0), $session.idle.hour|lt(0))}
          {"Time skew detected"|i18n( "design/admin/setup/session")}
      {else}
          {$session.idle_time|l10n( shortdatetime )}
      {/if}
    </td>

    {/let}
</tr>
{/section}
</table>
{section-else}
<div class="block">
<p>{'There are no sessions matching the selected options.'|i18n( 'design/admin/setup/session' )}</p>
</div>
{/section}



</div>

{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">
{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml">
<div class="block">
{if $sessions_list}
<input class="button" type="submit" name="RemoveSelectedSessionsButton" value="{'Remove selected'|i18n( 'design/admin/setup/session' )}" title="{'Remove selected sessions.'|i18n( 'design/admin/setup/session' )}" />
{else}
<input class="button-disabled" type="submit" name="RemoveSelectedSessionsButton" value="{'Remove selected'|i18n( 'design/admin/setup/session' )}" disabled="disabled" />
{/if}
</div>
{* DESIGN: Control bar END *}</div></div>
</div>
</div>





    {include name=navigator
             uri='design:navigator/google.tpl'
             page_uri=concat( '/setup/session', cond( $user_id, concat( '/', $user_id ), '' ) )
             item_count=$sessions_count
             view_parameters=$view_parameters
             item_limit=$page_limit}

</form>

