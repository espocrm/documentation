# Formula Functions

The format of function usage: `groupName\functionName(argument1, argument2, ..., argumentN)`.

Out-of-the-box functions are listed below.

Functions:

* [General](#general)
* [String](#string)
* [Datetime](#datetime)
* [Number](#number)
* [Entity](#entity)
* [Record](#record)
* [Env](#env)
* [Password](#password)
* [Array](#array)
* [Object](#object)
* [Language](#language)
* [Json](#json)
* [Ext](#ext)
* [Util](#util)
* [Log](#log)

## General

[general](formula/general.md)

* [list](formula/general.md#list)
* [ifThenElse](formula/general.md#ifthenelse)
* [ifThen](formula/general.md#ifthen)

## String

[string](formula/string.md)

* [string\concatenate](formula/string.md#stringconcatenate)
* [string\substring](formula/string.md#stringsubstring)
* [string\contains](formula/string.md#stringcontains)
* [string\pos](formula/string.md#stringpos)
* [string\test](formula/string.md#stringtest)
* [string\length](formula/string.md#stringlength)
* [string\trim](formula/string.md#stringtrim)
* [string\lowerCase](formula/string.md#stringlowercase)
* [string\upperCase](formula/string.md#stringuppercase)
* [string\pad](formula/string.md#stringpad)
* [string\match](formula/string.md#stringmatch)
* [string\matchAll](formula/string.md#stringmatchall)
* [string\matchExtract](formula/string.md#stringmatchextract)
* [string\replace](formula/string.md#stringreplace)
* [string\split](formula/string.md#stringsplit)

## Datetime

[datetime](formula/datetime.md)

* [datetime\today](formula/datetime.md#datetimetoday)
* [datetime\now](formula/datetime.md#datetimenow)
* [datetime\format](formula/datetime.md#datetimeformat)
* [datetime\date](formula/datetime.md#datetimedate)
* [datetime\month](formula/datetime.md#datetimemonth)
* [datetime\year](formula/datetime.md#datetimeyear)
* [datetime\hour](formula/datetime.md#datetimehour)
* [datetime\minute](formula/datetime.md#datetimeminute)
* [datetime\dayOfWeek](formula/datetime.md#datetimedayofweek)
* [datetime\diff](formula/datetime.md#datetimediff)
* [datetime\addMinutes](formula/datetime.md#datetimeaddminutes)
* [datetime\addHours](formula/datetime.md#datetimeaddhours)
* [datetime\addDays](formula/datetime.md#datetimeadddays)
* [datetime\addWeeks](formula/datetime.md#datetimeaddweeks)
* [datetime\addMonths](formula/datetime.md#datetimeaddmonths)
* [datetime\addYears](formula/datetime.md#datetimeaddyears)
* [datetime\closest](formula/datetime.md#datetimeclosest)

## Number

[number](formula/number.md)

* [number\format](formula/number.md#numberformat)
* [number\abs](formula/number.md#numberabs)
* [number\power](formula/number.md#numberpower)
* [number\round](formula/number.md#numberround)
* [number\floor](formula/number.md#numberfloor)
* [number\ceil](formula/number.md#numberceil)
* [number\randomInt](formula/number.md#numberrandomint)
* [number\parseInt](formula/number.md#numberparseint)
* [number\parseFloat](formula/number.md#numberparsefloat)

## Entity

[entity](formula/entity.md)

* [entity\isNew](formula/entity.md#entityisnew)
* [entity\isAttributeChanged](formula/entity.md#entityisattributechanged)
* [entity\isAttributeNotChanged](formula/entity.md#entityisattributenotchanged)
* [entity\attribute](formula/entity.md#entityattribute)
* [entity\setAttribute](formula/entity.md#entitysetattribute)
* [entity\clearAttribute](formula/entity.md#entityclearattribute)
* [entity\attributeFetched](formula/entity.md#entityattributefetched)
* [entity\addLinkMultipleId](formula/entity.md#entityaddlinkmultipleid)
* [entity\hasLinkMultipleId](formula/entity.md#entityhaslinkmultipleid)
* [entity\removeLinkMultipleId](formula/entity.md#entityremovelinkmultipleid)
* [entity\setLinkMultipleColumn](formula/entity.md#entitysetlinkmultiplecolumn)
* [entity\isRelated](formula/entity.md#entityisrelated)
* [entity\sumRelated](formula/entity.md#entitysumrelated)
* [entity\countRelated](formula/entity.md#entitycountrelated)
* [entity\getLinkColumn](formula/entity.md#entitygetlinkcolumn)

## Record

[record](formula/record.md)

* [record\exists](formula/record.md#recordexists)
* [record\count](formula/record.md#recordcount)
* [record\findOne](formula/record.md#recordfindone)
* [record\findMany](formula/record.md#recordfindmany)
* [record\findRelatedOne](formula/record.md#recordfindrelatedone)
* [record\findRelatedMany](formula/record.md#recordfindrelatedmany)
* [record\attribute](formula/record.md#recordattribute)
* [record\fetch](formula/record.md#recordfetch)
* [record\relate](formula/record.md#recordrelate)
* [record\unrelate](formula/record.md#recordunrelate)
* [record\create](formula/record.md#recordcreate)
* [record\update](formula/record.md#recordupdate)
* [record\delete](formula/record.md#recorddelete)
* [record\relationColumn](formula/record.md#recordrelationcolumn)
* [record\updateRelationColumn](formula/record.md#recordupdaterelationcolumn)

## Env

[env](formula/env.md)

* [env\userAttribute](formula/env.md#envuserattribute)

## Password

[password](formula/password.md)

* [password\generate](formula/password.md#passwordgenerate)
* [password\hash](formula/password.md#passwordhash)

## Array

[array](formula/array.md)

* [array\includes](formula/array.md#arrayincludes)
* [array\push](formula/array.md#arraypush)
* [array\length](formula/array.md#arraylength)
* [array\at](formula/array.md#arrayat)
* [array\join](formula/array.md#arrayjoin)
* [array\indexOf](formula/array.md#arrayindexof)
* [array\removeAt](formula/array.md#arrayremoveat)
* [array\unique](formula/array.md#arrayunique)

## Object

[object](formula/object.md)

* [object\create](formula/object.md#objectcreate)
* [object\get](formula/object.md#objectget)
* [object\set](formula/object.md#objectset)
* [object\clear](formula/object.md#objectclear)
* [object\has](formula/object.md#objecthas)
* [object\cloneDeep](formula/object.md#objectclonedeep)

## Language

[language](formula/language.md)

* [language\translate](formula/language.md#languagetranslate)
* [language\translateOption](formula/language.md#languagetranslateoption)

## Json

[json](formula/json.md)

* [json\retrieve](formula/json.md#jsonretrieve)
* [json\encode](formula/json.md#jsonencode)

## Ext

[ext](formula/ext.md)

* [ext\account\findByEmailAddress](formula/ext.md#extaccountfindbyemailaddress)
* [ext\currency\convert](formula/ext.md#extcurrencyconvert)
* [ext\email\send](formula/ext.md#extemailsend)
* [ext\email\applyTemplate](formula/ext.md#extemailapplytemplate)
* [ext\markdown\transform](formula/ext.md#extmarkdowntransform)
* [ext\sms\send](formula/ext.md#extsmssend)
* [ext\pdf\generate](formula/ext.md#extpdfgenerate)
* [ext\user\sendAccessInfo](formula/ext.md#extusersendaccessinfo)
* [ext\calendar\userIsBusy](formula/ext.md#extcalendaruserisbusy)
* [ext\acl\checkEntity](formula/ext.md#extaclcheckentity)
* [ext\acl\checkScope](formula/ext.md#extaclcheckscope)
* [ext\acl\getLevel](formula/ext.md#extaclgetlevel)
* [ext\acl\getPermissionLevel](formula/ext.md#extaclgetpermissionlevel)
* [ext\oauth\getAccessToken](formula/ext.md#extoauthgetaccesstoken)

## Util

[util](formula/util.md)

* [util\generateId](formula/util.md#utilgenerateid)
* [util\generateRecordId](formula/util.md#utilgeneraterecordid)
* [util\base64Encode](formula/util.md#utilbase64encode)
* [util\base64Decode](formula/util.md#utilbase64decode)

## Log

[log](formula/log.md)

* [log\info](formula/log.md#loginfo)
* [log\notice](formula/log.md#lognotice)
* [log\warning](formula/log.md#logwarning)
* [log\error](formula/log.md#logerror)
