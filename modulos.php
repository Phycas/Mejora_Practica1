<?php
//Include Common Files @1-557D59E6
define("RelativePath", ".");
define("PathToCurrentPage", "/");
define("FileName", "modulos.php");
include_once(RelativePath . "/Common.php");
include_once(RelativePath . "/Template.php");
include_once(RelativePath . "/Sorter.php");
include_once(RelativePath . "/Navigator.php");
//End Include Common Files

class clsGridmodulos1 { //modulos1 class @3-9FB2C7BB

//Variables @3-850BC33A

    // Public variables
    public $ComponentType = "Grid";
    public $ComponentName;
    public $Visible;
    public $Errors;
    public $ErrorBlock;
    public $ds;
    public $DataSource;
    public $PageSize;
    public $IsEmpty;
    public $ForceIteration = false;
    public $HasRecord = false;
    public $SorterName = "";
    public $SorterDirection = "";
    public $PageNumber;
    public $RowNumber;
    public $ControlsVisible = array();

    public $CCSEvents = "";
    public $CCSEventResult;

    public $RelativePath = "";
    public $Attributes;

    // Grid Controls
    public $StaticControls;
    public $RowControls;
    public $Sorter_modulo_id;
    public $Sorter_nombre;
    public $Sorter_codigo;
    public $Sorter_carrera_id;
    public $Sorter_descripcion;
    public $Sorter_componente_tecnico;
    public $Sorter_horas;
//End Variables

//Class_Initialize Event @3-F297858D
    function clsGridmodulos1($RelativePath, & $Parent)
    {
        global $FileName;
        global $CCSLocales;
        global $DefaultDateFormat;
        $this->ComponentName = "modulos1";
        $this->Visible = True;
        $this->Parent = & $Parent;
        $this->RelativePath = $RelativePath;
        $this->Errors = new clsErrors();
        $this->ErrorBlock = "Grid modulos1";
        $this->Attributes = new clsAttributes($this->ComponentName . ":");
        $this->DataSource = new clsmodulos1DataSource($this);
        $this->ds = & $this->DataSource;
        $this->PageSize = CCGetParam($this->ComponentName . "PageSize", "");
        if(!is_numeric($this->PageSize) || !strlen($this->PageSize))
            $this->PageSize = 10;
        else
            $this->PageSize = intval($this->PageSize);
        if ($this->PageSize > 100)
            $this->PageSize = 100;
        if($this->PageSize == 0)
            $this->Errors->addError("<p>Form: Grid " . $this->ComponentName . "<BR>Error: (CCS06) Invalid page size.</p>");
        $this->PageNumber = intval(CCGetParam($this->ComponentName . "Page", 1));
        if ($this->PageNumber <= 0) $this->PageNumber = 1;
        $this->SorterName = CCGetParam("modulos1Order", "");
        $this->SorterDirection = CCGetParam("modulos1Dir", "");

        $this->modulo_id = new clsControl(ccsLink, "modulo_id", "modulo_id", ccsInteger, "", CCGetRequestParam("modulo_id", ccsGet, NULL), $this);
        $this->modulo_id->Page = "";
        $this->nombre = new clsControl(ccsLabel, "nombre", "nombre", ccsText, "", CCGetRequestParam("nombre", ccsGet, NULL), $this);
        $this->codigo = new clsControl(ccsLabel, "codigo", "codigo", ccsText, "", CCGetRequestParam("codigo", ccsGet, NULL), $this);
        $this->carrera_id = new clsControl(ccsLabel, "carrera_id", "carrera_id", ccsInteger, "", CCGetRequestParam("carrera_id", ccsGet, NULL), $this);
        $this->descripcion = new clsControl(ccsLabel, "descripcion", "descripcion", ccsText, "", CCGetRequestParam("descripcion", ccsGet, NULL), $this);
        $this->componente_tecnico = new clsControl(ccsLabel, "componente_tecnico", "componente_tecnico", ccsText, "", CCGetRequestParam("componente_tecnico", ccsGet, NULL), $this);
        $this->horas = new clsControl(ccsLabel, "horas", "horas", ccsInteger, "", CCGetRequestParam("horas", ccsGet, NULL), $this);
        $this->modulos1_Insert = new clsControl(ccsLink, "modulos1_Insert", "modulos1_Insert", ccsText, "", CCGetRequestParam("modulos1_Insert", ccsGet, NULL), $this);
        $this->modulos1_Insert->Parameters = CCGetQueryString("QueryString", array("modulo_id", "ccsForm"));
        $this->modulos1_Insert->Page = "modulos.php";
        $this->Sorter_modulo_id = new clsSorter($this->ComponentName, "Sorter_modulo_id", $FileName, $this);
        $this->Sorter_nombre = new clsSorter($this->ComponentName, "Sorter_nombre", $FileName, $this);
        $this->Sorter_codigo = new clsSorter($this->ComponentName, "Sorter_codigo", $FileName, $this);
        $this->Sorter_carrera_id = new clsSorter($this->ComponentName, "Sorter_carrera_id", $FileName, $this);
        $this->Sorter_descripcion = new clsSorter($this->ComponentName, "Sorter_descripcion", $FileName, $this);
        $this->Sorter_componente_tecnico = new clsSorter($this->ComponentName, "Sorter_componente_tecnico", $FileName, $this);
        $this->Sorter_horas = new clsSorter($this->ComponentName, "Sorter_horas", $FileName, $this);
        $this->Navigator = new clsNavigator($this->ComponentName, "Navigator", $FileName, 10, tpCentered, $this);
        $this->Navigator->PageSizes = array("1", "5", "10", "25", "50");
    }
//End Class_Initialize Event

//Initialize Method @3-90E704C5
    function Initialize()
    {
        if(!$this->Visible) return;

        $this->DataSource->PageSize = & $this->PageSize;
        $this->DataSource->AbsolutePage = & $this->PageNumber;
        $this->DataSource->SetOrder($this->SorterName, $this->SorterDirection);
    }
//End Initialize Method

//Show Method @3-5E6B42D5
    function Show()
    {
        $Tpl = CCGetTemplate($this);
        global $CCSLocales;
        if(!$this->Visible) return;

        $this->RowNumber = 0;


        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeSelect", $this);


        $this->DataSource->Prepare();
        $this->DataSource->Open();
        $this->HasRecord = $this->DataSource->has_next_record();
        $this->IsEmpty = ! $this->HasRecord;
        $this->Attributes->Show();

        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeShow", $this);
        if(!$this->Visible) return;

        $GridBlock = "Grid " . $this->ComponentName;
        $ParentPath = $Tpl->block_path;
        $Tpl->block_path = $ParentPath . "/" . $GridBlock;


        if (!$this->IsEmpty) {
            $this->ControlsVisible["modulo_id"] = $this->modulo_id->Visible;
            $this->ControlsVisible["nombre"] = $this->nombre->Visible;
            $this->ControlsVisible["codigo"] = $this->codigo->Visible;
            $this->ControlsVisible["carrera_id"] = $this->carrera_id->Visible;
            $this->ControlsVisible["descripcion"] = $this->descripcion->Visible;
            $this->ControlsVisible["componente_tecnico"] = $this->componente_tecnico->Visible;
            $this->ControlsVisible["horas"] = $this->horas->Visible;
            while ($this->ForceIteration || (($this->RowNumber < $this->PageSize) &&  ($this->HasRecord = $this->DataSource->has_next_record()))) {
                $this->RowNumber++;
                if ($this->HasRecord) {
                    $this->DataSource->next_record();
                    $this->DataSource->SetValues();
                }
                $Tpl->block_path = $ParentPath . "/" . $GridBlock . "/Row";
                $this->modulo_id->SetValue($this->DataSource->modulo_id->GetValue());
                $this->modulo_id->Parameters = CCGetQueryString("QueryString", array("ccsForm"));
                $this->modulo_id->Parameters = CCAddParam($this->modulo_id->Parameters, "modulo_id", $this->DataSource->f("modulo_id"));
                $this->nombre->SetValue($this->DataSource->nombre->GetValue());
                $this->codigo->SetValue($this->DataSource->codigo->GetValue());
                $this->carrera_id->SetValue($this->DataSource->carrera_id->GetValue());
                $this->descripcion->SetValue($this->DataSource->descripcion->GetValue());
                $this->componente_tecnico->SetValue($this->DataSource->componente_tecnico->GetValue());
                $this->horas->SetValue($this->DataSource->horas->GetValue());
                $this->Attributes->SetValue("rowNumber", $this->RowNumber);
                $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeShowRow", $this);
                $this->Attributes->Show();
                $this->modulo_id->Show();
                $this->nombre->Show();
                $this->codigo->Show();
                $this->carrera_id->Show();
                $this->descripcion->Show();
                $this->componente_tecnico->Show();
                $this->horas->Show();
                $Tpl->block_path = $ParentPath . "/" . $GridBlock;
                $Tpl->parse("Row", true);
            }
        }
        else { // Show NoRecords block if no records are found
            $this->Attributes->Show();
            $Tpl->parse("NoRecords", false);
        }

        $errors = $this->GetErrors();
        if(strlen($errors))
        {
            $Tpl->replaceblock("", $errors);
            $Tpl->block_path = $ParentPath;
            return;
        }
        $this->Navigator->PageNumber = $this->DataSource->AbsolutePage;
        $this->Navigator->PageSize = $this->PageSize;
        if ($this->DataSource->RecordsCount == "CCS not counted")
            $this->Navigator->TotalPages = $this->DataSource->AbsolutePage + ($this->DataSource->next_record() ? 1 : 0);
        else
            $this->Navigator->TotalPages = $this->DataSource->PageCount();
        if (($this->Navigator->TotalPages <= 1 && $this->Navigator->PageNumber == 1) || $this->Navigator->PageSize == "") {
            $this->Navigator->Visible = false;
        }
        $this->modulos1_Insert->Show();
        $this->Sorter_modulo_id->Show();
        $this->Sorter_nombre->Show();
        $this->Sorter_codigo->Show();
        $this->Sorter_carrera_id->Show();
        $this->Sorter_descripcion->Show();
        $this->Sorter_componente_tecnico->Show();
        $this->Sorter_horas->Show();
        $this->Navigator->Show();
        $Tpl->parse();
        $Tpl->block_path = $ParentPath;
        $this->DataSource->close();
    }
//End Show Method

//GetErrors Method @3-BCA4C2BD
    function GetErrors()
    {
        $errors = "";
        $errors = ComposeStrings($errors, $this->modulo_id->Errors->ToString());
        $errors = ComposeStrings($errors, $this->nombre->Errors->ToString());
        $errors = ComposeStrings($errors, $this->codigo->Errors->ToString());
        $errors = ComposeStrings($errors, $this->carrera_id->Errors->ToString());
        $errors = ComposeStrings($errors, $this->descripcion->Errors->ToString());
        $errors = ComposeStrings($errors, $this->componente_tecnico->Errors->ToString());
        $errors = ComposeStrings($errors, $this->horas->Errors->ToString());
        $errors = ComposeStrings($errors, $this->Errors->ToString());
        $errors = ComposeStrings($errors, $this->DataSource->Errors->ToString());
        return $errors;
    }
//End GetErrors Method

} //End modulos1 Class @3-FCB6E20C

class clsmodulos1DataSource extends clsDBcosas {  //modulos1DataSource Class @3-90A403D8

//DataSource Variables @3-F6900E01
    public $Parent = "";
    public $CCSEvents = "";
    public $CCSEventResult;
    public $ErrorBlock;
    public $CmdExecution;

    public $CountSQL;
    public $wp;


    // Datasource fields
    public $modulo_id;
    public $nombre;
    public $codigo;
    public $carrera_id;
    public $descripcion;
    public $componente_tecnico;
    public $horas;
//End DataSource Variables

//DataSourceClass_Initialize Event @3-16EEE18C
    function clsmodulos1DataSource(& $Parent)
    {
        $this->Parent = & $Parent;
        $this->ErrorBlock = "Grid modulos1";
        $this->Initialize();
        $this->modulo_id = new clsField("modulo_id", ccsInteger, "");
        
        $this->nombre = new clsField("nombre", ccsText, "");
        
        $this->codigo = new clsField("codigo", ccsText, "");
        
        $this->carrera_id = new clsField("carrera_id", ccsInteger, "");
        
        $this->descripcion = new clsField("descripcion", ccsText, "");
        
        $this->componente_tecnico = new clsField("componente_tecnico", ccsText, "");
        
        $this->horas = new clsField("horas", ccsInteger, "");
        

    }
//End DataSourceClass_Initialize Event

//SetOrder Method @3-04CE8C6B
    function SetOrder($SorterName, $SorterDirection)
    {
        $this->Order = "";
        $this->Order = CCGetOrder($this->Order, $SorterName, $SorterDirection, 
            array("Sorter_modulo_id" => array("modulo_id", ""), 
            "Sorter_nombre" => array("nombre", ""), 
            "Sorter_codigo" => array("codigo", ""), 
            "Sorter_carrera_id" => array("carrera_id", ""), 
            "Sorter_descripcion" => array("descripcion", ""), 
            "Sorter_componente_tecnico" => array("componente_tecnico", ""), 
            "Sorter_horas" => array("horas", "")));
    }
//End SetOrder Method

//Prepare Method @3-14D6CD9D
    function Prepare()
    {
        global $CCSLocales;
        global $DefaultDateFormat;
    }
//End Prepare Method

//Open Method @3-A298F549
    function Open()
    {
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeBuildSelect", $this->Parent);
        $this->CountSQL = "SELECT COUNT(*)\n\n" .
        "FROM modulos";
        $this->SQL = "SELECT modulo_id, nombre, codigo, carrera_id, descripcion, componente_tecnico, horas \n\n" .
        "FROM modulos {SQL_Where} {SQL_OrderBy}";
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeExecuteSelect", $this->Parent);
        if ($this->CountSQL) 
            $this->RecordsCount = CCGetDBValue(CCBuildSQL($this->CountSQL, $this->Where, ""), $this);
        else
            $this->RecordsCount = "CCS not counted";
        $this->query($this->OptimizeSQL(CCBuildSQL($this->SQL, $this->Where, $this->Order)));
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "AfterExecuteSelect", $this->Parent);
    }
//End Open Method

//SetValues Method @3-D1A92A6D
    function SetValues()
    {
        $this->modulo_id->SetDBValue(trim($this->f("modulo_id")));
        $this->nombre->SetDBValue($this->f("nombre"));
        $this->codigo->SetDBValue($this->f("codigo"));
        $this->carrera_id->SetDBValue(trim($this->f("carrera_id")));
        $this->descripcion->SetDBValue($this->f("descripcion"));
        $this->componente_tecnico->SetDBValue($this->f("componente_tecnico"));
        $this->horas->SetDBValue(trim($this->f("horas")));
    }
//End SetValues Method

} //End modulos1DataSource Class @3-FCB6E20C

class clsRecordmodulos2 { //modulos2 Class @30-84FD320A

//Variables @30-9E315808

    // Public variables
    public $ComponentType = "Record";
    public $ComponentName;
    public $Parent;
    public $HTMLFormAction;
    public $PressedButton;
    public $Errors;
    public $ErrorBlock;
    public $FormSubmitted;
    public $FormEnctype;
    public $Visible;
    public $IsEmpty;

    public $CCSEvents = "";
    public $CCSEventResult;

    public $RelativePath = "";

    public $InsertAllowed = false;
    public $UpdateAllowed = false;
    public $DeleteAllowed = false;
    public $ReadAllowed   = false;
    public $EditMode      = false;
    public $ds;
    public $DataSource;
    public $ValidatingControls;
    public $Controls;
    public $Attributes;

    // Class variables
//End Variables

//Class_Initialize Event @30-838DD0CF
    function clsRecordmodulos2($RelativePath, & $Parent)
    {

        global $FileName;
        global $CCSLocales;
        global $DefaultDateFormat;
        $this->Visible = true;
        $this->Parent = & $Parent;
        $this->RelativePath = $RelativePath;
        $this->Errors = new clsErrors();
        $this->ErrorBlock = "Record modulos2/Error";
        $this->DataSource = new clsmodulos2DataSource($this);
        $this->ds = & $this->DataSource;
        $this->InsertAllowed = true;
        $this->UpdateAllowed = true;
        $this->DeleteAllowed = true;
        $this->ReadAllowed = true;
        if($this->Visible)
        {
            $this->ComponentName = "modulos2";
            $this->Attributes = new clsAttributes($this->ComponentName . ":");
            $CCSForm = explode(":", CCGetFromGet("ccsForm", ""), 2);
            if(sizeof($CCSForm) == 1)
                $CCSForm[1] = "";
            list($FormName, $FormMethod) = $CCSForm;
            $this->EditMode = ($FormMethod == "Edit");
            $this->FormEnctype = "application/x-www-form-urlencoded";
            $this->FormSubmitted = ($FormName == $this->ComponentName);
            $Method = $this->FormSubmitted ? ccsPost : ccsGet;
            $this->Button_Insert = new clsButton("Button_Insert", $Method, $this);
            $this->Button_Update = new clsButton("Button_Update", $Method, $this);
            $this->Button_Delete = new clsButton("Button_Delete", $Method, $this);
            $this->nombre = new clsControl(ccsTextBox, "nombre", "Nombre", ccsText, "", CCGetRequestParam("nombre", $Method, NULL), $this);
            $this->codigo = new clsControl(ccsTextBox, "codigo", "Codigo", ccsText, "", CCGetRequestParam("codigo", $Method, NULL), $this);
            $this->carrera_id = new clsControl(ccsTextBox, "carrera_id", "Carrera Id", ccsInteger, "", CCGetRequestParam("carrera_id", $Method, NULL), $this);
            $this->carrera_id->Required = true;
            $this->descripcion = new clsControl(ccsTextBox, "descripcion", "Descripcion", ccsText, "", CCGetRequestParam("descripcion", $Method, NULL), $this);
            $this->componente_tecnico = new clsControl(ccsTextBox, "componente_tecnico", "Componente Tecnico", ccsText, "", CCGetRequestParam("componente_tecnico", $Method, NULL), $this);
            $this->horas = new clsControl(ccsTextBox, "horas", "Horas", ccsInteger, "", CCGetRequestParam("horas", $Method, NULL), $this);
        }
    }
//End Class_Initialize Event

//Initialize Method @30-86D670D9
    function Initialize()
    {

        if(!$this->Visible)
            return;

        $this->DataSource->Parameters["urlmodulo_id"] = CCGetFromGet("modulo_id", NULL);
    }
//End Initialize Method

//Validate Method @30-DD84C6AF
    function Validate()
    {
        global $CCSLocales;
        $Validation = true;
        $Where = "";
        $Validation = ($this->nombre->Validate() && $Validation);
        $Validation = ($this->codigo->Validate() && $Validation);
        $Validation = ($this->carrera_id->Validate() && $Validation);
        $Validation = ($this->descripcion->Validate() && $Validation);
        $Validation = ($this->componente_tecnico->Validate() && $Validation);
        $Validation = ($this->horas->Validate() && $Validation);
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "OnValidate", $this);
        $Validation =  $Validation && ($this->nombre->Errors->Count() == 0);
        $Validation =  $Validation && ($this->codigo->Errors->Count() == 0);
        $Validation =  $Validation && ($this->carrera_id->Errors->Count() == 0);
        $Validation =  $Validation && ($this->descripcion->Errors->Count() == 0);
        $Validation =  $Validation && ($this->componente_tecnico->Errors->Count() == 0);
        $Validation =  $Validation && ($this->horas->Errors->Count() == 0);
        return (($this->Errors->Count() == 0) && $Validation);
    }
//End Validate Method

//CheckErrors Method @30-65B93554
    function CheckErrors()
    {
        $errors = false;
        $errors = ($errors || $this->nombre->Errors->Count());
        $errors = ($errors || $this->codigo->Errors->Count());
        $errors = ($errors || $this->carrera_id->Errors->Count());
        $errors = ($errors || $this->descripcion->Errors->Count());
        $errors = ($errors || $this->componente_tecnico->Errors->Count());
        $errors = ($errors || $this->horas->Errors->Count());
        $errors = ($errors || $this->Errors->Count());
        $errors = ($errors || $this->DataSource->Errors->Count());
        return $errors;
    }
//End CheckErrors Method

//Operation Method @30-B908BA44
    function Operation()
    {
        if(!$this->Visible)
            return;

        global $Redirect;
        global $FileName;

        $this->DataSource->Prepare();
        if(!$this->FormSubmitted) {
            $this->EditMode = $this->DataSource->AllParametersSet;
            return;
        }

        if($this->FormSubmitted) {
            $this->PressedButton = $this->EditMode ? "Button_Update" : "Button_Insert";
            if($this->Button_Insert->Pressed) {
                $this->PressedButton = "Button_Insert";
            } else if($this->Button_Update->Pressed) {
                $this->PressedButton = "Button_Update";
            } else if($this->Button_Delete->Pressed) {
                $this->PressedButton = "Button_Delete";
            }
        }
        $Redirect = $FileName . "?" . CCGetQueryString("QueryString", array("ccsForm"));
        if($this->PressedButton == "Button_Delete") {
            if(!CCGetEvent($this->Button_Delete->CCSEvents, "OnClick", $this->Button_Delete) || !$this->DeleteRow()) {
                $Redirect = "";
            }
        } else if($this->Validate()) {
            if($this->PressedButton == "Button_Insert") {
                if(!CCGetEvent($this->Button_Insert->CCSEvents, "OnClick", $this->Button_Insert) || !$this->InsertRow()) {
                    $Redirect = "";
                }
            } else if($this->PressedButton == "Button_Update") {
                if(!CCGetEvent($this->Button_Update->CCSEvents, "OnClick", $this->Button_Update) || !$this->UpdateRow()) {
                    $Redirect = "";
                }
            }
        } else {
            $Redirect = "";
        }
        if ($Redirect)
            $this->DataSource->close();
    }
//End Operation Method

//InsertRow Method @30-EA6165AA
    function InsertRow()
    {
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeInsert", $this);
        if(!$this->InsertAllowed) return false;
        $this->DataSource->nombre->SetValue($this->nombre->GetValue(true));
        $this->DataSource->codigo->SetValue($this->codigo->GetValue(true));
        $this->DataSource->carrera_id->SetValue($this->carrera_id->GetValue(true));
        $this->DataSource->descripcion->SetValue($this->descripcion->GetValue(true));
        $this->DataSource->componente_tecnico->SetValue($this->componente_tecnico->GetValue(true));
        $this->DataSource->horas->SetValue($this->horas->GetValue(true));
        $this->DataSource->Insert();
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "AfterInsert", $this);
        return (!$this->CheckErrors());
    }
//End InsertRow Method

//UpdateRow Method @30-08371ADF
    function UpdateRow()
    {
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeUpdate", $this);
        if(!$this->UpdateAllowed) return false;
        $this->DataSource->nombre->SetValue($this->nombre->GetValue(true));
        $this->DataSource->codigo->SetValue($this->codigo->GetValue(true));
        $this->DataSource->carrera_id->SetValue($this->carrera_id->GetValue(true));
        $this->DataSource->descripcion->SetValue($this->descripcion->GetValue(true));
        $this->DataSource->componente_tecnico->SetValue($this->componente_tecnico->GetValue(true));
        $this->DataSource->horas->SetValue($this->horas->GetValue(true));
        $this->DataSource->Update();
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "AfterUpdate", $this);
        return (!$this->CheckErrors());
    }
//End UpdateRow Method

//DeleteRow Method @30-299D98C3
    function DeleteRow()
    {
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeDelete", $this);
        if(!$this->DeleteAllowed) return false;
        $this->DataSource->Delete();
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "AfterDelete", $this);
        return (!$this->CheckErrors());
    }
//End DeleteRow Method

//Show Method @30-19C736D2
    function Show()
    {
        global $CCSUseAmp;
        $Tpl = CCGetTemplate($this);
        global $FileName;
        global $CCSLocales;
        $Error = "";

        if(!$this->Visible)
            return;

        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeSelect", $this);


        $RecordBlock = "Record " . $this->ComponentName;
        $ParentPath = $Tpl->block_path;
        $Tpl->block_path = $ParentPath . "/" . $RecordBlock;
        $this->EditMode = $this->EditMode && $this->ReadAllowed;
        if($this->EditMode) {
            if($this->DataSource->Errors->Count()){
                $this->Errors->AddErrors($this->DataSource->Errors);
                $this->DataSource->Errors->clear();
            }
            $this->DataSource->Open();
            if($this->DataSource->Errors->Count() == 0 && $this->DataSource->next_record()) {
                $this->DataSource->SetValues();
                if(!$this->FormSubmitted){
                    $this->nombre->SetValue($this->DataSource->nombre->GetValue());
                    $this->codigo->SetValue($this->DataSource->codigo->GetValue());
                    $this->carrera_id->SetValue($this->DataSource->carrera_id->GetValue());
                    $this->descripcion->SetValue($this->DataSource->descripcion->GetValue());
                    $this->componente_tecnico->SetValue($this->DataSource->componente_tecnico->GetValue());
                    $this->horas->SetValue($this->DataSource->horas->GetValue());
                }
            } else {
                $this->EditMode = false;
            }
        }

        if($this->FormSubmitted || $this->CheckErrors()) {
            $Error = "";
            $Error = ComposeStrings($Error, $this->nombre->Errors->ToString());
            $Error = ComposeStrings($Error, $this->codigo->Errors->ToString());
            $Error = ComposeStrings($Error, $this->carrera_id->Errors->ToString());
            $Error = ComposeStrings($Error, $this->descripcion->Errors->ToString());
            $Error = ComposeStrings($Error, $this->componente_tecnico->Errors->ToString());
            $Error = ComposeStrings($Error, $this->horas->Errors->ToString());
            $Error = ComposeStrings($Error, $this->Errors->ToString());
            $Error = ComposeStrings($Error, $this->DataSource->Errors->ToString());
            $Tpl->SetVar("Error", $Error);
            $Tpl->Parse("Error", false);
        }
        $CCSForm = $this->EditMode ? $this->ComponentName . ":" . "Edit" : $this->ComponentName;
        $this->HTMLFormAction = $FileName . "?" . CCAddParam(CCGetQueryString("QueryString", ""), "ccsForm", $CCSForm);
        $Tpl->SetVar("Action", !$CCSUseAmp ? $this->HTMLFormAction : str_replace("&", "&amp;", $this->HTMLFormAction));
        $Tpl->SetVar("HTMLFormName", $this->ComponentName);
        $Tpl->SetVar("HTMLFormEnctype", $this->FormEnctype);
        $this->Button_Insert->Visible = !$this->EditMode && $this->InsertAllowed;
        $this->Button_Update->Visible = $this->EditMode && $this->UpdateAllowed;
        $this->Button_Delete->Visible = $this->EditMode && $this->DeleteAllowed;

        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeShow", $this);
        $this->Attributes->Show();
        if(!$this->Visible) {
            $Tpl->block_path = $ParentPath;
            return;
        }

        $this->Button_Insert->Show();
        $this->Button_Update->Show();
        $this->Button_Delete->Show();
        $this->nombre->Show();
        $this->codigo->Show();
        $this->carrera_id->Show();
        $this->descripcion->Show();
        $this->componente_tecnico->Show();
        $this->horas->Show();
        $Tpl->parse();
        $Tpl->block_path = $ParentPath;
        $this->DataSource->close();
    }
//End Show Method

} //End modulos2 Class @30-FCB6E20C

class clsmodulos2DataSource extends clsDBcosas {  //modulos2DataSource Class @30-35AC68B4

//DataSource Variables @30-2EEAE352
    public $Parent = "";
    public $CCSEvents = "";
    public $CCSEventResult;
    public $ErrorBlock;
    public $CmdExecution;

    public $InsertParameters;
    public $UpdateParameters;
    public $DeleteParameters;
    public $wp;
    public $AllParametersSet;

    public $InsertFields = array();
    public $UpdateFields = array();

    // Datasource fields
    public $nombre;
    public $codigo;
    public $carrera_id;
    public $descripcion;
    public $componente_tecnico;
    public $horas;
//End DataSource Variables

//DataSourceClass_Initialize Event @30-8ED6C688
    function clsmodulos2DataSource(& $Parent)
    {
        $this->Parent = & $Parent;
        $this->ErrorBlock = "Record modulos2/Error";
        $this->Initialize();
        $this->nombre = new clsField("nombre", ccsText, "");
        
        $this->codigo = new clsField("codigo", ccsText, "");
        
        $this->carrera_id = new clsField("carrera_id", ccsInteger, "");
        
        $this->descripcion = new clsField("descripcion", ccsText, "");
        
        $this->componente_tecnico = new clsField("componente_tecnico", ccsText, "");
        
        $this->horas = new clsField("horas", ccsInteger, "");
        

        $this->InsertFields["nombre"] = array("Name" => "nombre", "Value" => "", "DataType" => ccsText, "OmitIfEmpty" => 1);
        $this->InsertFields["codigo"] = array("Name" => "codigo", "Value" => "", "DataType" => ccsText, "OmitIfEmpty" => 1);
        $this->InsertFields["carrera_id"] = array("Name" => "carrera_id", "Value" => "", "DataType" => ccsInteger, "OmitIfEmpty" => 1);
        $this->InsertFields["descripcion"] = array("Name" => "descripcion", "Value" => "", "DataType" => ccsText, "OmitIfEmpty" => 1);
        $this->InsertFields["componente_tecnico"] = array("Name" => "componente_tecnico", "Value" => "", "DataType" => ccsText, "OmitIfEmpty" => 1);
        $this->InsertFields["horas"] = array("Name" => "horas", "Value" => "", "DataType" => ccsInteger, "OmitIfEmpty" => 1);
        $this->UpdateFields["nombre"] = array("Name" => "nombre", "Value" => "", "DataType" => ccsText, "OmitIfEmpty" => 1);
        $this->UpdateFields["codigo"] = array("Name" => "codigo", "Value" => "", "DataType" => ccsText, "OmitIfEmpty" => 1);
        $this->UpdateFields["carrera_id"] = array("Name" => "carrera_id", "Value" => "", "DataType" => ccsInteger, "OmitIfEmpty" => 1);
        $this->UpdateFields["descripcion"] = array("Name" => "descripcion", "Value" => "", "DataType" => ccsText, "OmitIfEmpty" => 1);
        $this->UpdateFields["componente_tecnico"] = array("Name" => "componente_tecnico", "Value" => "", "DataType" => ccsText, "OmitIfEmpty" => 1);
        $this->UpdateFields["horas"] = array("Name" => "horas", "Value" => "", "DataType" => ccsInteger, "OmitIfEmpty" => 1);
    }
//End DataSourceClass_Initialize Event

//Prepare Method @30-79B3FE03
    function Prepare()
    {
        global $CCSLocales;
        global $DefaultDateFormat;
        $this->wp = new clsSQLParameters($this->ErrorBlock);
        $this->wp->AddParameter("1", "urlmodulo_id", ccsInteger, "", "", $this->Parameters["urlmodulo_id"], "", false);
        $this->AllParametersSet = $this->wp->AllParamsSet();
        $this->wp->Criterion[1] = $this->wp->Operation(opEqual, "modulo_id", $this->wp->GetDBValue("1"), $this->ToSQL($this->wp->GetDBValue("1"), ccsInteger),false);
        $this->Where = 
             $this->wp->Criterion[1];
    }
//End Prepare Method

//Open Method @30-C596E5E1
    function Open()
    {
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeBuildSelect", $this->Parent);
        $this->SQL = "SELECT * \n\n" .
        "FROM modulos {SQL_Where} {SQL_OrderBy}";
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeExecuteSelect", $this->Parent);
        $this->PageSize = 1;
        $this->query($this->OptimizeSQL(CCBuildSQL($this->SQL, $this->Where, $this->Order)));
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "AfterExecuteSelect", $this->Parent);
    }
//End Open Method

//SetValues Method @30-476188E3
    function SetValues()
    {
        $this->nombre->SetDBValue($this->f("nombre"));
        $this->codigo->SetDBValue($this->f("codigo"));
        $this->carrera_id->SetDBValue(trim($this->f("carrera_id")));
        $this->descripcion->SetDBValue($this->f("descripcion"));
        $this->componente_tecnico->SetDBValue($this->f("componente_tecnico"));
        $this->horas->SetDBValue(trim($this->f("horas")));
    }
//End SetValues Method

//Insert Method @30-E18AFA04
    function Insert()
    {
        global $CCSLocales;
        global $DefaultDateFormat;
        $this->CmdExecution = true;
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeBuildInsert", $this->Parent);
        $this->InsertFields["nombre"]["Value"] = $this->nombre->GetDBValue(true);
        $this->InsertFields["codigo"]["Value"] = $this->codigo->GetDBValue(true);
        $this->InsertFields["carrera_id"]["Value"] = $this->carrera_id->GetDBValue(true);
        $this->InsertFields["descripcion"]["Value"] = $this->descripcion->GetDBValue(true);
        $this->InsertFields["componente_tecnico"]["Value"] = $this->componente_tecnico->GetDBValue(true);
        $this->InsertFields["horas"]["Value"] = $this->horas->GetDBValue(true);
        $this->SQL = CCBuildInsert("modulos", $this->InsertFields, $this);
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeExecuteInsert", $this->Parent);
        if($this->Errors->Count() == 0 && $this->CmdExecution) {
            $this->query($this->SQL);
            $this->CCSEventResult = CCGetEvent($this->CCSEvents, "AfterExecuteInsert", $this->Parent);
        }
    }
//End Insert Method

//Update Method @30-49BD6584
    function Update()
    {
        global $CCSLocales;
        global $DefaultDateFormat;
        $this->CmdExecution = true;
        $Where = "";
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeBuildUpdate", $this->Parent);
        $this->UpdateFields["nombre"]["Value"] = $this->nombre->GetDBValue(true);
        $this->UpdateFields["codigo"]["Value"] = $this->codigo->GetDBValue(true);
        $this->UpdateFields["carrera_id"]["Value"] = $this->carrera_id->GetDBValue(true);
        $this->UpdateFields["descripcion"]["Value"] = $this->descripcion->GetDBValue(true);
        $this->UpdateFields["componente_tecnico"]["Value"] = $this->componente_tecnico->GetDBValue(true);
        $this->UpdateFields["horas"]["Value"] = $this->horas->GetDBValue(true);
        $this->SQL = CCBuildUpdate("modulos", $this->UpdateFields, $this);
        $this->SQL .= strlen($this->Where) ? " WHERE " . $this->Where : $this->Where;
        if (!strlen($this->Where) && $this->Errors->Count() == 0) 
            $this->Errors->addError($CCSLocales->GetText("CCS_CustomOperationError_MissingParameters"));
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeExecuteUpdate", $this->Parent);
        if($this->Errors->Count() == 0 && $this->CmdExecution) {
            $this->query($this->SQL);
            $this->CCSEventResult = CCGetEvent($this->CCSEvents, "AfterExecuteUpdate", $this->Parent);
        }
    }
//End Update Method

//Delete Method @30-C7D41A57
    function Delete()
    {
        global $CCSLocales;
        global $DefaultDateFormat;
        $this->CmdExecution = true;
        $Where = "";
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeBuildDelete", $this->Parent);
        $this->SQL = "DELETE FROM modulos";
        $this->SQL = CCBuildSQL($this->SQL, $this->Where, "");
        if (!strlen($this->Where) && $this->Errors->Count() == 0) 
            $this->Errors->addError($CCSLocales->GetText("CCS_CustomOperationError_MissingParameters"));
        $this->CCSEventResult = CCGetEvent($this->CCSEvents, "BeforeExecuteDelete", $this->Parent);
        if($this->Errors->Count() == 0 && $this->CmdExecution) {
            $this->query($this->SQL);
            $this->CCSEventResult = CCGetEvent($this->CCSEvents, "AfterExecuteDelete", $this->Parent);
        }
    }
//End Delete Method

} //End modulos2DataSource Class @30-FCB6E20C

//Include Page implementation @90-F507247F
include_once(RelativePath . "/my_include.php");
//End Include Page implementation

//Initialize Page @1-C13C009C
// Variables
$FileName = "";
$Redirect = "";
$Tpl = "";
$TemplateFileName = "";
$BlockToParse = "";
$ComponentName = "";
$Attributes = "";

// Events;
$CCSEvents = "";
$CCSEventResult = "";
$TemplateSource = "";

$FileName = FileName;
$Redirect = "";
$TemplateFileName = "modulos.html";
$BlockToParse = "main";
$TemplateEncoding = "UTF-8";
$ContentType = "text/html";
$PathToRoot = "./";
$PathToRootOpt = "";
$Scripts = "|js/jquery/jquery.js|js/jquery/event-manager.js|js/jquery/selectors.js|js/jquery/ui/jquery.ui.core.js|js/jquery/ui/jquery.ui.widget.js|js/jquery/ui/jquery.ui.mouse.js|js/jquery/ui/jquery.ui.draggable.js|js/jquery/ui/jquery.ui.position.js|js/jquery/ui/jquery.ui.resizable.js|js/jquery/ui/jquery.ui.button.js|js/jquery/ui/jquery.ui.dialog.js|js/jquery/dialog/ccs-dialog.js|js/jquery/updatepanel/ccs-update-panel.js|";
$Charset = $Charset ? $Charset : "utf-8";
//End Initialize Page

//Include events file @1-F27166A3
include_once("./modulos_events.php");
//End Include events file

//BeforeInitialize Binding @1-17AC9191
$CCSEvents["BeforeInitialize"] = "Page_BeforeInitialize";
//End BeforeInitialize Binding

//Before Initialize @1-E870CEBC
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeInitialize", $MainPage);
//End Before Initialize

//Initialize Objects @1-7061D70B
$DBcosas = new clsDBcosas();
$MainPage->Connections["cosas"] = & $DBcosas;
$Attributes = new clsAttributes("page:");
$Attributes->SetValue("pathToRoot", $PathToRoot);
$MainPage->Attributes = & $Attributes;

// Controls
$Panel1 = new clsPanel("Panel1", $MainPage);
$Panel1->GenerateDiv = true;
$Panel1->PanelId = "Panel1";
$modulos1 = new clsGridmodulos1("", $MainPage);
$Panel2 = new clsPanel("Panel2", $MainPage);
$Panel2->GenerateDiv = true;
$Panel2->PanelId = "Panel1Panel2";
$modulos2 = new clsRecordmodulos2("", $MainPage);
$my_include = new clsmy_include("", "my_include", $MainPage);
$my_include->Initialize();
$MainPage->Panel1 = & $Panel1;
$MainPage->modulos1 = & $modulos1;
$MainPage->Panel2 = & $Panel2;
$MainPage->modulos2 = & $modulos2;
$MainPage->my_include = & $my_include;
$Panel1->AddComponent("modulos1", $modulos1);
$Panel1->AddComponent("Panel2", $Panel2);
$Panel2->AddComponent("modulos2", $modulos2);
$modulos1->Initialize();
$modulos2->Initialize();
$ScriptIncludes = "";
$SList = explode("|", $Scripts);
foreach ($SList as $Script) {
    if ($Script != "") $ScriptIncludes = $ScriptIncludes . "<script src=\"" . $PathToRoot . $Script . "\" type=\"text/javascript\"></script>\n";
}
$Attributes->SetValue("scriptIncludes", $ScriptIncludes);

BindEvents();

$CCSEventResult = CCGetEvent($CCSEvents, "AfterInitialize", $MainPage);

if ($Charset) {
    header("Content-Type: " . $ContentType . "; charset=" . $Charset);
} else {
    header("Content-Type: " . $ContentType);
}
//End Initialize Objects

//Initialize HTML Template @1-28F2FDD6
$CCSEventResult = CCGetEvent($CCSEvents, "OnInitializeView", $MainPage);
$Tpl = new clsTemplate($FileEncoding, $TemplateEncoding);
if (strlen($TemplateSource)) {
    $Tpl->LoadTemplateFromStr($TemplateSource, $BlockToParse, "UTF-8");
} else {
    $Tpl->LoadTemplate(PathToCurrentPage . $TemplateFileName, $BlockToParse, "UTF-8");
}
$Tpl->SetVar("CCS_PathToRoot", $PathToRoot);
$Tpl->block_path = "/$BlockToParse";
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeShow", $MainPage);
$Attributes->SetValue("pathToRoot", "");
$Attributes->Show();
//End Initialize HTML Template

//Execute Components @1-DBA2478C
$my_include->Operations();
$modulos2->Operation();
//End Execute Components

//Go to destination page @1-086B6F7D
if($Redirect)
{
    $CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
    $DBcosas->close();
    header("Location: " . $Redirect);
    unset($modulos1);
    unset($modulos2);
    $my_include->Class_Terminate();
    unset($my_include);
    unset($Tpl);
    exit;
}
//End Go to destination page

//Show Page @1-9543D8AB
$my_include->Show();
$Panel1->Show();
$Tpl->block_path = "";
$Tpl->Parse($BlockToParse, false);
if (!isset($main_block)) $main_block = $Tpl->GetVar($BlockToParse);
$main_block = CCConvertEncoding($main_block, $FileEncoding, $TemplateEncoding);
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeOutput", $MainPage);
if ($CCSEventResult) echo $main_block;
//End Show Page

//Unload Page @1-8F4C16ED
$CCSEventResult = CCGetEvent($CCSEvents, "BeforeUnload", $MainPage);
$DBcosas->close();
unset($modulos1);
unset($modulos2);
$my_include->Class_Terminate();
unset($my_include);
unset($Tpl);
//End Unload Page


?>
