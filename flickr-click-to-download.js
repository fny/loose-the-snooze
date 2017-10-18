// JavaScript snippet that enables click to download on Flickr.
//
// This makes it a lot easier to get images for image recognition.


// Turns a background image url from CSS into the URL of a larger image
// url("//c1.staticflickr.com/4/3763/9484710961_267962fe6c_m.jpg")
function cleanBackgroundUrl(cssValue) {
  // Note we drop the _m to get to the larger image
  return cssValue.replace('url("', '').replace('")', '').replace('_m', '')
}


const downloadLink = document.createElement('a')
downloadLink.href = '#'
downloadLink.download = '#'
document.body.appendChild(downloadLink)

function overrideImageClick() {
  const linkNodes = document.querySelectorAll('.search-photos-results a.overlay')

  // Return if there are no links
  if (linkNodes.length === 0) return

  // Delete all the links from the page
  Array.from(linkNodes).forEach(x => x.remove())

  // Set all the images to download on click
  Array.from(document.querySelectorAll('.photo-list-photo-view')).forEach(photo => {
    photo.onclick = () => {
      const imageUrl = cleanBackgroundUrl(photo.style.backgroundImage)
      downloadLink.download = imageUrl
      downloadLink.href = imageUrl
      downloadLink.click()
    }
  })
}


// HACK: Checks every second for new images since I'm not sure how to trigger
// this to run whenever an image loads
setTimeout(overrideImageClick, 1000)
