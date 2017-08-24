var classNames = [];
if (navigator.userAgent.match(/(iPad|iPhone|iPod)/i)) classNames.push('device-ios');
if (navigator.userAgent.match(/android/i)) classNames.push('device-android');

var body = document.getElementsByTagName('body')[0];

if (classNames.length) classNames.push('on-device');
if (body.classList) body.classList.add.apply(body.classList, classNames);
