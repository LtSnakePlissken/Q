window.addEventListener('load', function() {
  document.querySelectorAll('code.hljs').forEach(appendCopyButton);
})

function appendCopyButton (el) {
  const button = document.createElement('button');
  button.className = 'copy-button';
  button.innerHTML = 'Copy';
  button.style.cssText = `
    background: var(--color-primary);
    border: none;
    border-radius: 3px;
    margin: 8px;
    color: var(--color-contrast-high);
    cursor: pointer;
    font-size: 12px;
    height: max-content;
  `;

  button.addEventListener('click', function () {
    button.innerHTML = 'Copied!';
    copyTextToClipboard(normalizeCode(el.innerText));
    setTimeout(function () { button.innerHTML = 'Copy'; }, 2000);
  })
  
  el.parentNode.appendChild(button);
  
  el.parentNode.style.display = 'flex';
  el.parentNode.style.justifyContent = 'space-between';
}

function normalizeCode (code) {
  return code.replace(/^\$\s+/mg, '');
}

function copyTextToClipboard (text) {
  var textArea = document.createElement('textarea');
  textArea.value = text;
  textArea.setAttribute('readonly', '');
  textArea.style.position = 'absolute';
  textArea.style.left = '-9999px';
  document.body.appendChild(textArea);
  textArea.select();

  try {
    document.execCommand('copy');
  } catch (err) {
    console.error('Unable to copy', err);
  }

  document.body.removeChild(textArea);
}
