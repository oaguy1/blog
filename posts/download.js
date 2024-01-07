const mediumToMarkdown = require('medium-to-markdown')

args = process.argv

if (args.length !== 3) {
  console.log("USAGE: node download.js <medium-url>")
  process.exit(1)
}

article_url = args[2]

mediumToMarkdown.convertFromUrl(article_url)
.then(function (markdown) {
  console.log(markdown)
})
