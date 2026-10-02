Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF5E477985;
	Fri,  2 Oct 2026 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932483; cv=none; b=DC2r8fSdUgXILIY9wvU3XtBQnqaYFNfhUvDzVB6pupsi79WCqVWTcYIjVDNANr3PCy//AN9imASKtXZGI+u/RK3H0IObDJM6T+Tik1c3H5AUgZpCF/hGGVbR1Hd8XqABpwFdUYdkOIiQ//gzjT3438RM6YhrdIpGPZR/QZyFTOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932483; c=relaxed/simple;
	bh=arE3bIx4izYzzUsgp/nOazm2aKz2snIDumZdwWtZNDQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eQNW35NHXQUnFXbWtmPflucTaiGGMPjGPRdfwEXwXl5xDvOutN9mwxQuznP0R3ciBRd+2bMNIAiiRFmoxuEhKZHdz+iG5yfVBH71O5iiQhyZQ9Hareelf74EFagM4dbUo3K2v9o5+wq13zY6g40PLgKNdd6bhjPXsSxGF89vmIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D9mcGmwm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D9mcGmwm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F141F00893;
	Fri,  2 Oct 2026 09:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932482;
	bh=mOECSzxHQz9Lipt0dBVVD3VuBEw/de8e5f4LjGSMrqg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D9mcGmwmA9BERJf2VZ2AbCKENVFiOwuE5RURIP1iMVP0m9a+aAoHNbZ98e3D6Eq+o
	 Cla3g+SVINb/foaxXt9AeQKXsujXXr44w8sDwUuuJbFmRlcsxG0RDQacA+XNZbY7I/
	 P/ZvYvb88GVVBd5LmJ2Dl6lRpP0CJdlc9YdaqaARLsW9Ex4DCfybCyJme2iyQ0vkOg
	 m5X71QU8ju1eH0LCVIDrJ+0/vLpvCoytZZvufS3pR4MGiNVUcIZ2VTUGoK0JDhj4Gq
	 KKNtbyW4m/PO2mE93HncwSez2z8E+Tl8l1N1o1KoJsKv3RTCMiE9Xop4noXHJhRFUp
	 V91SFQ4rnHEyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: as3722: Convert to json-schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thierry Reding" <thierry.reding@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org
In-Reply-To: <20261002-as3722-bindings-v3-1-21c179b72a95@nvidia.com>
References: <20261002-as3722-bindings-v3-0-21c179b72a95@nvidia.com>
 <20261002-as3722-bindings-v3-1-21c179b72a95@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:14:40 +0000
Message-Id: <20261002091441.26F141F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] dt-bindings: as3722: regex pattern for pinmux nodes rejects exis=
ting hyphens
- [Low] dt-bindings: as3722: ams,enable-tracking missing restriction to ldo3
--

commit d71712428dc3759a032b4331de89438e39e0ee5b
Author: Thierry Reding <treding@nvidia.com>

dt-bindings: mfd: as3722: Convert to json-schema
   =20
Convert the AMS AS3722 PMIC bindings from the free-form text format to
json-schema.

> diff --git a/Documentation/devicetree/bindings/mfd/ams,as3722.yaml b/Docu=
mentation/devicetree/bindings/mfd/ams,as3722.yaml
> new file mode 100644
> index 0000000000000..51910042c6216
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ams,as3722.yaml

[ ... ]

> @@ -0,0 +1,293 @@

[ ... ]

> +  pinmux:
> +    description:
> +      Device has 8 GPIO pins which can be configured as GPIO as well as =
the
> +      special IO functions.
> +
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      "^gpio[0-7_]+$":

[Severity: Medium]
Will this strict regex exclude the hyphen character and cause validation to
fail for existing in-tree device trees?

Existing device trees like arch/arm/boot/dts/nvidia/tegra124-apalis.dtsi use
hyphens in their node names, such as gpio0-1-3-4-5-6. Because these valid
names contain hyphens, do they fail to match the pattern, fall through to
additionalProperties: false, and trigger a schema violation error?

[ ... ]

> +    patternProperties:
> +      "^(sd[0-6]|ldo[0-7]|ldo9|ldo10|ldo11)$":
> +        description:
> +          These sub-nodes must be named after one of the regulators foun=
d on
> +          the AS3277. Each sub-node should contain the constraints and
> +          initialization information for that regulator.
> +
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +        type: object
> +
> +        properties:

[ ... ]

> +          ams,enable-tracking:
> +            description: Enable tracking with SD1, only supported by LDO=
3.
> +
> +            $ref: /schemas/types.yaml#/definitions/flag

[Severity: Low]
Is the ams,enable-tracking property missing a restriction to ldo3?

The text description explicitly states it is only supported by LDO3, but it
appears to be allowed for all regulators matching the parent pattern. Witho=
ut
an allOf/if-then constraint to restrict its application strictly to the ldo3
node, users could mistakenly apply ams,enable-tracking to unsupported
regulators.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-as3722-bin=
dings-v3-0-21c179b72a95@nvidia.com?part=3D1
