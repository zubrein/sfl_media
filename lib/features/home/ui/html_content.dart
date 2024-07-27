const String cssContent = """

    body {
        font-family: sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        width: device-width;
    }
    h2 {
        color: #333;
        margin-top: 20px;
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
    #additionalContent {
        font-family: 'Roboto',Helvetica,Arial,Lucida,sans-serif;
        margin-top: 20px;
        padding-right: 5px;
        width: 100%;
        text-align: justify;
        font-size: 14px;
    }

""";

String prepareHtmlContent({
  required String title,
  required String youtubeUrl,
  required String htmlContent,
}) {
  return """
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>InAppWebView Content</title>
        <style>
            $cssContent
        </style>
    </head>
    <body>
        <div id="content">
            <h2>$title</h2>
            <iframe src="$youtubeUrl" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            <div id="additionalContent">$htmlContent</div>
        </div>
    </body>
    </html>
    """;
}
