{* DO NOT EDIT THIS FILE! Use an override template instead. *}
<form method="post" action={"collaboration/action/"|ezurl}>

{let message_limit=2
     message_offset=0
     content_version=fetch("content","version",hash("object_id",$collab_item.content.content_object_id,"version_id",$collab_item.content.content_object_version))
     current_participant=fetch("collaboration","participant",hash("item_id",$collab_item.id))
     participant_list=fetch("collaboration","participant_map",hash("item_id",$collab_item.id))
     message_list=fetch("collaboration","message_list",hash("item_id",$collab_item.id,"limit",$message_limit,"offset",$message_offset))}

{if $content_version|null()|not()}
  {set-block variable=contentobject_link}
    {content_version_view_gui view=text_linked content_version=$content_version}
  {/set-block}
{/if}

<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-ml">

<h1 class="context-title">{"Approval"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div>

{* DESIGN: Content START *}<div class="box-ml"><div class="box-mr"><div class="box-content">

<div class="context-attributes">

{switch match=$collab_item.data_int3}
{case match=0}

{if $collab_item.is_creator}
    <p>{"The content object %1 awaits approval before it can be published."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($contentobject_link))}</p>
    <p>{"Do you want to send a message to the person approving it?"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</p>
{else}
    <p>{"The content object %1 needs your approval before it can be published."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($contentobject_link))}</p>
    <p>{"Do you approve of the content object being published?"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</p>
{/if}

{/case}
{case match=1}
  {if and( is_set( $contentobject_link ),$contentobject_link )}
        <p>{"The content object %1 was approved and will be published when the publishing workflow continues."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($contentobject_link))}</p>
  {else}
        <p>{"The content object %1 [deleted] was approved and will be published once the publishing workflow continues."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($collab_item.content.content_object_id))}</p>
  {/if}
{/case}
{case in=array(2,3)}
  {if $collab_item.is_creator}
    {if and( is_set( $contentobject_link ),$contentobject_link )}
        <p>{"The content object %1 was not accepted but is still available as a draft."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($contentobject_link))}</p>
    {else}
        <p>{"The content object %1 [deleted] was not accepted but is available as a draft again."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($collab_item.content.content_object_id))}</p>
    {/if}
    {if $content_version|null()|not()}
      <p>{"You may edit the draft and publish it, in which case an approval is required again."|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</p>
      <p><a href={concat("content/edit/",$content_version.contentobject_id)|ezurl}>{"Edit the object"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</a></p>
    {/if}
  {else}
    {if and( is_set( $contentobject_link ),$contentobject_link )}
        <p>{"The content object %1 was not accepted but will be available as a draft for the author."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($contentobject_link))}</p>
    {else}
        <p>{"The content object %1 [deleted] was not accepted but will be available as a draft for the author."|i18n('design/admin/collaboration/handler/view/full/ezapprove',,array($collab_item.content.content_object_id))}</p>
    {/if}
    <p>{"The author can edit the draft and publish it again, in which case a new approval is required."|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</p>
  {/if}
{/case}
{case/}
{/switch}

{if eq($collab_item.data_int3,0)}
    <label>{"Comment"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}:</label>
    <textarea class="box" name="Collaboration_ApproveComment" cols="40" rows="5"></textarea>
{/if}
</div>


{* DESIGN: Content END *}</div></div></div>

<div class="controlbar">

{* DESIGN: Control bar START *}<div class="box-bc"><div class="box-ml">

<input type="hidden" name="CollaborationActionCustom" value="custom" />
<input type="hidden" name="CollaborationTypeIdentifier" value="ezapprove" />

<input type="hidden" name="CollaborationItemID" value="{$collab_item.id}" />

<div class="block">
{if eq($collab_item.data_int3,0)}

    <input class="button" type="submit" name="CollaborationAction_Comment" value="{'Add Comment'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" />

    {if $collab_item.is_creator|not}
    <input class="button" type="submit" name="CollaborationAction_Accept" value="{'Approve'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" />
    <input class="button" type="submit" name="CollaborationAction_Deny" value="{'Deny'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" />
    {else}
    <input class="button-disabled" type="submit" name="CollaborationAction_Accept" value="{'Approve'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" disabled="disabled" />
    <input class="button-disabled" type="submit" name="CollaborationAction_Deny" value="{'Deny'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" disabled="disabled" />
    {/if}

{else}

    <input class="button-disabled" type="submit" name="CollaborationAction_Comment" value="{'Add Comment'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" disabled="disabled" />

    <input class="button-disabled" type="submit" name="CollaborationAction_Accept" value="{'Approve'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" disabled="disabled" />
    <input class="button-disabled" type="submit" name="CollaborationAction_Deny" value="{'Deny'|i18n('design/admin/collaboration/handler/view/full/ezapprove')}" disabled="disabled" />
{/if}
</div>

{* DESIGN: Control bar END *}</div></div>
</div>

</div>

{if $content_version|null()|not()}
<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-ml">

<h2 class="context-title">{"Preview"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</h2>



{* DESIGN: Header END *}</div></div>

<div class="box-ml"><div class="box-mr">

<div class="context-information">
    <p class="modified">{'Published at'|i18n( 'design/admin/node/view/full' )}: {$content_version.modified|l10n(shortdatetime)}, <a href={$content_version.creator.main_node.url_alias|ezurl}>{$content_version.creator.name|wash}</a></p>
    <p class="translation">{$content_version.initial_language.locale_object.intl_language_name}&nbsp;<img src="{$content_version.initial_language.locale|flag_icon}" alt="{$content_version.initial_language.locale_object.intl_language_name}" style="vertical-align: middle;" /></p>
    <div class="break"></div>
</div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-content">

<div class="mainobject-window" title="{$content_version.contentobject.name|wash} {'Node ID'|i18n( 'design/admin/node/view/full' )}: {$content_version.contentobject.main_node_id}, {'Object ID'|i18n( 'design/admin/node/view/full' )}: {$content_version.contentobject_id}">
    {content_version_view_gui view=plain content_version=$content_version}
</div>

</div></div>

{* DESIGN: Content END *}</div></div></div>

</div>
{/if}

<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-ml">

<h2 class="context-title">{"Participants"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</h2>



{* DESIGN: Header END *}</div></div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-content">

<div class="block">
{section name=Role loop=$participant_list}
<label>{$:item.name|wash}:</label>
{section name=Participant loop=$:item.items}
<p>{collaboration_participation_view view=text_linked collaboration_participant=$:item}</p>
{/section}
{/section}
</div>

{* DESIGN: Content END *}</div></div></div>

</div>

{section show=$message_list}

<div class="context-block">

{* DESIGN: Header START *}<div class="box-header"><div class="box-ml">

<h2 id="messages" class="context-title">{"Messages"|i18n('design/admin/collaboration/handler/view/full/ezapprove')}</h2>



{* DESIGN: Header END *}</div></div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-content">

  <table class="special" cellspacing="0">
  {section name=Message loop=$message_list sequence=array(bglight,bgdark)}

      {collaboration_simple_message_view view=element sequence=$:sequence is_read=$current_participant.last_read|gt($:item.modified) item_link=$:item collaboration_message=$:item.simple_message}

  {/section}
  </table>

{* DESIGN: Content END *}</div></div></div>

</div>

{/section}

{/let}

</form>
