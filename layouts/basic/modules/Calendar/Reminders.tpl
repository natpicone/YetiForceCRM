{strip}
	<style>
	{foreach item=ITEM from=Settings_Calendar_Module_Model::getCalendarConfig('colors')}
		.borderColor{$ITEM['name']}{
			border-color: {$ITEM['value']};
		}
		.headingColor{$ITEM['name']}{
			background-color: {$ITEM['value']};
			border-color: {$ITEM['value']};
		}
	{/foreach}
	</style>
	<div class="remindersContent">
		{foreach item=RECORD from=$RECORDS}
			{assign var=START_DATE value=$RECORD->get('date_start')}
			{assign var=START_TIME value=$RECORD->get('time_start')}
			{assign var=END_DATE value=$RECORD->get('due_date')}
			{assign var=END_TIME value=$RECORD->get('time_end')}
			<div class="panel borderColor{$RECORD->get('activitytype')}" data-record="{$RECORD->getId()}">
				<div class="panel-heading headingColor{$RECORD->get('activitytype')}" 
					 {if !empty($COLOR_LIST[$RECORD->getId()])}
					 style="background: {$COLOR_LIST[$RECORD->getId()]['background']}; color: {$COLOR_LIST[$RECORD->getId()]['text']};"
					 {/if}>
					<a class="btn btn-success btn-xs pull-right showModal" data-url="index.php?module=Calendar&view=ActivityStateModal&trigger=Reminders&record={$RECORD->getId()}">
						<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
					</a>
					<img class="activityTypeIcon" src="{vimage_path($RECORD->getActivityTypeIcon())}" />&nbsp;
					<a target="_blank" href="index.php?module=Calendar&view=Detail&record={$RECORD->getId()}">
						{$RECORD->get('subject')}
					</a>
				</div>
				<div class="panel-body">
					<div>
						{vtranslate('Start Date & Time',$MODULE_NAME)}: <strong>{Vtiger_Util_Helper::formatDateTimeIntoDayString("$START_DATE $START_TIME",$RECORD->get('allday'))}</strong>
					</div>
					<div>
						{vtranslate('Due Date',$MODULE_NAME)}: <strong>{Vtiger_Util_Helper::formatDateTimeIntoDayString("$END_DATE $END_TIME",$RECORD->get('allday'))}</strong>
					</div>
					{if $RECORD->get('activitystatus') neq '' }
						<div>
							{vtranslate('Status',$MODULE_NAME)}: <strong>{$RECORD->getDisplayValue('activitystatus')}</strong>
						</div>
					{/if}
					{if $RECORD->get('link') neq '' }
						<div>
							{vtranslate('FL_RELATION',$MODULE_NAME)}: <strong>{$RECORD->getDisplayValue('link')}</strong>
							{if $PERMISSION_TO_SENDE_MAIL}
								<a target="_blank" class="pull-right btn btn-default btn-xs " href="index.php?module=OSSMail&view=compose&mod={Vtiger_Functions::getCRMRecordType($RECORD->get('link'))}&record={$RECORD->get('link')}">
									<span class="glyphicon glyphicon-envelope icon-white" aria-hidden="true"></span>
								</a>
							{/if}
						</div>
					{/if}
					{if $RECORD->get('process') neq '' }
						<div>
							{vtranslate('FL_PROCESS',$MODULE_NAME)}: <strong>{$RECORD->getDisplayValue('process')}</strong>
						</div>
					{/if}
					{if $RECORD->get('subprocess') neq '' }
						<div>
							{vtranslate('FL_SUB_PROCESS',$MODULE_NAME)}: <strong>{$RECORD->getDisplayValue('subprocess')}</strong>
						</div>
					{/if}
					{if $RECORD->get('location') neq '' }
						<div>
							{vtranslate('Location',$MODULE_NAME)}:&nbsp;
							<strong>
								<a target="_blank" href="https://www.google.com/maps/search/{urlencode ($RECORD->get('location'))}" data-original-title="{vtranslate('Location', $MODULE_NAME)}" data-content="{$RECORD->get('location')}">
									{$RECORD->get('location')}
								</a>
							</strong>
							<a target="_blank" class="pull-right btn btn-default btn-xs " href="https://www.google.com/maps/search/{urlencode($RECORD->get('location'))}">
								<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
							</a>
						</div>
					{/if}
					<hr />
					<div class="actionRow text-center">
						<a class="btn btn-default btn-sm btn-success showModal" data-url="index.php?module=Calendar&view=ActivityStateModal&trigger=Reminders&record={$RECORD->getId()}"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></a>
						<a class="btn btn-default btn-sm btn-primary reminderPostpone" data-time="15m">15{vtranslate('LBL_M',$MODULE_NAME)}</a>
						<a class="btn btn-default btn-sm btn-primary reminderPostpone" data-time="30m">30{vtranslate('LBL_M',$MODULE_NAME)}</a>
						<a class="btn btn-default btn-sm btn-primary reminderPostpone" data-time="1h">1{vtranslate('LBL_H',$MODULE_NAME)}</a>
						<a class="btn btn-default btn-sm btn-primary reminderPostpone" data-time="2h">2{vtranslate('LBL_H',$MODULE_NAME)}</a>
						<a class="btn btn-default btn-sm btn-primary reminderPostpone" data-time="6h">6{vtranslate('LBL_H',$MODULE_NAME)}</a>
						<a class="btn btn-default btn-sm btn-primary reminderPostpone" data-time="1d">1{vtranslate('LBL_D',$MODULE_NAME)}</a>
					</div>
				</div>
			</div>
		{foreachelse}
			<div class="alert alert-info">
				{vtranslate('LBL_NO_CURRENT_ACTIVITIES',$MODULE_NAME)}
			</div>
		{/foreach}
	</div>
{/strip}
