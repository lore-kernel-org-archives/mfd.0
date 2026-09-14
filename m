Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346A5363C6F;
	Mon, 14 Sep 2026 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394904; cv=none; b=ir59kc4XQzd08XWSwaz2rwOw5gZ2Q+GhiXsl91812S7tg6tjj+WfVpY11eW3SirPc+dCvkE9/aK8FMat1puL1aYwpOJtwMKdSye2vCX9c8LRRk8xVvM9F8UV+XiFr64uSi+1j24frJkCWRS/At/CUCgotKuRLpwwA1tRtXPDiIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394904; c=relaxed/simple;
	bh=bFhefhHTZDtHvSCKQenUjA8S2WWWWO65/UG2uFZ7m5g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aK/2D8iYK6asHMoNM+FKCcLwLzYyKWxJI5igRWRjm5XZpoT4+dmN3JQrbX01xHacijO5s8SgS5orLC70rlDDXq4MsxoQNZcbaRyV5CXnip5e8nUwm8uklMV0qwc5IWXwAenOWcVydB3QMLZZjT2qkR3SpgcXvKochfCRBLdOZig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xx1lFcBo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xx1lFcBo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 269AC1F00893;
	Mon, 14 Sep 2026 14:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789394901;
	bh=Vw+pLfk8kNMoNyjNiV7IhxOkTNzg+e7dWN3kHDPZEGQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xx1lFcBo35Ak/cpPdn8eEoJN3v9WSMjdJBM4yEhxq9obwwmQ52NItOPaogSKwKbpl
	 tpMH1MeBKJfJvpgPhSXdhpsGtjWg/81A5QShn6e3xbLPB32r3qJX1+fZC79amd98l8
	 LIm/K25kdHirDD+oHKv2VR3MgI22lTUihBHMQNKC5q7fE8D3BYXYBoUrhDLVqxkwd+
	 lZCQxrwqMrNkOWlhVOS1i3ktNYNUivPoPhreMGkK8N39dDQldTkpjISFGOjrgrKjg9
	 qD0f0Mkshq/AnkNnW86miCJBJPXWmzTrJQjijZz3tTs79j9ZVgccFLVvuCkftvdILz
	 AK4OCZSopwbSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: ti,bq25703a: Expand to include
 BQ25798
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-bq25798-v1-1-dc5e2ec343c4@flipper.net>
References: <20260914-bq25798-v1-1-dc5e2ec343c4@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 14:08:20 +0000
Message-Id: <20260914140821.269AC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Adding an array-based fallback compatible string without updatin=
g the `if: properties: compatible: const:` conditionals causes the new comp=
atible to bypass device-specific schema constraints.
--

commit 37d04d6cb52639a3cc4ba9ade1878fa540a5cb3e
Author: Alexey Charkov <alchark@flipper.net>

dt-bindings: mfd: ti,bq25703a: Expand to include BQ25798

TI has unpublished the BQ25792 charger variant and pulled its docs from
their website. BQ25798 is a pin and register compatible replacement. Expand
the existing binding to include BQ25798 with a fallback compatible to
BQ25792.

Link: https://www.ti.com/product/BQ25798

> diff --git a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml b/Doc=
umentation/devicetree/bindings/mfd/ti,bq25703a.yaml
> index cdce83f058041..43afd232a6142 100644
> --- a/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
> +++ b/Documentation/devicetree/bindings/mfd/ti,bq25703a.yaml
> @@ -11,9 +11,14 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    enum:
> -      - ti,bq25703a
> -      - ti,bq25792
> +    oneOf:
> +      - enum:
> +          - ti,bq25703a
> +          - ti,bq25792
> +      - items:
> +          - enum:
> +              - ti,bq25798
> +          - const: ti,bq25792

[Severity: Medium]
Is this a regression that causes the new compatible string to bypass
device-specific schema constraints?

Later in the file's allOf/if section, there is an exact match condition
for the ti,bq25792 compatible string:

  - if:
      properties:
        compatible:
          const: ti,bq25792

Since the schema const keyword mandates strict equality, it will fail to
match the fallback array ["ti,bq25798", "ti,bq25792"]. As a result, if a
devicetree author specifies compatible =3D "ti,bq25798", "ti,bq25792" and
configures out-of-bounds regulator or current values, the device-specific
hardware constraints for ti,bq25792 will not be applied during validation.

Could this if condition be updated to use contains instead of const, or
otherwise include the new fallback array?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-bq25798-v1=
-1-dc5e2ec343c4@flipper.net?part=3D1
