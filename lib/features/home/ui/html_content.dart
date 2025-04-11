const String cssContent = """

    body {
        font-family: 'Roboto',Helvetica,Arial,Lucida,sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        width: device-width;
    }
    h2 {
        color: #333;
        font-size: 16px;
    }
    iframe {
        width: 100%;
        height: 56.25vw;
        max-width: 560px;
        max-height: 315px;
        border: none;
        margin-top: 20px;
    }
    img                {
        width: 100%;
        height: 56.25vw;
        max-width: 560px;
        max-height: 315px;
        border: none;
        margin-top: 20px;
    }
    #additionalContent {
        margin-top: 20px;
        padding-right: 5px;
        width: 97%;
        text-align: justify;
        font-size: 14px;
    }
    #author {
        color: #FF8000;
        margin-top: 0px;
        text-align: left;
        font-size: 12px;
    }

""";

String prepareHtmlContent({
  required String title,
  required String youtubeUrl,
  required String htmlContent,
  required String thumbnail,
  required String authorAndDate,
}) {
  String mediaContent = youtubeUrl.isNotEmpty
      ? '<iframe src="${youtubeUrl.replaceFirst("watch?v=", "embed/")}" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>'
      : '<img src="$thumbnail" alt="No Video Available" class="placeholder-image" />';

  return """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            $cssContent
        </style>
    </head>
    <body>
        <div id="content">
            <h2>$title</h2>
            $mediaContent
            <div id=author><strong><p>$authorAndDate</p></strong></div>
            <div id="additionalContent">$htmlContent</div>
        </div>
    </body>
    </html>
    """;
}
