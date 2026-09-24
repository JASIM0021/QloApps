<div id="mobile-sidebar-backdrop"></div>
<nav id="{if $employee->bo_menu}nav-sidebar{else}nav-topbar{/if}" class="bootstrap" role="navigation">
	<div class="mobile-nav-header visible-xs visible-sm">
		<div class="mobile-nav-brand">
			<i class="icon-building"></i>
			<span>TodayInTech PMS</span>
		</div>
		<button type="button" class="mobile-nav-close" id="mobile_nav_close_btn" aria-label="Close navigation">
			<i class="icon-remove"></i>
		</button>
	</div>
	{if !$tab}
		<div class="mainsubtablist" style="display:none;"></div>
	{/if}
	<ul class="menu">
		<li class="searchtab">
			{include file="search_form.tpl" id="header_search" show_clear_btn=1}
		</li>
		{foreach $tabs as $t}
			{if $t.active}
			<li class="maintab {if $t.current}active{/if} {if $t.sub_tabs|@count}has_submenu{/if}" id="maintab-{$t.class_name}" data-submenu="{$t.id_tab}">
				<a href="{if $t.sub_tabs|@count && isset($t.sub_tabs[0].href)}{$t.sub_tabs[0].href|escape:'html':'UTF-8'}{else}{$t.href|escape:'html':'UTF-8'}{/if}" class="title" >
					<i class="icon-{$t.class_name}"></i>
					<span>{if $t.name eq ''}{$t.class_name|escape:'html':'UTF-8'}{else}{$t.name|escape:'html':'UTF-8'}{/if}</span>
				</a>
				{if $t.sub_tabs|@count}
					<ul class="submenu">
					{foreach from=$t.sub_tabs item=t2}
						{if $t2.active}
						<li id="subtab-{$t2.class_name|escape:'html':'UTF-8'}" {if $t2.current} class="active"{/if}>
							<a href="{$t2.href|escape:'html':'UTF-8'}">
								{if $t2.name eq ''}{$t2.class_name|escape:'html':'UTF-8'}{else}{$t2.name|escape:'html':'UTF-8'}{/if}
							</a>
						</li>
						{/if}
					{/foreach}
					</ul>
				{/if}
			</li>
			{/if}
		{/foreach}
	</ul>
	{hook h='displayAdminNavBarBeforeEnd'}
</nav>
