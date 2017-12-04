<Page id="1" templateExtension="html" relativePath="." fullRelativePath="." secured="False" urlType="Relative" isIncluded="False" SSLAccess="False" isService="False" cachingEnabled="False" cachingDuration="1 minutes" wizardTheme="None" wizardThemeVersion="3.0" useDesign="False" needGeneration="0">
	<Components>
		<Panel id="2" visible="True" generateDiv="True" name="Panel1" PathID="Panel1" features="(assigned)">
			<Components>
				<Grid id="3" secured="False" sourceType="Table" returnValueType="Number" defaultPageSize="10" name="modulos1" connection="cosas" dataSource="modulos" pageSizeLimit="100" pageSize="True" wizardCaption=" Modulos Lista de" wizardThemeApplyTo="Page" wizardGridType="Tabular" wizardSortingType="SimpleDir" wizardAllowInsert="True" wizardAltRecord="False" wizardAltRecordType="Style" wizardRecordSeparator="False" wizardNoRecords="No hay registros" wizardGridPagingType="Centered" wizardUseSearch="False" wizardAddNbsp="True" gridTotalRecords="False" wizardAddPanels="False" wizardType="GridRecord" wizardGridRecordLinkFieldType="field" wizardGridRecordLinkField="modulo_id" wizardUseInterVariables="False" addTemplatePanel="False" changedCaptionGrid="False" gridExtendedHTML="False" PathID="Panel1modulos1" composition="4" isParent="True" useJqueryFeatures="True">
					<Components>
						<Link id="6" visible="Yes" fieldSourceType="DBColumn" dataType="Text" html="False" hrefType="Page" urlType="Relative" preserveParameters="GET" name="modulos1_Insert" hrefSource="modulos.ccp" removeParameters="modulo_id" wizardThemeItem="FooterA" wizardDefaultValue="Agregar Nuevo" wizardUseTemplateBlock="False" PathID="Panel1modulos1modulos1_Insert">
							<Components/>
							<Events/>
							<LinkParameters/>
							<Attributes/>
							<Features/>
						</Link>
						<Sorter id="7" visible="True" name="Sorter_modulo_id" column="modulo_id" wizardCaption="Modulo Id" wizardSortingType="SimpleDir" wizardControl="modulo_id" wizardAddNbsp="False" PathID="Panel1modulos1Sorter_modulo_id">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Sorter>
						<Sorter id="8" visible="True" name="Sorter_nombre" column="nombre" wizardCaption="Nombre" wizardSortingType="SimpleDir" wizardControl="nombre" wizardAddNbsp="False" PathID="Panel1modulos1Sorter_nombre">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Sorter>
						<Sorter id="9" visible="True" name="Sorter_codigo" column="codigo" wizardCaption="Codigo" wizardSortingType="SimpleDir" wizardControl="codigo" wizardAddNbsp="False" PathID="Panel1modulos1Sorter_codigo">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Sorter>
						<Sorter id="10" visible="True" name="Sorter_carrera_id" column="carrera_id" wizardCaption="Carrera Id" wizardSortingType="SimpleDir" wizardControl="carrera_id" wizardAddNbsp="False" PathID="Panel1modulos1Sorter_carrera_id">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Sorter>
						<Sorter id="11" visible="True" name="Sorter_descripcion" column="descripcion" wizardCaption="Descripcion" wizardSortingType="SimpleDir" wizardControl="descripcion" wizardAddNbsp="False" PathID="Panel1modulos1Sorter_descripcion">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Sorter>
						<Sorter id="12" visible="True" name="Sorter_componente_tecnico" column="componente_tecnico" wizardCaption="Componente Tecnico" wizardSortingType="SimpleDir" wizardControl="componente_tecnico" wizardAddNbsp="False" PathID="Panel1modulos1Sorter_componente_tecnico">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Sorter>
						<Sorter id="13" visible="True" name="Sorter_horas" column="horas" wizardCaption="Horas" wizardSortingType="SimpleDir" wizardControl="horas" wizardAddNbsp="False" PathID="Panel1modulos1Sorter_horas">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Sorter>
						<Link id="14" visible="Yes" fieldSourceType="DBColumn" dataType="Integer" html="False" hrefType="Page" preserveParameters="GET" name="modulo_id" fieldSource="modulo_id" wizardCaption="Modulo Id" wizardIsPassword="False" wizardUseTemplateBlock="False" linkProperties="''" wizardAlign="right" wizardAddNbsp="True" wizardThemeItem="GridA" PathID="Panel1modulos1modulo_id" urlType="Relative">
							<Components/>
							<Events/>
							<LinkParameters>
								<LinkParameter id="15" sourceType="DataField" format="yyyy-mm-dd" name="modulo_id" source="modulo_id"/>
							</LinkParameters>
							<Attributes/>
							<Features/>
						</Link>
						<Label id="17" fieldSourceType="DBColumn" dataType="Text" html="False" generateSpan="False" name="nombre" fieldSource="nombre" wizardCaption="Nombre" wizardIsPassword="False" wizardUseTemplateBlock="False" wizardAddNbsp="True" PathID="Panel1modulos1nombre">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Label>
						<Label id="19" fieldSourceType="DBColumn" dataType="Text" html="False" generateSpan="False" name="codigo" fieldSource="codigo" wizardCaption="Codigo" wizardIsPassword="False" wizardUseTemplateBlock="False" wizardAddNbsp="True" PathID="Panel1modulos1codigo">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Label>
						<Label id="21" fieldSourceType="DBColumn" dataType="Integer" html="False" generateSpan="False" name="carrera_id" fieldSource="carrera_id" wizardCaption="Carrera Id" wizardIsPassword="False" wizardUseTemplateBlock="False" wizardAlign="right" wizardAddNbsp="True" PathID="Panel1modulos1carrera_id">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Label>
						<Label id="23" fieldSourceType="DBColumn" dataType="Text" html="False" generateSpan="False" name="descripcion" fieldSource="descripcion" wizardCaption="Descripcion" wizardIsPassword="False" wizardUseTemplateBlock="False" wizardAddNbsp="True" PathID="Panel1modulos1descripcion">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Label>
						<Label id="25" fieldSourceType="DBColumn" dataType="Text" html="False" generateSpan="False" name="componente_tecnico" fieldSource="componente_tecnico" wizardCaption="Componente Tecnico" wizardIsPassword="False" wizardUseTemplateBlock="False" wizardAddNbsp="True" PathID="Panel1modulos1componente_tecnico">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Label>
						<Label id="27" fieldSourceType="DBColumn" dataType="Integer" html="False" generateSpan="False" name="horas" fieldSource="horas" wizardCaption="Horas" wizardIsPassword="False" wizardUseTemplateBlock="False" wizardAlign="right" wizardAddNbsp="True" PathID="Panel1modulos1horas">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Label>
						<Navigator id="28" size="10" type="Centered" pageSizes="1;5;10;25;50" name="Navigator" wizardPagingType="Centered" wizardFirst="True" wizardFirstText="Inicio" wizardPrev="True" wizardPrevText="Anterior" wizardNext="True" wizardNextText="Siguiente" wizardLast="True" wizardLastText="Final" wizardPageNumbers="Centered" wizardSize="10" wizardTotalPages="True" wizardHideDisabled="False" wizardOfText="de" wizardPageSize="True" wizardImagesScheme="None">
							<Components/>
							<Events/>
							<Attributes/>
							<Features/>
						</Navigator>
					</Components>
					<Events/>
					<TableParameters/>
					<JoinTables>
						<JoinTable id="4" tableName="modulos"/>
					</JoinTables>
					<JoinLinks/>
					<Fields>
						<Field id="5" tableName="modulos" fieldName="modulo_id"/>
						<Field id="16" tableName="modulos" fieldName="nombre"/>
						<Field id="18" tableName="modulos" fieldName="codigo"/>
						<Field id="20" tableName="modulos" fieldName="carrera_id"/>
						<Field id="22" tableName="modulos" fieldName="descripcion"/>
						<Field id="24" tableName="modulos" fieldName="componente_tecnico"/>
						<Field id="26" tableName="modulos" fieldName="horas"/>
					</Fields>
					<PKFields/>
					<SPParameters/>
					<SQLParameters/>
					<SecurityGroups/>
					<Attributes/>
					<Features/>
				</Grid>
				<Panel id="29" visible="True" generateDiv="True" name="Panel2" PathID="Panel1Panel2" features="(assigned)">
					<Components>
						<Record id="30" sourceType="Table" urlType="Relative" secured="False" allowInsert="True" allowUpdate="True" allowDelete="True" validateData="True" preserveParameters="GET" returnValueType="Number" returnValueTypeForDelete="Number" returnValueTypeForInsert="Number" returnValueTypeForUpdate="Number" name="modulos2" connection="cosas" dataSource="modulos" errorSummator="Error" allowCancel="False" recordDeleteConfirmation="False" buttonsType="button" wizardRecordKey="modulo_id" encryptPasswordField="False" wizardUseInterVariables="False" pkIsAutoincrement="True" wizardCaption="Agregar/Editar Modulos " wizardThemeApplyTo="Page" wizardFormMethod="post" wizardType="GridRecord" changedCaptionRecord="False" recordDirection="Vertical" templatePageRecord="C:/Program Files (x86)/CodeChargeStudio5/Templates/Record/Dialog.ccp|ccsTemplate" recordAddTemplatePanel="False" PathID="Panel1Panel2modulos2" composition="4">
							<Components>
								<Button id="32" urlType="Relative" enableValidation="True" isDefault="False" name="Button_Insert" operation="Insert" wizardCaption="Agregar" PathID="Panel1Panel2modulos2Button_Insert">
									<Components/>
									<Events/>
									<Attributes/>
									<Features/>
								</Button>
								<Button id="33" urlType="Relative" enableValidation="True" isDefault="False" name="Button_Update" operation="Update" wizardCaption="Enviar" PathID="Panel1Panel2modulos2Button_Update">
									<Components/>
									<Events/>
									<Attributes/>
									<Features/>
								</Button>
								<Button id="34" urlType="Relative" enableValidation="False" isDefault="False" name="Button_Delete" operation="Delete" wizardCaption="Borrar" PathID="Panel1Panel2modulos2Button_Delete">
									<Components/>
									<Events/>
									<Attributes/>
									<Features/>
								</Button>
								<TextBox id="36" visible="Yes" fieldSourceType="DBColumn" dataType="Text" name="nombre" fieldSource="nombre" wizardIsPassword="False" wizardUseTemplateBlock="False" wizardCaption="Nombre" caption="Nombre" required="False" unique="False" wizardSize="50" wizardMaxLength="250" PathID="Panel1Panel2modulos2nombre">
									<Components/>
									<Events/>
									<Attributes/>
									<Features/>
								</TextBox>
								<TextBox id="37" visible="Yes" fieldSourceType="DBColumn" dataType="Text" name="codigo" fieldSource="codigo" wizardIsPassword="False" wizardUseTemplateBlock="False" wizardCaption="Codigo" caption="Codigo" required="False" unique="False" wizardSize="50" wizardMaxLength="50" PathID="Panel1Panel2modulos2codigo">
									<Components/>
									<Events/>
									<Attributes/>
									<Features/>
								</TextBox>
								<TextBox id="38" visible="Yes" fieldSourceType="DBColumn" dataType="Integer" name="carrera_id" fieldSource="carrera_id" wizardIsPassword="False" wizardUseTemplateBlock="False" wizardCaption="Carrera Id" caption="Carrera Id" required="True" unique="False" wizardSize="10" wizardMaxLength="10" PathID="Panel1Panel2modulos2carrera_id">
									<Components/>
									<Events/>
									<Attributes/>
									<Features/>
								</TextBox>
								<TextBox id="39" visible="Yes" fieldSourceType="DBColumn" dataType="Text" name="descripcion" fieldSource="descripcion" wizardIsPassword="False" wizardUseTemplateBlock="False" wizardCaption="Descripcion" caption="Descripcion" required="False" unique="False" wizardSize="50" wizardMaxLength="250" PathID="Panel1Panel2modulos2descripcion">
									<Components/>
									<Events/>
									<Attributes/>
									<Features/>
								</TextBox>
								<TextBox id="40" visible="Yes" fieldSourceType="DBColumn" dataType="Text" name="componente_tecnico" fieldSource="componente_tecnico" wizardIsPassword="False" wizardUseTemplateBlock="False" wizardCaption="Componente Tecnico" caption="Componente Tecnico" required="False" unique="False" wizardSize="50" wizardMaxLength="250" PathID="Panel1Panel2modulos2componente_tecnico">
									<Components/>
									<Events/>
									<Attributes/>
									<Features/>
								</TextBox>
								<TextBox id="41" visible="Yes" fieldSourceType="DBColumn" dataType="Integer" name="horas" fieldSource="horas" wizardIsPassword="False" wizardUseTemplateBlock="False" wizardCaption="Horas" caption="Horas" required="False" unique="False" wizardSize="10" wizardMaxLength="10" PathID="Panel1Panel2modulos2horas">
									<Components/>
									<Events/>
									<Attributes/>
									<Features/>
								</TextBox>
							</Components>
							<Events/>
							<TableParameters>
								<TableParameter id="35" conditionType="Parameter" useIsNull="False" field="modulo_id" parameterSource="modulo_id" dataType="Integer" logicOperator="And" searchConditionType="Equal" parameterType="URL" orderNumber="1"/>
							</TableParameters>
							<SPParameters/>
							<SQLParameters/>
							<JoinTables>
								<JoinTable id="31" tableName="modulos"/>
							</JoinTables>
							<JoinLinks/>
							<Fields/>
							<PKFields/>
							<ISPParameters/>
							<ISQLParameters/>
							<IFormElements/>
							<USPParameters/>
							<USQLParameters/>
							<UConditions/>
							<UFormElements/>
							<DSPParameters/>
							<DSQLParameters/>
							<DConditions/>
							<SecurityGroups/>
							<Attributes/>
							<Features/>
						</Record>
					</Components>
					<Events/>
					<Attributes/>
					<Features>
						<JDialog id="70" modal="True" visible="False" enabled="True" name="DialogPanel1" category="jQuery" title="Agregar/Editar Modulos " show="Panel1condition_for_show.ontrue;" hide="Panel1condition_for_hide.ontrue;">
							<Components/>
							<Events/>
							<TableParameters/>
							<SPParameters/>
							<SQLParameters/>
							<JoinTables/>
							<JoinLinks/>
							<Fields/>
							<ControlPoints>
								<ControlPoint id="71" name="Panel1condition_for_show.ontrue" relProperty="show">
									<Items>
										<ControlPointItem id="72" name="modulos" ccpId="1" type="Page" isFeature="False"/>
										<ControlPointItem id="73" name="Panel1" ccpId="2" type="Panel" isFeature="False" PathID="Panel1"/>
										<ControlPointItem id="74" name="condition_for_show" ccpId="43" type="Condition" isFeature="True" PathID="Panel1condition_for_show"/>
									</Items>
								</ControlPoint>
								<ControlPoint id="75" name="Panel1condition_for_hide.ontrue" relProperty="hide">
									<Items>
										<ControlPointItem id="76" name="modulos" ccpId="1" type="Page" isFeature="False"/>
										<ControlPointItem id="77" name="Panel1" ccpId="2" type="Panel" isFeature="False" PathID="Panel1"/>
										<ControlPointItem id="78" name="condition_for_hide" ccpId="48" type="Condition" isFeature="True" PathID="Panel1condition_for_hide"/>
									</Items>
								</ControlPoint>
							</ControlPoints>
							<Features/>
						</JDialog>
					</Features>
				</Panel>
			</Components>
			<Events/>
			<Attributes/>
			<Features>
				<JUpdatePanel id="42" enabled="True" childrenAsTriggers="True" name="UpdatePanel1" category="jQuery">
					<Components/>
					<Events/>
					<ControlPoints/>
					<Features/>
				</JUpdatePanel>
				<Condition id="43" name="condition_for_show" category="Ajax" condition="==" sourceType1="Expression" name1="true" name2="(params[&quot;click&quot;] == &quot;link&quot;)" sourceType2="Expression" start="Panel1UpdatePanel1.onafterrefresh;">
					<Components/>
					<Events/>
					<ControlPoints>
						<ControlPoint id="44" name="Panel1UpdatePanel1.onafterrefresh" relProperty="start">
							<Items>
								<ControlPointItem id="45" name="modulos" ccpId="1" type="Page" isFeature="False"/>
								<ControlPointItem id="46" name="Panel1" ccpId="2" type="Panel" isFeature="False" PathID="Panel1"/>
								<ControlPointItem id="47" name="UpdatePanel1" ccpId="42" type="JUpdatePanel" isFeature="True" PathID="Panel1UpdatePanel1"/>
							</Items>
						</ControlPoint>
					</ControlPoints>
					<Features/>
				</Condition>
				<Condition id="48" name="condition_for_hide" category="Ajax" condition="==" sourceType1="Expression" name1="true" name2="(params[&quot;click&quot;] == &quot;submit&quot; &amp;&amp; $(&quot;#ErrorBlock&quot;).length == 0)" sourceType2="Expression" start="Panel1UpdatePanel1.onafterrefresh;">
					<Components/>
					<Events/>
					<ControlPoints>
						<ControlPoint id="49" name="Panel1UpdatePanel1.onafterrefresh" relProperty="start">
							<Items>
								<ControlPointItem id="50" name="modulos" ccpId="1" type="Page" isFeature="False"/>
								<ControlPointItem id="51" name="Panel1" ccpId="2" type="Panel" isFeature="False" PathID="Panel1"/>
								<ControlPointItem id="52" name="UpdatePanel1" ccpId="42" type="JUpdatePanel" isFeature="True" PathID="Panel1UpdatePanel1"/>
							</Items>
						</ControlPoint>
					</ControlPoints>
					<Features/>
				</Condition>
				<Condition id="53" name="ccc_link_Condition" category="Ajax" condition="==" sourceType1="Expression" name1="true" name2="(params[&quot;click&quot;] = &quot;link&quot;)" sourceType2="Expression" start="Panel1modulos1modulos1_Insert.onclick;Panel1modulos1modulo_id.onclick;">
					<Components/>
					<Events/>
					<ControlPoints>
						<ControlPoint id="54" name="Panel1modulos1modulos1_Insert.onclick" relProperty="start">
							<Items>
								<ControlPointItem id="55" name="modulos" ccpId="1" type="Page" isFeature="False"/>
								<ControlPointItem id="56" name="Panel1" ccpId="2" type="Panel" isFeature="False" PathID="Panel1"/>
								<ControlPointItem id="57" name="modulos1" ccpId="3" type="Grid" isFeature="False" PathID="Panel1modulos1"/>
								<ControlPointItem id="58" name="modulos1_Insert" ccpId="6" type="Link" isFeature="False" PathID="Panel1modulos1modulos1_Insert"/>
							</Items>
						</ControlPoint>
						<ControlPoint id="59" name="Panel1modulos1modulo_id.onclick" relProperty="start">
							<Items>
								<ControlPointItem id="60" name="modulos" ccpId="1" type="Page" isFeature="False"/>
								<ControlPointItem id="61" name="Panel1" ccpId="2" type="Panel" isFeature="False" PathID="Panel1"/>
								<ControlPointItem id="62" name="modulos1" ccpId="3" type="Grid" isFeature="False" PathID="Panel1modulos1"/>
								<ControlPointItem id="63" name="modulo_id" ccpId="14" type="Link" isFeature="False" PathID="Panel1modulos1modulo_id"/>
							</Items>
						</ControlPoint>
					</ControlPoints>
					<Features/>
				</Condition>
				<Condition id="64" name="ccc_submit_Condition" category="Ajax" condition="==" sourceType1="Expression" name1="true" name2="(params[&quot;click&quot;] = &quot;submit&quot;)" sourceType2="Expression" start="Panel1Panel2modulos2.onsubmit;">
					<Components/>
					<Events/>
					<ControlPoints>
						<ControlPoint id="65" name="Panel1Panel2modulos2.onsubmit" relProperty="start">
							<Items>
								<ControlPointItem id="66" name="modulos" ccpId="1" type="Page" isFeature="False"/>
								<ControlPointItem id="67" name="Panel1" ccpId="2" type="Panel" isFeature="False" PathID="Panel1"/>
								<ControlPointItem id="68" name="Panel2" ccpId="29" type="Panel" isFeature="False" PathID="Panel1Panel2"/>
								<ControlPointItem id="69" name="modulos2" ccpId="30" type="Record" isFeature="False" PathID="Panel1Panel2modulos2"/>
							</Items>
						</ControlPoint>
					</ControlPoints>
					<Features/>
				</Condition>
				<Condition id="79" name="ccc_others_Condition" category="Ajax" condition="==" sourceType1="Expression" name1="true" name2="(params[&quot;click&quot;] = &quot;&quot;)" sourceType2="Expression" start="Panel1Panel2DialogPanel1.onshow;Panel1Panel2DialogPanel1.onhide;">
					<Components/>
					<Events/>
					<ControlPoints>
						<ControlPoint id="80" name="Panel1Panel2DialogPanel1.onshow" relProperty="start">
							<Items>
								<ControlPointItem id="81" name="modulos" ccpId="1" type="Page" isFeature="False"/>
								<ControlPointItem id="82" name="Panel1" ccpId="2" type="Panel" isFeature="False" PathID="Panel1"/>
								<ControlPointItem id="83" name="Panel2" ccpId="29" type="Panel" isFeature="False" PathID="Panel1Panel2"/>
								<ControlPointItem id="84" name="DialogPanel1" ccpId="70" type="JDialog" isFeature="True" PathID="Panel1Panel2DialogPanel1"/>
							</Items>
						</ControlPoint>
						<ControlPoint id="85" name="Panel1Panel2DialogPanel1.onhide" relProperty="start">
							<Items>
								<ControlPointItem id="86" name="modulos" ccpId="1" type="Page" isFeature="False"/>
								<ControlPointItem id="87" name="Panel1" ccpId="2" type="Panel" isFeature="False" PathID="Panel1"/>
								<ControlPointItem id="88" name="Panel2" ccpId="29" type="Panel" isFeature="False" PathID="Panel1Panel2"/>
								<ControlPointItem id="89" name="DialogPanel1" ccpId="70" type="JDialog" isFeature="True" PathID="Panel1Panel2DialogPanel1"/>
							</Items>
						</ControlPoint>
					</ControlPoints>
					<Features/>
				</Condition>
			</Features>
		</Panel>
		<IncludePage id="90" name="my_include" PathID="my_include" page="my_include.ccp">
<Components/>
<Events/>
<Features/>
</IncludePage>
</Components>
	<CodeFiles>
		<CodeFile id="Events" language="PHPTemplates" name="modulos_events.php" forShow="False" comment="//" codePage="utf-8"/>
		<CodeFile id="Code" language="PHPTemplates" name="modulos.php" forShow="True" url="modulos.php" comment="//" codePage="utf-8"/>
	</CodeFiles>
	<SecurityGroups/>
	<CachingParameters/>
	<Attributes/>
	<Features/>
	<Events/>
</Page>
