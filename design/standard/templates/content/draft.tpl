<form action={concat("content/draft/")|ezurl} method="post" >

<div class="maincontentheader">
<h1>{"My drafts"|i18n("design/standard/content/view")}</h1>
</div>

{section show=$draft_list}

<table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <th>{"Name:"|i18n("design/standard/content/view")}</th>
    <th>{"Version:"|i18n("design/standard/content/view")}</th>
    <th>{"Edit:"|i18n("design/standard/content/view")}</th>
    <th>
    <div class="buttonblock">
    <input type="submit" name="RemoveButton" value="{'Remove'|i18n('design/standard/content/view')}" />
    </div>
    </th>
</tr>

{section name=Draft loop=$draft_list sequence=array(bglight,bgdark)}
<tr>
    <td class="{$Draft:sequence}">
    <a href={concat("/content/versionview/",$Draft:item.contentobject.id,"/",$Draft:item.version,"/")|ezurl}>
    {$Draft:item.contentobject.name}</a>
    </td>
    <td class="{$Draft:sequence}">
    {$Draft:item.version}
    </td>
    <td class="{$Draft:sequence}">
    <a href={concat("/content/edit/",$Draft:item.contentobject.id,"/",$Draft:item.version,"/")|ezurl}><img src={"edit.png"|ezimage} border="0"></a>
    </td>
    <td class="{$Draft:sequence}">
    <input type="checkbox" name="DeleteIDArray[]" value="{$Draft:item.id}" />
  </td>
</tr>
{/section}
<tr>
</table>


{section-else}

<div class="feedback">
<h2>{"You have no drafts"|i18n("design/standard/content/view")}</h2>
</div>

{/section}
