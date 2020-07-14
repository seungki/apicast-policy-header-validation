[![CircleCI](https://circleci.com/gh/3scale/apicast-example-policy.svg?style=svg)](https://circleci.com/gh/3scale/apicast-example-policy)

# APIcast Header Validation Policy

This policy is an custom policy which is to check specific header name and value for APIcast.


## OpenShift

To install this on OpenShift you can use provided template:

```shell
oc new-app -f openshift.yml --param AMP_RELEASE=2.8
```

The template creates new ImageStream for images containing this policy.
Then it creates two BuildConfigs: one for building an image to apicast-policy ImageStream
and second one for creating new APIcast image copying just necessary code from that previous image.

aafter that you will can see lbelow 

# License

MIT
