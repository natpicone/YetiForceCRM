<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class Accounts_Record_Model extends Vtiger_Record_Model {

	/**
	 * Function returns the details of Accounts Hierarchy
	 * @return <Array>
	 */
	function getAccountHierarchy() {
		$focus = CRMEntity::getInstance($this->getModuleName());
		$hierarchy = $focus->getAccountHierarchy($this->getId());
		$i=0;
		foreach($hierarchy['entries'] as $accountId => $accountInfo) {
			preg_match('/<a href="+/', $accountInfo[0], $matches);
			if($matches != null) {
				preg_match('/[.\s]+/', $accountInfo[0], $dashes);
				preg_match("/<a(.*)>(.*)<\/a>/i",$accountInfo[0], $name);

				$recordModel = Vtiger_Record_Model::getCleanInstance('Accounts');
				$recordModel->setId($accountId);
				$hierarchy['entries'][$accountId][0] = $dashes[0]."<a href=".$recordModel->getDetailViewUrl().">".$name[2]."</a>";
			}
		}
		return $hierarchy;
	}

	/**
	 * Function returns the url for create event
	 * @return <String>
	 */
	function getCreateEventUrl() {
		$calendarModuleModel = Vtiger_Module_Model::getInstance('Calendar');
		return $calendarModuleModel->getCreateEventRecordUrl().'&link='.$this->getId();
	}

	/**
	 * Function returns the url for create todo
	 * @retun <String>
	 */
	function getCreateTaskUrl() {
		$calendarModuleModel = Vtiger_Module_Model::getInstance('Calendar');
		return $calendarModuleModel->getCreateTaskRecordUrl().'&link='.$this->getId();
	}

	/**
	 * Function to get List of Fields which are related from Accounts to Inventory Record.
	 * @return <array>
	 */
	public function getInventoryMappingFields() {
		return array(
			array('parentField'=>'buildingnumbera', 'inventoryField'=>'buildingnumbera', 'defaultValue'=>''),
			array('parentField'=>'localnumbera', 'inventoryField'=>'localnumbera', 'defaultValue'=>''),
			array('parentField'=>'addresslevel1a', 'inventoryField'=>'addresslevel1a', 'defaultValue'=>''),
			array('parentField'=>'addresslevel2a', 'inventoryField'=>'addresslevel2a', 'defaultValue'=>''),
			array('parentField'=>'addresslevel3a', 'inventoryField'=>'addresslevel3a', 'defaultValue'=>''),
			array('parentField'=>'addresslevel4a', 'inventoryField'=>'addresslevel4a', 'defaultValue'=>''),
			array('parentField'=>'addresslevel5a', 'inventoryField'=>'addresslevel5a', 'defaultValue'=>''),
			array('parentField'=>'addresslevel6a', 'inventoryField'=>'addresslevel6a', 'defaultValue'=>''),
			array('parentField'=>'addresslevel7a', 'inventoryField'=>'addresslevel7a', 'defaultValue'=>''),
			array('parentField'=>'addresslevel8a', 'inventoryField'=>'addresslevel8a', 'defaultValue'=>''),
			
			array('parentField'=>'buildingnumberc', 'inventoryField'=>'buildingnumberb', 'defaultValue'=>''),
			array('parentField'=>'localnumberc', 'inventoryField'=>'localnumberb', 'defaultValue'=>''),
			array('parentField'=>'addresslevel1c', 'inventoryField'=>'addresslevel1b', 'defaultValue'=>''),
			array('parentField'=>'addresslevel2c', 'inventoryField'=>'addresslevel2b', 'defaultValue'=>''),
			array('parentField'=>'addresslevel3c', 'inventoryField'=>'addresslevel3b', 'defaultValue'=>''),
			array('parentField'=>'addresslevel4c', 'inventoryField'=>'addresslevel4b', 'defaultValue'=>''),
			array('parentField'=>'addresslevel5c', 'inventoryField'=>'addresslevel5b', 'defaultValue'=>''),
			array('parentField'=>'addresslevel6c', 'inventoryField'=>'addresslevel6b', 'defaultValue'=>''),
			array('parentField'=>'addresslevel7c', 'inventoryField'=>'addresslevel7b', 'defaultValue'=>''),
			array('parentField'=>'addresslevel8c', 'inventoryField'=>'addresslevel8b', 'defaultValue'=>''),
		);
	}

}
