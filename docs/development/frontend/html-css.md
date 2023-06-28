# HTML & CSS

## Button

```html
<button class="btn {style-class}">Label</button>
```

Style classes:

* `btn-default`
* `btn-primary`
* `btn-success`
* `btn-danger`
* `btn-warning`
* `btn-info`
* `btn-text`
* `btn-link`

Width classes:

* `btn-xs-wide`
* `btn-s-wide`
* `btn-wide`
* `btn-xx-wide`
* `btn-icon-wide`
* `btn-icon-x-wide`
* `btn-icon-xx-wide`
* `btn-full-wide` – 100% width;

Size classes:

* `btn-sm`
* `btn-lg`

Other classes:

* `btn-icon` – a button supposed to contain only an icon;

### Button group

```html
<div class="btn-group">
    <button class="btn btn-default"></button>
    <button class="btn btn-default"></button>
</div>
```

## Dropdown

```html
<div class="btn-group">
    <button
        class="btn btn-default dropdown-toggle"
        data-toggle="dropdown"
    >
        <span class="fas fa-ellipsis-h"></span>
    </button>
    <ul class="dropdown-menu pull-right">
        <li>
            <a
                role="button"
                tabindex="0"
                data-action="someAction"
            >Some Action</a>
        </li>
        <li class="divider"></li>
        <li>
            <a href="some-link">Some Link</a>
        </li>
    </ul>
</div>
```

The class `pull-right` is used to align the menu to the right side.

## Panel

```html
<div class="panel panel-default">
    <div class="panel-heading">
        <h4 class="panel-title">Title</h4>
    </div>
    <div class="panel-body">
    </div>
</div>
```

Style classes:

* `panel-default`
* `panel-success`
* `panel-danger`
* `panel-warning`
* `panel-info`
* `panel-primary`


Panel body classes:

* `panel-body-form` – for panels containing a form;

## Table

```html
<table class="table"></table>
```

Classes:

* `table-fixed` – sets `table-layout: fixed`;
* `table-no-overflow` – applies `overflow: hidden; text-overflow: ellipsis` to cells;
* `table-striped`
* `table-panel` – table like a panel;
* `table-bordered-inside` – with cell borders;
* `table-hover` – accent on row hover;
* `no-margin` – no bottom margin;

TH, TG tag classes:

* `cell-nowrap` – suppresses line breaks;

TR tag classes:

* `accented`

## List

```html
<ul class="list-group">
    <li class="list-group-item"></li>
</ul>
```

## Record

A field cell on a form:

```html
<div class="cell form-group" data-name="fieldName">
    <label class="control-label" data-name="fieldName">
        <span class="label-text">Label</span>
    </label>
    <div class="field" data-name="fieldName">
        (field-element)
    </div>
</div>
```

## Grid

### Columns

12 columns system:

```html
<div class="row">
    <div class="col-sm-6"></div>
    <div class="col-sm-3"></div>
    <div class="col-sm-3"></div>
</div>
```

```html
<div class="row">
    <div class="col-md-6 col-xs-12"></div>
    <div class="col-md-6 col-xs-12"></div>
</div>
```

```html
<div class="row">
    <div class="col-md-6 col-md-offset-6"></div>
</div>
```

Supported screen widths:

* `xs` – phones, 480px;
* `sm` – tablets, 768px;
* `md` – medium, 992px;
* `lg` – large, 1200px;

### Auto-fill grid

```html
<div class="grid-auto-fill-md">
    <div></div>
    <div></div>
    <div></div>
</div>
```

Sizes:

* `xxs`
* `xs`
* `sm`
* `md`

## Type

### Text

Style:

* `text-soft`
* `text-muted`
* `text-primary`
* `text-success`
* `text-danger`
* `text-warning`
* `text-info`
* `text-bold`
* `text-italic` (as of v7.6)

Size:

* `text-large`
* `text-2em`
* `text-3em`
* `text-4em`
* `text-5em`
* `text-6em`


### Label

```html
<span class="label label-md label-default">Text</span>
```

Style classes:

* `label-default`
* `label-primary`
* `label-success`
* `label-danger`
* `label-warning`
* `label-info`

Size classes:

* `label-md`

## Misc

Centering:

* `center-align` – applies `text-align: center`;

A horizontally centered block:

* `block-center`
* `block-center-sm`
* `block-center-md`

A container that horizontally & vertically centers its child:

* `container-centering`

Border radius:

* `radius-left` – forces an element to have border radius on the left;
* `radius-right` – forces an element to have border radius on the right;

Floating:

* `pull-left` – applies `float: left`;
* `pull-right` – applies `float: right`;

Cancelling margins:

* `no-margin` – cancels margins for an element contained in a panel and other containers;
* `no-side-margin` – cancels seide margins for an element contained in a panel and other containers;

Margins:

* `margin` – applies a margin to all sides;
* `margin-top-sm`
* `margin-top`
* `margin-top-2x`
* `margin-bottom-sm`
* `margin-bottom`
* `margin-bottom-2x`
* `margin-bottom-3x`
* `margin-bottom-4x`
