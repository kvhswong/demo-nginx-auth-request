# Demo Authentication of Static Web Content

I recently had a need to serve static html content. This seemed easy enough. I could sync the content to an S3 bucket and use cloud front to allow DNS access.

However, the content I needed to serve was not allowed to be publicly accessible. Thus I needed some sort of authentication mechanism in place to verify user access.

This seemed like it would be a fairly straight forward problem that AWS would have a solution for. Nothing immediately stood out, so I went digging around.

Turns out there were two options generally available that seemed acceptable.

1. [Vouch Proxy](https://github.com/vouch/vouch-proxy)
2. [Cloudfront Auth](https://github.com/Widen/cloudfront-auth)

Of the two I listed above, I decided to try out Vouch Proxy. Okta had published an [article](https://developer.okta.com/blog/2018/08/28/nginx-auth-request) in 2018 talking about the exact thing I needed to do, so I figured that was a good place to start.

Like anything involving auth, you can go down numerous rabbit holes. Though the instructions provided by Okta was a good start, it lacked some detail I needed to properly configure nginx and vouch. Eventually, I was able to make something work, so hopefully this will help anyone else looking for a similar solution.

Follow the folowing steps to get it working for you.

1. Clone this repository and cd into demo-nginx-auth-request
2. Run the following command, generate-certs.sh
3. Go into vouch-proxy/config/config.yml and add your Okta configuration. Steps to generate this is in the linked Okta article above
4. Run docker-compose up
5. Open a browser and connect to https://localhost

If working propertly, this should prompt you to authenticate into Okta. Upon successful authentication, you'll see the sample static index.html in the web folder.

