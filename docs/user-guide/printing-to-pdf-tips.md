# Printing to PDF tips

In this article:

 * [PDF syntax](#pdf-code-syntax)
 * [Text](#text)
 * [Logo/Image](#logoimage)
 * [Table](#table)
 * [Link](#link)

## PDF code syntax

If you open a template code view (`</>`) you will see that your PDF document data is markupped with the tags well known in HTML.

**Note!**
Due to a security policy some of HTML tags, attributes or styles may not be supported or allowed by editor. So it will truncate them automatically.

## Text

* `<b>some text</b>` - bold text style
* `<u>some text</u>` - underlined text style
* `<i>some text</i>` - italic text style
* `<s>some text</s>` - crossline the text
* `<br>` - insert single line breaks in a text
* `<span>some text</span>` - element which is used to color a part of a text: `<span style="color: rgb(255, 255, 255);>`. The `<span>` tag is also very helpful for setting the single string parameters or adding a single empty line.
* `<p>some text</p>` - defines a paragraph.
* `<div>some text</div>` - used as a container for HTML elements.

## Logo/Image

#### How to add an image

You can add your company logo or other images to your PDF document with the next ways:
* Click the picture button in the tools panel -> Browse -> select a file.

Code view: `<img src="?entryPoint=attachment&amp;id=5fec48f49f577cc31" style="width: 25%>`

* Click the picture button in the tools panel -> input Image URL line -> Insert

Code view: `<img src="https://www.espocrm.com/images/espocrm-logo.png" width="300" height="100">`

#### Image resize

* Setting a size with percentage: `style="width: 25%;"`
* Setting a size with pixels: `width="300" height="100"`

## Table

2x2 table structure example:
```
<table class="table table-bordered" border="0.5pt">
  <tbody>
    <tr bgcolor="#659B86">
      <td width="50%" style="text-align: center;">
        <span style="color: rgb(0, 0, 0); font-size: 12px; line-height: 1;">id</span>
      </td>
      <td width="50%" style="text-align: center;">
        <span style="color: rgb(0, 0, 0); font-size: 12px; line-height: 1;">user_name</span>
      </td>
    </tr>
    <tr>
      <td width="50%" style="text-align: center;">
        <span style="color: rgb(0, 0, 0); font-size: 12px; line-height: 1;">1</span>
      </td>
      <td width="50%" style="text-align: center;">
        <span style="color: rgb(0, 0, 0); font-size: 12px; line-height: 1;">Admin</span>
      </td>
    </tr>
  </tbody>
</table>
```
* `border="0.5pt"` - table attribute for setting the width of a table border. Without this parameter you won't see the table borders.
* `bgcolor="#659B86"` - set a background color. Works for the `<tr>` and the `<td>` tags.
* `width="25%"` - set a table cell width.
* `text-align: center;` - set a text position. Supports: `center`, `left`, `right`, ` justify`.
* `color: rgb(0, 0, 0);` - set the color of the text.
* `font-size: 12px;` - set the text size.
* `line-height: 1;` - set a line height.
* `<tr>` & `</tr>` - defines a table raw.
* `<td>` & `</td>` - defines a standard data cell in a table.
* `<td ><span style="font-size: 10px;">{{dateQuoted}}</span><br></td>`

## Link

You can create a link by clicking the link button in the tool panel.

Code view: `<a href="https://www.espocrm.com">Click me</a>`
