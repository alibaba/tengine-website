## FAQs

*   Q: **Why was the name 'Tengine' chosen?**

    A: Tengine is based on Nginx which stands for 'Engine-X'. Since Tengine was developed at Taobao, so at first it's named 'Taobao-Engine'. Then we called it 'Tengine' for short. You can pronounce it as 'tee-engine' or 'ten-gine'.

*   Q: **Which license does it use?**

    A: Tengine is distributed under the 2-clause BSD-like license, which is the same as Nginx itself.

*   Q: **Why Tengine is 'forking' Nginx instead of committing the patches to the official Nginx?**

    A: First, we are developing our own Nginx version because we have strong requirements to enhance it. Our website is very busy (the largest e-commerce website in Asia and ranked #14 on Alexa's top sites list). Many of the features we need can't be done by writing modules.
      We would love to contribute our work to the official Nginx, since we consider it a great honor to share our achievements with the community. That's why we have open sourced it. Actually we have contacted the Nginx team and we are discussing the details with them. Hopefully some of the Tengine features could be merged into the trunk. We'll keep this Tengine 'fork' to keep the unique features we need (some features such as the syslog and pipe support are explicitly refused to implement by the Nginx team). Meanwhile, we'll try our best to contribute our patches and bug fixes back to Nginx.
