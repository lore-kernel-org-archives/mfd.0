Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFDC32E68D;
	Sun, 16 Aug 2026 09:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786873016; cv=none; b=sBMMaOi+1HzAq6XA5TOQbQwg06zcTWZW7vhWJfyyxyH2+/q7iYX5ndl5sfT+fw/PkRDrf+fSsRgZJ4HZq/Lav4kIRpBOlklOs9chPnWnr8ubFHzsUxxjOgXkTMKwSuvV+fWCxXNNclSjpwklOTXkFQOInXa+F9zzBcCTpTPhFos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786873016; c=relaxed/simple;
	bh=bEnF4/bJKjSTXjgEmBoKF8iQ6W3KfQYjD/7A9pvkUVc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kNXCmOxLrg9qQlmlTlZBgV7007VbqHfI7gOyoi7ZgZJDvOZlWXQxVLCkaFaq94WVrU0nB1gkzGyAfWKLszgchBgfSwzFdrVC34R0DOAF3mHVu7XL6sNBqldrBlEytIRM8I54rpokbUVOKD03zZXrQujy68ImzjQw8/dd1mP1vdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDYZBzEO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDYZBzEO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACFC1F000E9;
	Sun, 16 Aug 2026 09:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786873014;
	bh=dEY3CIe0r0PQZrc8e4T4DIcQ4RgEY/H1mKI8McAe5cQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aDYZBzEO3GjvLCoNIWWqxbeDJlLjOOeSa8492ZKrylyWIbFDoNNLIax6agChtUAKR
	 aJPbCex+6sNBnytkRFLgfGwBoOn2lNrXxHlo1sMLZu/IvYywrMD9FKO1+nXfSoJ/+j
	 JbhbKo10xa4EP84ScW5BgsMj+0mdFNgI5X58VXdCACbuTlXioa/J0xU9uDMmTJjHYS
	 kn0Fs0/2BSvTfXzX58anIjm94QITRtpQUUAq6B/HL2ZoeU4o4/yJlSmrVOzKjEKP1t
	 HtisW1xPzMROTqT3ulAfPTqfN1GXO4DcTYFIYPFSvMRiWGUGgRuPpRB9E8jpfArRD4
	 /5ldbyRkVH6lg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: Convert TI TWL6040 to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Bostina" <egbostina@gmail.com>
Cc: mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260816092847.2522994-1-egbostina@gmail.com>
References: <20260816092847.2522994-1-egbostina@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 09:36:54 +0000
Message-Id: <20260816093654.8ACFC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Missing dependency enforcement for the 'vibra' node power suppli=
es ('vddvibl-supply' and 'vddvibr-supply').

Pre-existing issues:
- [High] The twl6040 driver constructs its mfd_cell array dynamically at ru=
ntime and mutates a global static resource array, violating MFD static refe=
rence rules.
- [High] Hardcoded cell indexing via PLATFORM_DEVID_NONE creates sysfs nami=
ng collisions.
--

--- Patch [1]: [PATCH v2] dt-bindings: mfd: Convert TI TWL6040 to DT schema=
 ---
commit 940b493f232639b743b8f6ddfb4feba28f32a8ab
Author: Eduard Bostina <egbostina@gmail.com>

dt-bindings: mfd: Convert TI TWL6040 to DT schema

Convert the Texas Instruments TWL6040 audio codecs family bindings to DT
schema. During the conversion, ti,audpwron-gpio was renamed and made
optional along with gpio-controller. The vibra voltage properties were also
renamed to match what the driver actually reads.

Link: https://lore.kernel.org/all/20260815083451.2147129-1-egbostina@gmail.=
com/

While reviewing this binding conversion, I noticed a couple of pre-existing
issues in the corresponding driver.

[Severity: High]
This isn't a bug introduced by this patch, but does the dynamic mutation of
mfd_cell resources in twl6040_probe() cause a data race?

drivers/mfd/twl6040.c:twl6040_probe() {
    ...
    twl6040_codec_rsrc[0].start =3D irq;
    twl6040_codec_rsrc[0].end =3D irq;
    cell->resources =3D twl6040_codec_rsrc;
    cell->num_resources =3D ARRAY_SIZE(twl6040_codec_rsrc);
    ...
}

If two TWL6040 devices probe concurrently, could they race to overwrite the=
se
globally shared arrays, resulting in incorrect IRQ assignments for the child
devices?

[Severity: High]
This is a pre-existing issue, but does using the hardcoded value of -1
instead of PLATFORM_DEVID_AUTO prevent multiple TWL6040 chips from being
used in the same system?

drivers/mfd/twl6040.c:twl6040_probe() {
    ...
    ret =3D mfd_add_devices(&client->dev, -1, twl6040->cells, children,
                          NULL, 0, NULL);
    ...
}

If a system integrates more than one TWL6040 device, would the second
instance fail to probe its child devices due to identical sysfs device name=
s?

> diff --git a/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml b/Docu=
mentation/devicetree/bindings/mfd/ti,twl6040.yaml
> new file mode 100644
> index 0000000000000..011a1a58615a6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,twl6040.yaml
[ ... ]
> +  vibra:
> +    type: object
> +    additionalProperties: false
> +    properties:
> +      ti,vibldrv-res:

[Severity: Medium]
Should the vibra configuration object include a dependencies constraint to
ensure vddvibl-supply and vddvibr-supply are present?

The previous twl6040.txt binding explicitly marked vddvibl-supply and
vddvibr-supply as required when the vibra functionality is present.

Without this constraint, would an incomplete device tree missing these
regulators silently pass dt_binding_check validation but fail in
twl6040-vibra.c at runtime?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816092847.2522=
994-1-egbostina@gmail.com?part=3D1
